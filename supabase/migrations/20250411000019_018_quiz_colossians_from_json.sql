-- ============================================================================
-- LOGOS LIGHT — Colossians (book 51) quiz questions from quiz-questions/colossians.json
-- ============================================================================
-- Idempotent: skips rows that already match (book_number, chapter, difficulty_stage, prompt).
-- ============================================================================

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 1, 1, 'According to Colossians 1, to whom is the letter addressed with the saints and faithful brothers?', '["Those in Colossae","Those in Philippi","Those in Rome","Those in Corinth"]'::jsonb, 'Those in Colossae', 'Paul addresses the saints and faithful brothers in Christ who are at Colossae (Colossians 1:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Colossians 1, to whom is the letter addressed with the saints and faithful brothers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 1, 1, 'According to Colossians 1, what three virtues does Paul mention after hearing about the Colossians?', '["Faith, love, and hope","Power, wealth, and honor","Law, temple, and sacrifice","Wisdom, status, and learning"]'::jsonb, 'Faith, love, and hope', 'Paul heard of their faith in Christ Jesus, their love toward all the saints, and the hope laid up for them in heaven (Colossians 1:4-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Colossians 1, what three virtues does Paul mention after hearing about the Colossians?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 1, 1, 'According to Colossians 1, through whom do believers have redemption?', '["The Son of God\u0027s love","Moses","The angels","The law"]'::jsonb, 'The Son of God''s love', 'Paul says believers were transferred into the kingdom of the Son of his love, in whom they have redemption and forgiveness of sins (Colossians 1:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Colossians 1, through whom do believers have redemption?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 1, 1, 'According to Colossians 1, what is Christ called in relation to the invisible God?', '["The image of the invisible God","The prophet of the invisible God","The servant of the invisible God","The messenger of the invisible God"]'::jsonb, 'The image of the invisible God', 'Paul says Christ is the image of the invisible God (Colossians 1:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Colossians 1, what is Christ called in relation to the invisible God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 1, 1, 'According to Colossians 1, what is Christ in relation to the church?', '["The head of the body","A member among many","The prophet of the body","The servant of the body"]'::jsonb, 'The head of the body', 'Paul says Christ is the head of the body, the assembly (Colossians 1:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Colossians 1, what is Christ in relation to the church?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 1, 1, 'According to Colossians 1, through what did God make peace?', '["The blood of Christ\u0027s cross","The law of Moses","Temple sacrifices","The wisdom of philosophers"]'::jsonb, 'The blood of Christ''s cross', 'Paul says God made peace through the blood of Christ''s cross (Colossians 1:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Colossians 1, through what did God make peace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 1, 1, 'According to Colossians 1, what mystery does Paul summarize as being among the Gentiles?', '["Christ in you, the hope of glory","Circumcision in the flesh","The law in Jerusalem","The temple in heaven"]'::jsonb, 'Christ in you, the hope of glory', 'Paul says the mystery is Christ in you, the hope of glory (Colossians 1:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Colossians 1, what mystery does Paul summarize as being among the Gentiles?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 1, 2, 'What does Paul pray the Colossians will be filled with in Colossians 1?', '["The knowledge of God\u0027s will in all spiritual wisdom and understanding","The traditions of the elders","The secrets of Rome","The fear of their opponents"]'::jsonb, 'The knowledge of God''s will in all spiritual wisdom and understanding', 'Paul prays they may be filled with the knowledge of God''s will in all spiritual wisdom and understanding (Colossians 1:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul pray the Colossians will be filled with in Colossians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 1, 2, 'How does Paul say believers should walk in Colossians 1?', '["Worthily of the Lord to all pleasing","According to human tradition","With confidence in the flesh","Under the fear of angels"]'::jsonb, 'Worthily of the Lord to all pleasing', 'Paul prays that they may walk worthily of the Lord, to all pleasing (Colossians 1:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does Paul say believers should walk in Colossians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 1, 2, 'What does Paul say all things were created through and for in Colossians 1?', '["Christ","The law","Israel","The heavenly powers"]'::jsonb, 'Christ', 'Paul says all things were created through Christ and for Christ (Colossians 1:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say all things were created through and for in Colossians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 1, 2, 'What does Paul say holds all things together in Colossians 1?', '["Christ","The temple","Roman order","The law of nature"]'::jsonb, 'Christ', 'Paul says in Christ all things are held together (Colossians 1:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say holds all things together in Colossians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 1, 2, 'How does Paul describe the Colossians'' former state before reconciliation?', '["Alienated and enemies in mind in evil works","Faithful but immature","Near to God through rituals","Blameless under the law"]'::jsonb, 'Alienated and enemies in mind in evil works', 'Paul says they once were alienated and enemies in mind in evil works (Colossians 1:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does Paul describe the Colossians'' former state before reconciliation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 1, 2, 'What does Paul say he is filling up in his flesh for the church in Colossians 1?', '["What is lacking of Christ\u0027s afflictions","The curses of the law","The weakness of the apostles","The offerings of the temple"]'::jsonb, 'What is lacking of Christ''s afflictions', 'Paul says he fills up in his flesh what is lacking of Christ''s afflictions for his body''s sake, the church (Colossians 1:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say he is filling up in his flesh for the church in Colossians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 1, 2, 'How does Paul say he proclaims Christ in Colossians 1?', '["Warning every man and teaching every man in all wisdom","By force and political power","Only through visions and dreams","Without any need for wisdom"]'::jsonb, 'Warning every man and teaching every man in all wisdom', 'Paul says, ''We proclaim him, admonishing every man and teaching every man in all wisdom'' (Colossians 1:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does Paul say he proclaims Christ in Colossians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 1, 3, 'Why does Colossians 1 place thanksgiving, prayer, and Christ''s supremacy together?', '["The life of the church is grounded in the supreme person and saving work of Christ","Prayer replaces the need for doctrine about Christ","Paul shifts topics without connection","Christ\u0027s supremacy matters only for creation, not the church"]'::jsonb, 'The life of the church is grounded in the supreme person and saving work of Christ', 'Paul moves from thanksgiving and prayer into a majestic description of Christ''s person and work, showing that all Christian life flows from him (Colossians 1:3-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Colossians 1 place thanksgiving, prayer, and Christ''s supremacy together?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 1, 3, 'What does Colossians 1 teach about reconciliation?', '["God reconciles hostile sinners through Christ\u0027s bodily death to present them holy and blameless","Reconciliation comes mainly through moral self-improvement","Only Jews can be reconciled to God","Reconciliation is unrelated to Christ\u0027s death"]'::jsonb, 'God reconciles hostile sinners through Christ''s bodily death to present them holy and blameless', 'Paul says they were reconciled in Christ''s body of flesh through death in order to present them holy, without blemish, and blameless (Colossians 1:21-22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Colossians 1 teach about reconciliation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 1, 3, 'What does Paul emphasize by calling Christ the firstborn of all creation in Colossians 1?', '["Christ has supreme rank and authority over creation, not that he is part of it as a creature","Christ was the first being God made","Christ became Lord only after resurrection","Creation exists independently of Christ"]'::jsonb, 'Christ has supreme rank and authority over creation, not that he is part of it as a creature', 'Paul immediately explains that all things were created in, through, and for Christ, showing his supremacy over creation (Colossians 1:15-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Paul emphasize by calling Christ the firstborn of all creation in Colossians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 1, 3, 'Why does Paul connect fruit-bearing with knowledge of God in Colossians 1?', '["True knowledge of God is meant to produce a fruitful life rather than mere information","Fruit makes knowledge unnecessary","Knowledge belongs only to teachers, not ordinary believers","Paul opposes growth in understanding"]'::jsonb, 'True knowledge of God is meant to produce a fruitful life rather than mere information', 'Paul prays that they may know God''s will so that they may walk worthily, bear fruit, and increase in the knowledge of God (Colossians 1:9-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul connect fruit-bearing with knowledge of God in Colossians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 1, 3, 'What is the significance of Christ being both creator and head of the church in Colossians 1?', '["The one who rules all creation is also the one who governs and gives life to his redeemed people","Christ rules the church but not the world","Creation and redemption belong to separate divine plans","The church stands above creation in authority"]'::jsonb, 'The one who rules all creation is also the one who governs and gives life to his redeemed people', 'Paul links Christ''s role in creating and sustaining all things with his role as head of the body, the church (Colossians 1:16-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the significance of Christ being both creator and head of the church in Colossians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 1, 3, 'Why does Paul describe his ministry as laboring according to Christ''s working in Colossians 1?', '["His ministry is strenuous, but its power comes from Christ rather than from himself","He wants to minimize the need for effort in ministry","Paul believes human labor can replace divine grace","Christ\u0027s working matters only in miracles, not teaching"]'::jsonb, 'His ministry is strenuous, but its power comes from Christ rather than from himself', 'Paul says he labors, striving according to Christ''s working, which works in him mightily (Colossians 1:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul describe his ministry as laboring according to Christ''s working in Colossians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 1, 3, 'What does ''Christ in you, the hope of glory'' imply in Colossians 1?', '["The indwelling Christ is the ground of the Gentiles\u0027 future share in divine glory","Glory is earned through law observance","Only Israel may hope for glory","Christ remains distant from believers"]'::jsonb, 'The indwelling Christ is the ground of the Gentiles'' future share in divine glory', 'Paul identifies the mystery among the Gentiles as Christ in you, the hope of glory (Colossians 1:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does ''Christ in you, the hope of glory'' imply in Colossians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 1, 4, 'How does Colossians 1 connect creation and redemption?', '["The same Christ through whom all things were made is the one through whom all things are reconciled","Creation belongs to Christ, but redemption belongs to another power","Redemption corrects Christ\u0027s failure in creation","Creation and reconciliation have no theological relation"]'::jsonb, 'The same Christ through whom all things were made is the one through whom all things are reconciled', 'Paul says all things were created through Christ and also that through Christ God reconciles all things to himself (Colossians 1:16, 20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Colossians 1 connect creation and redemption?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 1, 4, 'Why does Paul stress perseverance in the faith after speaking of reconciliation in Colossians 1?', '["The gospel that reconciles also calls believers to continue grounded and steadfast in its hope","Reconciliation depends finally on human achievement","Steadfastness replaces grace as the basis of acceptance","Paul doubts whether God can keep believers"]'::jsonb, 'The gospel that reconciles also calls believers to continue grounded and steadfast in its hope', 'After describing reconciliation, Paul adds ''if indeed you continue in the faith, grounded and steadfast'' and not moved away from gospel hope (Colossians 1:22-23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul stress perseverance in the faith after speaking of reconciliation in Colossians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 1, 4, 'What is the significance of fullness dwelling in Christ in Colossians 1?', '["God\u0027s saving presence and sufficiency are fully located in Christ rather than elsewhere","Christ receives divine fullness only temporarily","Fullness belongs mainly to angels and heavenly intermediaries","The church supplies what Christ lacks"]'::jsonb, 'God''s saving presence and sufficiency are fully located in Christ rather than elsewhere', 'Paul says it was the Father''s good pleasure for all the fullness to dwell in Christ, tying divine fullness directly to him (Colossians 1:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What is the significance of fullness dwelling in Christ in Colossians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 1, 4, 'How does Paul''s ministry description in Colossians 1 serve the letter''s wider argument?', '["It shows that the gospel Paul preaches aims to present every believer mature in Christ, not to lead them beyond him","It proves maturity comes through hidden knowledge beyond Christ","It reduces ministry to private spiritual experience","It says only apostles can be mature in Christ"]'::jsonb, 'It shows that the gospel Paul preaches aims to present every believer mature in Christ, not to lead them beyond him', 'Paul says he proclaims Christ, warning and teaching everyone, so that he may present every man perfect in Christ (Colossians 1:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Paul''s ministry description in Colossians 1 serve the letter''s wider argument?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 1, 4, 'How does Colossians 1 portray the Christian life as both gift and growth?', '["Believers are rescued and reconciled by grace, then strengthened to walk worthily and bear fruit","Growth replaces the need for divine rescue","Gift and growth are unrelated themes in the chapter","Only rescue matters; fruit is optional"]'::jsonb, 'Believers are rescued and reconciled by grace, then strengthened to walk worthily and bear fruit', 'Paul describes rescue from darkness and reconciliation in Christ, then prays for strength, endurance, and fruitful living (Colossians 1:11-14, 21-23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Colossians 1 portray the Christian life as both gift and growth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 1, 4, 'Why does Paul frame thanksgiving around inheritance and rescue in Colossians 1?', '["Believers thank the Father because he both qualifies them for the saints\u0027 inheritance and rescues them from darkness","Thanksgiving belongs only to future blessing, not present salvation","Inheritance depends on personal merit, so thanksgiving is limited","Rescue from darkness is a minor theme in the chapter"]'::jsonb, 'Believers thank the Father because he both qualifies them for the saints'' inheritance and rescues them from darkness', 'Paul thanks the Father who made them fit for the inheritance of the saints in light and delivered them out of the power of darkness (Colossians 1:12-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul frame thanksgiving around inheritance and rescue in Colossians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 1, 4, 'What does Colossians 1 imply about cosmic powers in relation to Christ?', '["Even thrones, dominions, rulers, and authorities exist under Christ\u0027s creative supremacy","Christ rules only human beings, not spiritual powers","The powers stand outside Christ\u0027s authority","Paul names the powers to promote fear of them"]'::jsonb, 'Even thrones, dominions, rulers, and authorities exist under Christ''s creative supremacy', 'Paul explicitly includes thrones, dominions, principalities, and powers among the things created through and for Christ (Colossians 1:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Colossians 1 imply about cosmic powers in relation to Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 1, 5, 'How does Colossians 1 present Christ as sufficient against all rivals?', '["Christ is creator, sustainer, reconciler, head, and indwelling hope, leaving no gap for another mediator or supplement","Christ is central for forgiveness but not for wisdom or creation","Christ requires angelic additions to complete salvation","Paul leaves room for higher powers beyond Christ"]'::jsonb, 'Christ is creator, sustainer, reconciler, head, and indwelling hope, leaving no gap for another mediator or supplement', 'Paul layers Christ''s supremacy across creation, redemption, the church, reconciliation, fullness, and indwelling hope to show his complete sufficiency (Colossians 1:15-29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Colossians 1 present Christ as sufficient against all rivals?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 1, 5, 'Why is the phrase ''in him all things hold together'' theologically weighty in Colossians 1?', '["It presents Christ not only as the origin but also the sustaining coherence of all reality","It refers only to the church\u0027s internal unity","It means creation now runs independently of Christ","It limits Christ\u0027s work to visible earthly things"]'::jsonb, 'It presents Christ not only as the origin but also the sustaining coherence of all reality', 'Paul moves from creation through Christ to the claim that in him all things hold together, emphasizing ongoing dependence on Christ (Colossians 1:16-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the phrase ''in him all things hold together'' theologically weighty in Colossians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 1, 5, 'What does Colossians 1 imply about maturity in Christ?', '["Maturity is the goal of apostolic ministry for every believer, not a hidden level for a spiritual elite","Maturity belongs only to those with mystical visions","Only teachers can become mature in Christ","Perfection in Christ is an earthly status reserved for Paul alone"]'::jsonb, 'Maturity is the goal of apostolic ministry for every believer, not a hidden level for a spiritual elite', 'Paul says he proclaims Christ to present every man mature or perfect in Christ, stressing universal rather than elitist maturity (Colossians 1:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Colossians 1 imply about maturity in Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 1, 5, 'How does Colossians 1 hold together the historical cross and cosmic reconciliation?', '["A concrete historical death becomes the means by which God reconciles all things under Christ\u0027s lordship","Cosmic reconciliation happens apart from Christ\u0027s bodily death","The cross concerns only private forgiveness and not the wider order of creation","Reconciliation is cosmic only in a symbolic sense"]'::jsonb, 'A concrete historical death becomes the means by which God reconciles all things under Christ''s lordship', 'Paul speaks of peace through the blood of Christ''s cross and then says through Christ God reconciles all things to himself (Colossians 1:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Colossians 1 hold together the historical cross and cosmic reconciliation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 1, 5, 'Why does Paul call the gospel hope something preached in all creation under heaven?', '["He emphasizes the universal scope and public character of the gospel over against narrow, sectarian alternatives","He means every creature has already believed the gospel","He is speaking only about local churches in Asia","The gospel\u0027s reach matters less than private spirituality"]'::jsonb, 'He emphasizes the universal scope and public character of the gospel over against narrow, sectarian alternatives', 'Paul describes the gospel as preached in all creation under heaven while grounding the Colossians in its hope, stressing its broad and public reach (Colossians 1:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does Paul call the gospel hope something preached in all creation under heaven?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 1, 5, 'How does Colossians 1 portray the Christian life as deeply Trinitarian without using later technical formulas?', '["The Father rescues and qualifies, the Son redeems and reconciles, and the Spirit gives love and wisdom-filled life","Only the Father acts in salvation while Christ and the Spirit remain secondary","The chapter avoids any coordinated divine action","Spirit and Son are mentioned only as poetic images"]'::jsonb, 'The Father rescues and qualifies, the Son redeems and reconciles, and the Spirit gives love and wisdom-filled life', 'Paul speaks of the Father''s rescuing work, the Son''s redemption and reconciliation, and the Spirit-shaped love and wisdom of believers (Colossians 1:8-14, 20-22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Colossians 1 portray the Christian life as deeply Trinitarian without using later technical formulas?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 1, 5, 'What deeper point lies behind Paul''s joy in suffering for the church in Colossians 1?', '["A Christ-centered ministry can embrace suffering as service to the body rather than as contradiction to God\u0027s purpose","Suffering automatically earns salvation for others","Paul values pain more than Christ himself","The church grows only through apostolic imprisonment"]'::jsonb, 'A Christ-centered ministry can embrace suffering as service to the body rather than as contradiction to God''s purpose', 'Paul rejoices in suffering because it serves Christ''s body, the church, within his God-given ministry to make the word fully known (Colossians 1:24-25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What deeper point lies behind Paul''s joy in suffering for the church in Colossians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 2, 1, 'According to Colossians 2, in whom are hidden all the treasures of wisdom and knowledge?', '["Christ","Moses","The angels","The philosophers"]'::jsonb, 'Christ', 'Paul says all the treasures of wisdom and knowledge are hidden in Christ (Colossians 2:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Colossians 2, in whom are hidden all the treasures of wisdom and knowledge?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 2, 1, 'According to Colossians 2, how should believers walk after receiving Christ Jesus the Lord?', '["In him","In the law","In fear of rulers","In human tradition"]'::jsonb, 'In him', 'Paul says, ''As therefore you received Christ Jesus the Lord, walk in him'' (Colossians 2:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Colossians 2, how should believers walk after receiving Christ Jesus the Lord?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 2, 1, 'According to Colossians 2, what dwells in Christ bodily?', '["All the fullness of the Godhead","The law of Moses","The spirits of the prophets","The powers of Rome"]'::jsonb, 'All the fullness of the Godhead', 'Paul says in Christ all the fullness of the Godhead dwells bodily (Colossians 2:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Colossians 2, what dwells in Christ bodily?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 2, 1, 'According to Colossians 2, what was nailed to the cross?', '["The written code against us","The temple veil","The promises to Abraham","The prophets of Israel"]'::jsonb, 'The written code against us', 'Paul says the bond written in ordinances that was against us was taken out of the way, having been nailed to the cross (Colossians 2:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Colossians 2, what was nailed to the cross?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 2, 1, 'According to Colossians 2, what did Christ do to principalities and powers?', '["He disarmed them","He submitted to them","He learned from them","He hid from them"]'::jsonb, 'He disarmed them', 'Paul says Christ stripped principalities and powers and made a show of them openly, triumphing over them in it (Colossians 2:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Colossians 2, what did Christ do to principalities and powers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 2, 1, 'According to Colossians 2, what should no one judge believers in regarding food, drink, or holy times?', '["A feast, a new moon, or a Sabbath day","Their prayers and songs","Their faith in Christ","Their love for the saints"]'::jsonb, 'A feast, a new moon, or a Sabbath day', 'Paul says no one should judge them in eating, drinking, or regarding a feast, new moon, or Sabbath day (Colossians 2:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Colossians 2, what should no one judge believers in regarding food, drink, or holy times?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 2, 1, 'According to Colossians 2, what are such observances called in relation to Christ?', '["A shadow of the things to come","The substance of salvation","The highest wisdom","The eternal covenant itself"]'::jsonb, 'A shadow of the things to come', 'Paul says these things are a shadow of the things to come, but the body is Christ''s (Colossians 2:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Colossians 2, what are such observances called in relation to Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 2, 2, 'What does Paul say he desires for the hearts of the believers in Colossians 2?', '["That they may be comforted and knit together in love","That they may seek visions first","That they may rely on human tradition","That they may fear all spiritual powers"]'::jsonb, 'That they may be comforted and knit together in love', 'Paul says he wants their hearts to be comforted, being knit together in love (Colossians 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say he desires for the hearts of the believers in Colossians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 2, 2, 'What does Paul warn may take believers captive in Colossians 2?', '["Philosophy and empty deceit according to human tradition","The gospel of Christ","The peace of God","The hope of glory"]'::jsonb, 'Philosophy and empty deceit according to human tradition', 'Paul warns lest anyone take them captive through philosophy and empty deceit according to human tradition and not according to Christ (Colossians 2:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul warn may take believers captive in Colossians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 2, 2, 'How are believers said to be complete in Colossians 2?', '["In Christ","In the law of Moses","In bodily discipline","In angelic worship"]'::jsonb, 'In Christ', 'Paul says believers are made full or complete in Christ, who is head of all principality and power (Colossians 2:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'How are believers said to be complete in Colossians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 2, 2, 'What kind of circumcision does Paul describe in Colossians 2?', '["A circumcision made without hands","A circumcision required from Abraham\u0027s line only","A priestly circumcision in the temple","A circumcision by Roman law"]'::jsonb, 'A circumcision made without hands', 'Paul says believers were circumcised with a circumcision not made with hands in the putting off of the body of flesh (Colossians 2:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What kind of circumcision does Paul describe in Colossians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 2, 2, 'How were believers raised with Christ according to Colossians 2?', '["Through faith in the working of God","Through food regulations","Through angelic mediators","Through Roman citizenship"]'::jsonb, 'Through faith in the working of God', 'Paul says believers were raised with Christ through faith in the working of God, who raised him from the dead (Colossians 2:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'How were believers raised with Christ according to Colossians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 2, 2, 'What does Paul say false teachers delight in in Colossians 2?', '["Self-abasement and the worship of angels","The freedom of Christ","The hope of the resurrection","The simplicity of the gospel"]'::jsonb, 'Self-abasement and the worship of angels', 'Paul warns against those delighting in false humility and the worship of angels (Colossians 2:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say false teachers delight in in Colossians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 2, 2, 'From whom does the whole body grow according to Colossians 2?', '["The Head","The philosophers","The principalities","The outward ordinances"]'::jsonb, 'The Head', 'Paul says the whole body grows with God''s growth by holding fast to the Head (Colossians 2:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'From whom does the whole body grow according to Colossians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 2, 3, 'Why does Paul stress rootedness and being built up in Christ in Colossians 2?', '["Stable growth in Christ protects believers from persuasive error and hollow alternatives","Christ is only the starting point before deeper systems are added","Being rooted in Christ limits thanksgiving and joy","The church matures best by leaving Christ behind"]'::jsonb, 'Stable growth in Christ protects believers from persuasive error and hollow alternatives', 'Paul urges them to walk in Christ, rooted and built up in him, right after warning against enticing words and later against philosophy not according to Christ (Colossians 2:4, 6-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul stress rootedness and being built up in Christ in Colossians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 2, 3, 'What does Colossians 2 imply about union with Christ in relation to old ordinances?', '["Dying and rising with Christ means the old condemning order no longer defines the believer","Union with Christ restores the old ordinances as the center of life","Only Jewish believers die and rise with Christ","The old written code remains the way of justification"]'::jsonb, 'Dying and rising with Christ means the old condemning order no longer defines the believer', 'Paul speaks of burial and resurrection with Christ, forgiveness of sins, and the removal of the written code against believers (Colossians 2:12-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Colossians 2 imply about union with Christ in relation to old ordinances?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 2, 3, 'Why does Paul oppose angel worship in Colossians 2?', '["It distracts from holding fast to Christ, the only head and source of growth","Angels are evil in every biblical context","The church should never think about heavenly things","Angel worship is acceptable if paired with humility"]'::jsonb, 'It distracts from holding fast to Christ, the only head and source of growth', 'Paul warns that such people are not holding firmly to the Head, from whom the whole body grows (Colossians 2:18-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul oppose angel worship in Colossians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 2, 3, 'What is the point of calling food laws and holy days a shadow in Colossians 2?', '["They pointed forward to Christ and must not be treated as the final substance","They were always meaningless and unrelated to God","They remain more important than Christ for maturity","They save those who keep them carefully"]'::jsonb, 'They pointed forward to Christ and must not be treated as the final substance', 'Paul says such observances are a shadow of things to come, but the substance belongs to Christ (Colossians 2:16-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the point of calling food laws and holy days a shadow in Colossians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 2, 3, 'What does Colossians 2 teach about Christ''s victory over hostile powers?', '["The cross is the means by which Christ publicly triumphs over spiritual rulers and authorities","Hostile powers remain outside Christ\u0027s authority","Victory comes mainly through severe bodily discipline","Believers must fear the powers because Christ only partly defeated them"]'::jsonb, 'The cross is the means by which Christ publicly triumphs over spiritual rulers and authorities', 'Paul says Christ disarmed the rulers and authorities and triumphed over them in the cross (Colossians 2:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Colossians 2 teach about Christ''s victory over hostile powers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 2, 3, 'Why does Paul criticize regulations like ''Do not handle, nor taste, nor touch'' in Colossians 2?', '["They appear wise but cannot restrain fleshly indulgence or produce true spiritual life","They are the heart of Christian maturity","They are commanded directly by Christ for all believers","They replace the need for faith in God\u0027s work"]'::jsonb, 'They appear wise but cannot restrain fleshly indulgence or produce true spiritual life', 'Paul says such regulations have an appearance of wisdom but are of no value against the indulgence of the flesh (Colossians 2:20-23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul criticize regulations like ''Do not handle, nor taste, nor touch'' in Colossians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 2, 3, 'What does it mean for believers to be complete in Christ in Colossians 2?', '["Nothing outside Christ is needed to supply spiritual fullness or status before God","Christ begins salvation, but higher beings complete it","Completion comes through rules about food and days","Only certain elite believers are complete in Christ"]'::jsonb, 'Nothing outside Christ is needed to supply spiritual fullness or status before God', 'Paul says believers are made full in Christ right after declaring that all the fullness of deity dwells in him bodily (Colossians 2:9-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does it mean for believers to be complete in Christ in Colossians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 2, 4, 'How does Colossians 2 connect Christ''s fullness with the rejection of false spirituality?', '["Because God\u0027s fullness dwells bodily in Christ, believers need no rival source of wisdom, power, or access to God","Christ\u0027s fullness encourages believers to seek angelic supplements","False spirituality is harmless if Christ remains central in theory","Paul treats fullness and false teaching as unrelated topics"]'::jsonb, 'Because God''s fullness dwells bodily in Christ, believers need no rival source of wisdom, power, or access to God', 'Paul grounds the warning against philosophy, ritual judgment, and angel worship in the fact that all divine fullness dwells in Christ and believers are complete in him (Colossians 2:8-10, 16-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Colossians 2 connect Christ''s fullness with the rejection of false spirituality?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 2, 4, 'Why does Paul treat ascetic regulations as inadequate in Colossians 2?', '["External severity cannot replace the inner transformation that comes from union with Christ","Ascetic practices are always the true path to holiness","The body is evil and must be punished to be saved","Only Gentiles were tempted by bodily discipline"]'::jsonb, 'External severity cannot replace the inner transformation that comes from union with Christ', 'Paul says these regulations have an appearance of wisdom but lack real value against fleshly indulgence, in contrast to life rooted in Christ (Colossians 2:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul treat ascetic regulations as inadequate in Colossians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 2, 4, 'How does Colossians 2 portray baptism in relation to Christ''s death and resurrection?', '["Believers\u0027 baptism is tied to burial and resurrection with Christ through faith in God\u0027s power","Baptism replaces faith as the basis of salvation","Baptism is mainly a cultural sign of belonging to Israel","Paul mentions baptism only as a minor ritual detail"]'::jsonb, 'Believers'' baptism is tied to burial and resurrection with Christ through faith in God''s power', 'Paul says believers were buried with Christ in baptism and raised with him through faith in God''s working (Colossians 2:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Colossians 2 portray baptism in relation to Christ''s death and resurrection?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 2, 4, 'What is the significance of holding fast to the Head in Colossians 2?', '["Growth in the body comes only by living connection to Christ, not by visionary or ritual alternatives","The body can grow equally well without Christ if it has discipline","The Head is one option among many for spiritual maturity","Paul uses body language only as a metaphor for social harmony"]'::jsonb, 'Growth in the body comes only by living connection to Christ, not by visionary or ritual alternatives', 'Paul says the whole body grows with God''s growth from the Head, contrasting that with those obsessed with false humility and angel worship (Colossians 2:18-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'What is the significance of holding fast to the Head in Colossians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 2, 4, 'How does Colossians 2 combine forgiveness and victory?', '["The same cross that forgives sins also cancels hostile accusations and defeats hostile powers","Forgiveness concerns God while victory concerns only human enemies","Victory over powers makes forgiveness unnecessary","The two themes stand unrelated in the chapter"]'::jsonb, 'The same cross that forgives sins also cancels hostile accusations and defeats hostile powers', 'Paul moves from forgiveness and the removal of the written code to Christ''s triumph over rulers and authorities through the cross (Colossians 2:13-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Colossians 2 combine forgiveness and victory?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 2, 4, 'Why does Paul stress thanksgiving while warning against deception in Colossians 2?', '["A grateful, rooted life in Christ helps stabilize believers against teachings that promise more than Christ gives","Thanksgiving is a minor ornament unrelated to steadfastness","Deception is best countered only by intellectual argument","Paul thinks gratitude belongs only to mature leaders"]'::jsonb, 'A grateful, rooted life in Christ helps stabilize believers against teachings that promise more than Christ gives', 'Paul calls them to be rooted and built up in Christ, established in the faith, and abounding in thanksgiving in the same section where he warns against deceptive teaching (Colossians 2:6-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul stress thanksgiving while warning against deception in Colossians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 2, 4, 'How does Colossians 2 challenge spiritual elitism?', '["Everything needed for wisdom, fullness, forgiveness, and growth is already given in Christ to the whole church","Only those with visions can truly know God","Maturity belongs only to those who adopt stricter regulations","The church requires layers of mediators beyond Christ"]'::jsonb, 'Everything needed for wisdom, fullness, forgiveness, and growth is already given in Christ to the whole church', 'Paul directs all believers to Christ as the location of wisdom and fullness and rejects systems built on visions, regulations, and angelic intermediaries (Colossians 2:2-10, 18-23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Colossians 2 challenge spiritual elitism?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 2, 5, 'How does Colossians 2 present Christ as the answer to both legalism and mysticism?', '["Christ\u0027s fullness, cross, and headship undercut both ritual self-righteousness and visionary spirituality","Paul rejects legalism but encourages mystical mediators","The chapter attacks only legalism and leaves mysticism intact","Mysticism and legalism are both necessary supplements to Christ"]'::jsonb, 'Christ''s fullness, cross, and headship undercut both ritual self-righteousness and visionary spirituality', 'Paul opposes judgment over food and days as well as angel worship and ascetic regulations by centering fullness, forgiveness, and growth in Christ alone (Colossians 2:9-10, 16-23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Colossians 2 present Christ as the answer to both legalism and mysticism?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 2, 5, 'Why is the phrase ''according to Christ'' decisive in Colossians 2?', '["It establishes Christ as the standard by which every philosophy, practice, and claim to wisdom must be judged","It limits Christ\u0027s relevance to private devotion only","It implies human tradition and Christ are equal authorities","It refers only to Paul\u0027s personal style of ministry"]'::jsonb, 'It establishes Christ as the standard by which every philosophy, practice, and claim to wisdom must be judged', 'Paul warns against teachings according to human tradition and the elemental principles of the world, and not according to Christ (Colossians 2:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the phrase ''according to Christ'' decisive in Colossians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 2, 5, 'How does Colossians 2 portray the believer''s freedom without turning it into autonomy?', '["Believers are freed from condemning ordinances and false judgments precisely to live under Christ the Head","Freedom means release from all accountability and growth","Freedom is achieved by stricter self-imposed rules","Paul\u0027s freedom is only from Jewish practice, not from spiritual bondage"]'::jsonb, 'Believers are freed from condemning ordinances and false judgments precisely to live under Christ the Head', 'Paul removes condemning ordinances and warns against human judgments while insisting on holding fast to Christ as Head (Colossians 2:14-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Colossians 2 portray the believer''s freedom without turning it into autonomy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 2, 5, 'What deeper problem lies beneath the regulations criticized in Colossians 2?', '["They promise control over the flesh while bypassing the person and work of Christ as the true source of life","They are wrong only because they are difficult to keep","They fail mainly because the church lacks enough discipline","They would work if combined with more visions"]'::jsonb, 'They promise control over the flesh while bypassing the person and work of Christ as the true source of life', 'Paul says such practices appear wise but have no value against fleshly indulgence, in contrast to life rooted in Christ''s fullness and victory (Colossians 2:8-10, 23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What deeper problem lies beneath the regulations criticized in Colossians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 2, 5, 'How does Colossians 2 make the cross central to spiritual warfare?', '["The cross is where accusation is canceled, forgiveness given, and hostile powers publicly defeated","Spiritual warfare requires practices beyond the cross to succeed","The cross forgives sins but does not affect spiritual rulers","The chapter locates spiritual victory mainly in ascetic rigor"]'::jsonb, 'The cross is where accusation is canceled, forgiveness given, and hostile powers publicly defeated', 'Paul ties forgiveness, cancellation of the written code, and triumph over rulers and authorities together in Christ''s cross (Colossians 2:13-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Colossians 2 make the cross central to spiritual warfare?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 2, 5, 'Why is Colossians 2 so important for understanding Christian holiness?', '["It teaches that real holiness grows from union with Christ rather than from externally impressive but powerless regulations","It teaches holiness is impossible in the body","It makes bodily discipline the center of sanctification","It says holiness comes by judging others over shadows"]'::jsonb, 'It teaches that real holiness grows from union with Christ rather than from externally impressive but powerless regulations', 'Paul roots fullness and growth in Christ while saying human regulations only appear wise and lack power against the flesh (Colossians 2:10, 19, 23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Colossians 2 so important for understanding Christian holiness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 2, 5, 'How does Colossians 2 frame the church''s maturity as corporate rather than merely private?', '["The whole body grows from the Head as its members are joined and knit together under Christ","Growth belongs only to isolated individuals with special discipline","The body is irrelevant if one has enough personal knowledge","Only prophets and teachers need connection to the Head"]'::jsonb, 'The whole body grows from the Head as its members are joined and knit together under Christ', 'Paul says the whole body, supplied and knit together, grows with God''s growth by holding fast to the Head (Colossians 2:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Colossians 2 frame the church''s maturity as corporate rather than merely private?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 3, 1, 'According to Colossians 3, where should believers seek the things above?', '["Where Christ is seated at God\u0027s right hand","Where the temple still stands","Where Rome gives honor","Where angels rule independently"]'::jsonb, 'Where Christ is seated at God''s right hand', 'Paul tells believers to seek the things above, where Christ is seated on the right hand of God (Colossians 3:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Colossians 3, where should believers seek the things above?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 3, 1, 'According to Colossians 3, what should believers put to death?', '["Their members which are on the earth","Their hope in heaven","Their love for the saints","Their knowledge of Christ"]'::jsonb, 'Their members which are on the earth', 'Paul says to put to death the earthly members, then names sexual immorality, uncleanness, passion, evil desire, and covetousness (Colossians 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Colossians 3, what should believers put to death?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 3, 1, 'According to Colossians 3, what does Paul call covetousness?', '["Idolatry","Wisdom","Weakness","Tradition"]'::jsonb, 'Idolatry', 'Paul explicitly says covetousness is idolatry (Colossians 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Colossians 3, what does Paul call covetousness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 3, 1, 'According to Colossians 3, what should the peace of Christ do in believers'' hearts?', '["Rule","Depart","Condemn","Remain hidden"]'::jsonb, 'Rule', 'Paul says, ''Let the peace of Christ rule in your hearts'' (Colossians 3:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Colossians 3, what should the peace of Christ do in believers'' hearts?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 3, 1, 'According to Colossians 3, what should dwell richly in believers?', '["The word of Christ","The fear of men","The customs of the nations","The wisdom of philosophers"]'::jsonb, 'The word of Christ', 'Paul says to let the word of Christ dwell in them richly (Colossians 3:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Colossians 3, what should dwell richly in believers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 3, 1, 'According to Colossians 3, what should wives do toward their husbands?', '["Be subject, as is fitting in the Lord","Ignore them completely","Rule them harshly","Withdraw from them in worship"]'::jsonb, 'Be subject, as is fitting in the Lord', 'Paul says wives should be subject to their husbands, as is fitting in the Lord (Colossians 3:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Colossians 3, what should wives do toward their husbands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 3, 1, 'According to Colossians 3, whom are servants ultimately serving?', '["The Lord Christ","Their earthly masters only","The rulers and authorities","Their own household"]'::jsonb, 'The Lord Christ', 'Paul says, ''You serve the Lord Christ'' (Colossians 3:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Colossians 3, whom are servants ultimately serving?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 3, 2, 'What does Paul say believers'' life is hidden with in Colossians 3?', '["Christ in God","The law in Moses","The church in Jerusalem","Wisdom in angels"]'::jsonb, 'Christ in God', 'Paul says believers died, and their life is hidden with Christ in God (Colossians 3:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say believers'' life is hidden with in Colossians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 3, 2, 'What old behaviors does Paul tell believers to put away in Colossians 3?', '["Anger, wrath, malice, slander, and shameful speaking","Faith, hope, and love","Prayer, thanksgiving, and singing","Patience, gentleness, and kindness"]'::jsonb, 'Anger, wrath, malice, slander, and shameful speaking', 'Paul commands believers to put away anger, wrath, malice, slander, and shameful speaking from their mouth (Colossians 3:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What old behaviors does Paul tell believers to put away in Colossians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 3, 2, 'What does Paul say believers have put on in Colossians 3?', '["The new man","The whole armor of Rome","The old ordinances","The traditions of the fathers"]'::jsonb, 'The new man', 'Paul says believers have put on the new man, which is being renewed in knowledge after the image of its Creator (Colossians 3:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say believers have put on in Colossians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 3, 2, 'What does Paul call the bond of perfection in Colossians 3?', '["Love","Knowledge","Discipline","Silence"]'::jsonb, 'Love', 'Paul says above all these things to put on love, which is the bond of perfection (Colossians 3:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul call the bond of perfection in Colossians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 3, 2, 'How are believers to sing according to Colossians 3?', '["With grace in their hearts to God","Only in public ceremonies","Without understanding","Only when commanded by leaders"]'::jsonb, 'With grace in their hearts to God', 'Paul says believers should teach and admonish one another with psalms, hymns, and spiritual songs, singing with grace in their hearts to God (Colossians 3:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'How are believers to sing according to Colossians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 3, 2, 'What should children do according to Colossians 3?', '["Obey their parents in all things","Provoke their fathers","Seek only their own way","Question every command with anger"]'::jsonb, 'Obey their parents in all things', 'Paul says children should obey their parents in all things, for this pleases the Lord (Colossians 3:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What should children do according to Colossians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 3, 2, 'What warning does Paul give fathers in Colossians 3?', '["Do not provoke your children, so they won\u0027t be discouraged","Do not teach your children the Lord\u0027s way","Do not speak gently to your children","Do not correct your household at all"]'::jsonb, 'Do not provoke your children, so they won''t be discouraged', 'Paul tells fathers not to provoke their children, lest they become discouraged (Colossians 3:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What warning does Paul give fathers in Colossians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 3, 3, 'What does Colossians 3 imply by saying believers have died and been raised with Christ?', '["Their identity and values are now determined by the risen Christ rather than the old earthly order","They no longer live in bodily existence at all","Their earthly actions no longer matter","Paul rejects creation as evil in itself"]'::jsonb, 'Their identity and values are now determined by the risen Christ rather than the old earthly order', 'Paul grounds the call to seek things above in the believer''s death and risen life with Christ (Colossians 3:1-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Colossians 3 imply by saying believers have died and been raised with Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 3, 3, 'Why does Paul move from setting the mind above to household relationships in Colossians 3?', '["Union with Christ reshapes both inner priorities and ordinary earthly conduct","He abandons theology once ethics begin","Household life matters less than worship and song","The heavenly life has no practical implications"]'::jsonb, 'Union with Christ reshapes both inner priorities and ordinary earthly conduct', 'Paul begins with the heavenly identity of believers and then applies it to speech, forgiveness, worship, family life, and work (Colossians 3:1-25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul move from setting the mind above to household relationships in Colossians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 3, 3, 'What does Colossians 3 teach about Christian identity beyond ethnic and social divisions?', '["Christ is all and in all within the new humanity","Ethnic status remains the center of the new life","Social divisions are the basis of holiness","The new man exists only for Jewish believers"]'::jsonb, 'Christ is all and in all within the new humanity', 'Paul says in the new man there cannot be Greek or Jew, circumcision or uncircumcision, barbarian, Scythian, bondservant, or free man, but Christ is all and in all (Colossians 3:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Colossians 3 teach about Christian identity beyond ethnic and social divisions?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 3, 3, 'Why does Paul place forgiveness alongside compassion, kindness, and humility in Colossians 3?', '["The new life in Christ is communal and must mirror the Lord\u0027s own forgiving grace","Forgiveness matters only if the offense is small","Kindness and humility are unrelated to reconciliation","Believers forgive mainly to avoid punishment"]'::jsonb, 'The new life in Christ is communal and must mirror the Lord''s own forgiving grace', 'Paul tells believers to bear with and forgive one another just as the Lord forgave them (Colossians 3:12-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul place forgiveness alongside compassion, kindness, and humility in Colossians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 3, 3, 'What does it mean for the word of Christ to dwell richly in believers?', '["Christ\u0027s message is to saturate the church\u0027s teaching, worship, and mutual admonition","Only leaders need Christ\u0027s word in a deep way","The word matters mainly for private memory work","Singing replaces the need for teaching"]'::jsonb, 'Christ''s message is to saturate the church''s teaching, worship, and mutual admonition', 'Paul links the word of Christ dwelling richly with teaching, admonishing, and singing together (Colossians 3:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does it mean for the word of Christ to dwell richly in believers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 3, 3, 'How does Colossians 3 transform ordinary work?', '["Whatever believers do becomes service rendered to the Lord rather than merely to human masters","Ordinary work is spiritually inferior and outside Christ\u0027s lordship","Only public ministry can be done for the Lord","Work matters only when it gains praise from others"]'::jsonb, 'Whatever believers do becomes service rendered to the Lord rather than merely to human masters', 'Paul says whatever they do, they should work heartily as to the Lord and not to men, because they serve the Lord Christ (Colossians 3:23-24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Colossians 3 transform ordinary work?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 3, 3, 'What does Colossians 3 imply about the old and new selves?', '["Christian life involves decisive rejection of old sinful patterns and continual renewal into God\u0027s image","The old self remains the believer\u0027s truest identity","Renewal is unnecessary once sins are forgiven","Paul treats ethics as unrelated to creation"]'::jsonb, 'Christian life involves decisive rejection of old sinful patterns and continual renewal into God''s image', 'Paul says believers have put off the old man with its practices and put on the new man being renewed in knowledge after the image of its Creator (Colossians 3:9-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Colossians 3 imply about the old and new selves?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 3, 4, 'How does Colossians 3 connect heavenly-mindedness with earthly obedience?', '["Setting the mind above produces concrete holiness in speech, relationships, worship, and work below","Heavenly-mindedness excuses neglect of ordinary duties","Paul contrasts spiritual focus with household faithfulness","Earthly conduct becomes irrelevant once Christ is known"]'::jsonb, 'Setting the mind above produces concrete holiness in speech, relationships, worship, and work below', 'Paul moves directly from seeking things above to commands about purity, speech, love, peace, worship, and household life (Colossians 3:1-25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Colossians 3 connect heavenly-mindedness with earthly obedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 3, 4, 'Why does Paul say believers will appear with Christ in glory?', '["The hidden life they now share with Christ will one day be openly revealed in his appearing","Present life in Christ remains permanently invisible and private","Glory belongs only to apostles and martyrs","Believers earn glory by household obedience"]'::jsonb, 'The hidden life they now share with Christ will one day be openly revealed in his appearing', 'Paul says their life is hidden with Christ in God now, but when Christ appears, they also will appear with him in glory (Colossians 3:3-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul say believers will appear with Christ in glory?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 3, 4, 'How does Colossians 3 portray peace and gratitude in the life of the church?', '["Christ\u0027s peace and repeated thanksgiving are meant to govern the church\u0027s shared life and worship","Peace matters privately, while gratitude matters only in singing","Thanksgiving is optional when peace is present","Paul separates peace from communal unity"]'::jsonb, 'Christ''s peace and repeated thanksgiving are meant to govern the church''s shared life and worship', 'Paul says the peace of Christ should rule in their hearts as one body, and he repeatedly commands thanksgiving in this section (Colossians 3:15-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Colossians 3 portray peace and gratitude in the life of the church?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 3, 4, 'What does Colossians 3 suggest about the image of God and the new creation?', '["Renewal in Christ restores people toward the Creator\u0027s image in a way that reorders community life","Image language is unrelated to ethics or community","Only inward belief matters, not recreated humanity","The new creation abolishes all ordinary relationships"]'::jsonb, 'Renewal in Christ restores people toward the Creator''s image in a way that reorders community life', 'Paul says the new man is renewed after the image of its Creator and then applies that renewed life to the church and household relationships (Colossians 3:10-25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Colossians 3 suggest about the image of God and the new creation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 3, 4, 'Why does Paul ground all actions in the name of the Lord Jesus in Colossians 3?', '["Christ\u0027s lordship is to govern every word and deed, making all of life an act of thankful obedience","Only religious acts are done in Christ\u0027s name","The name of Jesus matters only for public preaching","Paul reserves Christ\u0027s name for moments of conflict"]'::jsonb, 'Christ''s lordship is to govern every word and deed, making all of life an act of thankful obedience', 'Paul says whatever they do in word or deed should be done in the name of the Lord Jesus, giving thanks through him to God the Father (Colossians 3:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul ground all actions in the name of the Lord Jesus in Colossians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 3, 4, 'How does Colossians 3 reshape social hierarchies without denying ordinary roles?', '["All roles are subordinated to Christ\u0027s impartial lordship so that even servants work and are rewarded before him","Paul leaves earthly relationships entirely untouched by the gospel","The gospel abolishes all forms of obedience in households","Only free persons can truly serve the Lord Christ"]'::jsonb, 'All roles are subordinated to Christ''s impartial lordship so that even servants work and are rewarded before him', 'Paul tells servants they serve the Lord Christ and warns that wrongdoers will receive back for wrong without partiality (Colossians 3:23-25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Colossians 3 reshape social hierarchies without denying ordinary roles?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 3, 4, 'Why does Colossians 3 place love above the other virtues?', '["Love binds the new community together into mature wholeness in Christ","Love replaces the need for truth or holiness","Paul thinks compassion and kindness are unnecessary without love","Love is mainly an emotional experience disconnected from community"]'::jsonb, 'Love binds the new community together into mature wholeness in Christ', 'Paul says above all these things to put on love, which is the bond of perfection (Colossians 3:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Colossians 3 place love above the other virtues?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 3, 5, 'How does Colossians 3 present sanctification as participation in the risen life of Christ?', '["Holy living flows from sharing Christ\u0027s death, hidden life, and future glory rather than from mere rule-keeping","Sanctification is mainly self-improvement through discipline alone","The risen life has no effect on bodily conduct","Paul bases holiness on social respectability rather than union with Christ"]'::jsonb, 'Holy living flows from sharing Christ''s death, hidden life, and future glory rather than from mere rule-keeping', 'Paul grounds the whole chapter''s ethical commands in the believers'' death and risen life with Christ and their future appearing with him in glory (Colossians 3:1-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Colossians 3 present sanctification as participation in the risen life of Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 3, 5, 'Why is Colossians 3 important for understanding Christian worship?', '["Worship is portrayed as word-saturated, mutually instructive, thankful, and inseparable from the church\u0027s common life","Worship is reduced to inward meditation only","Only leaders participate actively in worship","Singing replaces the need for teaching and admonition"]'::jsonb, 'Worship is portrayed as word-saturated, mutually instructive, thankful, and inseparable from the church''s common life', 'Paul links the word of Christ, teaching, admonishing, singing, and thanksgiving as shared practices of the body (Colossians 3:15-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Colossians 3 important for understanding Christian worship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 3, 5, 'How does Colossians 3 answer the idea that deep spirituality is separate from ordinary relationships?', '["The risen life in Christ must be expressed in forgiveness, peace, marriage, parenting, and work under his lordship","Spirituality belongs only to prayer and song, not households","Ordinary relationships remain outside Christ\u0027s reign","Paul thinks the household code is unrelated to union with Christ"]'::jsonb, 'The risen life in Christ must be expressed in forgiveness, peace, marriage, parenting, and work under his lordship', 'Paul moves from heavenly identity and church virtues directly into household commands, showing the comprehensive reach of Christ''s lordship (Colossians 3:1-25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Colossians 3 answer the idea that deep spirituality is separate from ordinary relationships?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 3, 5, 'What does Colossians 3 imply about idolatry and desire?', '["Disordered desire can become worship, so the battle for holiness is also a battle over what the heart treats as ultimate","Idolatry concerns only carved images and never inward cravings","Desire is morally neutral in every form","Paul limits idolatry to pagan temple rituals"]'::jsonb, 'Disordered desire can become worship, so the battle for holiness is also a battle over what the heart treats as ultimate', 'Paul identifies covetousness as idolatry, showing that desire can become a form of false worship (Colossians 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Colossians 3 imply about idolatry and desire?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 3, 5, 'How does Colossians 3 unite grace and responsibility?', '["The new self is a gift of renewal from God, yet believers are called to actively put off sin and put on Christlike virtues","Grace removes all obligation to pursue holiness","Responsibility replaces the need for grace","Renewal depends entirely on human effort"]'::jsonb, 'The new self is a gift of renewal from God, yet believers are called to actively put off sin and put on Christlike virtues', 'Paul speaks of the new man being renewed and simultaneously commands believers to put to death sin and clothe themselves with virtues fitting the chosen of God (Colossians 3:5, 10, 12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Colossians 3 unite grace and responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 3, 5, 'Why is thanksgiving repeated so often in Colossians 3?', '["Thanksgiving is a core expression of the Christ-centered life, shaping peace, worship, and every word and deed","Paul repeats it only for stylistic variety","Thanksgiving matters less than strict discipline","Only public worship should include gratitude"]'::jsonb, 'Thanksgiving is a core expression of the Christ-centered life, shaping peace, worship, and every word and deed', 'Paul repeatedly commands thankfulness alongside peace, song, and action in Jesus'' name, showing gratitude as central to Christian life (Colossians 3:15-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is thanksgiving repeated so often in Colossians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 3, 5, 'What deeper social vision stands behind Colossians 3:11?', '["The new humanity in Christ relativizes old divisions because Christ himself is the defining center of identity","Social distinctions remain the church\u0027s primary categories","Paul wants all cultures erased into sameness","Only private faith matters, not communal identity"]'::jsonb, 'The new humanity in Christ relativizes old divisions because Christ himself is the defining center of identity', 'Paul says Christ is all and in all within the new humanity, showing that former identities no longer define covenant standing as before (Colossians 3:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What deeper social vision stands behind Colossians 3:11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 4, 1, 'According to Colossians 4, how should masters treat their servants?', '["With justice and fairness","With harshness and threats","With partiality and fear","With silence and neglect"]'::jsonb, 'With justice and fairness', 'Paul tells masters to give their servants what is just and fair (Colossians 4:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Colossians 4, how should masters treat their servants?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 4, 1, 'According to Colossians 4, how are believers to continue in prayer?', '["Steadfastly, watching in it with thanksgiving","Only in times of crisis","With fear of rulers","Without any thanksgiving"]'::jsonb, 'Steadfastly, watching in it with thanksgiving', 'Paul says to continue steadfastly in prayer, watching in it with thanksgiving (Colossians 4:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Colossians 4, how are believers to continue in prayer?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 4, 1, 'According to Colossians 4, what does Paul ask God to open for him?', '["A door for the word","The prison gate only","A seat in Caesar\u0027s court","The treasury of Jerusalem"]'::jsonb, 'A door for the word', 'Paul asks for prayer that God would open to them a door for the word to speak the mystery of Christ (Colossians 4:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Colossians 4, what does Paul ask God to open for him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 4, 1, 'According to Colossians 4, with what should believers'' speech always be seasoned?', '["Grace, seasoned with salt","Fear, seasoned with silence","Law, seasoned with strictness","Power, seasoned with threat"]'::jsonb, 'Grace, seasoned with salt', 'Paul says their speech should always be with grace, seasoned with salt (Colossians 4:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Colossians 4, with what should believers'' speech always be seasoned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 4, 1, 'According to Colossians 4, who will make Paul''s circumstances known to the Colossians?', '["Tychicus","Timothy","Mark","Nympha"]'::jsonb, 'Tychicus', 'Paul says Tychicus will make all things known to them (Colossians 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Colossians 4, who will make Paul''s circumstances known to the Colossians?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 4, 1, 'According to Colossians 4, who is sent with Tychicus?', '["Onesimus","Epaphras","Demas","Luke"]'::jsonb, 'Onesimus', 'Paul says Onesimus, the faithful and beloved brother, is coming with Tychicus (Colossians 4:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Colossians 4, who is sent with Tychicus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 4, 1, 'According to Colossians 4, in whose house does the church meet?', '["Nympha\u0027s","Lydia\u0027s","Priscilla\u0027s","Euodia\u0027s"]'::jsonb, 'Nympha''s', 'Paul greets Nympha and the assembly that is in her house (Colossians 4:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Colossians 4, in whose house does the church meet?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 4, 2, 'Why does Paul ask for prayer in Colossians 4?', '["That he may speak the mystery of Christ clearly","That he may regain his former status","That he may avoid all ministry hardship","That he may return to the law"]'::jsonb, 'That he may speak the mystery of Christ clearly', 'Paul asks prayer that he may make the mystery of Christ manifest as he ought to speak (Colossians 4:3-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why does Paul ask for prayer in Colossians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 4, 2, 'How should believers walk toward those who are outside according to Colossians 4?', '["In wisdom, redeeming the time","In fear, avoiding every conversation","In harsh judgment","In dependence on visions"]'::jsonb, 'In wisdom, redeeming the time', 'Paul says they should walk in wisdom toward outsiders, redeeming the time (Colossians 4:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'How should believers walk toward those who are outside according to Colossians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 4, 2, 'What does Paul say believers should know about answering each person?', '["How they ought to answer each one","How to silence every opponent harshly","How to avoid all difficult questions","How to speak only to insiders"]'::jsonb, 'How they ought to answer each one', 'Paul says their gracious speech should help them know how they ought to answer each one (Colossians 4:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say believers should know about answering each person?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 4, 2, 'How does Paul describe Epaphras in Colossians 4?', '["A servant of Christ Jesus who always labors fervently in prayers","A ruler over the churches of Asia","A teacher of angelic mysteries","A philosopher from Greece"]'::jsonb, 'A servant of Christ Jesus who always labors fervently in prayers', 'Paul says Epaphras, one of them and a servant of Christ Jesus, always strives for them in prayers (Colossians 4:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does Paul describe Epaphras in Colossians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 4, 2, 'For whom does Paul say Epaphras has much zeal?', '["Those in Colossae, Laodicea, and Hierapolis","Those in Rome, Corinth, and Galatia","Those in Jerusalem alone","Those in Macedonia only"]'::jsonb, 'Those in Colossae, Laodicea, and Hierapolis', 'Paul says Epaphras has great zeal for those in Colossae, Laodicea, and Hierapolis (Colossians 4:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'For whom does Paul say Epaphras has much zeal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 4, 2, 'Which fellow worker does Paul identify as the beloved physician in Colossians 4?', '["Luke","Demas","Aristarchus","Justus"]'::jsonb, 'Luke', 'Paul says Luke, the beloved physician, and Demas greet them (Colossians 4:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'Which fellow worker does Paul identify as the beloved physician in Colossians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 4, 2, 'What message does Paul tell the Colossians to give Archippus?', '["Take heed to the ministry you received in the Lord, that you fulfill it","Return to Jerusalem at once","Set your mind on earthly things","Receive circumcision without delay"]'::jsonb, 'Take heed to the ministry you received in the Lord, that you fulfill it', 'Paul tells them to say to Archippus, ''Take heed to the ministry which you have received in the Lord, that you fulfill it'' (Colossians 4:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What message does Paul tell the Colossians to give Archippus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 4, 3, 'What does Colossians 4 teach about prayer and mission?', '["Prayer is to accompany gospel mission by asking God to open doors and grant clear speech","Mission advances mainly without prayer","Prayer belongs to private comfort, not proclamation","Paul prays only for release, not for witness"]'::jsonb, 'Prayer is to accompany gospel mission by asking God to open doors and grant clear speech', 'Paul asks for steadfast prayer and specifically requests prayer for an open door and clear proclamation of Christ''s mystery (Colossians 4:2-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Colossians 4 teach about prayer and mission?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 4, 3, 'Why does Paul emphasize gracious speech seasoned with salt?', '["Christian witness should be both attractive and discerning, suited to each person encountered","Salt language refers only to ritual sacrifice","Speech matters less than inward belief","Paul wants believers to avoid answering outsiders"]'::jsonb, 'Christian witness should be both attractive and discerning, suited to each person encountered', 'Paul joins gracious, seasoned speech with the ability to answer each person appropriately (Colossians 4:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul emphasize gracious speech seasoned with salt?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 4, 3, 'What does Colossians 4 suggest about gospel fellowship?', '["The mission of Christ is carried by a network of faithful coworkers, praying friends, and house churches","Paul works largely alone and rejects assistance","Only apostles matter in the church\u0027s life","Households have no role in gospel ministry"]'::jsonb, 'The mission of Christ is carried by a network of faithful coworkers, praying friends, and house churches', 'Paul names multiple coworkers, mentions Epaphras''s prayers, and greets the church in Nympha''s house, showing shared gospel labor (Colossians 4:7-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Colossians 4 suggest about gospel fellowship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 4, 3, 'Why does Paul instruct the Colossians and Laodiceans to exchange letters?', '["The churches are to share apostolic teaching across their local boundaries for common edification","Each church needs a different gospel message","Written instruction matters less than oral rumor","Paul wants to compare the churches competitively"]'::jsonb, 'The churches are to share apostolic teaching across their local boundaries for common edification', 'Paul instructs that this letter be read in Laodicea and that the Colossians also read the letter from Laodicea (Colossians 4:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul instruct the Colossians and Laodiceans to exchange letters?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 4, 3, 'What does Epaphras''s prayer aim at for the Colossians?', '["That they may stand perfect and fully assured in all the will of God","That they may gain favor with Rome","That they may become free from work","That they may seek mystical visions"]'::jsonb, 'That they may stand perfect and fully assured in all the will of God', 'Paul says Epaphras labors in prayer that they may stand perfect and fully assured in all the will of God (Colossians 4:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Epaphras''s prayer aim at for the Colossians?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 4, 3, 'What does Colossians 4 imply about ministry calling?', '["A ministry received in the Lord is to be watched carefully and fulfilled faithfully","Ministry is mainly self-chosen and self-defined","Calling matters only for apostles, not others","Faithfulness in ministry is less important than public success"]'::jsonb, 'A ministry received in the Lord is to be watched carefully and fulfilled faithfully', 'Paul tells Archippus to take heed to the ministry he received in the Lord and fulfill it (Colossians 4:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Colossians 4 imply about ministry calling?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 4, 3, 'Why does Paul mention his chains at the close of Colossians?', '["His imprisonment underscores the cost of the gospel and invites the church\u0027s remembering solidarity","He wants sympathy more than faithfulness","The chains prove his ministry has ended","Paul mentions them only as a legal detail"]'::jsonb, 'His imprisonment underscores the cost of the gospel and invites the church''s remembering solidarity', 'Paul closes with ''Remember my bonds,'' linking the letter''s teaching to his embodied suffering for Christ''s mission (Colossians 4:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul mention his chains at the close of Colossians?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 4, 4, 'How does Colossians 4 connect wise conduct and gracious speech in witness to outsiders?', '["The church\u0027s public life and public words are both to be shaped by wisdom and grace for the sake of mission","Only speech matters in evangelistic witness","Conduct toward outsiders is irrelevant if doctrine is correct","Paul treats wisdom and grace as opposites"]'::jsonb, 'The church''s public life and public words are both to be shaped by wisdom and grace for the sake of mission', 'Paul commands wise walking toward outsiders and gracious speech suited to each person, joining conduct and speech in witness (Colossians 4:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Colossians 4 connect wise conduct and gracious speech in witness to outsiders?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 4, 4, 'What does Colossians 4 reveal about the communal nature of perseverance?', '["Prayer, encouragement, exchanged letters, and mutual reminders all help the churches remain steadfast","Perseverance is purely individual and needs no church support","Only apostles strengthen churches, not fellow workers","Shared reading of letters is optional and spiritually minor"]'::jsonb, 'Prayer, encouragement, exchanged letters, and mutual reminders all help the churches remain steadfast', 'Paul highlights steadfast prayer, trusted messengers, shared letters between churches, and exhortation to Archippus, showing perseverance as communal (Colossians 4:2-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Colossians 4 reveal about the communal nature of perseverance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 4, 4, 'How does Colossians 4 portray local churches in relation to one another?', '["They are distinct communities yet bound together through shared teaching, greetings, workers, and prayer","Each church should remain isolated from the others","Only large urban churches matter to apostolic mission","Interchurch fellowship threatens doctrinal faithfulness"]'::jsonb, 'They are distinct communities yet bound together through shared teaching, greetings, workers, and prayer', 'Paul links Colossae, Laodicea, and Hierapolis through coworkers, letter exchange, and intercession, showing connected church life (Colossians 4:12-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Colossians 4 portray local churches in relation to one another?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 4, 4, 'Why does Paul combine watchfulness and thanksgiving in prayer?', '["Christian prayer is alert, dependent, and grateful rather than passive or anxious","Thanksgiving and watchfulness cancel each other out","Prayer should focus only on danger and not on grace","Watchfulness belongs only to apostles in prison"]'::jsonb, 'Christian prayer is alert, dependent, and grateful rather than passive or anxious', 'Paul says to continue steadfastly in prayer, watching in it with thanksgiving, combining vigilance and gratitude (Colossians 4:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul combine watchfulness and thanksgiving in prayer?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 4, 4, 'How does Colossians 4 complement the earlier teaching about Christ''s sufficiency?', '["The chapter shows Christ\u0027s sufficiency producing practical prayer, speech, fellowship, and faithful ministry rather than abstract theory","Practical church life is unrelated to Christ\u0027s centrality","Christ\u0027s sufficiency removes the need for communication between churches","Only doctrinal sections matter for real discipleship"]'::jsonb, 'The chapter shows Christ''s sufficiency producing practical prayer, speech, fellowship, and faithful ministry rather than abstract theory', 'Colossians 4 turns the letter''s Christ-centered theology into lived practices of prayer, witness, hospitality, and ministry stewardship (Colossians 4:2-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Colossians 4 complement the earlier teaching about Christ''s sufficiency?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 4, 4, 'What does Colossians 4 imply about the role of ordinary believers in the spread of the gospel?', '["Through prayer, gracious speech, hospitality, letter-sharing, and encouragement, the whole church participates in gospel advance","Only apostles and evangelists participate in mission","Ordinary believers support mission only by remaining silent","Mission is restricted to public preaching events"]'::jsonb, 'Through prayer, gracious speech, hospitality, letter-sharing, and encouragement, the whole church participates in gospel advance', 'Paul addresses the church broadly about prayer and speech and then names networks of household and ministry support, showing wide participation in gospel life (Colossians 4:2-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Colossians 4 imply about the role of ordinary believers in the spread of the gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 4, 4, 'Why is Onesimus called faithful and beloved in Colossians 4?', '["Paul presents him as a fully honored brother within the church rather than merely by former social status","Paul distinguishes him from true believers in Colossae","Onesimus is praised only for travel reliability","His value depends mainly on Roman approval"]'::jsonb, 'Paul presents him as a fully honored brother within the church rather than merely by former social status', 'Paul calls Onesimus a faithful and beloved brother who is one of them, signaling his honored place among the believers (Colossians 4:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is Onesimus called faithful and beloved in Colossians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 4, 5, 'How does Colossians 4 present mission as dependent on God without making believers passive?', '["God opens the door for the word, yet believers must pray, speak wisely, and answer others fittingly","If God opens doors, human speech and prayer no longer matter","Mission depends only on human planning and eloquence","Paul\u0027s imprisonment proves mission has stalled beyond human action"]'::jsonb, 'God opens the door for the word, yet believers must pray, speak wisely, and answer others fittingly', 'Paul asks God to open a door for the word while also calling the church to prayerful watchfulness, wise conduct, and gracious speech (Colossians 4:2-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Colossians 4 present mission as dependent on God without making believers passive?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 4, 5, 'What does Colossians 4 imply about apostolic ministry and local church life?', '["Apostolic teaching reaches churches through networks of trusted coworkers, shared letters, and accountable ministries","Local churches need no apostolic word once founded","Apostolic authority eliminates the role of local workers","The chapter leaves ministry unstructured and unaccountable"]'::jsonb, 'Apostolic teaching reaches churches through networks of trusted coworkers, shared letters, and accountable ministries', 'Paul uses Tychicus and Onesimus, orders letter exchange, and charges Archippus to fulfill his ministry, showing coordinated oversight and local faithfulness (Colossians 4:7-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Colossians 4 imply about apostolic ministry and local church life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 4, 5, 'How does Colossians 4 portray the church as both contemplative and active?', '["The church is to persist in thankful prayer while also speaking, walking wisely, and strengthening one another in mission","Prayer and action are treated as competing priorities","The chapter favors contemplation at the expense of witness","Only active ministry matters; prayer is secondary"]'::jsonb, 'The church is to persist in thankful prayer while also speaking, walking wisely, and strengthening one another in mission', 'Paul joins steadfast prayer with wise conduct, gracious speech, and the sending and receiving of coworkers for mutual encouragement (Colossians 4:2-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Colossians 4 portray the church as both contemplative and active?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 4, 5, 'Why is gracious speech ''seasoned with salt'' a fitting image in Colossians 4?', '["Christian words are to preserve truth, carry wisdom, and make the gospel fittingly answerable in each situation","Salt imagery means speech should always be harsh and sharp","Paul wants believers to avoid answering outsiders at all","The image refers only to temple offerings and not conversation"]'::jsonb, 'Christian words are to preserve truth, carry wisdom, and make the gospel fittingly answerable in each situation', 'Paul connects speech seasoned with salt to knowing how to answer each person, implying wise, fitting, and attractive witness (Colossians 4:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is gracious speech ''seasoned with salt'' a fitting image in Colossians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 4, 5, 'How does Colossians 4 turn a letter ending into theology for the church?', '["The closing names and instructions reveal a Christ-centered network of prayer, friendship, courage, and accountability that embodies the letter\u0027s message","The ending is mostly incidental and theologically empty","Paul ends the letter by setting theology aside for administration","Only the doctrinal center of the letter has spiritual significance"]'::jsonb, 'The closing names and instructions reveal a Christ-centered network of prayer, friendship, courage, and accountability that embodies the letter''s message', 'The final greetings, requests, and commands show the theology of Christ''s sufficiency worked out in real communities, relationships, and ministries (Colossians 4:2-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Colossians 4 turn a letter ending into theology for the church?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 4, 5, 'What deeper point is made by Epaphras striving in prayer for the churches?', '["Pastoral labor includes hidden intercession aimed at the full maturity and assurance of God\u0027s people","Prayer matters only when joined to public teaching","Maturity is achieved without any need for intercession","Only apostles carry spiritual concern for the churches"]'::jsonb, 'Pastoral labor includes hidden intercession aimed at the full maturity and assurance of God''s people', 'Paul highlights Epaphras''s earnest prayer that the believers may stand mature and fully assured in all the will of God (Colossians 4:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What deeper point is made by Epaphras striving in prayer for the churches?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 51, 4, 5, 'How does Colossians 4 show that Christ''s lordship reaches beyond worship services?', '["Prayer habits, speech, hospitality, ministry stewardship, household justice, and mission all fall under Christ\u0027s rule","Christ\u0027s lordship applies mainly to explicit acts of devotion","Public witness lies outside the reign of Christ","Household and work matters are morally neutral in the chapter"]'::jsonb, 'Prayer habits, speech, hospitality, ministry stewardship, household justice, and mission all fall under Christ''s rule', 'Paul speaks about masters, prayer, speech, hospitality networks, and ministry faithfulness, showing Christ''s rule over the whole life of the church (Colossians 4:1-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 51
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Colossians 4 show that Christ''s lordship reaches beyond worship services?'
);

