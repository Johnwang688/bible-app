-- ============================================================================
-- LOGOS LIGHT - 2 Peter (book 61) quiz questions from quiz-questions/2peter.json
-- ============================================================================
-- Idempotent: skips rows that already match (book_number, chapter, difficulty_stage, prompt).
-- ============================================================================

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 1, 1, 'According to 2 Peter 1, what has God''s divine power granted to believers?', '["All things that pertain to life and godliness","A life without suffering","Authority over every nation","A new earthly temple"]'::jsonb, 'All things that pertain to life and godliness', 'Peter says God''s divine power granted all things pertaining to life and godliness (2 Peter 1:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Peter 1, what has God''s divine power granted to believers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 1, 1, 'According to 2 Peter 1, through what have believers been given precious and exceedingly great promises?', '["God''s glory and virtue","The law of Moses","Temple sacrifices","Roman peace"]'::jsonb, 'God''s glory and virtue', 'The promises come through God''s own glory and virtue or excellence (2 Peter 1:3-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Peter 1, through what have believers been given precious and exceedingly great promises?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 1, 1, 'According to 2 Peter 1, what should be added to faith first?', '["Moral excellence","Patience","Brotherly affection","Love"]'::jsonb, 'Moral excellence', 'Peter begins the growth list with faith and then moral excellence (2 Peter 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Peter 1, what should be added to faith first?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 1, 1, 'According to 2 Peter 1, what should be added to brotherly affection?', '["Love","Knowledge","Perseverance","Self-control"]'::jsonb, 'Love', 'The final trait in Peter''s sequence is love, added to brotherly affection (2 Peter 1:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Peter 1, what should be added to brotherly affection?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 1, 1, 'According to 2 Peter 1, what does a person lack if he is blind and short-sighted?', '["These qualities","A teacher","Jewish heritage","Worldly wisdom"]'::jsonb, 'These qualities', 'Peter says whoever lacks these virtues is blind and short-sighted (2 Peter 1:8-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Peter 1, what does a person lack if he is blind and short-sighted?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 1, 1, 'According to 2 Peter 1, what mountain was Peter on when he heard the voice from heaven?', '["The holy mountain","Mount Carmel","Mount Sinai","Mount Zion"]'::jsonb, 'The holy mountain', 'Peter says they heard the voice when they were with Jesus on the holy mountain (2 Peter 1:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Peter 1, what mountain was Peter on when he heard the voice from heaven?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 1, 1, 'According to 2 Peter 1, who moved holy men of God to speak?', '["The Holy Spirit","Their own will","An angel alone","Public opinion"]'::jsonb, 'The Holy Spirit', 'Men spoke from God as they were moved by the Holy Spirit (2 Peter 1:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Peter 1, who moved holy men of God to speak?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 1, 2, 'According to 2 Peter 1, what do believers become through God''s promises?', '["Partakers of the divine nature","Rulers over angels","Authors of Scripture","Citizens of Rome"]'::jsonb, 'Partakers of the divine nature', 'Through the promises believers become partakers of the divine nature (2 Peter 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 2 Peter 1, what do believers become through God''s promises?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 1, 2, 'According to 2 Peter 1, what has escaped through the promises?', '["The corruption in the world by lust","The punishment of angels","The floodwaters of Noah","The Roman authorities"]'::jsonb, 'The corruption in the world by lust', 'Peter says believers escape the corruption that is in the world by lust (2 Peter 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 2 Peter 1, what has escaped through the promises?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 1, 2, 'According to 2 Peter 1, what should be added to knowledge?', '["Self-control","Love","Hope","Boldness"]'::jsonb, 'Self-control', 'Peter''s chain says knowledge is followed by self-control (2 Peter 1:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 2 Peter 1, what should be added to knowledge?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 1, 2, 'According to 2 Peter 1, what will keep believers from being idle or unfruitful in the knowledge of Jesus Christ?', '["Having these qualities and abounding in them","Avoiding all contact with outsiders","Learning many languages","Holding political office"]'::jsonb, 'Having these qualities and abounding in them', 'If these virtues are in believers and abound, they keep them from being idle or unfruitful (2 Peter 1:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 2 Peter 1, what will keep believers from being idle or unfruitful in the knowledge of Jesus Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 1, 2, 'According to 2 Peter 1, what should believers make sure of?', '["Their calling and election","Their tribal ancestry","Their public reputation","Their travel plans"]'::jsonb, 'Their calling and election', 'Peter urges diligence to make calling and election sure (2 Peter 1:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 2 Peter 1, what should believers make sure of?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 1, 2, 'According to 2 Peter 1, what does Peter say will be supplied richly to the diligent believer?', '["Entrance into the eternal Kingdom","Victory in earthly war","A seat in Jerusalem''s council","Freedom from physical death"]'::jsonb, 'Entrance into the eternal Kingdom', 'Peter says an abundant entrance into the eternal Kingdom will be supplied (2 Peter 1:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 2 Peter 1, what does Peter say will be supplied richly to the diligent believer?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 1, 2, 'According to 2 Peter 1, how does Peter describe his approaching death?', '["Putting off his tent","Crossing the Jordan","Finishing the racecourse","Entering exile"]'::jsonb, 'Putting off his tent', 'Peter says he will soon put off his tent, meaning his body (2 Peter 1:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 2 Peter 1, how does Peter describe his approaching death?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 1, 3, 'In 2 Peter 1, why does Peter urge believers to supplement faith with a chain of virtues?', '["So their calling is confirmed in a fruitful Christian life","So they can replace grace with effort","So they may qualify as apostles","So they can avoid all earthly troubles"]'::jsonb, 'So their calling is confirmed in a fruitful Christian life', 'The virtues lead to fruitfulness and connect with making calling and election sure (2 Peter 1:5-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Peter 1, why does Peter urge believers to supplement faith with a chain of virtues?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 1, 3, 'In 2 Peter 1, what does forgetting the cleansing from former sins reveal about a person''s spiritual condition?', '["He is blind to the implications of the gospel","He was never physically healed","He has lost his Roman citizenship","He has become a false prophet already"]'::jsonb, 'He is blind to the implications of the gospel', 'Peter links lacking these virtues with blindness and forgetting cleansing from former sins (2 Peter 1:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Peter 1, what does forgetting the cleansing from former sins reveal about a person''s spiritual condition?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 1, 3, 'In 2 Peter 1, why does Peter keep reminding his readers of truths they already know?', '["Because steadfast believers still need stirring up by remembrance","Because they had never heard the gospel","Because he doubted all their conversions","Because new revelations had replaced old teaching"]'::jsonb, 'Because steadfast believers still need stirring up by remembrance', 'Peter says he will always remind them and stir them up while in this tent (2 Peter 1:12-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Peter 1, why does Peter keep reminding his readers of truths they already know?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 1, 3, 'In 2 Peter 1, why does Peter emphasize that the apostles did not follow cleverly invented fables?', '["To ground their message in eyewitness testimony about Jesus","To reject all parables as useless","To deny that prophecy uses imagery","To suggest only Peter saw Jesus'' glory"]'::jsonb, 'To ground their message in eyewitness testimony about Jesus', 'Peter contrasts myths with being eyewitnesses of Christ''s majesty (2 Peter 1:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Peter 1, why does Peter emphasize that the apostles did not follow cleverly invented fables?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 1, 3, 'In 2 Peter 1, what is the effect of paying attention to the prophetic word?', '["It is like a lamp shining in a dark place until day dawns","It guarantees freedom from persecution","It replaces the need for Christ","It reveals secret dates for the end"]'::jsonb, 'It is like a lamp shining in a dark place until day dawns', 'Peter compares the prophetic word to a lamp shining in a dark place (2 Peter 1:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Peter 1, what is the effect of paying attention to the prophetic word?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 1, 3, 'In 2 Peter 1, what does saying prophecy never came by the will of man imply about Scripture?', '["Its source is divine rather than merely human","Its meaning is determined by rulers","It belongs only to Israel''s kings","It should be read without context"]'::jsonb, 'Its source is divine rather than merely human', 'Peter says prophecy did not come by human will but from men moved by the Holy Spirit (2 Peter 1:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Peter 1, what does saying prophecy never came by the will of man imply about Scripture?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 1, 3, 'In 2 Peter 1, what does the phrase morning star arising in your hearts suggest?', '["A fuller realization of Christ''s light and day","A command to worship the stars","The rise of a political empire","A temporary emotional experience only"]'::jsonb, 'A fuller realization of Christ''s light and day', 'The image joins dawn and inward illumination as believers heed the prophetic word (2 Peter 1:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Peter 1, what does the phrase morning star arising in your hearts suggest?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 1, 4, 'How does 2 Peter 1 connect divine gift and human effort?', '["God grants all needed for godliness, so believers should diligently grow in virtue","Human effort earns the promises with no divine help","Grace removes any need for diligence","God supplies virtue only after perfection is reached"]'::jsonb, 'God grants all needed for godliness, so believers should diligently grow in virtue', 'The chapter moves from divine power granting all things to believers giving all diligence (2 Peter 1:3-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 2 Peter 1 connect divine gift and human effort?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 1, 4, 'How does 2 Peter 1 present moral growth as related to assurance rather than merit?', '["Growth displays the reality of God''s call instead of purchasing salvation","Growth replaces faith as the basis of salvation","Assurance comes only from seeing miracles","Merit is measured by mystical knowledge alone"]'::jsonb, 'Growth displays the reality of God''s call instead of purchasing salvation', 'Peter tells believers to practice these qualities to confirm calling and avoid stumbling (2 Peter 1:8-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 2 Peter 1 present moral growth as related to assurance rather than merit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 1, 4, 'How does Peter''s reference to putting off his tent strengthen the urgency of his letter?', '["He knows his death is near and wants his readers to remember the truth after he is gone","He expects to leave the faith behind shortly","He plans to return to fishing immediately","He is preparing to rebuild the tabernacle"]'::jsonb, 'He knows his death is near and wants his readers to remember the truth after he is gone', 'Peter says his departure is near and he will make provision for their remembrance afterward (2 Peter 1:14-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Peter''s reference to putting off his tent strengthen the urgency of his letter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 1, 4, 'How does the Transfiguration account function in 2 Peter 1?', '["It confirms apostolic witness to Jesus'' majesty and coming power","It proves Peter outranked the other apostles","It explains why the law was abolished on that day","It serves only as a private mystical memory"]'::jsonb, 'It confirms apostolic witness to Jesus'' majesty and coming power', 'Peter cites the heavenly voice and Christ''s honor and glory as eyewitness confirmation (2 Peter 1:16-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the Transfiguration account function in 2 Peter 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 1, 4, 'How does 2 Peter 1 place the prophetic word alongside apostolic eyewitness testimony?', '["Both reinforce the certainty of God''s revelation centered on Christ","Prophecy cancels the need for apostolic testimony","Eyewitness testimony makes prophecy obsolete","The two sources contradict each other by design"]'::jsonb, 'Both reinforce the certainty of God''s revelation centered on Christ', 'After recounting the voice from heaven, Peter says believers also have the more sure prophetic word (2 Peter 1:16-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 2 Peter 1 place the prophetic word alongside apostolic eyewitness testimony?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 1, 4, 'What does 2 Peter 1 suggest about Christian memory and perseverance?', '["Remembering revealed truth is a means God uses to steady believers","Mature believers no longer need reminders","Perseverance depends on secret visions alone","Memory matters only for church leaders"]'::jsonb, 'Remembering revealed truth is a means God uses to steady believers', 'Peter repeatedly says he will remind and stir up his readers so they remain established (2 Peter 1:12-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does 2 Peter 1 suggest about Christian memory and perseverance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 1, 4, 'Why does Peter say no prophecy of Scripture is of private interpretation in the flow of 2 Peter 1?', '["Because prophecy originates from God and must be received as God''s word, not human invention","Because individuals are forbidden to read Scripture privately","Because only Peter may explain prophets","Because prophecy has no fixed meaning at all"]'::jsonb, 'Because prophecy originates from God and must be received as God''s word, not human invention', 'Peter''s point is about origin: prophecy came from men moved by the Spirit, not from human impulse (2 Peter 1:20-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Peter say no prophecy of Scripture is of private interpretation in the flow of 2 Peter 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 1, 5, 'In 2 Peter 1, why is the phrase partakers of the divine nature best understood as participation rather than absorption into deity?', '["Because Peter ties it to escaping corruption through God''s promises, not becoming identical with God","Because he says believers become uncreated beings","Because the apostles rejected all moral transformation","Because divine nature refers only to angelic status"]'::jsonb, 'Because Peter ties it to escaping corruption through God''s promises, not becoming identical with God', 'The context is ethical transformation and escape from corruption, not loss of creaturely distinction (2 Peter 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 2 Peter 1, why is the phrase partakers of the divine nature best understood as participation rather than absorption into deity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 1, 5, 'In 2 Peter 1, what is the strongest reason Peter includes both the Transfiguration and the prophetic word?', '["To show the gospel rests on converging revelation: witnessed glory and Spirit-given Scripture","To replace Christ''s teaching with mystical experience","To separate Jesus from Old Testament expectation","To argue that prophecy matters only after Peter''s death"]'::jsonb, 'To show the gospel rests on converging revelation: witnessed glory and Spirit-given Scripture', 'Peter appeals to witnessed majesty and then to the prophetic word as a unified testimony to Christ (2 Peter 1:16-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 2 Peter 1, what is the strongest reason Peter includes both the Transfiguration and the prophetic word?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 1, 5, 'In 2 Peter 1, what does the title Majestic Glory most likely underscore?', '["The overwhelming divine splendor of the Father speaking about the Son","A Roman imperial honor given to Jesus","Peter''s own status among the apostles","The brightness of the morning sky only"]'::jsonb, 'The overwhelming divine splendor of the Father speaking about the Son', 'Peter says the voice came from the Majestic Glory at the Transfiguration (2 Peter 1:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 2 Peter 1, what does the title Majestic Glory most likely underscore?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 1, 5, 'In 2 Peter 1, why does moral excellence appear immediately after faith in the virtue list?', '["Peter presents faith as active and ethically transformative rather than inert","He means moral effort replaces trust in Christ","He is listing random virtues without connection","He is describing qualifications for Roman office"]'::jsonb, 'Peter presents faith as active and ethically transformative rather than inert', 'Faith is to be supplied with virtue, showing genuine faith issues in godly character (2 Peter 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 2 Peter 1, why does moral excellence appear immediately after faith in the virtue list?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 1, 5, 'What theological point is reinforced by Peter''s statement that believers will never stumble if they practice these things?', '["Persevering holiness is the ordinary path of stability for those truly called","Sinless perfection can be reached immediately","Stumbling is impossible for anyone who reads prophecy","Moral failure proves God never grants promises"]'::jsonb, 'Persevering holiness is the ordinary path of stability for those truly called', 'Peter ties continued practice of these qualities to steadfastness and a rich entrance into the Kingdom (2 Peter 1:10-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What theological point is reinforced by Peter''s statement that believers will never stumble if they practice these things?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 1, 5, 'What does 2 Peter 1 imply about the relationship between Christ''s first revealed glory and future coming?', '["The witnessed glory anticipates and authenticates the power of his coming","The coming replaces the significance of his earthly ministry","Future hope depends only on chronology, not revelation","The Transfiguration denied any future judgment"]'::jsonb, 'The witnessed glory anticipates and authenticates the power of his coming', 'Peter says they made known the power and coming of Jesus because they were eyewitnesses of his majesty (2 Peter 1:16-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does 2 Peter 1 imply about the relationship between Christ''s first revealed glory and future coming?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 1, 5, 'Why is Peter''s insistence on Spirit-originated prophecy important for the argument of 2 Peter 1?', '["It secures the reliability of Scripture against the charge that apostolic teaching is manufactured","It lowers the authority of the Old Testament below eyewitness reports","It shows prophecy is mainly political commentary","It means prophecy should remain permanently obscure"]'::jsonb, 'It secures the reliability of Scripture against the charge that apostolic teaching is manufactured', 'After denying cleverly invented tales, Peter roots prophecy in the Spirit''s action, not human fabrication (2 Peter 1:16, 20-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Peter''s insistence on Spirit-originated prophecy important for the argument of 2 Peter 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 2, 1, 'According to 2 Peter 2, what will false teachers secretly bring in?', '["Destructive heresies","New psalms","Righteous laws","Temple reforms"]'::jsonb, 'Destructive heresies', 'Peter says false teachers will secretly bring in destructive heresies (2 Peter 2:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Peter 2, what will false teachers secretly bring in?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 2, 1, 'According to 2 Peter 2, whom do the false teachers deny?', '["The Master who bought them","Moses","The emperor","John the Baptist"]'::jsonb, 'The Master who bought them', 'Peter says they deny the Master who bought them (2 Peter 2:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Peter 2, whom do the false teachers deny?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 2, 1, 'According to 2 Peter 2, by what motive do false teachers exploit others?', '["Greed","Mercy","Patience","Humility"]'::jsonb, 'Greed', 'Peter says in greed they will exploit people with deceptive words (2 Peter 2:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Peter 2, by what motive do false teachers exploit others?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 2, 1, 'According to 2 Peter 2, whom did God preserve when he brought the flood?', '["Noah with seven others","Lot with his daughters","Abraham with Isaac","Moses with Aaron"]'::jsonb, 'Noah with seven others', 'Peter says God preserved Noah, one of eight people, when bringing the flood (2 Peter 2:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Peter 2, whom did God preserve when he brought the flood?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 2, 1, 'According to 2 Peter 2, what cities were reduced to ashes as an example?', '["Sodom and Gomorrah","Tyre and Sidon","Nineveh and Babylon","Jerusalem and Samaria"]'::jsonb, 'Sodom and Gomorrah', 'God reduced Sodom and Gomorrah to ashes as an example to the ungodly (2 Peter 2:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Peter 2, what cities were reduced to ashes as an example?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 2, 1, 'According to 2 Peter 2, who was distressed by the sensual conduct of the wicked?', '["Righteous Lot","Noah","Enoch","Abel"]'::jsonb, 'Righteous Lot', 'Peter says righteous Lot was greatly distressed by lawless sensuality (2 Peter 2:7-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Peter 2, who was distressed by the sensual conduct of the wicked?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 2, 1, 'According to 2 Peter 2, what animal spoke with a human voice to rebuke Balaam?', '["A donkey","A lion","A raven","A lamb"]'::jsonb, 'A donkey', 'A mute donkey spoke with a man''s voice and restrained Balaam''s madness (2 Peter 2:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Peter 2, what animal spoke with a human voice to rebuke Balaam?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 2, 2, 'According to 2 Peter 2, what happens to the way of truth because of false teachers?', '["It is blasphemed","It is forgotten by God","It becomes easier to follow","It is hidden in the temple"]'::jsonb, 'It is blasphemed', 'Because of false teachers, the way of truth will be blasphemed (2 Peter 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 2 Peter 2, what happens to the way of truth because of false teachers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 2, 2, 'According to 2 Peter 2, what did God do to angels when they sinned?', '["Cast them into pits of darkness to be reserved for judgment","Immediately restore them to glory","Place them over nations","Send them to preach repentance"]'::jsonb, 'Cast them into pits of darkness to be reserved for judgment', 'Peter says God did not spare angels but cast them down to pits of darkness for judgment (2 Peter 2:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 2 Peter 2, what did God do to angels when they sinned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 2, 2, 'According to 2 Peter 2, what does the Lord know how to do?', '["Rescue the godly from trial and keep the unrighteous for punishment","Reward everyone equally regardless of conduct","End all trials immediately","Reveal every future event in advance"]'::jsonb, 'Rescue the godly from trial and keep the unrighteous for punishment', 'Peter summarizes that the Lord can rescue the godly and reserve the unjust for judgment (2 Peter 2:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 2 Peter 2, what does the Lord know how to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 2, 2, 'According to 2 Peter 2, what are false teachers compared to that have no water?', '["Springs","Mountains","Altars","Olive trees"]'::jsonb, 'Springs', 'Peter calls them springs without water and mists driven by a storm (2 Peter 2:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 2 Peter 2, what are false teachers compared to that have no water?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 2, 2, 'According to 2 Peter 2, through what do false teachers entice people?', '["The lusts of the flesh and sensuality","Prayer and fasting","Acts of mercy","Sound doctrine"]'::jsonb, 'The lusts of the flesh and sensuality', 'They entice by fleshly lusts and licentiousness those escaping from error (2 Peter 2:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 2 Peter 2, through what do false teachers entice people?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 2, 2, 'According to 2 Peter 2, while false teachers promise liberty, what are they themselves?', '["Slaves of corruption","Servants of righteousness","Victims of misunderstanding","Keepers of the law"]'::jsonb, 'Slaves of corruption', 'Peter says they promise freedom while they themselves are slaves of corruption (2 Peter 2:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 2 Peter 2, while false teachers promise liberty, what are they themselves?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 2, 2, 'According to 2 Peter 2, what proverb describes the person who returns to defilement?', '["A dog returns to its vomit","A wise son honors his father","The righteous shine like the sun","A tree is known by its fruit"]'::jsonb, 'A dog returns to its vomit', 'Peter cites the proverb about a dog returning to its vomit (2 Peter 2:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 2 Peter 2, what proverb describes the person who returns to defilement?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 2, 3, 'In 2 Peter 2, why does Peter rehearse examples of angels, the flood, and Sodom?', '["To show that God judges the wicked while preserving the righteous","To argue that history repeats without meaning","To prove only Old Testament sinners were punished","To deny the need for future judgment"]'::jsonb, 'To show that God judges the wicked while preserving the righteous', 'The examples build to Peter''s conclusion that the Lord rescues the godly and judges the unrighteous (2 Peter 2:4-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Peter 2, why does Peter rehearse examples of angels, the flood, and Sodom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 2, 3, 'In 2 Peter 2, what does calling the teachers springs without water suggest about their ministry?', '["They appear promising but cannot satisfy or give life","They are hidden sources of secret wisdom","They offer too much teaching for listeners","They are persecuted for being faithful"]'::jsonb, 'They appear promising but cannot satisfy or give life', 'A waterless spring offers the appearance of refreshment but none in reality (2 Peter 2:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Peter 2, what does calling the teachers springs without water suggest about their ministry?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 2, 3, 'In 2 Peter 2, what does the example of Balaam highlight about false teachers?', '["They love the wages of wrongdoing","They suffer for righteousness'' sake","They are misunderstood prophets of truth","They reject all material possessions"]'::jsonb, 'They love the wages of wrongdoing', 'Peter says Balaam loved the wages of unrighteousness, making him a fitting pattern (2 Peter 2:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Peter 2, what does the example of Balaam highlight about false teachers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 2, 3, 'In 2 Peter 2, what is the significance of false teachers despising authority and daring to revile dignities?', '["Their rebellion is moral as well as doctrinal","They are defenders of true freedom","They only oppose human rulers politely","Their bold speech proves prophetic inspiration"]'::jsonb, 'Their rebellion is moral as well as doctrinal', 'Peter presents them as self-willed, arrogant, sensual, and contemptuous of authority (2 Peter 2:10-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Peter 2, what is the significance of false teachers despising authority and daring to revile dignities?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 2, 3, 'In 2 Peter 2, why is the last state worse than the first for those who return to corruption?', '["Because they turn back after knowing the way of righteousness","Because ignorance is a greater sin than rebellion","Because suffering always increases guilt","Because ritual impurity cannot be removed"]'::jsonb, 'Because they turn back after knowing the way of righteousness', 'Peter says it would have been better not to have known the way than to turn from it after knowing it (2 Peter 2:20-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Peter 2, why is the last state worse than the first for those who return to corruption?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 2, 3, 'In 2 Peter 2, what do eyes full of adultery reveal about false teachers?', '["Their desires are uncontrolled and predatory","Their marriages are all invalid","Their teaching focuses only on marriage law","Their problem is merely poor eyesight"]'::jsonb, 'Their desires are uncontrolled and predatory', 'Peter says they have eyes full of adultery and entice unstable souls (2 Peter 2:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Peter 2, what do eyes full of adultery reveal about false teachers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 2, 3, 'In 2 Peter 2, what is implied by the statement that false teachers count it pleasure to revel in the daytime?', '["They are shameless in public sin","They practice secret holiness unseen by others","They are devoted to honest labor","They only act wrongly at night festivals"]'::jsonb, 'They are shameless in public sin', 'Peter portrays them as open, brazen revelers and stains among believers (2 Peter 2:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Peter 2, what is implied by the statement that false teachers count it pleasure to revel in the daytime?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 2, 4, 'How does 2 Peter 2 use Old Testament judgments to answer the threat of present false teachers?', '["Past judgments guarantee that present corruption will not escape God''s justice","Old Testament examples are irrelevant under grace","False teachers will be corrected only by civic law","Judgment belongs only to the end with no present significance"]'::jsonb, 'Past judgments guarantee that present corruption will not escape God''s justice', 'Peter argues from God''s prior acts against angels, the ancient world, and Sodom (2 Peter 2:4-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 2 Peter 2 use Old Testament judgments to answer the threat of present false teachers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 2, 4, 'How does Peter''s portrayal of false freedom function in 2 Peter 2?', '["It exposes liberty talk as empty when speakers remain enslaved to corruption","It condemns every form of human freedom","It means the gospel itself is a form of bondage","It praises autonomy as the highest good"]'::jsonb, 'It exposes liberty talk as empty when speakers remain enslaved to corruption', 'Peter says a person is a slave to whatever overcomes him, so their freedom claims are hollow (2 Peter 2:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Peter''s portrayal of false freedom function in 2 Peter 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 2, 4, 'How does Lot function in the argument of 2 Peter 2?', '["He is evidence that God can preserve the righteous amid a corrupt society","He proves righteous people must never live near cities","He shows judgment can be avoided by compromise","He demonstrates that distress over sin is unnecessary"]'::jsonb, 'He is evidence that God can preserve the righteous amid a corrupt society', 'Peter uses Lot as the positive counterpart to Sodom''s destruction (2 Peter 2:7-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Lot function in the argument of 2 Peter 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 2, 4, 'How does 2 Peter 2 connect false doctrine with false living?', '["Peter presents corrupt teaching and sensual conduct as mutually reinforcing","He treats theology as unrelated to behavior","He says only speech matters, not conduct","He blames corruption solely on persecution"]'::jsonb, 'Peter presents corrupt teaching and sensual conduct as mutually reinforcing', 'The chapter ties destructive heresy to greed, sensuality, arrogance, and exploitation (2 Peter 2:1-3, 10-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 2 Peter 2 connect false doctrine with false living?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 2, 4, 'Why does Peter compare false teachers to unreasoning animals in 2 Peter 2?', '["To stress their instinct-driven behavior and coming destruction","To praise their innocence before God","To show they should lead the flock naturally","To argue animals are morally superior to humans"]'::jsonb, 'To stress their instinct-driven behavior and coming destruction', 'Peter says they are like creatures of instinct, born to be captured and destroyed (2 Peter 2:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Peter compare false teachers to unreasoning animals in 2 Peter 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 2, 4, 'What does 2 Peter 2 suggest about the seriousness of apostasy after knowing the way of righteousness?', '["Turning back after knowledge brings a graver condition than former ignorance","Knowledge guarantees no future falling away","Apostasy affects only rewards, never spiritual danger","Returning to sin is harmless if doctrine remains correct"]'::jsonb, 'Turning back after knowledge brings a graver condition than former ignorance', 'Peter says the last state becomes worse than the first for those who turn back (2 Peter 2:20-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does 2 Peter 2 suggest about the seriousness of apostasy after knowing the way of righteousness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 2, 4, 'Why does Peter say even angels do not bring a reviling judgment against dignities in 2 Peter 2?', '["To contrast proper restraint with the reckless arrogance of false teachers","To prove angels never judge anyone","To teach believers should ignore evil entirely","To deny all spiritual authority structures"]'::jsonb, 'To contrast proper restraint with the reckless arrogance of false teachers', 'Peter contrasts stronger angelic beings with false teachers who boldly revile what they do not understand (2 Peter 2:10-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Peter say even angels do not bring a reviling judgment against dignities in 2 Peter 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 2, 5, 'In 2 Peter 2, what is the rhetorical effect of moving from hidden heresies to vivid images like waterless springs and washed pigs?', '["Peter exposes false teaching as both doctrinally deadly and morally disgusting","He softens the warning with humorous exaggeration","He narrows the warning to ceremonial impurity alone","He shifts attention away from church danger to farm life"]'::jsonb, 'Peter exposes false teaching as both doctrinally deadly and morally disgusting', 'The chapter combines doctrinal warning with unforgettable moral imagery to portray corruption (2 Peter 2:1, 17, 22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 2 Peter 2, what is the rhetorical effect of moving from hidden heresies to vivid images like waterless springs and washed pigs?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 2, 5, 'In 2 Peter 2, why is Balaam an especially fitting Old Testament parallel for the false teachers?', '["He joins religious speech to greed, just as they exploit people for gain","He is a model of faithful perseverance under suffering","He represents righteous anger against idolatry only","He shows that every prophet must oppose kings publicly"]'::jsonb, 'He joins religious speech to greed, just as they exploit people for gain', 'Peter links Balaam''s love of unrighteous wages to the teachers'' greed and exploitation (2 Peter 2:3, 15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 2 Peter 2, why is Balaam an especially fitting Old Testament parallel for the false teachers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 2, 5, 'In 2 Peter 2, what does the repeated emphasis on reservation for judgment imply about divine timing?', '["Judgment may be delayed, but it is already certain and appointed","Delay means God has forgotten evil","Judgment occurs only in history and never finally","Reservation means restoration is guaranteed for all"]'::jsonb, 'Judgment may be delayed, but it is already certain and appointed', 'Peter speaks of angels and the unjust being kept for judgment, stressing certainty despite delay (2 Peter 2:4, 9, 17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 2 Peter 2, what does the repeated emphasis on reservation for judgment imply about divine timing?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 2, 5, 'In 2 Peter 2, what theological tension is held together by the cases of Noah and Lot?', '["The same God who judges thoroughly also knows how to deliver the righteous","God must choose either mercy or justice but not both","Rescue belongs to the wicked while judgment falls on the godly","Old Testament salvation depended on merit alone"]'::jsonb, 'The same God who judges thoroughly also knows how to deliver the righteous', 'Noah and Lot show preservation within a chapter dominated by judgment examples (2 Peter 2:5, 7-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 2 Peter 2, what theological tension is held together by the cases of Noah and Lot?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 2, 5, 'What does 2 Peter 2 imply about the pastoral danger of persuasive speech divorced from holiness?', '["Impressive words can become instruments of exploitation when character is corrupt","Words are harmless if doctrine sounds religious","Only actions matter in spiritual leadership","Charisma is proof of divine approval"]'::jsonb, 'Impressive words can become instruments of exploitation when character is corrupt', 'Peter says they exploit with fabricated words and entice through sensuality, showing speech and character must not be separated (2 Peter 2:3, 18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does 2 Peter 2 imply about the pastoral danger of persuasive speech divorced from holiness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 2, 5, 'Why is the proverb about the washed sow especially sharp at the end of 2 Peter 2?', '["It portrays an outward cleansing that never changed the creature''s inner bent","It teaches baptism permanently removes all temptation","It praises ritual washing as the heart of the gospel","It suggests animals can model repentance better than people"]'::jsonb, 'It portrays an outward cleansing that never changed the creature''s inner bent', 'The sow returns to the mire, fitting Peter''s warning about returning to corruption after apparent escape (2 Peter 2:20-22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the proverb about the washed sow especially sharp at the end of 2 Peter 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 2, 5, 'Why is Peter''s phrase the way of righteousness important in 2 Peter 2?', '["It presents Christianity as a moral and doctrinal path from which turning back is grave","It limits salvation to legal observance under Moses","It refers only to civil justice in society","It means righteousness is attained by teachers alone"]'::jsonb, 'It presents Christianity as a moral and doctrinal path from which turning back is grave', 'Peter says they knew the way of righteousness and then turned from the holy commandment (2 Peter 2:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Peter''s phrase the way of righteousness important in 2 Peter 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 3, 1, 'According to 2 Peter 3, what do scoffers ask about the Lord''s return?', '["Where is the promise of his coming?","Who is worthy to open the scroll?","When will the temple be rebuilt?","Why did Moses strike the rock?"]'::jsonb, 'Where is the promise of his coming?', 'Scoffers ask, ''Where is the promise of his coming?'' (2 Peter 3:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Peter 3, what do scoffers ask about the Lord''s return?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 3, 1, 'According to 2 Peter 3, what ancient event do scoffers deliberately forget?', '["The world being overflowed with water","Israel crossing the Jordan","David defeating Goliath","Elijah calling down fire"]'::jsonb, 'The world being overflowed with water', 'Peter says they forget that the world of that time perished when flooded with water (2 Peter 3:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Peter 3, what ancient event do scoffers deliberately forget?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 3, 1, 'According to 2 Peter 3, how are the present heavens and earth being reserved?', '["For fire","For another flood","For angelic rule","For endless peace"]'::jsonb, 'For fire', 'The present heavens and earth are reserved for fire and the day of judgment (2 Peter 3:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Peter 3, how are the present heavens and earth being reserved?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 3, 1, 'According to 2 Peter 3, how is one day with the Lord?', '["As a thousand years","As a watch in the night only","As a single hour","As no time at all"]'::jsonb, 'As a thousand years', 'Peter says one day is with the Lord as a thousand years (2 Peter 3:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Peter 3, how is one day with the Lord?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 3, 1, 'According to 2 Peter 3, how will the day of the Lord come?', '["Like a thief","Like the morning dew","Like a royal parade","Like a seasonal harvest"]'::jsonb, 'Like a thief', 'Peter says the day of the Lord will come like a thief (2 Peter 3:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Peter 3, how will the day of the Lord come?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 3, 1, 'According to 2 Peter 3, what are believers looking for after the present heavens and earth pass away?', '["New heavens and a new earth","A restored Roman empire","Another ark","A rebuilt tabernacle"]'::jsonb, 'New heavens and a new earth', 'Peter says believers look for new heavens and a new earth in which righteousness dwells (2 Peter 3:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Peter 3, what are believers looking for after the present heavens and earth pass away?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 3, 1, 'According to 2 Peter 3, in what should believers grow?', '["Grace and the knowledge of Jesus Christ","Political influence and courage","Wealth and honor","Ceremonial precision and fasting"]'::jsonb, 'Grace and the knowledge of Jesus Christ', 'Peter closes by urging growth in grace and the knowledge of Jesus Christ (2 Peter 3:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Peter 3, in what should believers grow?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 3, 2, 'According to 2 Peter 3, why is the Lord not slow concerning his promise?', '["He is patient, not wanting any to perish","He has forgotten the date","He already returned secretly","He is waiting for Rome to fall"]'::jsonb, 'He is patient, not wanting any to perish', 'Peter says the Lord is patient toward us, not wishing that any should perish (2 Peter 3:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 2 Peter 3, why is the Lord not slow concerning his promise?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 3, 2, 'According to 2 Peter 3, what should the readers remember from the prophets and apostles?', '["The words spoken before and the commandment of the Lord","Only Peter''s private visions","The customs of the nations","The genealogies of the patriarchs"]'::jsonb, 'The words spoken before and the commandment of the Lord', 'Peter wants them to remember the prophets and the apostolic commandment of the Lord and Savior (2 Peter 3:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 2 Peter 3, what should the readers remember from the prophets and apostles?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 3, 2, 'According to 2 Peter 3, what do scoffers walk after?', '["Their own lusts","The path of righteousness","The fear of the Lord","The traditions of the elders"]'::jsonb, 'Their own lusts', 'Peter says scoffers walk according to their own lusts (2 Peter 3:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 2 Peter 3, what do scoffers walk after?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 3, 2, 'According to 2 Peter 3, what will happen to the elements on the day of the Lord?', '["They will be dissolved with fervent heat","They will become gold","They will be hidden under the sea","They will rule over the nations"]'::jsonb, 'They will be dissolved with fervent heat', 'Peter says the elements will be dissolved with fervent heat (2 Peter 3:10, 12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 2 Peter 3, what will happen to the elements on the day of the Lord?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 3, 2, 'According to 2 Peter 3, how should believers be found by Christ?', '["In peace, without spot and blameless","Busy with building defenses","Separated from every unbeliever physically","Silent about the gospel"]'::jsonb, 'In peace, without spot and blameless', 'Peter urges diligence to be found by him in peace, without spot and blameless (2 Peter 3:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 2 Peter 3, how should believers be found by Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 3, 2, 'According to 2 Peter 3, how should the Lord''s patience be regarded?', '["As salvation","As indifference","As weakness","As defeat"]'::jsonb, 'As salvation', 'Peter tells them to regard the patience of the Lord as salvation (2 Peter 3:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 2 Peter 3, how should the Lord''s patience be regarded?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 3, 2, 'According to 2 Peter 3, what do the ignorant and unstable do with Paul''s letters?', '["They twist them","They memorize them all","They reject every one of them","They translate them into Latin"]'::jsonb, 'They twist them', 'Peter says the ignorant and unstable twist Paul''s writings, as they do the other Scriptures (2 Peter 3:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 2 Peter 3, what do the ignorant and unstable do with Paul''s letters?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 3, 3, 'In 2 Peter 3, why does Peter answer the scoffers with creation and flood?', '["To show God''s word has already acted decisively in history and will do so again","To prove natural processes are evil","To deny that the earth continues at all","To say judgment already fully happened"]'::jsonb, 'To show God''s word has already acted decisively in history and will do so again', 'Peter points to creation by God''s word and the flood by that same word as proof against the scoffers (2 Peter 3:5-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Peter 3, why does Peter answer the scoffers with creation and flood?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 3, 3, 'In 2 Peter 3, what does the comparison of one day and a thousand years teach about divine timing?', '["God''s perspective on time differs from human impatience","God measures time inaccurately","The return must occur after exactly one thousand years","Human calendars are forbidden for believers"]'::jsonb, 'God''s perspective on time differs from human impatience', 'Peter uses the comparison to correct the scoffers'' assumptions about delay (2 Peter 3:8-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Peter 3, what does the comparison of one day and a thousand years teach about divine timing?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 3, 3, 'In 2 Peter 3, why does Peter ask what sort of people believers ought to be?', '["Because future judgment should shape present holiness and godliness","Because only teachers need ethical instruction","Because the world will improve gradually without judgment","Because holiness prevents physical death"]'::jsonb, 'Because future judgment should shape present holiness and godliness', 'Since all these things will be dissolved, Peter asks what kind of holy lives believers should live (2 Peter 3:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Peter 3, why does Peter ask what sort of people believers ought to be?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 3, 3, 'In 2 Peter 3, what does looking for new heavens and a new earth imply about Christian hope?', '["Hope is directed toward a renewed creation where righteousness dwells","Hope ends with escape from all embodied existence","Hope centers on rebuilding the old order unchanged","Hope depends on political reform first"]'::jsonb, 'Hope is directed toward a renewed creation where righteousness dwells', 'Peter''s hope is for a new heavens and earth characterized by righteousness (2 Peter 3:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Peter 3, what does looking for new heavens and a new earth imply about Christian hope?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 3, 3, 'In 2 Peter 3, what does Peter''s reference to Paul show about apostolic teaching?', '["Peter sees Paul''s teaching as wise and consistent with the shared apostolic message","Peter rejects Paul''s letters as unreliable","Paul alone understood the return of Christ","Only Peter''s writings count as Scripture"]'::jsonb, 'Peter sees Paul''s teaching as wise and consistent with the shared apostolic message', 'Peter refers to Paul''s wisdom and treats his letters alongside the other Scriptures (2 Peter 3:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Peter 3, what does Peter''s reference to Paul show about apostolic teaching?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 3, 3, 'In 2 Peter 3, why is the image of the day coming like a thief significant?', '["It stresses suddenness and the need for readiness","It means the Lord acts unjustly","It guarantees no one can know anything true","It refers only to economic collapse"]'::jsonb, 'It stresses suddenness and the need for readiness', 'The thief image underscores unexpected arrival and therefore moral vigilance (2 Peter 3:10, 14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Peter 3, why is the image of the day coming like a thief significant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 3, 3, 'In 2 Peter 3, what danger does Peter warn established believers against?', '["Being carried away by the error of the wicked","Losing all earthly property","Forgetting Noah''s name","Reading Paul''s letters too often"]'::jsonb, 'Being carried away by the error of the wicked', 'Peter warns them not to be carried away with the error of the wicked and fall from steadfastness (2 Peter 3:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Peter 3, what danger does Peter warn established believers against?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 3, 4, 'How does 2 Peter 3 reinterpret apparent delay in Christ''s return?', '["Delay is mercy that opens space for repentance, not failure of the promise","Delay proves the promise was mistaken","Delay means history runs without divine purpose","Delay shows judgment will never come"]'::jsonb, 'Delay is mercy that opens space for repentance, not failure of the promise', 'Peter says the Lord is patient and not willing that any should perish, reframing delay as saving patience (2 Peter 3:9, 15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 2 Peter 3 reinterpret apparent delay in Christ''s return?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 3, 4, 'How does Peter connect memory with steadfastness in 2 Peter 3?', '["Remembering prophetic and apostolic words guards believers from scoffing and instability","Memory matters only for historical interest","Steadfastness comes from ignoring hard teachings","Believers should remember only miracles, not commands"]'::jsonb, 'Remembering prophetic and apostolic words guards believers from scoffing and instability', 'Peter writes to stir up sincere minds by remembrance of the prophets and apostles (2 Peter 3:1-2, 17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Peter connect memory with steadfastness in 2 Peter 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 3, 4, 'How does 2 Peter 3 link cosmic judgment with ethical conduct?', '["Because the world''s dissolution calls believers to holy and godly lives now","Because ethics become irrelevant when the world ends","Because only the ungodly need to think about judgment","Because holiness can postpone judgment indefinitely"]'::jsonb, 'Because the world''s dissolution calls believers to holy and godly lives now', 'Peter draws a direct ethical conclusion from the coming dissolution of the heavens and earth (2 Peter 3:11-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 2 Peter 3 link cosmic judgment with ethical conduct?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 3, 4, 'How does Peter''s treatment of Paul''s letters contribute to the chapter''s warning?', '["It shows that twisting apostolic teaching is itself a path to destruction","It means hard passages should be ignored","It proves Paul taught differently from the prophets","It limits error to non-Christian readers only"]'::jsonb, 'It shows that twisting apostolic teaching is itself a path to destruction', 'Peter says unstable people twist Paul''s letters and the other Scriptures to their own destruction (2 Peter 3:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Peter''s treatment of Paul''s letters contribute to the chapter''s warning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 3, 4, 'How does the flood function in Peter''s argument compared with the coming fire?', '["The flood is a historical precedent showing that divine judgment can interrupt apparent continuity","The flood canceled all future judgment imagery","Fire refers only to metaphorical inner feelings","Both images are used to deny bodily resurrection"]'::jsonb, 'The flood is a historical precedent showing that divine judgment can interrupt apparent continuity', 'Scoffers appeal to uniformity, but Peter cites the flood as proof that the world has already undergone catastrophic judgment (2 Peter 3:4-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the flood function in Peter''s argument compared with the coming fire?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 3, 4, 'Why does Peter say believers may be looking for and earnestly desiring the coming day of God?', '["Because the promised future of righteousness makes God''s final day desirable for the faithful","Because believers control the date of the end","Because the day will spare the present creation entirely","Because longing for the end excuses neglect of present duty"]'::jsonb, 'Because the promised future of righteousness makes God''s final day desirable for the faithful', 'Peter links eager expectation of the day with the promise of a righteous new creation (2 Peter 3:12-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Peter say believers may be looking for and earnestly desiring the coming day of God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 3, 4, 'What does Peter''s closing command to grow in grace and knowledge imply after his warnings in 2 Peter 3?', '["Perseverance requires ongoing maturation, not passive assumption of safety","Growth is optional once basic doctrine is learned","Knowledge alone is enough without grace","Warnings are meant only for false teachers, not believers"]'::jsonb, 'Perseverance requires ongoing maturation, not passive assumption of safety', 'After warning against falling, Peter ends with a command to continue growing in Christ (2 Peter 3:17-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Peter''s closing command to grow in grace and knowledge imply after his warnings in 2 Peter 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 3, 5, 'In 2 Peter 3, what is the deepest flaw in the scoffers'' argument that all things continue as they were?', '["It ignores God''s prior interventions in creation and flood and therefore misreads history","It depends too heavily on prophecy","It grants too much weight to apostolic testimony","It assumes the world is morally corrupt"]'::jsonb, 'It ignores God''s prior interventions in creation and flood and therefore misreads history', 'Peter says they deliberately forget creation by God''s word and the flood that judged the ancient world (2 Peter 3:4-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 2 Peter 3, what is the deepest flaw in the scoffers'' argument that all things continue as they were?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 3, 5, 'In 2 Peter 3, why is Peter''s phrase the other Scriptures significant when speaking of Paul''s letters?', '["It places Paul''s letters within the category of authoritative Scripture","It means Paul wrote mostly commentaries on Scripture","It separates Paul''s letters from apostolic teaching","It limits scriptural authority to Peter''s circle only"]'::jsonb, 'It places Paul''s letters within the category of authoritative Scripture', 'Peter says unstable people twist Paul''s letters as they do the other Scriptures (2 Peter 3:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 2 Peter 3, why is Peter''s phrase the other Scriptures significant when speaking of Paul''s letters?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 3, 5, 'In 2 Peter 3, what tension is held together by the claim that the Lord''s patience is salvation and the day will come like a thief?', '["Merciful delay and sudden judgment both belong to God''s faithful purpose","Judgment and mercy cancel each other out","The day is uncertain even to God","Salvation removes any future accountability"]'::jsonb, 'Merciful delay and sudden judgment both belong to God''s faithful purpose', 'Peter combines patience toward repentance with the certainty and suddenness of the coming day (2 Peter 3:9-10, 15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 2 Peter 3, what tension is held together by the claim that the Lord''s patience is salvation and the day will come like a thief?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 3, 5, 'In 2 Peter 3, what theological emphasis is served by saying righteousness dwells in the new heavens and new earth?', '["The final creation is not merely new in form but fitting for God''s holy order","The new creation will have no physical reality","Only civil justice will matter there","Righteousness will be temporary until another fall"]'::jsonb, 'The final creation is not merely new in form but fitting for God''s holy order', 'Peter defines the promised new creation as the sphere where righteousness dwells (2 Peter 3:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 2 Peter 3, what theological emphasis is served by saying righteousness dwells in the new heavens and new earth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 3, 5, 'What does 2 Peter 3 imply about the pastoral use of eschatology?', '["Teaching about the end is meant to produce holiness, patience, and stability","Eschatology is mainly for speculation about dates","End-times teaching belongs only to scholars and not churches","Future hope matters only after suffering has ended"]'::jsonb, 'Teaching about the end is meant to produce holiness, patience, and stability', 'Peter uses the coming day to call for holy conduct, patient interpretation, and steadfast growth (2 Peter 3:11-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does 2 Peter 3 imply about the pastoral use of eschatology?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 3, 5, 'Why does Peter open and close 2 Peter 3 with reminders and growth language?', '["He frames discernment against error as an ongoing process of remembered truth and continued maturation","He suggests memory replaces doctrine entirely","He limits growth to intellectual achievement alone","He implies mature believers no longer face deception"]'::jsonb, 'He frames discernment against error as an ongoing process of remembered truth and continued maturation', 'Peter stirs up remembrance at the start and ends by urging growth in grace and knowledge (2 Peter 3:1-2, 17-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does Peter open and close 2 Peter 3 with reminders and growth language?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 61, 3, 5, 'Why is Peter''s appeal to prophetic and apostolic words strategically important against scoffers in 2 Peter 3?', '["It anchors hope in a unified revelation rather than in visible cultural trends","It concedes that history alone disproves the promise","It shows only apostles matter and prophets do not","It teaches that reason has no role in Christian hope"]'::jsonb, 'It anchors hope in a unified revelation rather than in visible cultural trends', 'Peter urges remembrance of both prophets and apostles before addressing the mockers'' claims (2 Peter 3:2-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 61
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Peter''s appeal to prophetic and apostolic words strategically important against scoffers in 2 Peter 3?'
);
