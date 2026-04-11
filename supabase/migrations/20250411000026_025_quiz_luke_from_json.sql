-- ============================================================================
-- LOGOS LIGHT — Luke (book 42) quiz questions from quiz-questions/luke.json
-- ============================================================================
-- Idempotent: skips rows that already match (book_number, chapter, difficulty_stage, prompt).
-- ============================================================================

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 1, 1, 'To whom does Luke address his opening account?', '["Theophilus", "Caesar Augustus", "Zechariah", "Simeon"]'::jsonb, 'Theophilus', 'Luke 1:3 addresses the orderly account to Theophilus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'To whom does Luke address his opening account?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 1, 1, 'What happened to Zechariah''s speech when John was named in Luke 1?', '["His tongue was loosed", "He remained mute", "He began to sing in the temple choir", "He left the house immediately"]'::jsonb, 'His tongue was loosed', 'Luke 1:63-64 says Zechariah''s mouth was opened and his tongue loosed.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'What happened to Zechariah''s speech when John was named in Luke 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 1, 1, 'What name was Zechariah and Elizabeth told to give their son in Luke 1?', '["John", "Jesus", "Joseph", "Samuel"]'::jsonb, 'John', 'Luke 1:13 says their son was to be named John.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'What name was Zechariah and Elizabeth told to give their son in Luke 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 1, 1, 'Who appeared to Zechariah in the temple in Luke 1?', '["Gabriel", "Michael", "Simeon", "Joseph"]'::jsonb, 'Gabriel', 'Luke 1:19 names Gabriel as the angel speaking to Zechariah.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who appeared to Zechariah in the temple in Luke 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 1, 1, 'Whom did Mary visit after Gabriel''s announcement in Luke 1?', '["Elizabeth", "Anna", "Martha", "Salome"]'::jsonb, 'Elizabeth', 'Luke 1:39-40 says Mary visited Elizabeth.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'Whom did Mary visit after Gabriel''s announcement in Luke 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 1, 2, 'What happened to John in Elizabeth''s womb when Mary greeted her in Luke 1?', '["He leaped for joy", "He became still", "He was named immediately", "He was dedicated at the temple"]'::jsonb, 'He leaped for joy', 'Luke 1:41 says the baby leaped in Elizabeth''s womb.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What happened to John in Elizabeth''s womb when Mary greeted her in Luke 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 1, 2, 'What happened to Zechariah after he did not believe Gabriel''s message?', '["He became mute until John''s birth", "He was sent out of the temple permanently", "He fell asleep in the sanctuary", "He left for Bethlehem immediately"]'::jsonb, 'He became mute until John''s birth', 'Luke 1:20 says Zechariah would be silent until the word was fulfilled.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What happened to Zechariah after he did not believe Gabriel''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 1, 2, 'What sign did Gabriel give Mary concerning Elizabeth in Luke 1?', '["Elizabeth had conceived a son in her old age", "Zechariah would speak again immediately", "A star would appear over Nazareth", "Joseph would have a dream"]'::jsonb, 'Elizabeth had conceived a son in her old age', 'Luke 1:36 gives Elizabeth''s pregnancy as a confirming sign to Mary.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What sign did Gabriel give Mary concerning Elizabeth in Luke 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 1, 2, 'What title did Elizabeth use for Mary in Luke 1?', '["The mother of my Lord", "Daughter of Zion", "Servant of the temple", "Queen of Israel"]'::jsonb, 'The mother of my Lord', 'Luke 1:43 says, ''Why is this granted to me, that the mother of my Lord should come to me?'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What title did Elizabeth use for Mary in Luke 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 1, 2, 'Why did the neighbors object when Elizabeth said the baby should be called John?', '["No one among their relatives had that name", "They wanted to name him Zechariah by law", "The angel had told them otherwise", "They believed John was a royal name"]'::jsonb, 'No one among their relatives had that name', 'Luke 1:61 says none of their relatives was called by that name.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why did the neighbors object when Elizabeth said the baby should be called John?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 1, 3, 'What does Zechariah''s Benedictus reveal about John''s role?', '["He will go before the Lord to prepare his ways", "He will rule on David''s throne", "He will remain in the wilderness forever", "He will replace temple worship"]'::jsonb, 'He will go before the Lord to prepare his ways', 'Luke 1:76 says John will go before the Lord to prepare his ways.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Zechariah''s Benedictus reveal about John''s role?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 1, 3, 'What theme stands out in Mary''s Magnificat in Luke 1?', '["God exalts the humble and brings down the proud", "Rome will soon be overthrown by force", "Israel no longer needs Abraham''s promises", "Temple sacrifice is ending immediately"]'::jsonb, 'God exalts the humble and brings down the proud', 'Luke 1:46-55 emphasizes divine reversal, lifting the humble and bringing down the proud.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What theme stands out in Mary''s Magnificat in Luke 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 1, 3, 'Why does Luke emphasize the naming of John in chapter 1?', '["It confirms obedience to God''s revealed plan rather than family expectation", "It shows Zechariah finally chose his own favorite name", "It proves John will become a priest like his father", "It marks the beginning of Jesus''s ministry"]'::jsonb, 'It confirms obedience to God''s revealed plan rather than family expectation', 'Luke 1:13 and 1:63 show the name John came from God''s instruction, not family custom.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Luke emphasize the naming of John in chapter 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 1, 3, 'Why is Mary''s response to Gabriel important in Luke 1?', '["She responds in faith and submission to God''s word", "She demands a sign like Zechariah", "She refuses the mission at first", "She asks Joseph to answer for her"]'::jsonb, 'She responds in faith and submission to God''s word', 'Luke 1:38 says, "Behold, the servant of the Lord; let it be to me according to your word."'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is Mary''s response to Gabriel important in Luke 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 1, 3, 'Why is Zechariah''s muteness significant in Luke 1?', '["It turns his unbelief into a lived sign until God''s word comes true", "It proves he lost his priesthood permanently", "It shows Gabriel was angry without purpose", "It keeps the birth hidden from everyone"]'::jsonb, 'It turns his unbelief into a lived sign until God''s word comes true', 'Luke 1:20 makes Zechariah''s silence a sign tied to the fulfillment of God''s promise.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is Zechariah''s muteness significant in Luke 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 1, 4, 'How do the announcements to Zechariah and Mary work together in Luke 1?', '["They contrast unbelieving hesitation with trusting submission while advancing one saving plan", "They present unrelated family stories", "They prove John is greater than Jesus", "They show Joseph as the central figure of the chapter"]'::jsonb, 'They contrast unbelieving hesitation with trusting submission while advancing one saving plan', 'Luke 1 pairs Zechariah''s doubt and Mary''s faith-filled response within the same divine plan.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do the announcements to Zechariah and Mary work together in Luke 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 1, 4, 'How do the songs and speeches in Luke 1 frame the chapter''s theology?', '["They present God''s salvation as faithful to covenant promises and full of reversal", "They focus mainly on Rome''s political strength", "They replace prophecy with private experience only", "They deny any role for Israel''s history"]'::jsonb, 'They present God''s salvation as faithful to covenant promises and full of reversal', 'Luke 1 includes the Magnificat and Benedictus, both celebrating God''s covenant faithfulness and reversal.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do the songs and speeches in Luke 1 frame the chapter''s theology?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 1, 4, 'How does Elizabeth''s blessing of Mary deepen Luke 1''s message?', '["It confirms through Spirit-filled witness that faith receives God''s promise before sight", "It replaces Gabriel''s word with human opinion", "It denies Zechariah''s priestly role", "It shifts attention away from the child Jesus"]'::jsonb, 'It confirms through Spirit-filled witness that faith receives God''s promise before sight', 'Luke 1:41-45 presents Elizabeth speaking by the Holy Spirit and blessing Mary''s faith.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Elizabeth''s blessing of Mary deepen Luke 1''s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 1, 4, 'What larger pattern of salvation history begins in Luke 1?', '["God visits his people by fulfilling old promises through unexpected, Spirit-marked births", "Israel''s story is left behind for a new religion", "Temple worship ends before Jesus is born", "Only private spirituality matters going forward"]'::jsonb, 'God visits his people by fulfilling old promises through unexpected, Spirit-marked births', 'Luke 1 opens the Gospel with covenant fulfillment, prophetic language, and miraculous births.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger pattern of salvation history begins in Luke 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 1, 4, 'Why is the connection to David important in Gabriel''s message to Mary in Luke 1?', '["It frames Jesus as the promised royal son in Israel''s covenant story", "It means Jesus will serve in the temple as a priest only", "It disconnects Jesus from Abraham", "It limits Jesus''s mission to Nazareth"]'::jsonb, 'It frames Jesus as the promised royal son in Israel''s covenant story', 'Luke 1:32-33 says the Lord will give Jesus the throne of his father David.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is the connection to David important in Gabriel''s message to Mary in Luke 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 1, 5, 'How does Luke 1 establish certainty about the coming of salvation?', '["Through prophetic fulfillment, angelic announcement, and Spirit-filled witness", "Through military signs in Jerusalem", "By avoiding all links to Israel''s story", "By keeping Jesus''s identity hidden from everyone"]'::jsonb, 'Through prophetic fulfillment, angelic announcement, and Spirit-filled witness', 'Luke 1 combines careful narration, angelic messages, and Spirit-inspired praise to ground certainty.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 1 establish certainty about the coming of salvation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 1, 5, 'How does Luke 1 present John and Jesus together without confusing their roles?', '["John is the promised forerunner, while Jesus is the Lord and Davidic Son whose way John prepares", "Both are presented as equal messianic rulers", "John is the true king and Jesus the herald", "Their identities remain intentionally unclear"]'::jsonb, 'John is the promised forerunner, while Jesus is the Lord and Davidic Son whose way John prepares', 'Luke 1 distinguishes John as preparer and Jesus as the central saving figure.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 1 present John and Jesus together without confusing their roles?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 1, 5, 'How does Luke 1 use temple, home, and wilderness settings theologically?', '["God''s saving work reaches priestly space, ordinary households, and the coming prophetic wilderness", "Only temple space matters for revelation", "The wilderness is portrayed as outside God''s plan", "Nazareth is shown as spiritually superior to Jerusalem"]'::jsonb, 'God''s saving work reaches priestly space, ordinary households, and the coming prophetic wilderness', 'Luke 1 moves from temple to household scenes and ends with John in the wilderness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 1 use temple, home, and wilderness settings theologically?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 1, 5, 'What does Luke 1 suggest about the nature of revelation?', '["God''s word comes through angels, Scripture-shaped songs, and Spirit-filled testimony that call for faith", "Revelation is mainly private intuition without history", "Only priests can receive divine truth", "Signs matter, but God''s word itself does not"]'::jsonb, 'God''s word comes through angels, Scripture-shaped songs, and Spirit-filled testimony that call for faith', 'Luke 1 repeatedly combines divine speech, Spirit-inspired praise, and trustworthy witness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Luke 1 suggest about the nature of revelation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 1, 5, 'Why is the phrase ''nothing will be impossible with God'' so important in Luke 1?', '["It interprets both miraculous conceptions as acts of divine power and faithfulness", "It means human obedience is unnecessary", "It refers only to Elizabeth''s pregnancy", "It promises believers freedom from suffering"]'::jsonb, 'It interprets both miraculous conceptions as acts of divine power and faithfulness', 'Luke 1:37 anchors the chapter''s impossible births in God''s sovereign power.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the phrase ''nothing will be impossible with God'' so important in Luke 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 2, 1, 'What sign did the angel give the shepherds in Luke 2?', '["A baby wrapped in cloths and lying in a manger", "A star over Bethlehem", "A child standing in the temple", "A king seated on a throne"]'::jsonb, 'A baby wrapped in cloths and lying in a manger', 'Luke 2:12 gives that sign to the shepherds.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'What sign did the angel give the shepherds in Luke 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 2, 1, 'What was Jesus named on the eighth day in Luke 2?', '["Jesus", "Immanuel", "John", "David"]'::jsonb, 'Jesus', 'Luke 2:21 says he was named Jesus on the eighth day.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'What was Jesus named on the eighth day in Luke 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 2, 1, 'Where was Jesus laid after he was born in Luke 2?', '["In a manger", "In the temple court", "In Joseph''s workshop", "In Herod''s palace"]'::jsonb, 'In a manger', 'Luke 2:7 says Mary laid Jesus in a manger.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'Where was Jesus laid after he was born in Luke 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 2, 1, 'Who was waiting for the consolation of Israel in Luke 2?', '["Simeon", "Anna", "Theophilus", "Joseph"]'::jsonb, 'Simeon', 'Luke 2:25 describes Simeon that way.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who was waiting for the consolation of Israel in Luke 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 2, 1, 'Why did Joseph and Mary go to Bethlehem in Luke 2?', '["Because of a census decreed by Caesar Augustus", "To visit Zechariah and Elizabeth", "To escape Herod''s soldiers", "To dedicate Jesus there by custom"]'::jsonb, 'Because of a census decreed by Caesar Augustus', 'Luke 2:1-5 says they went because of the census.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'Why did Joseph and Mary go to Bethlehem in Luke 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 2, 2, 'How did Mary respond to the events surrounding Jesus''s birth in Luke 2?', '["She treasured them and pondered them in her heart", "She told everyone in Jerusalem immediately", "She doubted the angel''s words", "She stayed permanently in Bethlehem"]'::jsonb, 'She treasured them and pondered them in her heart', 'Luke 2:19 says Mary treasured these things and pondered them in her heart.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'How did Mary respond to the events surrounding Jesus''s birth in Luke 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 2, 2, 'To whom did the angels first announce Jesus''s birth in Luke 2?', '["Shepherds", "Priests", "Wise men", "Scribes"]'::jsonb, 'Shepherds', 'Luke 2:8-14 describes angels announcing the birth to shepherds.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'To whom did the angels first announce Jesus''s birth in Luke 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 2, 2, 'What did the multitude of the heavenly host praise God for in Luke 2?', '["Glory to God in the highest, and on earth peace", "The coming census", "The fall of Herod", "The rebuilding of Jerusalem"]'::jsonb, 'Glory to God in the highest, and on earth peace', 'Luke 2:13-14 records the angelic praise.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the multitude of the heavenly host praise God for in Luke 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 2, 2, 'What warning did Simeon give Mary in Luke 2?', '["A sword would pierce her own soul also", "She must flee to Egypt immediately", "Jesus would never return to Nazareth", "The shepherds would oppose her"]'::jsonb, 'A sword would pierce her own soul also', 'Luke 2:35 says a sword would pierce Mary''s soul.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What warning did Simeon give Mary in Luke 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 2, 2, 'Why did Simeon say he could now depart in peace in Luke 2?', '["He had seen God''s salvation with his own eyes", "He was ready to leave Jerusalem forever", "He had heard the shepherds'' report", "He had finished his priestly duty"]'::jsonb, 'He had seen God''s salvation with his own eyes', 'Luke 2:29-30 says Simeon had seen God''s salvation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why did Simeon say he could now depart in peace in Luke 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 2, 3, 'What do Simeon and Anna contribute to Luke 2?', '["They recognize and testify to the significance of the child Jesus", "They oppose Joseph and Mary in the temple", "They arrange the family''s move to Nazareth", "They question whether Jesus is the Messiah"]'::jsonb, 'They recognize and testify to the significance of the child Jesus', 'Luke 2:25-38 presents Simeon and Anna as Spirit-led witnesses to Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What do Simeon and Anna contribute to Luke 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 2, 3, 'What does Luke mean by saying Jesus increased in wisdom and stature?', '["He truly grew through ordinary human development while remaining unique", "He gradually became divine over time", "He needed to overcome earlier unbelief", "He stopped growing after the temple episode"]'::jsonb, 'He truly grew through ordinary human development while remaining unique', 'Luke 2:52 stresses Jesus''s real human growth in wisdom and favor.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Luke mean by saying Jesus increased in wisdom and stature?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 2, 3, 'What does Simeon''s song reveal about Jesus in Luke 2?', '["He is salvation prepared for all peoples, including Gentiles", "He belongs only to Bethlehem and Judea", "He will remain hidden from Israel forever", "He comes mainly to restore temple rituals"]'::jsonb, 'He is salvation prepared for all peoples, including Gentiles', 'Luke 2:30-32 calls Jesus a light for revelation to the Gentiles and glory to Israel.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Simeon''s song reveal about Jesus in Luke 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 2, 3, 'Why are shepherds significant recipients of the birth announcement in Luke 2?', '["They fit Luke''s pattern of God''s favor reaching the lowly and ordinary", "They were the most politically powerful group in Judea", "They served as temple priests by night", "They had already visited Nazareth earlier"]'::jsonb, 'They fit Luke''s pattern of God''s favor reaching the lowly and ordinary', 'Luke 2 highlights humble shepherds as first hearers of the angelic announcement.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why are shepherds significant recipients of the birth announcement in Luke 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 2, 3, 'Why is Jesus staying behind in the temple important in Luke 2?', '["It reveals his unique relation to the Father even in childhood", "It shows disobedience with no redeeming purpose", "It marks the calling of the Twelve", "It replaces his submission to Mary and Joseph"]'::jsonb, 'It reveals his unique relation to the Father even in childhood', 'Luke 2:49 points to Jesus''s special identity in relation to the Father.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is Jesus staying behind in the temple important in Luke 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 2, 4, 'How does Luke 2 connect public history and divine purpose?', '["The emperor''s census becomes the means by which God''s saving plan unfolds in Bethlehem", "Rome accidentally prevents God''s plan from happening", "The chapter avoids all historical markers", "Political power is shown to control Jesus''s destiny"]'::jsonb, 'The emperor''s census becomes the means by which God''s saving plan unfolds in Bethlehem', 'Luke 2 opens with Caesar''s decree but shows God directing events through it.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Luke 2 connect public history and divine purpose?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 2, 4, 'How does Luke 2 portray Jesus as both royal and lowly?', '["He is announced as Savior and Lord yet lies in a manger and grows in an ordinary family", "He is crowned king at birth in Jerusalem", "His lowliness is hidden from every witness", "Royal language is absent from the chapter"]'::jsonb, 'He is announced as Savior and Lord yet lies in a manger and grows in an ordinary family', 'Luke 2 combines exalted titles with humble circumstances.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Luke 2 portray Jesus as both royal and lowly?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 2, 4, 'What is the narrative effect of moving from angels to shepherds to temple witnesses in Luke 2?', '["It widens the testimony to Jesus across heaven, humble hearers, and devout Israel", "It shifts away from Jesus to John the Baptist", "It limits the message to one small family circle", "It replaces revelation with rumor"]'::jsonb, 'It widens the testimony to Jesus across heaven, humble hearers, and devout Israel', 'Luke 2 layers witness from angels, shepherds, Simeon, and Anna.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'What is the narrative effect of moving from angels to shepherds to temple witnesses in Luke 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 2, 4, 'Why is Anna''s witness important in Luke 2?', '["She adds a second temple witness of praise and expectation around redemption", "She replaces Simeon''s testimony entirely", "She privately questions whether Jesus is the Messiah", "She serves mainly as a genealogical detail"]'::jsonb, 'She adds a second temple witness of praise and expectation around redemption', 'Luke 2:36-38 presents Anna as another witness giving thanks and speaking of redemption.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is Anna''s witness important in Luke 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 2, 4, 'Why is the scene of twelve-year-old Jesus in the temple important in Luke 2?', '["It shows his unique sonship and wisdom while he still submits to his parents", "It proves he rejected his family permanently", "It marks the start of his public miracles", "It ends his growth in ordinary life"]'::jsonb, 'It shows his unique sonship and wisdom while he still submits to his parents', 'Luke 2:41-52 shows Jesus in his Father''s house yet returning in submission with Mary and Joseph.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is the scene of twelve-year-old Jesus in the temple important in Luke 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 2, 5, 'How does Luke 2 frame Jesus''s identity in relation to Israel and the nations?', '["He is Israel''s glory and also light for revelation to the Gentiles", "He belongs only to the shepherds and no one else", "He is sent to abolish Israel''s hope", "The nations remain outside the chapter''s scope"]'::jsonb, 'He is Israel''s glory and also light for revelation to the Gentiles', 'Luke 2:32 places Jesus within both Israel''s hope and a wider mission to the nations.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 2 frame Jesus''s identity in relation to Israel and the nations?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 2, 5, 'How does Luke 2 hold together humility and glory in Jesus''s early life?', '["The Savior is born in lowliness yet recognized as God''s promised salvation", "The chapter presents only royal splendor with no humility", "Humility hides Jesus from all witnesses", "Glory appears only after the resurrection"]'::jsonb, 'The Savior is born in lowliness yet recognized as God''s promised salvation', 'Luke 2 joins manger humility with angelic glory, shepherd witness, and temple recognition.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 2 hold together humility and glory in Jesus''s early life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 2, 5, 'How does Luke 2 use worship as a response to revelation?', '["Angels, shepherds, Simeon, Anna, and finally the family setting all answer revelation with praise and wonder", "Worship is limited to the temple priests alone", "The chapter separates praise from understanding", "Only Mary responds with faith"]'::jsonb, 'Angels, shepherds, Simeon, Anna, and finally the family setting all answer revelation with praise and wonder', 'Luke 2 repeatedly joins revelation with glorifying God, thanksgiving, marveling, and worship.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 2 use worship as a response to revelation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 2, 5, 'What is the theological significance of Jesus being found in the temple after three days in Luke 2?', '["Even here Luke hints that Jesus is oriented around the Father''s affairs above all else", "It proves Mary and Joseph failed permanently as parents", "It predicts the exact day of the resurrection in a direct formula", "It means Jesus would never return home again"]'::jsonb, 'Even here Luke hints that Jesus is oriented around the Father''s affairs above all else', 'Luke 2:46-49 centers on Jesus in the temple and his Father''s business.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the theological significance of Jesus being found in the temple after three days in Luke 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 2, 5, 'What larger arc does Luke 2 begin for the Gospel?', '["Jesus is recognized early as Savior, yet his path unfolds through humility, misunderstanding, and growth", "His identity remains completely hidden until chapter 24", "The chapter suggests the temple will replace his mission", "Luke begins and ends in Bethlehem alone"]'::jsonb, 'Jesus is recognized early as Savior, yet his path unfolds through humility, misunderstanding, and growth', 'Luke 2 introduces both early recognition and the long unfolding of Jesus''s mission.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger arc does Luke 2 begin for the Gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 3, 1, 'How did the people wonder about John in Luke 3?', '["They questioned whether he might be the Christ", "They believed he was Elijah returned visibly", "They asked if he was a king from David''s line", "They assumed he was a Roman prophet"]'::jsonb, 'They questioned whether he might be the Christ', 'Luke 3:15 says the people wondered whether John might be the Christ.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'How did the people wonder about John in Luke 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 3, 1, 'What did John preach in the wilderness in Luke 3?', '["A baptism of repentance for the forgiveness of sins", "A call to armed revolt", "A message about temple sacrifices only", "A promise of immediate judgment on Rome"]'::jsonb, 'A baptism of repentance for the forgiveness of sins', 'Luke 3:3 says John preached a baptism of repentance for forgiveness of sins.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did John preach in the wilderness in Luke 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 3, 1, 'What did John tell soldiers in Luke 3?', '["Do not extort and be content with your wages", "Leave the army at once", "Refuse all orders from Rome", "Join the temple guard"]'::jsonb, 'Do not extort and be content with your wages', 'Luke 3:14 tells soldiers not to extort and to be content with wages.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did John tell soldiers in Luke 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 3, 1, 'What did John tell tax collectors to do in Luke 3?', '["Collect no more than appointed", "Leave their jobs immediately", "Stop paying Roman taxes", "Go into the wilderness"]'::jsonb, 'Collect no more than appointed', 'Luke 3:12-13 gives that instruction to tax collectors.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did John tell tax collectors to do in Luke 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 3, 1, 'What did John tell the crowds to produce in Luke 3?', '["Fruits worthy of repentance", "More sacrifices", "Political loyalty", "Temple offerings only"]'::jsonb, 'Fruits worthy of repentance', 'Luke 3:8 tells them to bear fruits worthy of repentance.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did John tell the crowds to produce in Luke 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 3, 2, 'What descended on Jesus at his baptism in Luke 3?', '["The Holy Spirit in bodily form like a dove", "Fire from heaven", "A cloud of darkness", "A host of angels"]'::jsonb, 'The Holy Spirit in bodily form like a dove', 'Luke 3:22 says the Holy Spirit descended in bodily form like a dove.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What descended on Jesus at his baptism in Luke 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 3, 2, 'What did John say the mightier one would baptize with in Luke 3?', '["The Holy Spirit and fire", "Water only", "Oil and wine", "Cloud and thunder"]'::jsonb, 'The Holy Spirit and fire', 'Luke 3:16 says the coming one would baptize with the Holy Spirit and fire.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did John say the mightier one would baptize with in Luke 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 3, 2, 'What did the voice from heaven say to Jesus in Luke 3?', '["You are my beloved Son; in you I am well pleased", "This is my prophet; hear him", "You will reign over Rome", "Peace to all who see you"]'::jsonb, 'You are my beloved Son; in you I am well pleased', 'Luke 3:22 records the Father''s words at Jesus''s baptism.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the voice from heaven say to Jesus in Luke 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 3, 2, 'What happened when Jesus was baptized in Luke 3?', '["He was praying and heaven was opened", "He immediately went to Nazareth", "The crowds fled in fear", "John left the Jordan forever"]'::jsonb, 'He was praying and heaven was opened', 'Luke 3:21 says that while Jesus was praying, heaven was opened.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What happened when Jesus was baptized in Luke 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 3, 2, 'What image did John use for judgment in Luke 3?', '["A winnowing fork separating wheat from chaff", "A vineyard being burned", "A broken net in the sea", "A tower falling in the city"]'::jsonb, 'A winnowing fork separating wheat from chaff', 'Luke 3:17 uses the winnowing fork image.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What image did John use for judgment in Luke 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 3, 3, 'What does the Spirit descending bodily like a dove add to Luke''s baptism account?', '["It marks Jesus publicly and concretely for Spirit-filled mission", "It means Jesus lacked the Spirit beforehand in every sense", "It identifies John as the true Messiah", "It signals the end of prayer"]'::jsonb, 'It marks Jesus publicly and concretely for Spirit-filled mission', 'Luke 3:22 gives a visible sign of the Spirit''s descent on Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the Spirit descending bodily like a dove add to Luke''s baptism account?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 3, 3, 'What is the significance of tracing Jesus back to Adam in Luke 3?', '["It places Jesus in solidarity with all humanity, not Israel alone", "It denies his Davidic identity", "It proves Joseph is his biological father in Luke''s argument", "It separates Jesus from Abraham''s line"]'::jsonb, 'It places Jesus in solidarity with all humanity, not Israel alone', 'Luke 3:38 ends the genealogy with Adam, broadening the horizon of Jesus''s mission.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the significance of tracing Jesus back to Adam in Luke 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 3, 3, 'Why are John''s practical instructions to crowds, tax collectors, and soldiers important in Luke 3?', '["Repentance is shown in concrete ethical fruit, not mere ancestry or ritual", "They prove social roles must be abandoned immediately", "They replace the need for baptism", "They are directed only to Gentiles"]'::jsonb, 'Repentance is shown in concrete ethical fruit, not mere ancestry or ritual', 'Luke 3 links repentance with visible, ordinary obedience in everyday callings.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why are John''s practical instructions to crowds, tax collectors, and soldiers important in Luke 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 3, 3, 'Why does John call people a brood of vipers in Luke 3?', '["He warns that ancestry without repentance cannot save them from coming wrath", "He is speaking only to Gentile soldiers", "He is rejecting baptism itself", "He is praising their zeal for the law"]'::jsonb, 'He warns that ancestry without repentance cannot save them from coming wrath', 'Luke 3:7-9 demands fruits worthy of repentance instead of trust in descent from Abraham.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does John call people a brood of vipers in Luke 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 3, 3, 'Why does Luke include Herod''s imprisonment of John before narrating Jesus''s baptism?', '["It closes off John''s role and clears the stage for Jesus''s ministry", "It proves John never finished preaching repentance", "It suggests Herod repented afterward", "It means Jesus was baptized in prison"]'::jsonb, 'It closes off John''s role and clears the stage for Jesus''s ministry', 'Luke 3:19-20 notes Herod''s action before turning fully to Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Luke include Herod''s imprisonment of John before narrating Jesus''s baptism?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 3, 4, 'How do John''s preaching and Jesus''s baptism work together in Luke 3?', '["The forerunner prepares repentant expectation, and the beloved Son is publicly revealed to begin the mission", "John and Jesus compete for the same role", "Baptism replaces John''s ethical preaching", "The Father speaks first to John and not to Jesus"]'::jsonb, 'The forerunner prepares repentant expectation, and the beloved Son is publicly revealed to begin the mission', 'Luke 3 pairs preparation through John with divine identification of Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do John''s preaching and Jesus''s baptism work together in Luke 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 3, 4, 'How does Luke''s genealogy deepen the identity of Jesus?', '["It links him not only to Israel''s story but back to Adam and humanity as a whole", "It disconnects him from David entirely", "It proves Luke copied Matthew exactly", "It focuses only on priestly descent"]'::jsonb, 'It links him not only to Israel''s story but back to Adam and humanity as a whole', 'Luke 3:23-38 traces Jesus back to Adam, broadening the scope of his mission.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Luke''s genealogy deepen the identity of Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 3, 4, 'How does prayer function in Luke''s baptism account?', '["Jesus''s baptism is marked by prayer at the moment heaven opens and the Spirit descends", "Prayer is absent from the scene entirely", "Only John is shown praying", "Prayer replaces the voice from heaven"]'::jsonb, 'Jesus''s baptism is marked by prayer at the moment heaven opens and the Spirit descends', 'Luke 3:21 uniquely notes Jesus praying at his baptism.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does prayer function in Luke''s baptism account?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 3, 4, 'What larger picture of judgment and hope does Luke 3 present?', '["The chapter warns of coming wrath while announcing the Spirit-anointed Son", "It offers judgment without any hope", "It focuses only on ethical reform and not the Messiah", "It delays all salvation language until later chapters"]'::jsonb, 'The chapter warns of coming wrath while announcing the Spirit-anointed Son', 'Luke 3 holds together John''s severe warnings and the Father''s declaration over Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger picture of judgment and hope does Luke 3 present?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 3, 4, 'Why is the contrast between Abraham and Adam important in Luke 3?', '["Luke keeps Israel''s promises intact while also widening Jesus''s significance to all humanity", "Luke chooses Adam to replace Abraham entirely", "The genealogy is meant only to correct Matthew", "Adam appears only as a literary flourish with no theological role"]'::jsonb, 'Luke keeps Israel''s promises intact while also widening Jesus''s significance to all humanity', 'Luke''s genealogy includes Abraham and David but extends all the way to Adam.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is the contrast between Abraham and Adam important in Luke 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 3, 5, 'How does Luke 3 prepare for Jesus''s public ministry?', '["John calls for repentance, the Father identifies the Son, and the genealogy frames Jesus in salvation history", "The chapter ends John''s ministry before he preaches", "Jesus begins with miracles before baptism", "Israel''s story is set aside for a new beginning without context"]'::jsonb, 'John calls for repentance, the Father identifies the Son, and the genealogy frames Jesus in salvation history', 'Luke 3 combines John''s preparation, Jesus''s baptism, and genealogy as a launch into ministry.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 3 prepare for Jesus''s public ministry?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 3, 5, 'How does Luke 3 prepare the reader for the temptation narrative that follows?', '["Jesus is identified as God''s beloved Son and linked to Adam just before entering wilderness testing", "The genealogy interrupts the story without purpose", "John remains the central figure through chapter 4", "The Spirit departs from Jesus before the wilderness"]'::jsonb, 'Jesus is identified as God''s beloved Son and linked to Adam just before entering wilderness testing', 'Luke 3 ends by naming Jesus as Son and tracing him to Adam, setting up Luke 4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 3 prepare the reader for the temptation narrative that follows?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 3, 5, 'How does Luke 3 unite ethics, Christology, and salvation history?', '["John''s ethical call prepares for the beloved Son whose genealogy locates him in God''s long redemptive story", "The chapter keeps ethics and identity entirely separate", "Salvation history ends with John''s imprisonment", "Only the genealogy matters"]'::jsonb, 'John''s ethical call prepares for the beloved Son whose genealogy locates him in God''s long redemptive story', 'Luke 3 moves from repentance to baptism to genealogy as one coherent preparation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 3 unite ethics, Christology, and salvation history?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 3, 5, 'What does Luke 3 suggest about genuine covenant identity?', '["It is marked by repentance and fruit, not reliance on ancestry alone", "It depends solely on descent from Abraham", "It belongs only to temple priests", "It is proven by political resistance"]'::jsonb, 'It is marked by repentance and fruit, not reliance on ancestry alone', 'John''s preaching in Luke 3 undermines confidence in ancestry without transformed life.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Luke 3 suggest about genuine covenant identity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 3, 5, 'Why is John''s self-lowering statement about untying sandals important in Luke 3?', '["It sharply distinguishes the forerunner from the far greater one who is coming", "It means John is unworthy to baptize anyone", "It shows John rejects all prophecy", "It teaches that humility replaces truth"]'::jsonb, 'It sharply distinguishes the forerunner from the far greater one who is coming', 'Luke 3:16 places John clearly beneath the coming Messiah.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is John''s self-lowering statement about untying sandals important in Luke 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 4, 1, 'In Luke 4, what did Jesus use to answer the devil''s temptations?', '["Scripture", "A miracle", "A parable", "Silence only"]'::jsonb, 'Scripture', 'Luke 4:4, 4:8, and 4:12 show Jesus answering from Scripture.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'In Luke 4, what did Jesus use to answer the devil''s temptations?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 4, 1, 'What happened when demons came out of many in Luke 4?', '["They said Jesus was the Son of God", "They asked to enter swine", "They followed him to Nazareth", "They were ignored by the crowds"]'::jsonb, 'They said Jesus was the Son of God', 'Luke 4:41 says demons came out crying that Jesus was the Son of God.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'What happened when demons came out of many in Luke 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 4, 1, 'Where did Jesus say a prophet is not accepted in Luke 4?', '["In his hometown", "In the temple", "Among Gentiles", "In the wilderness"]'::jsonb, 'In his hometown', 'Luke 4:24 says no prophet is acceptable in his hometown.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'Where did Jesus say a prophet is not accepted in Luke 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 4, 1, 'Where was Jesus tempted in Luke 4?', '["In the wilderness", "In Jerusalem''s temple court", "At the Sea of Galilee", "In Nazareth"]'::jsonb, 'In the wilderness', 'Luke 4:1-2 says Jesus was led in the wilderness and tempted by the devil.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'Where was Jesus tempted in Luke 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 4, 1, 'Whose mother-in-law did Jesus heal in Luke 4?', '["Simon''s", "Levi''s", "James''s", "Zacchaeus''s"]'::jsonb, 'Simon''s', 'Luke 4:38 says Jesus healed Simon''s mother-in-law.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'Whose mother-in-law did Jesus heal in Luke 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 4, 2, 'How did the people of Nazareth react when Jesus spoke of those Old Testament examples?', '["They were filled with wrath and tried to throw him down", "They asked him to stay and teach longer", "They immediately believed and repented", "They brought the sick to him for healing"]'::jsonb, 'They were filled with wrath and tried to throw him down', 'Luke 4:28-29 says they rose up and tried to cast him down the hill.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'How did the people of Nazareth react when Jesus spoke of those Old Testament examples?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 4, 2, 'What did Jesus announce had been fulfilled in the synagogue at Nazareth?', '["The Scripture he had just read", "The temple sacrifice for that day", "John''s imprisonment", "The census under Augustus"]'::jsonb, 'The Scripture he had just read', 'Luke 4:21 says, ''Today this Scripture has been fulfilled in your hearing.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus announce had been fulfilled in the synagogue at Nazareth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 4, 2, 'What did Jesus read in the synagogue at Nazareth in Luke 4?', '["Isaiah''s prophecy about good news and liberty", "Moses''s account of creation", "The psalm of David''s kingship", "Malachi''s prophecy about Elijah only"]'::jsonb, 'Isaiah''s prophecy about good news and liberty', 'Luke 4:17-19 records Jesus reading from Isaiah in the synagogue.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus read in the synagogue at Nazareth in Luke 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 4, 2, 'Why did Jesus mention Elijah and Elisha in Luke 4?', '["To show that God''s mercy had reached outsiders when Israel was unbelieving", "To prove he would call down fire on Nazareth", "To identify John as Elijah in full", "To explain the Roman occupation"]'::jsonb, 'To show that God''s mercy had reached outsiders when Israel was unbelieving', 'Luke 4:25-27 cites Elijah and Elisha helping Gentiles, provoking Nazareth''s anger.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why did Jesus mention Elijah and Elisha in Luke 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 4, 2, 'Why did Jesus say he must preach the good news in other towns also in Luke 4?', '["He was sent for that purpose", "Nazareth had fully accepted him", "The disciples were already waiting in Galilee", "Jerusalem had summoned him"]'::jsonb, 'He was sent for that purpose', 'Luke 4:43 says he must preach in other cities because he was sent for that purpose.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why did Jesus say he must preach the good news in other towns also in Luke 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 4, 3, 'What do the healings and exorcisms in Capernaum reveal in Luke 4?', '["Jesus''s word has immediate authority over spiritual and physical brokenness", "Only demons recognize him, not people", "He heals only those in Peter''s household", "His main work is political liberation"]'::jsonb, 'Jesus''s word has immediate authority over spiritual and physical brokenness', 'Luke 4:31-41 stresses the authority of Jesus''s word in teaching, exorcism, and healing.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What do the healings and exorcisms in Capernaum reveal in Luke 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 4, 3, 'What is the significance of Jesus reading Isaiah in Luke 4?', '["He defines his mission as Spirit-anointed good news, liberty, and healing", "He replaces all earlier Scripture with a new book", "He announces only political revolution", "He limits his work to synagogue reading"]'::jsonb, 'He defines his mission as Spirit-anointed good news, liberty, and healing', 'Luke 4:18-19 presents Isaiah as the charter for Jesus''s mission.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the significance of Jesus reading Isaiah in Luke 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 4, 3, 'Why did the people of Nazareth turn against Jesus in Luke 4?', '["They rejected his claim of fulfillment and were angered by examples of grace to Gentiles", "They objected to his healing of Peter''s mother-in-law", "They thought he was too young to read Scripture", "They demanded tribute money"]'::jsonb, 'They rejected his claim of fulfillment and were angered by examples of grace to Gentiles', 'Luke 4:21-30 shows the synagogue turning hostile when Jesus speaks of prophetic mercy toward outsiders.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why did the people of Nazareth turn against Jesus in Luke 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 4, 3, 'Why does Luke emphasize that Jesus returned in the power of the Spirit?', '["His ministry flows from Spirit-empowered obedience after the wilderness testing", "It means he previously lacked all divine power", "The Spirit appears only for miracles and not teaching", "It explains why Nazareth accepted him at first"]'::jsonb, 'His ministry flows from Spirit-empowered obedience after the wilderness testing', 'Luke 4:14 connects Jesus''s temptation victory with Spirit-empowered ministry.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Luke emphasize that Jesus returned in the power of the Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 4, 3, 'Why is Nazareth''s rejection a key moment in Luke 4?', '["It foreshadows how prophetic grace can be resisted even by those most familiar with Jesus", "It ends Jesus''s public ministry at once", "It proves Gentiles will always reject him too", "It shows his teaching lacked authority"]'::jsonb, 'It foreshadows how prophetic grace can be resisted even by those most familiar with Jesus', 'Luke 4:22-30 turns from amazement to attempted violence.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is Nazareth''s rejection a key moment in Luke 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 4, 4, 'How do wilderness temptation and synagogue proclamation fit together in Luke 4?', '["The obedient Son resists the devil and then publicly declares the shape of his mission", "The temptation prevents him from preaching afterward", "Nazareth explains the temptations rather than mission", "The chapter separates private obedience from public ministry"]'::jsonb, 'The obedient Son resists the devil and then publicly declares the shape of his mission', 'Luke 4 moves from tested sonship in the wilderness to public mission in Nazareth.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do wilderness temptation and synagogue proclamation fit together in Luke 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 4, 4, 'How does Luke 4 balance announcement and action?', '["Jesus declares good news in Scripture and then enacts it through deliverance and healing", "Words matter, but actions are secondary and unrelated", "Only the announcement in Nazareth is central", "Action replaces explanation entirely"]'::jsonb, 'Jesus declares good news in Scripture and then enacts it through deliverance and healing', 'Luke 4 shows Jesus''s words in Nazareth embodied in his ministry in Capernaum and beyond.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Luke 4 balance announcement and action?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 4, 4, 'What does Luke 4 emphasize about Jesus''s authority?', '["He teaches with authority and commands demons and sickness alike", "He depends entirely on Nazareth''s approval", "He avoids all confrontation with evil spirits", "He limits his work to private prayer"]'::jsonb, 'He teaches with authority and commands demons and sickness alike', 'Luke 4:31-41 highlights Jesus''s authoritative word over demons and illness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Luke 4 emphasize about Jesus''s authority?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 4, 4, 'What larger portrait of the Messiah emerges in Luke 4?', '["He is Spirit-anointed, scripturally grounded, resisted by some, and authoritative over evil", "He is mainly a political reformer", "He remains hidden from public view", "He works only through the temple system"]'::jsonb, 'He is Spirit-anointed, scripturally grounded, resisted by some, and authoritative over evil', 'Luke 4 combines Isaiah fulfillment, rejection, and powerful works into a unified messianic portrait.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger portrait of the Messiah emerges in Luke 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 4, 4, 'Why is the reference to Gentiles in Nazareth so provocative in Luke 4?', '["It exposes that God''s mercy cannot be controlled by hometown privilege or ethnic presumption", "It means Israel has no future role at all", "It was a minor historical aside with no relevance", "It proves Jesus planned to abandon Galilee immediately"]'::jsonb, 'It exposes that God''s mercy cannot be controlled by hometown privilege or ethnic presumption', 'Jesus''s references to Elijah and Elisha helping Gentiles ignite the town''s anger in Luke 4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is the reference to Gentiles in Nazareth so provocative in Luke 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 4, 5, 'How does Luke 4 prepare the reader for the rest of Luke-Acts?', '["It introduces the Spirit, Scripture fulfillment, opposition, and mission to the needy and outsiders", "It settles every major controversy immediately", "It limits the Gospel to Nazareth and Capernaum", "It removes the need for further teaching about the kingdom"]'::jsonb, 'It introduces the Spirit, Scripture fulfillment, opposition, and mission to the needy and outsiders', 'Themes central to Luke-Acts are already present in Luke 4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 4 prepare the reader for the rest of Luke-Acts?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 4, 5, 'How does Luke 4 reveal the relation between sonship and mission?', '["The beloved Son proves his identity through obedient dependence and proclamation of the Father''s liberating purpose", "Sonship is shown only by visible power", "Mission replaces sonship as the main issue", "Jesus receives sonship later in Galilee"]'::jsonb, 'The beloved Son proves his identity through obedient dependence and proclamation of the Father''s liberating purpose', 'Luke 3-4 ties the Father''s declaration of sonship to wilderness obedience and public mission.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 4 reveal the relation between sonship and mission?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 4, 5, 'How does Luke 4 set the pattern for the rest of the Gospel?', '["Spirit-led mission, prophetic fulfillment, rejection, and powerful ministry all appear together", "Jesus settles permanently in Nazareth without opposition", "The kingdom message is replaced by genealogy", "The chapter focuses only on temptation and nothing more"]'::jsonb, 'Spirit-led mission, prophetic fulfillment, rejection, and powerful ministry all appear together', 'Luke 4 combines temptation, Isaiah fulfillment, rejection at home, and effective ministry in Capernaum.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 4 set the pattern for the rest of the Gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 4, 5, 'What is the theological importance of Jesus refusing the devil''s shortcuts in Luke 4?', '["He embraces obedience to the Father rather than power, spectacle, or compromise", "He is unwilling to help hungry people later", "He rejects Scripture as a guide", "He decides miracles are unnecessary for ministry"]'::jsonb, 'He embraces obedience to the Father rather than power, spectacle, or compromise', 'Luke 4 presents Jesus as the faithful Son who will not seize mission on the devil''s terms.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the theological importance of Jesus refusing the devil''s shortcuts in Luke 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 4, 5, 'Why is Jesus''s passing through the hostile crowd in Nazareth significant in Luke 4?', '["His mission continues under divine purpose and cannot be ended on the crowd''s terms", "It proves he used violence to escape", "It marks the end of his connection to Israel", "It denies the reality of the opposition"]'::jsonb, 'His mission continues under divine purpose and cannot be ended on the crowd''s terms', 'Luke 4:30 shows Jesus going through their midst and leaving.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Jesus''s passing through the hostile crowd in Nazareth significant in Luke 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 5, 1, 'From whose boat did Jesus teach before the miraculous catch in Luke 5?', '["Simon''s boat", "Levi''s boat", "James''s chariot", "A centurion''s vessel"]'::jsonb, 'Simon''s boat', 'Luke 5:3 says Jesus got into Simon''s boat to teach.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'From whose boat did Jesus teach before the miraculous catch in Luke 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 5, 1, 'How was the paralytic brought before Jesus in Luke 5?', '["Through the roof on a bed", "By the synagogue ruler''s servants", "On a stretcher through the front gate", "Across the sea in a boat"]'::jsonb, 'Through the roof on a bed', 'Luke 5:19 says they let him down through the tiles into the midst before Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'How was the paralytic brought before Jesus in Luke 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 5, 1, 'What did Jesus do when a leper asked to be made clean in Luke 5?', '["He touched him and said, ''I will; be clean''", "He told him to wait outside the town", "He sent him to John first", "He rebuked him for approaching"]'::jsonb, 'He touched him and said, ''I will; be clean''', 'Luke 5:13 says Jesus touched the leper and cleansed him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus do when a leper asked to be made clean in Luke 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 5, 1, 'What did Jesus tell Simon after the miraculous catch in Luke 5?', '["From now on you will catch people", "Launch into the deep again tomorrow", "Return these fish to the crowd", "Go back to Nazareth"]'::jsonb, 'From now on you will catch people', 'Luke 5:10 says, ''From now on you will catch men alive.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus tell Simon after the miraculous catch in Luke 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 5, 1, 'What did Levi do after Jesus called him in Luke 5?', '["He left everything and followed him", "He asked to think about it first", "He returned to the temple", "He went back to collecting taxes immediately"]'::jsonb, 'He left everything and followed him', 'Luke 5:28 says Levi left all, rose up, and followed Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Levi do after Jesus called him in Luke 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 5, 2, 'How did Jesus answer the question about fasting in Luke 5?', '["The bridegroom''s presence changes the time for fasting", "Fasting is never appropriate again", "Only Pharisees should fast", "His disciples had already mastered fasting"]'::jsonb, 'The bridegroom''s presence changes the time for fasting', 'Luke 5:34-35 uses the bridegroom image to answer the fasting question.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'How did Jesus answer the question about fasting in Luke 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 5, 2, 'What did Jesus say about those who need a physician in Luke 5?', '["The sick, not the healthy", "The righteous, not sinners", "The rich, not the poor", "The scribes, not tax collectors"]'::jsonb, 'The sick, not the healthy', 'Luke 5:31 says those who are sick need a physician.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say about those who need a physician in Luke 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 5, 2, 'What did Jesus tell the healed leper to do in Luke 5?', '["Show himself to the priest and offer as Moses commanded", "Tell everyone openly at once", "Return to the wilderness", "Join the tax collectors'' feast"]'::jsonb, 'Show himself to the priest and offer as Moses commanded', 'Luke 5:14 gives that instruction.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus tell the healed leper to do in Luke 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 5, 2, 'What did the scribes and Pharisees complain about at Levi''s feast in Luke 5?', '["Jesus ate with tax collectors and sinners", "Jesus healed too many people", "Jesus refused to read Scripture", "Jesus charged money for miracles"]'::jsonb, 'Jesus ate with tax collectors and sinners', 'Luke 5:30 records their complaint.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the scribes and Pharisees complain about at Levi''s feast in Luke 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 5, 2, 'Whom did Jesus call from the tax office in Luke 5?', '["Levi", "Andrew", "Nicodemus", "Zacchaeus"]'::jsonb, 'Levi', 'Luke 5:27 says Jesus called Levi from the tax office.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'Whom did Jesus call from the tax office in Luke 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 5, 3, 'What do the patch and wineskins sayings mean in Luke 5?', '["Jesus''s ministry brings a new reality that old structures cannot simply contain unchanged", "The old covenant was evil from the start", "New disciples should reject all Scripture", "Only wedding feasts matter now"]'::jsonb, 'Jesus''s ministry brings a new reality that old structures cannot simply contain unchanged', 'Luke 5:36-39 uses patch and wineskins imagery to express the newness of Jesus''s work.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What do the patch and wineskins sayings mean in Luke 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 5, 3, 'What does Jesus''s withdrawal to pray reveal in Luke 5?', '["Public power in ministry is matched by hidden dependence on the Father", "He needed to escape from all crowds permanently", "Prayer replaces healing for the rest of the chapter", "He doubted his calling after cleansing the leper"]'::jsonb, 'Public power in ministry is matched by hidden dependence on the Father', 'Luke 5:16 says Jesus withdrew to deserted places and prayed.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Jesus''s withdrawal to pray reveal in Luke 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 5, 3, 'Why does Peter say, ''Depart from me, for I am a sinful man, Lord'' in Luke 5?', '["The miraculous catch exposes Jesus''s holy authority and Peter''s unworthiness", "He is angry about losing the fish", "He wants to return to Nazareth immediately", "He believes the boat is sinking"]'::jsonb, 'The miraculous catch exposes Jesus''s holy authority and Peter''s unworthiness', 'Luke 5:8 shows Peter overwhelmed by Jesus''s power and holiness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Peter say, ''Depart from me, for I am a sinful man, Lord'' in Luke 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 5, 3, 'Why is Levi''s calling important in Luke 5?', '["It shows Jesus deliberately calls socially compromised outsiders into discipleship", "It proves tax collectors were already respected religious leaders", "It ends the controversy with the Pharisees", "It marks the first Gentile conversion in Luke"]'::jsonb, 'It shows Jesus deliberately calls socially compromised outsiders into discipleship', 'Luke 5:27-32 emphasizes Jesus calling sinners, not the self-righteous.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is Levi''s calling important in Luke 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 5, 3, 'Why is touching the leper significant in Luke 5?', '["Jesus''s holiness overcomes uncleanness rather than being defiled by it", "It shows he ignored the law carelessly", "It proves the leper was not really unclean", "It meant the priestly system was abolished that day"]'::jsonb, 'Jesus''s holiness overcomes uncleanness rather than being defiled by it', 'Luke 5:13 presents Jesus touching and cleansing the leper immediately.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is touching the leper significant in Luke 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 5, 4, 'How do miracle, forgiveness, and controversy interact in Luke 5?', '["Jesus''s gracious acts reveal divine authority and simultaneously provoke resistance", "Miracles eliminate all opposition immediately", "Controversy happens only because crowds misunderstand the healings", "Forgiveness is treated as less important than physical healing"]'::jsonb, 'Jesus''s gracious acts reveal divine authority and simultaneously provoke resistance', 'Luke 5 repeatedly pairs mercy with questions from religious leaders.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do miracle, forgiveness, and controversy interact in Luke 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 5, 4, 'How does Luke 5 portray the Son of Man?', '["He has authority to forgive, power to heal, and the right to call followers into a new way of life", "He appears only as a future title with no present authority", "He is mainly a political liberator", "He avoids contact with sinners and the sick"]'::jsonb, 'He has authority to forgive, power to heal, and the right to call followers into a new way of life', 'Luke 5:24 and the surrounding stories reveal the Son of Man''s present authority.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Luke 5 portray the Son of Man?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 5, 4, 'What is Jesus teaching by healing the paralytic after forgiving him?', '["The Son of Man has authority on earth to forgive sins", "Physical healing is more important than forgiveness", "Only scribes may judge sin", "Faith matters only for miracles"]'::jsonb, 'The Son of Man has authority on earth to forgive sins', 'Luke 5:20-24 ties the healing to Jesus''s authority to forgive sins.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'What is Jesus teaching by healing the paralytic after forgiving him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 5, 4, 'What larger idea does Jesus''s table fellowship support in Luke 5?', '["God''s kingdom welcomes repentant sinners into restored fellowship", "Meals are distractions from true ministry", "Only the already righteous may eat with Jesus", "Forgiveness can occur without any community dimension"]'::jsonb, 'God''s kingdom welcomes repentant sinners into restored fellowship', 'Levi''s feast in Luke 5 embodies Jesus''s mission to call sinners.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger idea does Jesus''s table fellowship support in Luke 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 5, 4, 'Why does Luke 5 move from fishermen to leper to paralytic to tax collector?', '["It displays Jesus drawing very different kinds of needy people into one circle of mercy and call", "It follows the order of temple rank in Israel", "It shows sickness is worse than sin", "It separates miracles from discipleship"]'::jsonb, 'It displays Jesus drawing very different kinds of needy people into one circle of mercy and call', 'Luke 5 broadens the scope of Jesus''s gracious call across social and physical boundaries.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Luke 5 move from fishermen to leper to paralytic to tax collector?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 5, 5, 'How do prayer and controversy together deepen Luke 5?', '["Jesus''s authority is exercised from a place of communion with the Father even as opposition intensifies", "Prayer is shown as a response to defeat by opponents", "Controversy disappears whenever Jesus prays", "Luke treats prayer and public ministry as separate concerns"]'::jsonb, 'Jesus''s authority is exercised from a place of communion with the Father even as opposition intensifies', 'Luke 5 places Jesus''s withdrawal to pray amid growing crowds and growing challenge.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'How do prayer and controversy together deepen Luke 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 5, 5, 'How does Luke 5 connect calling, cleansing, forgiveness, and table fellowship?', '["Jesus gathers followers by extending holy mercy to the unclean and the socially excluded", "Jesus focuses only on ritual purity laws", "Following Jesus means avoiding sinners entirely", "The chapter ends with no controversy at all"]'::jsonb, 'Jesus gathers followers by extending holy mercy to the unclean and the socially excluded', 'Luke 5 moves from the fishermen to the leper, paralytic, Levi, and shared meals with sinners.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 5 connect calling, cleansing, forgiveness, and table fellowship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 5, 5, 'How does Luke 5 shape the reader''s understanding of Jesus''s mission?', '["He gathers disciples by cleansing, forgiving, healing, and eating with the very people others avoid", "He comes mainly to confirm the existing religious order", "He limits grace to those already inside respectable society", "He offers miracles but not a transformed community"]'::jsonb, 'He gathers disciples by cleansing, forgiving, healing, and eating with the very people others avoid', 'Luke 5 presents Jesus''s mission as holy mercy drawing people into discipleship.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 5 shape the reader''s understanding of Jesus''s mission?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 5, 5, 'What does Luke 5 suggest about the proper response to Jesus''s presence?', '["Leave all, trust his word, receive cleansing and forgiveness, and join his mission", "Wait for social acceptance first", "Stay near Jesus but avoid public identification", "Focus on ritual over repentance"]'::jsonb, 'Leave all, trust his word, receive cleansing and forgiveness, and join his mission', 'Across Luke 5, the fitting response to Jesus is faith, repentance, and costly following.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Luke 5 suggest about the proper response to Jesus''s presence?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 5, 5, 'Why is Peter''s confession of sin after the catch important for Luke''s theology of discipleship?', '["Calling begins with awareness of Jesus''s holiness and one''s own unworthiness, answered by grace", "Only sinless people may follow Jesus", "Peter is rejected because of his confession", "The miracle matters more than the relationship"]'::jsonb, 'Calling begins with awareness of Jesus''s holiness and one''s own unworthiness, answered by grace', 'Luke 5:8-10 moves from Peter''s confession to Jesus''s reassuring call.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Peter''s confession of sin after the catch important for Luke''s theology of discipleship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 6, 1, 'What did Jesus do all night before choosing the twelve apostles in Luke 6?', '["He prayed to God", "He taught the crowds", "He traveled to Jerusalem", "He fasted in the wilderness"]'::jsonb, 'He prayed to God', 'Luke 6:12 says Jesus spent the night in prayer before choosing the Twelve.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus do all night before choosing the twelve apostles in Luke 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 6, 1, 'What image did Jesus use for someone who hears and does his words in Luke 6?', '["A man building a house on rock", "A shepherd seeking sheep", "A sower planting seed", "A servant waiting at night"]'::jsonb, 'A man building a house on rock', 'Luke 6:47-48 compares such a person to a builder laying a foundation on rock.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'What image did Jesus use for someone who hears and does his words in Luke 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 6, 1, 'What physical condition did the man in the synagogue have in Luke 6?', '["A withered right hand", "Blindness", "Leprosy", "Paralysis"]'::jsonb, 'A withered right hand', 'Luke 6:6 mentions a man whose right hand was withered.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'What physical condition did the man in the synagogue have in Luke 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 6, 1, 'What two kinds of sayings did Jesus pronounce on the level place in Luke 6?', '["Blessings and woes", "Parables and proverbs", "Judgments and visions", "Songs and prayers"]'::jsonb, 'Blessings and woes', 'Luke 6:20-26 contains blessings and corresponding woes.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'What two kinds of sayings did Jesus pronounce on the level place in Luke 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 6, 1, 'Where did Jesus give blessings and woes in Luke 6?', '["On a level place", "On the temple steps", "In a fishing boat", "At Bethany"]'::jsonb, 'On a level place', 'Luke 6:17 says Jesus stood on a level place with his disciples and the crowd.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'Where did Jesus give blessings and woes in Luke 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 6, 2, 'How did Jesus answer the question about doing good on the Sabbath in Luke 6?', '["He asked whether it is lawful to do good or to do harm", "He said healing must wait until Monday", "He told the man to go to the priests first", "He refused to answer publicly"]'::jsonb, 'He asked whether it is lawful to do good or to do harm', 'Luke 6:9 records Jesus asking whether it is lawful to do good or harm on the Sabbath.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'How did Jesus answer the question about doing good on the Sabbath in Luke 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 6, 2, 'How many apostles did Jesus choose in Luke 6?', '["Twelve", "Seven", "Ten", "Seventy"]'::jsonb, 'Twelve', 'Luke 6:13 says Jesus chose twelve apostles.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'How many apostles did Jesus choose in Luke 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 6, 2, 'What did Jesus say about loving enemies in Luke 6?', '["Love your enemies and do good to those who hate you", "Avoid your enemies and remain silent", "Pray only for your friends", "Defeat your enemies before forgiving them"]'::jsonb, 'Love your enemies and do good to those who hate you', 'Luke 6:27 says to love enemies and do good to those who hate you.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say about loving enemies in Luke 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 6, 2, 'What did Jesus say people often notice in another person''s eye in Luke 6?', '["A speck", "A plank first", "A tear", "A veil"]'::jsonb, 'A speck', 'Luke 6:41 asks why someone notices the speck in another''s eye.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say people often notice in another person''s eye in Luke 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 6, 2, 'What did Jesus say should happen when someone strikes you on one cheek in Luke 6?', '["Offer the other also", "Strike back immediately", "Go to court first", "Leave town without speaking"]'::jsonb, 'Offer the other also', 'Luke 6:29 says, ''To him who strikes you on the cheek, offer the other also.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say should happen when someone strikes you on one cheek in Luke 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 6, 3, 'What does Jesus mean by saying a good tree does not bear corrupt fruit in Luke 6?', '["A person''s inner character is revealed by outward words and actions", "Fruit determines whether a tree should be planted", "Only prophets can bear good fruit", "Words matter less than appearances"]'::jsonb, 'A person''s inner character is revealed by outward words and actions', 'Luke 6:43-45 connects the heart with speech and fruit.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Jesus mean by saying a good tree does not bear corrupt fruit in Luke 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 6, 3, 'What is Jesus challenging with his command not to judge in Luke 6?', '["Hypocritical, self-blind condemnation rather than all moral discernment", "Any evaluation of good and evil", "Church discipline in every form", "The ability to recognize fruit"]'::jsonb, 'Hypocritical, self-blind condemnation rather than all moral discernment', 'Luke 6:37-42 warns against hypocritical judgment while still calling for clear sight.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is Jesus challenging with his command not to judge in Luke 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 6, 3, 'What is Jesus teaching in Luke 6 by pairing blessings and woes?', '["God''s kingdom reverses ordinary human evaluations of security and success", "Wealth is always evil in itself", "Poverty alone guarantees righteousness", "Woes apply only to Rome"]'::jsonb, 'God''s kingdom reverses ordinary human evaluations of security and success', 'Luke 6:20-26 contrasts present conditions in light of God''s kingdom reversal.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is Jesus teaching in Luke 6 by pairing blessings and woes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 6, 3, 'Why are the blessings and woes in Luke 6 so important?', '["They reveal the kingdom''s reversal of ordinary values and securities", "They abolish all material concerns entirely", "They apply only to the twelve apostles", "They cancel the need for obedience"]'::jsonb, 'They reveal the kingdom''s reversal of ordinary values and securities', 'Luke 6:20-26 contrasts present poverty, hunger, and exclusion with future kingdom vindication and warns the comfortable.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why are the blessings and woes in Luke 6 so important?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 6, 3, 'Why is Jesus''s choice of the Twelve after a night of prayer significant in Luke 6?', '["It shows the formation of the apostolic community arises from prayerful dependence", "It means Jesus was unsure whom to choose", "It replaces all previous disciples", "It was done to satisfy the crowds"]'::jsonb, 'It shows the formation of the apostolic community arises from prayerful dependence', 'Luke 6:12-13 links Jesus''s all-night prayer to the choosing of the Twelve.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is Jesus''s choice of the Twelve after a night of prayer significant in Luke 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 6, 4, 'How do the Sabbath controversies and the sermon on the level place fit together in Luke 6?', '["Both reveal Jesus''s authority to interpret life under God''s kingdom and expose hardened religion", "The Sabbath section is unrelated to discipleship", "The sermon replaces healing altogether", "Only the crowds, not the leaders, are addressed"]'::jsonb, 'Both reveal Jesus''s authority to interpret life under God''s kingdom and expose hardened religion', 'Luke 6 moves from Sabbath conflict into the formation and teaching of a kingdom people.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do the Sabbath controversies and the sermon on the level place fit together in Luke 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 6, 4, 'How does Luke 6 define mercy?', '["As reflecting the Father''s character in generosity, forgiveness, and non-retaliation", "As avoiding all confrontation with evil", "As rewarding only the deserving", "As an optional practice for advanced disciples"]'::jsonb, 'As reflecting the Father''s character in generosity, forgiveness, and non-retaliation', 'Luke 6:35-36 says to be merciful, even as your Father is merciful.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Luke 6 define mercy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 6, 4, 'What larger picture of discipleship emerges from Luke 6?', '["Kingdom disciples are prayer-formed, enemy-loving, self-aware, fruitful hearers who act on Jesus''s words", "Discipleship is mainly about public signs and wonders", "The key trait is social influence", "Hearing alone is enough without obedience"]'::jsonb, 'Kingdom disciples are prayer-formed, enemy-loving, self-aware, fruitful hearers who act on Jesus''s words', 'Luke 6 joins prayer, apostolic formation, blessings/woes, mercy, and the house on the rock.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger picture of discipleship emerges from Luke 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 6, 4, 'Why does Luke 6 end with the house on the rock and the house without foundation?', '["Hearing Jesus is insufficient without doing what he says", "Storms come only to the wicked", "Obedience matters only for apostles", "Foundations are mainly about temple architecture"]'::jsonb, 'Hearing Jesus is insufficient without doing what he says', 'Luke 6:46-49 contrasts hearing and doing with hearing and not doing.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Luke 6 end with the house on the rock and the house without foundation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 6, 4, 'Why does Luke place the choosing of the Twelve before the sermon material in chapter 6?', '["Jesus forms a community before giving the ethic that will shape it", "The sermon is meant only for priests", "The Twelve replace the crowds as the only hearers", "It shows the sermon happened in private"]'::jsonb, 'Jesus forms a community before giving the ethic that will shape it', 'Luke 6 narratively links prayer, apostolic calling, and kingdom instruction.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Luke place the choosing of the Twelve before the sermon material in chapter 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 6, 5, 'How does Luke 6 connect the Father''s character to human ethics?', '["The call to mercy, love of enemies, and generosity flows from the Father''s own mercy and kindness", "Ethics are detached from theology", "The Father is holy but not merciful", "Only Jesus, not disciples, may imitate the Father"]'::jsonb, 'The call to mercy, love of enemies, and generosity flows from the Father''s own mercy and kindness', 'Luke 6:35-36 grounds kingdom ethics in the Father''s character.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 6 connect the Father''s character to human ethics?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 6, 5, 'How does Luke 6 deepen the meaning of blessedness?', '["Blessedness is tied to life under God''s future reign, not merely present comfort or status", "Blessedness means material wealth only", "Blessedness belongs exclusively to Israel''s rulers", "Blessedness removes the need for repentance"]'::jsonb, 'Blessedness is tied to life under God''s future reign, not merely present comfort or status', 'Luke 6:20-23 redefines blessedness through the kingdom horizon.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 6 deepen the meaning of blessedness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 6, 5, 'How does Luke 6 present true discipleship?', '["It combines prayer, enemy-love, mercy, discernment, and obedient practice", "It is mainly defined by public honor", "It removes all need for moral judgment", "It belongs only to the original Twelve"]'::jsonb, 'It combines prayer, enemy-love, mercy, discernment, and obedient practice', 'Luke 6 moves from Jesus praying all night to choosing the Twelve and teaching a demanding ethic for disciples.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 6 present true discipleship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 6, 5, 'What does Luke 6 suggest about authority in Jesus''s ministry?', '["He authoritatively interprets Sabbath, forms a people, and teaches the life of the kingdom", "His authority depends mainly on Pharisaic approval", "He avoids making ethical claims", "Authority is shown only through miracles, not teaching"]'::jsonb, 'He authoritatively interprets Sabbath, forms a people, and teaches the life of the kingdom', 'Luke 6 presents Jesus acting and teaching with decisive kingdom authority.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Luke 6 suggest about authority in Jesus''s ministry?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 6, 5, 'Why is the rock foundation image an appropriate climax to Luke 6?', '["It shows kingdom teaching demands embodied obedience that can withstand judgment and trial", "It proves words are enough if repeated often", "It concerns architecture more than discipleship", "It means storms never come to believers"]'::jsonb, 'It shows kingdom teaching demands embodied obedience that can withstand judgment and trial', 'Luke 6:46-49 closes with hearing and doing as the true test.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the rock foundation image an appropriate climax to Luke 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 7, 1, 'What amazed Jesus about the centurion in Luke 7?', '["His faith", "His wealth", "His ancestry", "His public prayers"]'::jsonb, 'His faith', 'Luke 7:9 says Jesus marveled at the centurion''s faith.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'What amazed Jesus about the centurion in Luke 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 7, 1, 'What did Jesus say to the dead young man in Luke 7?', '["Young man, I tell you, arise", "Peace, be still", "Your sins are forgiven", "Come out of him"]'::jsonb, 'Young man, I tell you, arise', 'Luke 7:14 records Jesus saying, ''Young man, I tell you, arise.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say to the dead young man in Luke 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 7, 1, 'Where did Jesus raise a widow''s only son in Luke 7?', '["Nain", "Capernaum", "Bethany", "Jericho"]'::jsonb, 'Nain', 'Luke 7:11-15 records the raising of the widow''s son at Nain.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'Where did Jesus raise a widow''s only son in Luke 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 7, 1, 'Who anointed Jesus''s feet with tears in Luke 7?', '["A sinful woman", "Mary Magdalene", "Martha", "Joanna"]'::jsonb, 'A sinful woman', 'Luke 7:37-38 describes a woman known as a sinner washing Jesus''s feet with tears.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who anointed Jesus''s feet with tears in Luke 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 7, 1, 'Whose servant was healed in Luke 7?', '["A centurion''s servant", "A synagogue ruler''s servant", "Levi''s servant", "Herod''s servant"]'::jsonb, 'A centurion''s servant', 'Luke 7:2-10 tells of a centurion''s servant being healed.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'Whose servant was healed in Luke 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 7, 2, 'What answer did Jesus give John''s messengers in Luke 7?', '["Tell John what you have seen and heard: the blind receive sight and the poor have good news preached", "Tell John to come out of prison", "Tell John the kingdom has been delayed", "Tell John Elijah has already returned visibly"]'::jsonb, 'Tell John what you have seen and heard: the blind receive sight and the poor have good news preached', 'Luke 7:22 gives this answer to John''s messengers.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'What answer did Jesus give John''s messengers in Luke 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 7, 2, 'What did Jesus say about John among those born of women in Luke 7?', '["None is greater than John, yet the least in the kingdom is greater than he", "John was the least of the prophets", "John would soon sit on David''s throne", "John had replaced Moses"]'::jsonb, 'None is greater than John, yet the least in the kingdom is greater than he', 'Luke 7:28 gives this striking statement about John.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say about John among those born of women in Luke 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 7, 2, 'What did Jesus tell the forgiven woman at the end of Luke 7?', '["Your faith has saved you; go in peace", "You must now repay your debts", "Keep this miracle secret", "Return later with an offering"]'::jsonb, 'Your faith has saved you; go in peace', 'Luke 7:50 says, ''Your faith has saved you. Go in peace.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus tell the forgiven woman at the end of Luke 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 7, 2, 'Which dead person did Jesus raise in Luke 7?', '["A widow''s only son at Nain", "Jairus''s daughter", "Lazarus of Bethany", "John the Baptist"]'::jsonb, 'A widow''s only son at Nain', 'Luke 7:11-17 records Jesus raising a widow''s son at Nain.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'Which dead person did Jesus raise in Luke 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 7, 2, 'Why did Simon the Pharisee question Jesus in Luke 7?', '["He thought a prophet would know what kind of woman was touching him", "He believed Jesus should not heal Gentiles", "He expected Jesus to bless Rome", "He wanted Jesus to leave his house early"]'::jsonb, 'He thought a prophet would know what kind of woman was touching him', 'Luke 7:39 says Simon questioned Jesus because of the woman touching him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why did Simon the Pharisee question Jesus in Luke 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 7, 3, 'How does Luke 7 answer the question of who Jesus is?', '["Through deeds of healing, resurrection power, prophetic fulfillment, and forgiveness of sins", "Only through genealogy references", "By avoiding public controversy", "Through political alliance with Jerusalem''s leaders"]'::jsonb, 'Through deeds of healing, resurrection power, prophetic fulfillment, and forgiveness of sins', 'Luke 7 presents multiple scenes that reveal Jesus''s identity through word and deed.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Luke 7 answer the question of who Jesus is?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 7, 3, 'What does the raising of the widow''s son reveal about Jesus in Luke 7?', '["He is moved by compassion and has authority even over death", "He performs miracles only when asked by rulers", "He seeks public fame through mourning crowds", "He avoids contact with funeral processions"]'::jsonb, 'He is moved by compassion and has authority even over death', 'Luke 7:13-15 shows Jesus''s compassion and power in raising the widow''s son.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the raising of the widow''s son reveal about Jesus in Luke 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 7, 3, 'Why does the sinful woman''s love matter so much in Luke 7?', '["Her great love flows from receiving great forgiveness", "Her tears earn forgiveness by themselves", "Simon''s hospitality was greater than hers", "Love replaces the need for faith"]'::jsonb, 'Her great love flows from receiving great forgiveness', 'Luke 7:47 ties her love to the forgiveness she has received.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does the sinful woman''s love matter so much in Luke 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 7, 3, 'Why is the centurion''s faith striking in Luke 7?', '["He trusts Jesus''s authority to heal by a word without physical presence", "He insists Jesus must come into his house", "He asks only for a sign from heaven", "He argues with Jesus about the law"]'::jsonb, 'He trusts Jesus''s authority to heal by a word without physical presence', 'Luke 7:6-10 highlights the centurion''s confidence in Jesus''s word.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the centurion''s faith striking in Luke 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 7, 3, 'Why is the centurion''s statement about authority important in Luke 7?', '["It recognizes that Jesus can command healing with a word from a distance", "It proves the centurion understood every prophecy", "It shows Gentiles outrank Israelites in the kingdom", "It means Jesus no longer needed to travel"]'::jsonb, 'It recognizes that Jesus can command healing with a word from a distance', 'Luke 7:7-8 links the centurion''s view of authority with confidence in Jesus''s word.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the centurion''s statement about authority important in Luke 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 7, 4, 'How do the centurion, the widow, John''s disciples, and the sinful woman work together in Luke 7?', '["Each scene shows Jesus meeting different forms of need with authority and mercy", "They are unrelated miracle fragments", "Only John understands Jesus rightly", "The chapter narrows Jesus''s mission to one social class"]'::jsonb, 'Each scene shows Jesus meeting different forms of need with authority and mercy', 'Luke 7 moves across Gentile faith, bereavement, prophetic expectation, and forgiveness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do the centurion, the widow, John''s disciples, and the sinful woman work together in Luke 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 7, 4, 'How does Luke 7 deepen the role of faith?', '["Faith appears as confident trust in Jesus''s word and as personal reception of his saving mercy", "Faith matters only in miracle stories, not forgiveness", "Faith is shown only by public status", "Faith is unnecessary if one has enough love"]'::jsonb, 'Faith appears as confident trust in Jesus''s word and as personal reception of his saving mercy', 'The centurion and the forgiven woman both illustrate faith in distinct but complementary ways.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Luke 7 deepen the role of faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 7, 4, 'What does the sinful woman''s action at the Pharisee''s house reveal in Luke 7?', '["Forgiven love overflows in humble devotion to Jesus", "Public shame disqualifies a person from mercy", "Simon understands Jesus better than she does", "Jesus refuses table fellowship with sinners"]'::jsonb, 'Forgiven love overflows in humble devotion to Jesus', 'Luke 7:36-50 contrasts Simon''s coldness with the woman''s loving response to forgiveness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does the sinful woman''s action at the Pharisee''s house reveal in Luke 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 7, 4, 'What larger picture of the kingdom emerges in Luke 7?', '["The kingdom welcomes surprising faith, comforts the grieving, and offers forgiveness to sinners", "The kingdom is reserved for temple authorities", "The kingdom advances without any controversy", "The kingdom is mainly about ceremonial purity"]'::jsonb, 'The kingdom welcomes surprising faith, comforts the grieving, and offers forgiveness to sinners', 'Luke 7 consistently centers mercy and reversal across social boundaries.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger picture of the kingdom emerges in Luke 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 7, 4, 'Why is Simon''s failure of hospitality important in Luke 7?', '["It exposes a respectable lack of love beside the woman''s overflowing devotion", "It proves meals should be avoided in ministry", "It means Simon was poorer than the woman", "It explains why Jesus left immediately"]'::jsonb, 'It exposes a respectable lack of love beside the woman''s overflowing devotion', 'Luke 7:44-46 contrasts Simon''s omissions with the woman''s actions.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is Simon''s failure of hospitality important in Luke 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 7, 5, 'How does Luke 7 combine power and compassion in Jesus''s ministry?', '["He heals at a distance, raises the dead, answers John''s doubts, and forgives a sinner", "He performs signs but withholds mercy", "He limits help to the socially respected", "He avoids controversial forgiveness claims"]'::jsonb, 'He heals at a distance, raises the dead, answers John''s doubts, and forgives a sinner', 'Luke 7 joins mighty works with tender mercy toward outsiders and the broken.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 7 combine power and compassion in Jesus''s ministry?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 7, 5, 'How does Luke 7 connect prophetic expectation to Jesus''s mission?', '["John''s question is answered by works that fulfill prophetic hopes of restoration and good news", "Jesus rejects all prophetic categories as obsolete", "The chapter delays any answer about messiahship", "Only resurrection proves Jesus''s mission"]'::jsonb, 'John''s question is answered by works that fulfill prophetic hopes of restoration and good news', 'Luke 7:18-23 interprets Jesus''s deeds as the answer to messianic expectation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 7 connect prophetic expectation to Jesus''s mission?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 7, 5, 'How does Luke 7 portray Jesus as both prophet and more than prophet?', '["He raises the dead like a prophet yet also forgives sins and fulfills messianic promises in himself", "He is only another Elijah figure", "He denies any link to prophecy", "His power is limited to moral teaching"]'::jsonb, 'He raises the dead like a prophet yet also forgives sins and fulfills messianic promises in himself', 'Luke 7 invites comparison with prophets while also pushing beyond them in Jesus''s authority.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 7 portray Jesus as both prophet and more than prophet?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 7, 5, 'What does Luke 7 suggest about social respectability and access to grace?', '["Grace often appears most clearly where respectable people least expect it", "Respectable people are always excluded from mercy", "Social status determines forgiveness", "Grace belongs only to outsiders"]'::jsonb, 'Grace often appears most clearly where respectable people least expect it', 'The chapter contrasts Simon''s posture with the woman''s faith and love.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Luke 7 suggest about social respectability and access to grace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 7, 5, 'Why is Jesus''s pronouncement of forgiveness at the table so theologically weighty in Luke 7?', '["It shows Jesus exercising divine authority in a setting of public scandal and personal restoration", "It was merely a polite blessing after dinner", "It means priests no longer mattered at all", "It referred only to social acceptance"]'::jsonb, 'It shows Jesus exercising divine authority in a setting of public scandal and personal restoration', 'Luke 7:48-49 shows the guests asking who this is who even forgives sins.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Jesus''s pronouncement of forgiveness at the table so theologically weighty in Luke 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 8, 1, 'What did Jesus say to the woman healed from bleeding in Luke 8?', '["Your faith has made you well", "Do not tell anyone", "Rise and walk", "Your sins are forgiven"]'::jsonb, 'Your faith has made you well', 'Luke 8:48 says, ''Daughter, your faith has made you well.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say to the woman healed from bleeding in Luke 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 8, 1, 'What kind of seed produced a hundredfold in Luke 8?', '["Seed on good soil", "Seed on rocky ground", "Seed among thorns", "Seed on the path"]'::jsonb, 'Seed on good soil', 'Luke 8:8 says the seed on good ground produced a hundredfold.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'What kind of seed produced a hundredfold in Luke 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 8, 1, 'What kind of soil represents those who hear the word with an honest and good heart in Luke 8?', '["Good soil", "Rocky soil", "Thorny soil", "The path"]'::jsonb, 'Good soil', 'Luke 8:15 says the good soil represents those who hold the word fast and bear fruit with patience.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'What kind of soil represents those who hear the word with an honest and good heart in Luke 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 8, 1, 'What name did the demonized man give when Jesus asked in Luke 8?', '["Legion", "Beelzebul", "Abaddon", "Mammon"]'::jsonb, 'Legion', 'Luke 8:30 says the demons answered, ''Legion.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'What name did the demonized man give when Jesus asked in Luke 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 8, 1, 'Who asked Jesus to come because his daughter was dying in Luke 8?', '["Jairus", "Levi", "A centurion", "Zacchaeus"]'::jsonb, 'Jairus', 'Luke 8:41-42 says Jairus begged Jesus to come because his daughter was dying.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who asked Jesus to come because his daughter was dying in Luke 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 8, 2, 'What did Jesus ask the disciples after calming the storm in Luke 8?', '["Where is your faith?", "Why did you wake me?", "Who touched me?", "Whom do the crowds say I am?"]'::jsonb, 'Where is your faith?', 'Luke 8:25 records Jesus asking, "Where is your faith?"'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus ask the disciples after calming the storm in Luke 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 8, 2, 'What did Jesus command the wind and waves in Luke 8?', '["He rebuked them and they ceased", "He asked the disciples to row harder", "He told them to wait until shore", "He called Elijah for help"]'::jsonb, 'He rebuked them and they ceased', 'Luke 8:24 says Jesus rebuked the wind and the raging of the water, and they ceased.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus command the wind and waves in Luke 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 8, 2, 'What did Jesus tell Jairus after hearing that his daughter had died in Luke 8?', '["Do not fear; only believe", "It is too late now", "Prepare her burial immediately", "Call the priests at once"]'::jsonb, 'Do not fear; only believe', 'Luke 8:50 says, ''Do not fear; only believe, and she will be made well.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus tell Jairus after hearing that his daughter had died in Luke 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 8, 2, 'What happened to the herd of pigs in Luke 8?', '["They rushed down the steep bank into the lake and drowned", "They scattered into the wilderness", "They were driven back to the town", "They remained unharmed in the field"]'::jsonb, 'They rushed down the steep bank into the lake and drowned', 'Luke 8:33 says the herd rushed down the steep bank into the lake and drowned.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'What happened to the herd of pigs in Luke 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 8, 2, 'Why did Jesus say a lamp is not put under a jar in Luke 8?', '["What is hidden is meant to come to light", "Light would go out too quickly", "Only disciples may see light", "The house would burn down"]'::jsonb, 'What is hidden is meant to come to light', 'Luke 8:16-17 uses the lamp image to stress revelation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why did Jesus say a lamp is not put under a jar in Luke 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 8, 3, 'How does Luke 8 define Jesus''s true family?', '["Those who hear the word of God and do it", "Those descended from David physically", "The Twelve alone", "Mary and his brothers only"]'::jsonb, 'Those who hear the word of God and do it', 'Luke 8:21 says Jesus''s mother and brothers are those who hear God''s word and do it.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Luke 8 define Jesus''s true family?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 8, 3, 'How does Luke 8 define belonging to Jesus?', '["Belonging is marked by hearing God''s word and doing it", "Only family ties determine belonging", "The twelve alone count as family", "Miracle recipients automatically become family"]'::jsonb, 'Belonging is marked by hearing God''s word and doing it', 'Luke 8:21 defines Jesus''s true family in terms of hearing and doing God''s word.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Luke 8 define belonging to Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 8, 3, 'What does the Gerasene demoniac''s restoration reveal in Luke 8?', '["Jesus can bring a person from chaos, isolation, and oppression into wholeness and witness", "Demons are stronger in Gentile lands", "The townspeople immediately become disciples", "Only Jews may be healed by Jesus"]'::jsonb, 'Jesus can bring a person from chaos, isolation, and oppression into wholeness and witness', 'Luke 8:26-39 shows the man restored and commissioned to testify.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the Gerasene demoniac''s restoration reveal in Luke 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 8, 3, 'Why does Jesus stress ''Take heed how you hear'' in Luke 8?', '["The way people receive God''s word determines what they truly gain from it", "Hearing is less important than miracles", "Only the crowds need to hear carefully", "The parables were meant to remain completely secret"]'::jsonb, 'The way people receive God''s word determines what they truly gain from it', 'Luke 8:18 ties hearing to spiritual receptivity and response.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Jesus stress ''Take heed how you hear'' in Luke 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 8, 3, 'Why is the interruption of Jairus''s story by the bleeding woman important in Luke 8?', '["It links two desperate situations and highlights faith amid delay", "It shows Jesus lost focus on Jairus entirely", "It proves the crowd mattered more than Jairus''s household", "It means one miracle canceled the other"]'::jsonb, 'It links two desperate situations and highlights faith amid delay', 'Luke 8 weaves the two stories together around fear, faith, and Jesus''s power.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the interruption of Jairus''s story by the bleeding woman important in Luke 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 8, 4, 'How do the parable section and the miracle section of Luke 8 fit together?', '["The chapter moves from hearing the word to trusting the Lord who rules over every threat", "They are unrelated teaching blocks", "The miracles replace the need for hearing", "Only the disciples are addressed in the second half"]'::jsonb, 'The chapter moves from hearing the word to trusting the Lord who rules over every threat', 'Luke 8 unites hearing themes with scenes that demand faith in Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do the parable section and the miracle section of Luke 8 fit together?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 8, 4, 'How does Luke 8 portray faith under pressure?', '["Faith is tested in storms, fear, delay, and public exposure yet finds Jesus sufficient", "Faith only matters when outcomes are immediate", "Pressure always means God''s absence", "The disciples never struggle with faith"]'::jsonb, 'Faith is tested in storms, fear, delay, and public exposure yet finds Jesus sufficient', 'Luke 8 repeatedly places characters in stressful situations where Jesus calls for trust.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Luke 8 portray faith under pressure?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 8, 4, 'What larger picture of Jesus emerges from Luke 8?', '["He is the revealer of God''s word and the Lord over nature, demons, sickness, and death", "He teaches well but lacks authority in crisis", "His miracles are mostly private acts without meaning", "He helps only those with social standing"]'::jsonb, 'He is the revealer of God''s word and the Lord over nature, demons, sickness, and death', 'Luke 8 combines parable interpretation with sweeping authority across multiple spheres.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger picture of Jesus emerges from Luke 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 8, 4, 'Why does the healed demoniac become a witness in his own region in Luke 8?', '["Jesus''s mercy extends outward through transformed lives that testify publicly", "He replaces the Twelve as an apostle", "He is forbidden ever to speak again", "His mission is only to Jerusalem"]'::jsonb, 'Jesus''s mercy extends outward through transformed lives that testify publicly', 'Luke 8:39 sends him to declare what God had done for him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does the healed demoniac become a witness in his own region in Luke 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 8, 4, 'Why is the healing of the bleeding woman significant in Luke 8?', '["Jesus''s power brings restoration even to long-term uncleanness and hidden suffering", "It interrupts the story by accident with no purpose", "Only Jairus''s status matters in the chapter", "The woman is healed before she touches Jesus"]'::jsonb, 'Jesus''s power brings restoration even to long-term uncleanness and hidden suffering', 'Luke 8:43-48 highlights healing, faith, and public restoration for the woman.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is the healing of the bleeding woman significant in Luke 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 8, 5, 'How does Luke 8 deepen the meaning of revelation?', '["The hidden word of the kingdom is disclosed in Jesus''s teaching and embodied in his mighty acts", "Revelation belongs only to miracles and not to teaching", "Nothing hidden ever becomes clear in the chapter", "Only the Gerasene region receives revelation"]'::jsonb, 'The hidden word of the kingdom is disclosed in Jesus''s teaching and embodied in his mighty acts', 'The lamp saying and the miracles together show revelation in word and deed.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 8 deepen the meaning of revelation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 8, 5, 'How does Luke 8 join the themes of hearing, faith, and life?', '["Right hearing produces persevering faith, and faith clings to Jesus as the giver of true life", "Hearing replaces faith entirely", "Life comes only through lineage, not response", "The chapter treats death as final and unresolved"]'::jsonb, 'Right hearing produces persevering faith, and faith clings to Jesus as the giver of true life', 'From the sower to Jairus''s daughter, Luke 8 links receptivity to the word with life-giving trust in Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 8 join the themes of hearing, faith, and life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 8, 5, 'How does Luke 8 present hearing and faith across its stories?', '["The chapter moves from hearing the word rightly to trusting Jesus over chaos, demons, sickness, and death", "Only parables matter while miracles are unrelated", "Faith belongs to crowds but not disciples", "Hearing without action is praised"]'::jsonb, 'The chapter moves from hearing the word rightly to trusting Jesus over chaos, demons, sickness, and death', 'Luke 8 links the sower and hearing themes with miracles that call for faith.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 8 present hearing and faith across its stories?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 8, 5, 'What does Luke 8 suggest about the mission of restored people?', '["Those delivered by Jesus are meant to become tellers of what God has done", "Restoration should remain private whenever possible", "Only the Twelve can witness publicly", "Healing matters more than testimony"]'::jsonb, 'Those delivered by Jesus are meant to become tellers of what God has done', 'The demoniac''s commission in Luke 8 models witness born of restoration.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Luke 8 suggest about the mission of restored people?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 8, 5, 'Why is the question ''Who then is this?'' effectively answered in Luke 8?', '["Because the chapter shows Jesus doing what only one with divine authority could do", "Because the disciples identify him only as a prophet", "Because the crowd crowns him king immediately", "Because the storm scene stands alone without interpretation"]'::jsonb, 'Because the chapter shows Jesus doing what only one with divine authority could do', 'Luke 8''s sequence answers the question raised after the storm through escalating demonstrations of authority.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the question ''Who then is this?'' effectively answered in Luke 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 9, 1, 'What city did not receive Jesus because his face was set toward Jerusalem in Luke 9?', '["A Samaritan village", "Nazareth", "Bethlehem", "Jericho"]'::jsonb, 'A Samaritan village', 'Luke 9:52-53 says a Samaritan village did not receive him because he was going to Jerusalem.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'What city did not receive Jesus because his face was set toward Jerusalem in Luke 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 9, 1, 'What confession did Peter make about Jesus in Luke 9?', '["The Christ of God", "A great prophet only", "The Son of David", "John risen from the dead"]'::jsonb, 'The Christ of God', 'Luke 9:20 records Peter saying Jesus is "the Christ of God."'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'What confession did Peter make about Jesus in Luke 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 9, 1, 'What did Jesus tell the Twelve to take for their journey in Luke 9?', '["Nothing", "Extra money and food", "Only a staff and a sword", "Animals for the road"]'::jsonb, 'Nothing', 'Luke 9:3 says Jesus told them to take nothing for their journey.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus tell the Twelve to take for their journey in Luke 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 9, 1, 'What did the Father''s voice say at the transfiguration in Luke 9?', '["This is my Son, my Chosen One; listen to him", "This is Elijah returned; follow him", "The kingdom has now fully come", "Go tell this vision to everyone now"]'::jsonb, 'This is my Son, my Chosen One; listen to him', 'Luke 9:35 records the voice from the cloud.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the Father''s voice say at the transfiguration in Luke 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 9, 1, 'What was left over after the five thousand were fed in Luke 9?', '["Twelve baskets of broken pieces", "Seven baskets", "One basket", "No leftovers"]'::jsonb, 'Twelve baskets of broken pieces', 'Luke 9:17 says twelve baskets of broken pieces were taken up.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'What was left over after the five thousand were fed in Luke 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 9, 2, 'What did Jesus say about a person who puts his hand to the plow and looks back in Luke 9?', '["He is not fit for the kingdom of God", "He should return home first", "He will lead Israel later", "He must wait for a better time"]'::jsonb, 'He is not fit for the kingdom of God', 'Luke 9:62 gives that saying about discipleship.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say about a person who puts his hand to the plow and looks back in Luke 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 9, 2, 'What did Jesus say disciples must take up in Luke 9?', '["Their cross daily", "A lamp for the road", "Their inheritance", "The sword of judgment"]'::jsonb, 'Their cross daily', 'Luke 9:23 says disciples must take up their cross daily.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say disciples must take up in Luke 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 9, 2, 'What did Jesus say when the disciples wanted to stop someone casting out demons in his name in Luke 9?', '["Do not stop him, for the one not against you is for you", "Bring him to me for judgment", "He must join the Twelve first", "Such power is forbidden outside Galilee"]'::jsonb, 'Do not stop him, for the one not against you is for you', 'Luke 9:50 gives Jesus''s answer.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say when the disciples wanted to stop someone casting out demons in his name in Luke 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 9, 2, 'What question did Jesus ask the disciples before Peter''s confession in Luke 9?', '["Who do you say that I am?", "Why are you afraid?", "Whom should I send?", "Do you understand this parable?"]'::jsonb, 'Who do you say that I am?', 'Luke 9:20 records Jesus asking, ''But who do you say that I am?'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'What question did Jesus ask the disciples before Peter''s confession in Luke 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 9, 2, 'Who appeared with Jesus at the transfiguration in Luke 9?', '["Moses and Elijah", "Abraham and Samuel", "David and Isaiah", "Peter and James"]'::jsonb, 'Moses and Elijah', 'Luke 9:30-31 says Moses and Elijah appeared speaking with Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'Who appeared with Jesus at the transfiguration in Luke 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 9, 3, 'What does Jesus teach about greatness by using a child in Luke 9?', '["True greatness receives the lowly in Jesus''s name", "Children are symbols only of weakness, not welcome", "Greatness is measured by visibility before crowds", "Only leaders may receive children"]'::jsonb, 'True greatness receives the lowly in Jesus''s name', 'Luke 9:46-48 connects receiving a child with receiving Jesus and the One who sent him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Jesus teach about greatness by using a child in Luke 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 9, 3, 'What is the significance of Moses and Elijah appearing with Jesus in Luke 9?', '["Jesus stands at the center of Israel''s law and prophets as he moves toward his exodus in Jerusalem", "They replace Jesus as the main speakers", "They prove the kingdom has no suffering ahead", "They tell the disciples to remain on the mountain"]'::jsonb, 'Jesus stands at the center of Israel''s law and prophets as he moves toward his exodus in Jerusalem', 'Luke 9:30-31 says they spoke of Jesus''s departure, which he was about to accomplish at Jerusalem.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the significance of Moses and Elijah appearing with Jesus in Luke 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 9, 3, 'Why is Herod''s question about Jesus significant in Luke 9?', '["It shows Jesus''s identity is becoming publicly pressing even to political rulers", "It proves Herod has become a disciple", "It answers Peter''s confession ahead of time", "It shifts the chapter away from mission"]'::jsonb, 'It shows Jesus''s identity is becoming publicly pressing even to political rulers', 'Luke 9:7-9 shows Herod perplexed about who Jesus is.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is Herod''s question about Jesus significant in Luke 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 9, 3, 'Why is the disciples'' failure with the demonized boy important in Luke 9?', '["It exposes their weakness and the need for dependence even after being sent with authority", "It means Jesus had revoked their calling", "It proves the father lacked all faith", "It ends their participation in ministry"]'::jsonb, 'It exposes their weakness and the need for dependence even after being sent with authority', 'Luke 9:37-43 contrasts Jesus''s authority with the disciples'' inability.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the disciples'' failure with the demonized boy important in Luke 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 9, 3, 'Why is the feeding of the five thousand important in Luke 9?', '["It shows Jesus''s sufficiency for the crowd and foreshadows deeper recognition of his identity", "It proves the disciples no longer need his help", "It mainly answers Herod''s questions", "It ends public ministry in Galilee"]'::jsonb, 'It shows Jesus''s sufficiency for the crowd and foreshadows deeper recognition of his identity', 'Luke 9:10-17 shows Jesus providing abundantly before Peter''s confession.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the feeding of the five thousand important in Luke 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 9, 4, 'How do mission, confession, transfiguration, and the journey to Jerusalem fit together in Luke 9?', '["The chapter moves from delegated ministry to clearer revelation of Jesus and then toward the path of suffering", "Each section stands alone without narrative progression", "The transfiguration interrupts the main story by accident", "Jerusalem appears only as a minor destination"]'::jsonb, 'The chapter moves from delegated ministry to clearer revelation of Jesus and then toward the path of suffering', 'Luke 9 is a major hinge chapter that sharpens Jesus''s identity and direction.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do mission, confession, transfiguration, and the journey to Jerusalem fit together in Luke 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 9, 4, 'How does Luke 9 portray discipleship under the shadow of the cross?', '["It is costly, urgent, and incompatible with divided allegiance", "It remains mainly about miracle participation", "It can wait until family obligations are complete", "It is reserved for the Twelve only"]'::jsonb, 'It is costly, urgent, and incompatible with divided allegiance', 'The closing sayings in Luke 9 stress costly and undivided following.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Luke 9 portray discipleship under the shadow of the cross?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 9, 4, 'What does Jesus teach about discipleship after predicting his suffering in Luke 9?', '["Followers must deny themselves, take up the cross daily, and follow him", "Only the Twelve must suffer", "Discipleship is mainly private belief", "Kingdom glory removes all cost"]'::jsonb, 'Followers must deny themselves, take up the cross daily, and follow him', 'Luke 9:23 gives the daily cross-bearing call.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Jesus teach about discipleship after predicting his suffering in Luke 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 9, 4, 'What is the significance of Jesus setting his face toward Jerusalem in Luke 9?', '["It marks a decisive, deliberate turn toward the mission that awaits him there", "It shows he is unsure where to go next", "It means Galilee no longer matters at all", "It signals immediate entry into the city that same day"]'::jsonb, 'It marks a decisive, deliberate turn toward the mission that awaits him there', 'Luke 9:51 uses strong language to show Jesus''s resolute direction toward Jerusalem.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'What is the significance of Jesus setting his face toward Jerusalem in Luke 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 9, 4, 'Why is Jesus''s prediction of suffering crucial immediately after Peter''s confession in Luke 9?', '["It corrects triumphal expectations by defining the Christ through rejection and resurrection", "It means Peter''s confession was mistaken", "It delays discipleship until after Easter only", "It is meant only for Herod, not the disciples"]'::jsonb, 'It corrects triumphal expectations by defining the Christ through rejection and resurrection', 'Luke 9:20-22 ties messianic identity directly to suffering.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is Jesus''s prediction of suffering crucial immediately after Peter''s confession in Luke 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 9, 5, 'How does Luke 9 deepen the meaning of glory?', '["Glory is revealed on the mountain but interpreted through the coming suffering in Jerusalem", "Glory eliminates the need for suffering", "Glory belongs only to Elijah and Moses", "Glory is hidden from the disciples completely"]'::jsonb, 'Glory is revealed on the mountain but interpreted through the coming suffering in Jerusalem', 'Luke 9 links transfiguration glory with Jesus''s ''departure'' to be accomplished at Jerusalem.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 9 deepen the meaning of glory?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 9, 5, 'How does Luke 9 function as a hinge in the Gospel?', '["It gathers identity, mission, suffering, glory, and discipleship into the turning point toward Jerusalem", "It simply repeats earlier miracle stories without development", "It ends the question of who Jesus is with no further tension", "It removes Jerusalem from Luke''s storyline"]'::jsonb, 'It gathers identity, mission, suffering, glory, and discipleship into the turning point toward Jerusalem', 'Luke 9 is one of the Gospel''s major transition chapters.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 9 function as a hinge in the Gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 9, 5, 'How does Luke 9 turn the Gospel toward Jerusalem?', '["Recognition of Jesus leads directly into suffering, costly discipleship, and a resolute journey ahead", "Peter''s confession ends all misunderstanding", "The transfiguration cancels the cross", "The Samaritans welcome Jesus without resistance"]'::jsonb, 'Recognition of Jesus leads directly into suffering, costly discipleship, and a resolute journey ahead', 'Luke 9 ties confession and glory to suffering and then moves toward the journey section.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 9 turn the Gospel toward Jerusalem?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 9, 5, 'What does Luke 9 suggest about power and dependence in ministry?', '["Delegated power must still be exercised in humility, faith, and reliance on Jesus", "Once sent, the disciples no longer need Jesus''s presence", "Power proves greatness among disciples", "The mission succeeds mainly through political recognition"]'::jsonb, 'Delegated power must still be exercised in humility, faith, and reliance on Jesus', 'The mission of the Twelve and the failed exorcism together show dependence remains essential.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Luke 9 suggest about power and dependence in ministry?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 9, 5, 'Why is the language of exodus or departure in the transfiguration scene so important in Luke 9?', '["It frames Jesus''s death and resurrection as the climactic saving act toward which Scripture points", "It means Jesus will leave Israel permanently with no return", "It refers only to the disciples leaving Galilee", "It denies any link between Jesus and Moses"]'::jsonb, 'It frames Jesus''s death and resurrection as the climactic saving act toward which Scripture points', 'Luke 9:31 says Moses and Elijah spoke of Jesus''s departure in Jerusalem.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the language of exodus or departure in the transfiguration scene so important in Luke 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 10, 1, 'How did Jesus describe the workers he sent out in Luke 10?', '["As lambs in the midst of wolves", "As kings over the cities", "As scribes of the temple", "As shepherds with flocks"]'::jsonb, 'As lambs in the midst of wolves', 'Luke 10:3 says, ''I send you out as lambs among wolves.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'How did Jesus describe the workers he sent out in Luke 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 10, 1, 'How many others did Jesus appoint and send out in Luke 10?', '["Seventy", "Twelve", "Seven", "One hundred twenty"]'::jsonb, 'Seventy', 'Luke 10:1 says Jesus appointed seventy others and sent them ahead.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'How many others did Jesus appoint and send out in Luke 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 10, 1, 'What did the Samaritan do for the wounded man in Luke 10?', '["He bandaged him, took him to an inn, and cared for him", "He reported the attack to the priest", "He passed by after praying", "He brought him to Jerusalem''s rulers"]'::jsonb, 'He bandaged him, took him to an inn, and cared for him', 'Luke 10:34 says the Samaritan treated his wounds and brought him to an inn.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the Samaritan do for the wounded man in Luke 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 10, 1, 'What happened when the seventy returned in Luke 10?', '["They came back with joy that demons submitted to them", "They were rejected by every town", "They returned silently to Jerusalem", "They asked to be released from the mission"]'::jsonb, 'They came back with joy that demons submitted to them', 'Luke 10:17 says the seventy returned with joy.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'What happened when the seventy returned in Luke 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 10, 1, 'What were the seventy to say when entering a house in Luke 10?', '["Peace to this house", "Repent, for judgment is near", "Prepare a meal for us", "The kingdom has not yet come"]'::jsonb, 'Peace to this house', 'Luke 10:5 instructs them to say, ''Peace be to this house.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'What were the seventy to say when entering a house in Luke 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 10, 2, 'How did Jesus answer the lawyer''s question, ''Who is my neighbor?'' in Luke 10?', '["By telling the parable of the Good Samaritan", "By quoting only the Ten Commandments", "By directing him to the priests", "By saying every Israelite is automatically your neighbor"]'::jsonb, 'By telling the parable of the Good Samaritan', 'Luke 10:29-37 answers the question through the Good Samaritan parable.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'How did Jesus answer the lawyer''s question, ''Who is my neighbor?'' in Luke 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 10, 2, 'What did Jesus say Mary had chosen in Luke 10?', '["The good portion", "The path of sacrifice", "A prophet''s reward", "The higher seat at table"]'::jsonb, 'The good portion', 'Luke 10:42 says Mary chose the good portion that would not be taken away.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say Mary had chosen in Luke 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 10, 2, 'What did Jesus say the harvest was in Luke 10?', '["Plentiful", "Small and delayed", "Already completed", "Only for Israel''s rulers"]'::jsonb, 'Plentiful', 'Luke 10:2 says, ''The harvest is plentiful, but the laborers are few.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say the harvest was in Luke 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 10, 2, 'What did Jesus tell the seventy not to rejoice in primarily in Luke 10?', '["That spirits were subject to them", "That the sick were healed", "That they found lodging", "That crowds listened"]'::jsonb, 'That spirits were subject to them', 'Luke 10:20 says not to rejoice chiefly that spirits submit, but that their names are written in heaven.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus tell the seventy not to rejoice in primarily in Luke 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 10, 2, 'Who proved to be a neighbor in the parable of the Good Samaritan?', '["The one who showed mercy", "The priest", "The Levite", "The injured man"]'::jsonb, 'The one who showed mercy', 'Luke 10:36-37 identifies the merciful Samaritan as the true neighbor.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'Who proved to be a neighbor in the parable of the Good Samaritan?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 10, 3, 'What does Jesus''s rejoicing in the Holy Spirit reveal in Luke 10?', '["God delights to reveal kingdom truth to the humble rather than the self-assured wise", "Only children can receive revelation in any sense", "The disciples now understand everything fully", "Wisdom is excluded from God''s purposes"]'::jsonb, 'God delights to reveal kingdom truth to the humble rather than the self-assured wise', 'Luke 10:21 highlights the Father''s revelation to babes rather than the wise and understanding.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Jesus''s rejoicing in the Holy Spirit reveal in Luke 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 10, 3, 'What does Luke 10 teach about mission through the sending of the seventy?', '["Kingdom mission depends on prayer, peace, urgency, and trust rather than self-provision", "Mission succeeds only through visible power", "Cities are judged only after miracles fail", "Only the Twelve may represent Jesus"]'::jsonb, 'Kingdom mission depends on prayer, peace, urgency, and trust rather than self-provision', 'Luke 10:1-16 outlines a dependent and urgent mission pattern.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Luke 10 teach about mission through the sending of the seventy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 10, 3, 'What is Jesus teaching through the mission of the seventy in Luke 10?', '["The kingdom advances through dependent, peace-bearing witnesses", "The disciples should rely on wealth and planning first", "Judgment no longer matters for rejecting cities", "Mission belongs only to Jerusalem"]'::jsonb, 'The kingdom advances through dependent, peace-bearing witnesses', 'Luke 10:1-16 sends the seventy out with urgency, dependence, and a kingdom message.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is Jesus teaching through the mission of the seventy in Luke 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 10, 3, 'Why is Martha''s distraction contrasted with Mary''s listening in Luke 10?', '["Luke highlights the priority of attentive discipleship over anxious busyness", "Service is condemned as worthless", "Martha is excluded from Jesus''s followers", "Mary refuses all practical care"]'::jsonb, 'Luke highlights the priority of attentive discipleship over anxious busyness', 'Luke 10:38-42 contrasts Martha''s distraction with Mary''s sitting at Jesus''s feet.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is Martha''s distraction contrasted with Mary''s listening in Luke 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 10, 3, 'Why is the Samaritan in Jesus''s parable so significant in Luke 10?', '["He becomes the surprising model of neighbor-love over against expected religious respectability", "He proves priests are always wicked", "He represents Rome''s political power", "He replaces Israel in every sense"]'::jsonb, 'He becomes the surprising model of neighbor-love over against expected religious respectability', 'Luke 10:30-37 overturns expectations by making the Samaritan the merciful one.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the Samaritan in Jesus''s parable so significant in Luke 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 10, 4, 'How do the mission of the seventy and the Good Samaritan belong together in Luke 10?', '["Both show kingdom life moving outward in mercy toward others", "One is about preaching and the other cancels preaching", "They are unrelated examples from different traditions", "The Samaritan story limits mission to roadside care"]'::jsonb, 'Both show kingdom life moving outward in mercy toward others', 'Luke 10 joins proclamation of peace with neighbor-love enacted in mercy.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do the mission of the seventy and the Good Samaritan belong together in Luke 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 10, 4, 'What larger picture of discipleship emerges in Luke 10?', '["Disciples pray for laborers, serve in mission, love neighbors concretely, and sit to hear Jesus", "Discipleship is mainly about private devotion without action", "Mercy matters more than truth, so teaching is secondary", "Mission belongs only to experts"]'::jsonb, 'Disciples pray for laborers, serve in mission, love neighbors concretely, and sit to hear Jesus', 'Luke 10 combines mission, mercy, and attentive discipleship into one vision.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger picture of discipleship emerges in Luke 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 10, 4, 'Why does Luke place Mary and Martha after the Good Samaritan?', '["The chapter holds together active mercy and receptive discipleship as complementary, not competing, responses to Jesus", "Martha replaces the priest and Levite in a hidden allegory", "Mary is meant to reject all hospitality", "The order is accidental and without meaning"]'::jsonb, 'The chapter holds together active mercy and receptive discipleship as complementary, not competing, responses to Jesus', 'Luke 10 presents both doing mercy and listening to Jesus as essential kingdom postures.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Luke place Mary and Martha after the Good Samaritan?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 10, 4, 'Why is Jesus''s statement about names written in heaven important in Luke 10?', '["It reorients joy away from power toward belonging to God and final salvation", "It means miracles should cease immediately", "It limits assurance to the seventy alone", "It replaces kingdom preaching with inward feeling"]'::jsonb, 'It reorients joy away from power toward belonging to God and final salvation', 'Luke 10:20 gives a deeper ground for joy than spiritual power.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is Jesus''s statement about names written in heaven important in Luke 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 10, 4, 'Why is Mary commended over Martha in Luke 10?', '["She chooses attentive discipleship at Jesus''s feet over anxious distraction", "Service has no value in God''s kingdom", "Martha is excluded from discipleship", "Hospitality is condemned altogether"]'::jsonb, 'She chooses attentive discipleship at Jesus''s feet over anxious distraction', 'Luke 10:41-42 contrasts Martha''s anxiety with Mary''s chosen portion.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is Mary commended over Martha in Luke 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 10, 5, 'How does Luke 10 connect revelation and response?', '["Those to whom the Father reveals the Son are called into both joyful mission and obedient love", "Revelation removes the need for practical compassion", "Response is limited to intellectual agreement", "Only private prayer matters after revelation"]'::jsonb, 'Those to whom the Father reveals the Son are called into both joyful mission and obedient love', 'Luke 10 joins revelation from the Father with mission and neighbor-love.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 10 connect revelation and response?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 10, 5, 'How does Luke 10 join mission, mercy, and discipleship?', '["Jesus sends kingdom workers, defines neighbor-love through mercy, and commends attentive hearing of his word", "Only public preaching matters, not mercy", "The Good Samaritan replaces faith in God", "Mary and Martha are unrelated to the rest of the chapter"]'::jsonb, 'Jesus sends kingdom workers, defines neighbor-love through mercy, and commends attentive hearing of his word', 'Luke 10 moves from mission to the Good Samaritan to Mary and Martha as complementary pictures of kingdom life.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 10 join mission, mercy, and discipleship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 10, 5, 'How does Luke 10 portray the kingdom of God?', '["As a reality advancing through witness, mercy, revelation, and fellowship with Jesus", "As purely future with no present effects", "As identical with political restoration", "As inaccessible to outsiders"]'::jsonb, 'As a reality advancing through witness, mercy, revelation, and fellowship with Jesus', 'Luke 10 shows the kingdom in mission, compassion, divine revelation, and discipleship.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 10 portray the kingdom of God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 10, 5, 'What is the theological force of Jesus making a Samaritan the hero in Luke 10?', '["Love of neighbor is defined by mercy, not ethnic or religious boundary markers", "Samaritans replace all other peoples in God''s plan", "The lawyer''s question is answered only politically", "The law is rejected rather than fulfilled"]'::jsonb, 'Love of neighbor is defined by mercy, not ethnic or religious boundary markers', 'The Good Samaritan redefines neighborliness around mercy shown to the needy.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the theological force of Jesus making a Samaritan the hero in Luke 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 10, 5, 'Why is the final scene with Mary and Martha such an effective close to Luke 10?', '["It ends the chapter by anchoring all action in personal attention to Jesus''s word", "It dismisses the importance of hospitality and service entirely", "It introduces an unrelated household conflict only", "It proves women could not be disciples"]'::jsonb, 'It ends the chapter by anchoring all action in personal attention to Jesus''s word', 'Luke 10 closes by centering the one thing necessary: hearing Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the final scene with Mary and Martha such an effective close to Luke 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 11, 1, 'What accusation was made against Jesus after he cast out a demon in Luke 11?', '["That he cast out demons by Beelzebul", "That he broke the Sabbath", "That he blasphemed Moses", "That he sought Herod''s throne"]'::jsonb, 'That he cast out demons by Beelzebul', 'Luke 11:15 records the accusation that Jesus cast out demons by Beelzebul.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'What accusation was made against Jesus after he cast out a demon in Luke 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 11, 1, 'What did Jesus say the Father gives to those who ask in Luke 11?', '["The Holy Spirit", "Riches and honor", "A kingdom throne", "Immediate freedom from all suffering"]'::jsonb, 'The Holy Spirit', 'Luke 11:13 says the Father gives the Holy Spirit to those who ask him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say the Father gives to those who ask in Luke 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 11, 1, 'What did Jesus teach when the disciples asked him to pray in Luke 11?', '["The Lord''s Prayer", "The Beatitudes", "The Shema", "A psalm of David"]'::jsonb, 'The Lord''s Prayer', 'Luke 11:1-4 records Jesus teaching them how to pray.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus teach when the disciples asked him to pray in Luke 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 11, 1, 'What example did Jesus use to teach persistence in prayer in Luke 11?', '["A friend asking for bread at midnight", "A widow before an unjust judge", "A builder counting cost", "A shepherd seeking sheep"]'::jsonb, 'A friend asking for bread at midnight', 'Luke 11:5-8 uses the example of a friend asking for bread at midnight.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'What example did Jesus use to teach persistence in prayer in Luke 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 11, 1, 'What queen did Jesus mention in Luke 11 as rising in judgment?', '["The queen of the South", "Queen Esther", "The queen of Sheba''s daughter", "Cleopatra"]'::jsonb, 'The queen of the South', 'Luke 11:31 mentions the queen of the South.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'What queen did Jesus mention in Luke 11 as rising in judgment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 11, 2, 'How did Jesus describe the eye in Luke 11?', '["As the lamp of the body", "As the window of the soul", "As the measure of wisdom", "As the mirror of the heart"]'::jsonb, 'As the lamp of the body', 'Luke 11:34 says the eye is the lamp of the body.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'How did Jesus describe the eye in Luke 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 11, 2, 'What burden did Jesus say the lawyers placed on people in Luke 11?', '["Loads hard to bear", "Unclean food laws only", "Roman taxes", "Military service"]'::jsonb, 'Loads hard to bear', 'Luke 11:46 says they load men with burdens hard to bear.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'What burden did Jesus say the lawyers placed on people in Luke 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 11, 2, 'What did Jesus say had come upon them if he cast out demons by the finger of God in Luke 11?', '["The kingdom of God", "The day of vengeance", "The glory of Solomon", "The sign of Elijah"]'::jsonb, 'The kingdom of God', 'Luke 11:20 says the kingdom of God had come upon them.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say had come upon them if he cast out demons by the finger of God in Luke 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 11, 2, 'What key did Jesus say the lawyers had taken away in Luke 11?', '["The key of knowledge", "The key of David", "The key of the temple", "The key of life"]'::jsonb, 'The key of knowledge', 'Luke 11:52 says they took away the key of knowledge.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'What key did Jesus say the lawyers had taken away in Luke 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 11, 2, 'What sign did Jesus say would be given to that generation in Luke 11?', '["The sign of Jonah", "A sign from the temple veil", "Fire from heaven", "A new census"]'::jsonb, 'The sign of Jonah', 'Luke 11:29-30 says no sign will be given except the sign of Jonah.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'What sign did Jesus say would be given to that generation in Luke 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 11, 3, 'What does Jesus mean by saying God''s kingdom has come upon them in Luke 11?', '["His defeat of demonic power shows God''s reign breaking in", "The Romans have been overthrown already", "Prayer has replaced obedience", "Jerusalem''s leaders have repented"]'::jsonb, 'His defeat of demonic power shows God''s reign breaking in', 'Luke 11:20 connects exorcism with the arrival of God''s kingdom.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Jesus mean by saying God''s kingdom has come upon them in Luke 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 11, 3, 'What does the strong man image reveal in Luke 11?', '["Jesus''s power over demons shows a stronger one has come to overcome Satan''s hold", "The devil remains unchallenged by Jesus", "The image is only about political revolution", "Prayer alone, without Jesus, binds the strong man"]'::jsonb, 'Jesus''s power over demons shows a stronger one has come to overcome Satan''s hold', 'Luke 11:21-22 explains Jesus''s exorcisms as the work of the stronger one.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the strong man image reveal in Luke 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 11, 3, 'What is the main problem Jesus exposes in the Pharisees in Luke 11?', '["They cultivate outward religious appearance while remaining inwardly full of greed and wickedness", "They care too much for Gentiles", "They refuse to keep any traditions at all", "They are too open about their sins"]'::jsonb, 'They cultivate outward religious appearance while remaining inwardly full of greed and wickedness', 'Luke 11:39 contrasts outward cleansing with inward corruption.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the main problem Jesus exposes in the Pharisees in Luke 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 11, 3, 'Why does Jesus call Jonah a sign in Luke 11?', '["Jonah''s ministry of warning and repentance points beyond itself to Jesus''s own significance", "Jesus means only a sea miracle will convince the crowds", "Nineveh is being condemned for repenting too soon", "Jonah replaces the Scriptures"]'::jsonb, 'Jonah''s ministry of warning and repentance points beyond itself to Jesus''s own significance', 'Luke 11:29-32 connects Jonah with Jesus and the response of repentance.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Jesus call Jonah a sign in Luke 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 11, 3, 'Why is Jesus''s teaching on ask, seek, and knock important in Luke 11?', '["It portrays prayer as persistent trust in the Father''s goodness", "It guarantees instant answers to every request", "It limits prayer to leaders", "It replaces repentance with persistence alone"]'::jsonb, 'It portrays prayer as persistent trust in the Father''s goodness', 'Luke 11:9-13 grounds prayer in the Father''s generosity.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is Jesus''s teaching on ask, seek, and knock important in Luke 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 11, 4, 'How do prayer and exorcism belong together in Luke 11?', '["The Father''s generous response to prayer is matched by the kingdom''s active defeat of evil powers", "Prayer replaces spiritual conflict entirely", "Exorcism makes prayer unnecessary", "They are separate topics placed side by side accidentally"]'::jsonb, 'The Father''s generous response to prayer is matched by the kingdom''s active defeat of evil powers', 'Luke 11 links asking the Father with the kingdom''s arrival in Jesus''s works.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do prayer and exorcism belong together in Luke 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 11, 4, 'How does Luke 11 intensify the conflict around Jesus?', '["The chapter moves from teaching and deliverance into escalating opposition from religious leaders", "Conflict subsides after the Lord''s Prayer", "Only the crowds misunderstand Jesus now", "The lawyers and Pharisees leave convinced"]'::jsonb, 'The chapter moves from teaching and deliverance into escalating opposition from religious leaders', 'Luke 11 ends with the leaders beginning to press him hard and provoke him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Luke 11 intensify the conflict around Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 11, 4, 'What larger vision of blessedness does Luke 11 present?', '["True blessedness lies in hearing and keeping God''s word, not in external prestige", "Blessedness belongs chiefly to biological connection with Jesus", "Blessedness is measured by miraculous signs", "Blessedness is found in public honor"]'::jsonb, 'True blessedness lies in hearing and keeping God''s word, not in external prestige', 'Luke 11:27-28 redirects blessing to those who hear and keep God''s word.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger vision of blessedness does Luke 11 present?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 11, 4, 'Why do the woes against Pharisees and lawyers matter so much in Luke 11?', '["They expose how false religion can resist God''s kingdom while burdening others", "They show that all teaching authority is illegitimate", "They mean the law itself is the problem", "They end Jesus''s engagement with Israel"]'::jsonb, 'They expose how false religion can resist God''s kingdom while burdening others', 'Luke 11:37-52 reveals hypocrisy, misplaced priorities, and obstructed access to truth.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why do the woes against Pharisees and lawyers matter so much in Luke 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 11, 4, 'Why does Jesus pronounce woes on Pharisees and lawyers in Luke 11?', '["They neglect justice and love while burdening others and blocking knowledge", "They pray too often in public", "They welcome sinners too freely", "They have too little influence in Jerusalem"]'::jsonb, 'They neglect justice and love while burdening others and blocking knowledge', 'Luke 11:39-52 rebukes greed, hypocrisy, and obstructing access to God''s truth.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Jesus pronounce woes on Pharisees and lawyers in Luke 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 11, 5, 'How does Luke 11 join intimacy with God and confrontation with evil?', '["Those taught to pray to the Father see the kingdom break in against darkness through Jesus", "Prayer belongs to private life only and not public mission", "Evil is addressed only by ritual, not by Jesus''s authority", "The Father is absent from the chapter''s conflict scenes"]'::jsonb, 'Those taught to pray to the Father see the kingdom break in against darkness through Jesus', 'Luke 11 moves from ''Father'' language in prayer to the finger of God in exorcism and searching critique.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 11 join intimacy with God and confrontation with evil?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 11, 5, 'How does Luke 11 link prayer, spiritual conflict, and hypocrisy?', '["Jesus teaches dependence on the Father while exposing evil powers and false religion", "Prayer protects people from ever facing opposition", "The chapter is only about table manners", "Spiritual conflict is separated from moral life"]'::jsonb, 'Jesus teaches dependence on the Father while exposing evil powers and false religion', 'Luke 11 moves from prayer to exorcism to the searching woes against religious hypocrisy.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 11 link prayer, spiritual conflict, and hypocrisy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 11, 5, 'How does Luke 11 portray the kingdom of God?', '["It is present in Jesus''s authority over evil and demands a wholehearted response", "It remains entirely future and unseen", "It belongs only to those who ask for signs", "It advances mainly through ceremonial purity"]'::jsonb, 'It is present in Jesus''s authority over evil and demands a wholehearted response', 'Luke 11:20 and the surrounding teaching present the kingdom as actively present in Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 11 portray the kingdom of God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 11, 5, 'What does Luke 11 suggest about the proper use of knowledge?', '["Knowledge should open people to God rather than become a barrier controlled by religious elites", "Knowledge is dangerous and should be avoided", "Only lawyers may handle Scripture", "Ignorance is spiritually preferable to learning"]'::jsonb, 'Knowledge should open people to God rather than become a barrier controlled by religious elites', 'Luke 11:52 condemns taking away the key of knowledge rather than using it to lead people to God.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Luke 11 suggest about the proper use of knowledge?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 11, 5, 'Why is the contrast between external cleansing and internal corruption so central in Luke 11?', '["It shows that God''s concern reaches the heart, not just visible religious performance", "It means outward actions never matter", "It proves purity laws were always pointless", "It concerns table etiquette more than theology"]'::jsonb, 'It shows that God''s concern reaches the heart, not just visible religious performance', 'Jesus''s table rebuke in Luke 11 targets heart-level wickedness beneath outward piety.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the contrast between external cleansing and internal corruption so central in Luke 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 12, 1, 'What did Jesus call the leaven of the Pharisees in Luke 12?', '["Hypocrisy", "Wisdom", "Zeal", "Greed only"]'::jsonb, 'Hypocrisy', 'Luke 12:1 says the leaven of the Pharisees is hypocrisy.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus call the leaven of the Pharisees in Luke 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 12, 1, 'What did Jesus say should be where a person''s treasure is in Luke 12?', '["Their heart", "Their family", "Their house", "Their reputation"]'::jsonb, 'Their heart', 'Luke 12:34 says, ''Where your treasure is, there will your heart be also.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say should be where a person''s treasure is in Luke 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 12, 1, 'What did Jesus tell his disciples to consider in Luke 12 when teaching against anxiety?', '["The ravens and the lilies", "The temple and the priests", "The sea and the ships", "The shepherds and the sheep"]'::jsonb, 'The ravens and the lilies', 'Luke 12:24-27 points to ravens and lilies.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus tell his disciples to consider in Luke 12 when teaching against anxiety?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 12, 1, 'What did Jesus tell the servants to keep burning in Luke 12?', '["Their lamps", "The temple fire", "Incense before the altar", "Torches in the city gate"]'::jsonb, 'Their lamps', 'Luke 12:35 says to let your lamps be burning.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus tell the servants to keep burning in Luke 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 12, 1, 'What did the rich man decide to build in Luke 12?', '["Bigger barns", "A synagogue", "A tower in Jerusalem", "An inn for travelers"]'::jsonb, 'Bigger barns', 'Luke 12:18 says the rich man planned to tear down his barns and build bigger ones.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the rich man decide to build in Luke 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 12, 2, 'What did Jesus say disciples should seek first in Luke 12?', '["God''s kingdom", "A secure inheritance", "A larger harvest", "Public approval"]'::jsonb, 'God''s kingdom', 'Luke 12:31 says, ''Seek his Kingdom, and all these things will be added to you.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say disciples should seek first in Luke 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 12, 2, 'What did Jesus say the Son of Man would come at in Luke 12?', '["An hour you do not expect", "The next Passover only", "Midday in Jerusalem", "After all signs are complete"]'::jsonb, 'An hour you do not expect', 'Luke 12:40 says the Son of Man comes at an hour you do not expect.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say the Son of Man would come at in Luke 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 12, 2, 'What did Jesus say the faithful and wise steward does in Luke 12?', '["Gives the household their portion at the proper time", "Builds larger barns for the master", "Avoids all responsibility until the master returns", "Keeps the lamps hidden"]'::jsonb, 'Gives the household their portion at the proper time', 'Luke 12:42 says the faithful steward gives the household food at the proper time.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say the faithful and wise steward does in Luke 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 12, 2, 'What happened to the rich fool in Luke 12?', '["His life was required of him that night", "He built larger barns successfully", "He gave away all his goods", "He followed Jesus immediately"]'::jsonb, 'His life was required of him that night', 'Luke 12:20 says God said, ''This night your soul is required of you.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'What happened to the rich fool in Luke 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 12, 2, 'Why did Jesus tell the parable of the rich fool in Luke 12?', '["To warn against greed and false security in possessions", "To praise careful financial planning", "To condemn all farming as sinful", "To illustrate temple tithing"]'::jsonb, 'To warn against greed and false security in possessions', 'Luke 12:15-21 warns against covetousness and storing up treasure for oneself.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why did Jesus tell the parable of the rich fool in Luke 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 12, 3, 'What does Jesus mean by the leaven of the Pharisees in Luke 12?', '["Hypocrisy spreads subtly and corruptingly if left unchecked", "Their bread was physically unclean", "Their teaching had no influence at all", "Leaven refers only to greed"]'::jsonb, 'Hypocrisy spreads subtly and corruptingly if left unchecked', 'Luke 12:1 defines the leaven of the Pharisees as hypocrisy.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Jesus mean by the leaven of the Pharisees in Luke 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 12, 3, 'What is the significance of the command to sell possessions and give alms in Luke 12?', '["It calls disciples to loosen earthly security and invest in heavenly treasure", "It abolishes all private property for every person universally", "It applies only to the rich fool", "It replaces care for one''s household"]'::jsonb, 'It calls disciples to loosen earthly security and invest in heavenly treasure', 'Luke 12:33 connects almsgiving with treasure in heaven.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the significance of the command to sell possessions and give alms in Luke 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 12, 3, 'Why does Jesus speak about fearing the one who can cast into Gehenna in Luke 12?', '["To redirect fear from human threats to ultimate accountability before God", "To deny God''s mercy entirely", "To encourage terror over daily suffering only", "To say disciples should fear angels"]'::jsonb, 'To redirect fear from human threats to ultimate accountability before God', 'Luke 12:4-5 contrasts fear of human beings with fear of God.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Jesus speak about fearing the one who can cast into Gehenna in Luke 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 12, 3, 'Why does Jesus speak of division rather than peace in Luke 12?', '["His mission provokes decisive responses that can divide even households", "He rejects peace as a kingdom value", "He wants disciples to create conflict deliberately", "He is speaking only about Roman politics"]'::jsonb, 'His mission provokes decisive responses that can divide even households', 'Luke 12:49-53 says Jesus''s coming brings division even within families.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Jesus speak of division rather than peace in Luke 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 12, 3, 'Why does Jesus tell the parable of the rich fool in Luke 12?', '["To expose the danger of storing up earthly wealth without being rich toward God", "To praise wise agricultural planning", "To condemn all barns and farming", "To teach that long life is guaranteed by success"]'::jsonb, 'To expose the danger of storing up earthly wealth without being rich toward God', 'Luke 12:16-21 warns against greed and false security.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Jesus tell the parable of the rich fool in Luke 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 12, 4, 'How do the rich fool, the ravens and lilies, and the watchful servants fit together in Luke 12?', '["They contrast anxious self-security with trustful readiness under God''s rule", "They are unrelated sayings about money and nature", "The servant section cancels the warning against greed", "The chapter moves away from kingdom concerns after the parable"]'::jsonb, 'They contrast anxious self-security with trustful readiness under God''s rule', 'Luke 12 moves from greed and anxiety to trust and watchfulness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do the rich fool, the ravens and lilies, and the watchful servants fit together in Luke 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 12, 4, 'How do the teachings on anxiety and readiness fit together in Luke 12?', '["Trust in the Father''s care frees disciples to live alertly for the Son of Man''s coming", "Readiness eliminates the need for trust", "Anxiety proves spiritual seriousness", "Only the apostles must stay watchful"]'::jsonb, 'Trust in the Father''s care frees disciples to live alertly for the Son of Man''s coming', 'Luke 12 moves from treasure and trust to lamps burning and servants ready.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do the teachings on anxiety and readiness fit together in Luke 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 12, 4, 'How does Luke 12 portray stewardship?', '["Stewardship is measured by faithfulness under delay and accountability at the master''s return", "Stewardship means avoiding responsibility to stay safe", "Only money counts as stewardship", "Delay removes the need for obedience"]'::jsonb, 'Stewardship is measured by faithfulness under delay and accountability at the master''s return', 'Luke 12:42-48 emphasizes faithful service while awaiting the master.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Luke 12 portray stewardship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 12, 4, 'What larger shape of discipleship appears in Luke 12?', '["It is fearless before people, trusting before God, free from greed, and ready for the master''s return", "It is mainly about predicting the end times", "It centers on storing up enough goods for hardship", "It belongs only to leaders entrusted with teaching"]'::jsonb, 'It is fearless before people, trusting before God, free from greed, and ready for the master''s return', 'Luke 12 gathers fear of God, non-anxiety, generosity, and readiness into one ethic.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger shape of discipleship appears in Luke 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 12, 4, 'Why is hidden hypocrisy an apt opening warning for Luke 12?', '["It frames the whole chapter around what is truly seen by God beneath outward appearances", "It mainly introduces barn-building imagery", "It applies only to the Pharisees and not disciples", "It denies that speech matters"]'::jsonb, 'It frames the whole chapter around what is truly seen by God beneath outward appearances', 'Luke 12:1-3 sets the tone for the chapter''s concern with true fear, treasure, and loyalty.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is hidden hypocrisy an apt opening warning for Luke 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 12, 5, 'How does Luke 12 connect daily trust with final judgment?', '["Those who trust the Father in ordinary needs are also called to live ready for ultimate accountability", "Daily trust and final judgment are unrelated topics", "Judgment matters only to hypocrites, not disciples", "Anxiety is the proper way to prepare for judgment"]'::jsonb, 'Those who trust the Father in ordinary needs are also called to live ready for ultimate accountability', 'Luke 12 moves organically from God''s care for daily life to readiness for the Son of Man.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 12 connect daily trust with final judgment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 12, 5, 'How does Luke 12 shape a disciple''s relation to fear, possessions, and the future?', '["Fear God, hold possessions loosely, and live ready for the coming Son of Man", "Avoid all possessions and responsibility entirely", "Fear other people above God", "Treat the future as fully predictable"]'::jsonb, 'Fear God, hold possessions loosely, and live ready for the coming Son of Man', 'Luke 12 weaves together holy fear, anti-greed teaching, trust, and readiness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 12 shape a disciple''s relation to fear, possessions, and the future?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 12, 5, 'How does Luke 12 shape the heart of a disciple?', '["By exposing hidden hypocrisy and redirecting desire toward God, generosity, and readiness", "By teaching that external religion is sufficient", "By encouraging private wealth over public faithfulness", "By making judgment the only motive for obedience"]'::jsonb, 'By exposing hidden hypocrisy and redirecting desire toward God, generosity, and readiness', 'Luke 12 repeatedly returns to the inner life through treasure, fear, and faithfulness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 12 shape the heart of a disciple?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 12, 5, 'What does Luke 12 imply about true security?', '["True security rests in the Father''s care and kingdom promise, not in possessions or timing control", "Security is found in bigger barns and prudent fear", "The future can be mastered if one interprets signs well enough", "Only public honor keeps a disciple safe"]'::jsonb, 'True security rests in the Father''s care and kingdom promise, not in possessions or timing control', 'Across Luke 12, Jesus relocates security from goods and predictability to the Father and his kingdom.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Luke 12 imply about true security?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 12, 5, 'Why is the phrase ''little flock'' significant in Luke 12?', '["It combines tenderness and assurance with the promise of the kingdom", "It means the disciples should remain socially small forever", "It limits the kingdom to the apostles", "It contrasts sheep with ravens in the chapter"]'::jsonb, 'It combines tenderness and assurance with the promise of the kingdom', 'Luke 12:32 says, ''Do not be afraid, little flock, for your Father''s good pleasure is to give you the kingdom.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the phrase ''little flock'' significant in Luke 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 13, 1, 'How long had the woman been bent over in Luke 13?', '["Eighteen years", "Twelve years", "Seven years", "Forty years"]'::jsonb, 'Eighteen years', 'Luke 13:11 says the woman had been bent over for eighteen years.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'How long had the woman been bent over in Luke 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 13, 1, 'What animal image did Jesus use when lamenting over Jerusalem in Luke 13?', '["A hen gathering her brood", "A shepherd seeking sheep", "A lion protecting cubs", "An eagle over its young"]'::jsonb, 'A hen gathering her brood', 'Luke 13:34 says Jesus longed to gather Jerusalem as a hen gathers her brood.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'What animal image did Jesus use when lamenting over Jerusalem in Luke 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 13, 1, 'What did Jesus compare the kingdom of God to in Luke 13?', '["A mustard seed and leaven", "A vineyard and a fig tree only", "A lamp and a coin", "A flock and a gate"]'::jsonb, 'A mustard seed and leaven', 'Luke 13:18-21 compares the kingdom to a mustard seed and leaven.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus compare the kingdom of God to in Luke 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 13, 1, 'What did Jesus say would happen unless people repented in Luke 13?', '["They would all likewise perish", "They would lose only earthly rewards", "They would become like angels", "They would be exiled from Galilee only"]'::jsonb, 'They would all likewise perish', 'Luke 13:3 and 13:5 warn, ''Unless you repent, you will all likewise perish.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say would happen unless people repented in Luke 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 13, 1, 'What examples of sudden death did Jesus mention in Luke 13?', '["The Galileans and those killed by the tower in Siloam", "The widow''s son and Lazarus", "The priests and the shepherds", "The rich fool and Judas"]'::jsonb, 'The Galileans and those killed by the tower in Siloam', 'Luke 13:1-4 mentions the Galileans and the tower in Siloam.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'What examples of sudden death did Jesus mention in Luke 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 13, 2, 'How did Jesus answer those upset about healing on the Sabbath in Luke 13?', '["He said the woman ought to be loosed from her bond on the Sabbath", "He postponed the healing to another day", "He told them Sabbath forbids mercy", "He asked the synagogue ruler to decide"]'::jsonb, 'He said the woman ought to be loosed from her bond on the Sabbath', 'Luke 13:16 argues that the woman should be loosed on the Sabbath.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'How did Jesus answer those upset about healing on the Sabbath in Luke 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 13, 2, 'What did Jesus call Herod in Luke 13?', '["That fox", "A wolf", "A serpent", "A lion"]'::jsonb, 'That fox', 'Luke 13:32 says, ''Go and tell that fox.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus call Herod in Luke 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 13, 2, 'What did Jesus heal on the Sabbath in Luke 13?', '["A woman bent over for eighteen years", "A blind beggar by Jericho", "A centurion''s servant", "A man with dropsy"]'::jsonb, 'A woman bent over for eighteen years', 'Luke 13:10-17 tells of the healing of a bent woman on the Sabbath.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus heal on the Sabbath in Luke 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 13, 2, 'What did Jesus say would happen unless people repented in Luke 13?', '["They would all likewise perish", "They would lose only reward", "They would be exiled to Samaria", "They would become like the nations"]'::jsonb, 'They would all likewise perish', 'Luke 13:3 and 13:5 repeat that warning.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say would happen unless people repented in Luke 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 13, 2, 'What did Jesus tell people to do regarding the narrow door in Luke 13?', '["Strive to enter", "Wait patiently outside", "Seek a wider road", "Ask others to carry them through"]'::jsonb, 'Strive to enter', 'Luke 13:24 says, ''Strive to enter by the narrow door.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus tell people to do regarding the narrow door in Luke 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 13, 3, 'What does the narrow door teaching reveal about the kingdom in Luke 13?', '["Entering requires response and cannot be assumed by proximity or familiarity alone", "Only a literal doorway in Jerusalem matters", "Most people enter by effort alone", "The kingdom excludes all outsiders from the start"]'::jsonb, 'Entering requires response and cannot be assumed by proximity or familiarity alone', 'Luke 13:24-30 warns that acquaintance with Jesus is not the same as entering the kingdom.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the narrow door teaching reveal about the kingdom in Luke 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 13, 3, 'What is Jesus teaching with the barren fig tree in Luke 13?', '["God''s patience is real, but fruitless lives still face judgment", "Israel will never be judged", "Repentance is optional if one waits long enough", "The tree represents Rome alone"]'::jsonb, 'God''s patience is real, but fruitless lives still face judgment', 'Luke 13:6-9 portrays delayed judgment as mercy, not indifference.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is Jesus teaching with the barren fig tree in Luke 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 13, 3, 'What is the point of the barren fig tree parable in Luke 13?', '["God''s patience grants time for repentance, but fruitlessness will not last forever", "Israel has already been cut down completely", "Repentance is unnecessary if one is planted in the vineyard", "Fruit is only a symbol of material success"]'::jsonb, 'God''s patience grants time for repentance, but fruitlessness will not last forever', 'Luke 13:6-9 joins mercy and warning in the fig tree parable.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the point of the barren fig tree parable in Luke 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 13, 3, 'Why does Jesus reject the assumption that sudden victims were worse sinners in Luke 13?', '["He uses tragedy to call everyone to repentance rather than to rank others'' guilt", "He denies that sin brings any judgment at all", "He says only Galileans need to repent", "He shifts the blame entirely to Rome"]'::jsonb, 'He uses tragedy to call everyone to repentance rather than to rank others'' guilt', 'Luke 13:1-5 redirects the discussion from comparing sinners to universal repentance.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Jesus reject the assumption that sudden victims were worse sinners in Luke 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 13, 3, 'Why is the healing of the bent woman significant in Luke 13?', '["Jesus treats Sabbath as a fitting day for liberating mercy", "It shows synagogue worship should cease", "It proves every illness is caused by a demon", "It matters only because the crowd admired it"]'::jsonb, 'Jesus treats Sabbath as a fitting day for liberating mercy', 'Luke 13:10-17 presents the healing as release from bondage on the Sabbath.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the healing of the bent woman significant in Luke 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 13, 4, 'How do repentance, Sabbath healing, kingdom growth, and lament over Jerusalem fit together in Luke 13?', '["The chapter joins urgent warning with gracious liberation and the sorrow of resisted mercy", "Jerusalem''s lament cancels the earlier call to repent", "Kingdom growth replaces the need for judgment", "The healing scene is unrelated to the narrow door"]'::jsonb, 'The chapter joins urgent warning with gracious liberation and the sorrow of resisted mercy', 'Luke 13 moves from warning to mercy to lament within one kingdom vision.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do repentance, Sabbath healing, kingdom growth, and lament over Jerusalem fit together in Luke 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 13, 4, 'How does Luke 13 challenge false security?', '["It warns that tragedy, synagogue membership, or familiarity with Jesus do not replace repentance", "It says all Israel is safe regardless of response", "It teaches the Sabbath guarantees righteousness", "It promises Herod cannot affect anyone''s future"]'::jsonb, 'It warns that tragedy, synagogue membership, or familiarity with Jesus do not replace repentance', 'Luke 13 repeatedly confronts assumptions of safety without repentance.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Luke 13 challenge false security?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 13, 4, 'How does the narrow door saying function in Luke 13?', '["It warns that opportunity to enter God''s kingdom must be responded to before it is too late", "Only a small ethnic group can ever be saved", "Effort alone earns entrance", "Jesus is discouraging people from coming"]'::jsonb, 'It warns that opportunity to enter God''s kingdom must be responded to before it is too late', 'Luke 13:22-30 urges striving to enter before the door is shut.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the narrow door saying function in Luke 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 13, 4, 'What larger picture of Jesus emerges from Luke 13?', '["He is a warning prophet, liberating healer, and grieving gatherer of a resistant people", "He is only a teacher of proverbs", "He withdraws from public ministry under Herod''s threat", "He limits his concern to Galilee"]'::jsonb, 'He is a warning prophet, liberating healer, and grieving gatherer of a resistant people', 'Luke 13 presents Jesus in judgment, mercy, and lament.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger picture of Jesus emerges from Luke 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 13, 4, 'Why are mustard seed and leaven fitting images in Luke 13?', '["They show the kingdom''s quiet but undeniable growth from small beginnings", "They teach that the kingdom is hidden forever", "They mean only women understand the kingdom", "They replace the need for repentance with patience"]'::jsonb, 'They show the kingdom''s quiet but undeniable growth from small beginnings', 'Luke 13:18-21 uses small beginnings to picture kingdom expansion.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why are mustard seed and leaven fitting images in Luke 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 13, 5, 'How does Luke 13 combine warning and compassion?', '["Jesus calls for repentance and also laments Jerusalem with tender grief", "He offers only judgment with no mercy", "He avoids speaking about Jerusalem altogether", "Compassion belongs only to the healing story"]'::jsonb, 'Jesus calls for repentance and also laments Jerusalem with tender grief', 'Luke 13 moves from urgent warnings to the lament over Jerusalem.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 13 combine warning and compassion?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 13, 5, 'How does Luke 13 deepen Luke''s theme of reversal?', '["The bound woman is loosed, the last become first, and the rejected city is still passionately addressed by Jesus", "Reversal disappears after chapter 12", "Only political fortunes are reversed", "The chapter has no connection to Luke''s larger themes"]'::jsonb, 'The bound woman is loosed, the last become first, and the rejected city is still passionately addressed by Jesus', 'Luke 13 includes liberation, last/first language, and lament over resistant Jerusalem.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 13 deepen Luke''s theme of reversal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 13, 5, 'How does Luke 13 hold together patience and urgency?', '["God grants time and mercy, yet the call to repent and enter is immediate and serious", "Patience means judgment will never come", "Urgency removes all room for mercy", "The two themes remain unrelated"]'::jsonb, 'God grants time and mercy, yet the call to repent and enter is immediate and serious', 'The fig tree, narrow door, and lament all combine mercy with urgency.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 13 hold together patience and urgency?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 13, 5, 'What does Luke 13 suggest about the nature of kingdom entry?', '["It requires repentance, perseverance, and response to God''s gracious invitation", "It comes automatically through ancestry", "It is secured by observing the Sabbath externally", "It depends on avoiding tragedy"]'::jsonb, 'It requires repentance, perseverance, and response to God''s gracious invitation', 'Luke 13 repeatedly ties kingdom participation to response rather than assumption.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Luke 13 suggest about the nature of kingdom entry?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 13, 5, 'Why is Jesus''s lament over Jerusalem such a powerful close to Luke 13?', '["It reveals divine compassion toward those who resist the very mercy they need", "It marks Jesus''s final departure from Israel without sorrow", "It shows Jerusalem had fully welcomed him already", "It turns the chapter into a purely political speech"]'::jsonb, 'It reveals divine compassion toward those who resist the very mercy they need', 'Luke 13:34-35 ends with grief, longing, and judgment held together.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Jesus''s lament over Jerusalem such a powerful close to Luke 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 14, 1, 'What did Jesus say about salt in Luke 14?', '["Salt is good, but if it loses its taste it is useless", "Salt should be hidden in the storehouse", "Salt is only for temple offerings", "Salt must never be shared"]'::jsonb, 'Salt is good, but if it loses its taste it is useless', 'Luke 14:34-35 uses salt as an image of true usefulness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say about salt in Luke 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 14, 1, 'What seat did Jesus say a guest should choose at a banquet in Luke 14?', '["The lowest place", "The highest place", "The middle place only", "Any place reserved by wealth"]'::jsonb, 'The lowest place', 'Luke 14:10 teaches taking the lowest place.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'What seat did Jesus say a guest should choose at a banquet in Luke 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 14, 1, 'What seat did Jesus tell guests to choose at a feast in Luke 14?', '["The lowest place", "The highest place", "The host''s own seat", "Any seat nearest the door"]'::jsonb, 'The lowest place', 'Luke 14:10 teaches taking the lowest place at a feast.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'What seat did Jesus tell guests to choose at a feast in Luke 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 14, 1, 'What structure did Jesus mention in Luke 14 when teaching about counting the cost?', '["A tower", "A vineyard", "A synagogue", "A boat"]'::jsonb, 'A tower', 'Luke 14:28 uses the example of building a tower.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'What structure did Jesus mention in Luke 14 when teaching about counting the cost?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 14, 1, 'Whom did Jesus say to invite to a banquet in Luke 14?', '["The poor, crippled, lame, and blind", "Only rich friends and relatives", "Only religious leaders", "Only those who can repay"]'::jsonb, 'The poor, crippled, lame, and blind', 'Luke 14:13 says to invite those who cannot repay you.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'Whom did Jesus say to invite to a banquet in Luke 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 14, 2, 'What comparison did Jesus use alongside tower-building in Luke 14?', '["A king considering war", "A farmer sowing seed", "A judge hearing a widow", "A merchant buying pearls"]'::jsonb, 'A king considering war', 'Luke 14:31-32 gives the example of a king considering war.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'What comparison did Jesus use alongside tower-building in Luke 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 14, 2, 'What did Jesus say a disciple must bear in Luke 14?', '["His own cross", "A lamp", "The temple tax", "A shepherd''s staff"]'::jsonb, 'His own cross', 'Luke 14:27 says whoever does not bear his own cross cannot be Jesus''s disciple.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say a disciple must bear in Luke 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 14, 2, 'What did the master tell his servant to do after the invited guests refused the supper in Luke 14?', '["Bring in the poor and go out to highways and hedges", "Cancel the banquet entirely", "Invite only priests instead", "Wait for the original guests to change their minds"]'::jsonb, 'Bring in the poor and go out to highways and hedges', 'Luke 14:21-23 expands the invitation to outsiders and the poor.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the master tell his servant to do after the invited guests refused the supper in Luke 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 14, 2, 'Who did Jesus say should be invited to a banquet in Luke 14?', '["The poor, crippled, lame, and blind", "Only close friends and rich neighbors", "Only religious leaders", "Only family members"]'::jsonb, 'The poor, crippled, lame, and blind', 'Luke 14:13 says to invite those who cannot repay.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'Who did Jesus say should be invited to a banquet in Luke 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 14, 2, 'Why did many invited guests refuse the great supper in Luke 14?', '["They made excuses about property, oxen, and marriage", "They were too poor to attend", "They could not find the house", "They feared the crowds"]'::jsonb, 'They made excuses about property, oxen, and marriage', 'Luke 14:18-20 records their excuses.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why did many invited guests refuse the great supper in Luke 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 14, 3, 'What does the great supper parable reveal about God''s invitation in Luke 14?', '["Those who presume on privilege may refuse it, while unexpected people are welcomed in", "The invitation belongs only to the first guests", "The poor are invited only after proving themselves", "Excuses are treated as acceptable by the master"]'::jsonb, 'Those who presume on privilege may refuse it, while unexpected people are welcomed in', 'Luke 14:15-24 shows the feast filled by those outside the expected circle.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the great supper parable reveal about God''s invitation in Luke 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 14, 3, 'What is the point of counting the cost in Luke 14?', '["Discipleship requires deliberate, total commitment rather than impulse", "It means salvation can be earned by effort", "It discourages anyone from following Jesus", "It applies only to rulers and builders"]'::jsonb, 'Discipleship requires deliberate, total commitment rather than impulse', 'Luke 14:28-33 teaches sober consideration of what following Jesus demands.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the point of counting the cost in Luke 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 14, 3, 'What is the point of the parable of the great supper in Luke 14?', '["Those who make excuses miss the feast, while unexpected people are brought in", "Every invited guest eventually arrives", "The banquet represents only earthly prosperity", "The poor refuse the invitation too"]'::jsonb, 'Those who make excuses miss the feast, while unexpected people are brought in', 'Luke 14:15-24 contrasts excuse-making invitees with those gathered from outside.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the point of the parable of the great supper in Luke 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 14, 3, 'Why does Jesus use strong language about hating family in Luke 14?', '["He demands ultimate allegiance above every competing loyalty", "He commands literal hatred toward relatives", "He abolishes family responsibility entirely", "He speaks only to the Twelve"]'::jsonb, 'He demands ultimate allegiance above every competing loyalty', 'Luke 14:26 uses strong comparative language to stress supreme loyalty to Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Jesus use strong language about hating family in Luke 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 14, 3, 'Why is humility at the banquet important in Luke 14?', '["God''s kingdom reverses self-exaltation and honors the humble", "Social etiquette is the chapter''s only concern", "Humility guarantees worldly promotion", "The teaching applies only to Pharisees"]'::jsonb, 'God''s kingdom reverses self-exaltation and honors the humble', 'Luke 14:11 says everyone who exalts himself will be humbled, and he who humbles himself will be exalted.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is humility at the banquet important in Luke 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 14, 4, 'How do humility, the banquet, and counting the cost fit together in Luke 14?', '["The kingdom welcomes the lowly and demands a wholehearted response from disciples", "Hospitality replaces discipleship in the chapter", "The banquet parable cancels the call to sacrifice", "Humility matters only for social gatherings"]'::jsonb, 'The kingdom welcomes the lowly and demands a wholehearted response from disciples', 'Luke 14 joins social reversal with radical discipleship.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do humility, the banquet, and counting the cost fit together in Luke 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 14, 4, 'What larger picture of discipleship emerges in Luke 14?', '["True discipleship is humble, grace-shaped, and willing to renounce competing claims", "It is mainly about attending religious meals", "It avoids all family obligations in every sense", "It is reserved for public leaders only"]'::jsonb, 'True discipleship is humble, grace-shaped, and willing to renounce competing claims', 'Luke 14 moves from humility and inclusive invitation to the cost of following Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger picture of discipleship emerges in Luke 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 14, 4, 'Why are the poor and disabled invited in Luke 14?', '["They embody those who cannot repay and thus highlight grace over social advantage", "They are easier to impress than wealthy guests", "They alone understand the law fully", "They replace all other guests permanently"]'::jsonb, 'They embody those who cannot repay and thus highlight grace over social advantage', 'Luke 14:12-14 and 14:21 emphasize inviting those who cannot repay.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why are the poor and disabled invited in Luke 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 14, 4, 'Why does Jesus speak about counting the cost in Luke 14?', '["Discipleship requires deliberate, total allegiance rather than impulse alone", "Salvation can be bought with enough planning", "Crowds should stop following him immediately", "Only builders and kings can understand the kingdom"]'::jsonb, 'Discipleship requires deliberate, total allegiance rather than impulse alone', 'Luke 14:25-33 uses tower and war images to teach costly discipleship.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Jesus speak about counting the cost in Luke 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 14, 4, 'Why is salt a fitting closing image in Luke 14?', '["It warns that discipleship must retain its distinct, costly character to remain useful", "It means food laws are now central again", "It praises those who stay socially respectable", "It refers only to temple sacrifice"]'::jsonb, 'It warns that discipleship must retain its distinct, costly character to remain useful', 'Luke 14:34-35 closes with the danger of salt losing its savor.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is salt a fitting closing image in Luke 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 14, 5, 'How does Luke 14 connect table fellowship and the way of the cross?', '["The chapter moves from kingdom hospitality to the costly renunciation required to belong to Jesus", "Meals are shown to oppose discipleship", "The cross image cancels the banquet imagery", "Only private faith matters after the meal teachings"]'::jsonb, 'The chapter moves from kingdom hospitality to the costly renunciation required to belong to Jesus', 'Luke 14 links the gracious feast imagery with Jesus''s uncompromising discipleship call.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 14 connect table fellowship and the way of the cross?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 14, 5, 'How does Luke 14 redefine honor and belonging in God''s kingdom?', '["The humble are lifted, the poor are welcomed, and disciples must value Jesus above every competing claim", "Honor goes to those with the best invitations", "Kingdom life is mainly about social strategy", "Belonging depends on family prestige"]'::jsonb, 'The humble are lifted, the poor are welcomed, and disciples must value Jesus above every competing claim', 'Luke 14 joins humility, inclusive banquet imagery, and radical discipleship.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 14 redefine honor and belonging in God''s kingdom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 14, 5, 'How does Luke 14 reveal the kingdom''s reversal of honor?', '["Those seeking status are humbled while the overlooked are brought to the feast", "The honored guests remain the center throughout", "Status is ignored as spiritually irrelevant", "Only humility without invitation matters"]'::jsonb, 'Those seeking status are humbled while the overlooked are brought to the feast', 'The chapter repeatedly overturns ordinary honor patterns.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 14 reveal the kingdom''s reversal of honor?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 14, 5, 'What does Luke 14 suggest about grace and obligation?', '["Grace welcomes those who cannot repay, while discipleship calls for total allegiance in response", "Grace removes every call to obedience", "Obligation earns entry into the feast", "Only the poor are asked to count the cost"]'::jsonb, 'Grace welcomes those who cannot repay, while discipleship calls for total allegiance in response', 'Luke 14 combines free invitation with costly response.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Luke 14 suggest about grace and obligation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 14, 5, 'Why is the master''s anger in the great supper parable significant in Luke 14?', '["It shows refusal of God''s invitation is a serious moral rejection, not a trivial scheduling matter", "It means the banquet was never truly intended", "It proves hospitality is dangerous", "It shows outsiders are only a backup plan without dignity"]'::jsonb, 'It shows refusal of God''s invitation is a serious moral rejection, not a trivial scheduling matter', 'Luke 14:21-24 treats the excuses as culpable rejection.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the master''s anger in the great supper parable significant in Luke 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 15, 1, 'How many sheep did the shepherd leave behind in Luke 15 to seek the lost one?', '["Ninety-nine", "Seventy", "Twelve", "Fifty"]'::jsonb, 'Ninety-nine', 'Luke 15:4 says he left the ninety-nine in the wilderness and went after the one.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'How many sheep did the shepherd leave behind in Luke 15 to seek the lost one?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 15, 1, 'What did the father do when he saw the prodigal son still far off in Luke 15?', '["He ran and embraced him", "He waited for a full confession first", "He sent a servant to question him", "He shut the door"]'::jsonb, 'He ran and embraced him', 'Luke 15:20 says the father ran and embraced his son.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the father do when he saw the prodigal son still far off in Luke 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 15, 1, 'What did the shepherd do when one sheep was lost in Luke 15?', '["He left the ninety-nine and went after the lost one", "He sold the flock and started over", "He waited for the sheep to return alone", "He blamed the other sheep"]'::jsonb, 'He left the ninety-nine and went after the lost one', 'Luke 15:4 says the shepherd goes after the one that is lost.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the shepherd do when one sheep was lost in Luke 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 15, 1, 'What object did the woman search for in Luke 15?', '["A lost coin", "A pearl", "A scroll", "A lamp"]'::jsonb, 'A lost coin', 'Luke 15:8 says the woman searched for one lost coin.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'What object did the woman search for in Luke 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 15, 1, 'Who complained that Jesus welcomed sinners in Luke 15?', '["The Pharisees and scribes", "The disciples", "The Samaritans", "The tax collectors"]'::jsonb, 'The Pharisees and scribes', 'Luke 15:1-2 says the Pharisees and scribes grumbled about Jesus receiving sinners.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who complained that Jesus welcomed sinners in Luke 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 15, 2, 'How did the older brother react to the celebration in Luke 15?', '["He became angry and refused to go in", "He led the music with joy", "He went to fetch his brother at once", "He gave his inheritance away"]'::jsonb, 'He became angry and refused to go in', 'Luke 15:28 says the older brother was angry and would not go in.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'How did the older brother react to the celebration in Luke 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 15, 2, 'What did the father do when the prodigal son returned in Luke 15?', '["He ran to him and embraced him", "He made him earn his place back first", "He sent him to the fields", "He refused to speak with him"]'::jsonb, 'He ran to him and embraced him', 'Luke 15:20 says the father ran, embraced, and kissed the returning son.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the father do when the prodigal son returned in Luke 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 15, 2, 'What did the father put on the returning prodigal in Luke 15?', '["The best robe, a ring, and sandals", "A servant''s apron only", "A crown and scepter", "A mourning garment"]'::jsonb, 'The best robe, a ring, and sandals', 'Luke 15:22 says the father gave him the best robe, a ring, and sandals.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the father put on the returning prodigal in Luke 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 15, 2, 'What did the woman do after finding her lost coin in Luke 15?', '["She called friends and neighbors to rejoice with her", "She hid it carefully and told no one", "She gave it to the poor immediately", "She returned it to the temple"]'::jsonb, 'She called friends and neighbors to rejoice with her', 'Luke 15:9 says she called others together to rejoice.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the woman do after finding her lost coin in Luke 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 15, 2, 'What repeated phrase marks the joy of the first two parables in Luke 15?', '["Rejoice with me", "Do not be afraid", "Peace be to this house", "The kingdom is near"]'::jsonb, 'Rejoice with me', 'Luke 15:6 and 15:9 repeat the call to rejoice with me.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'What repeated phrase marks the joy of the first two parables in Luke 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 15, 3, 'What does Luke 15 teach about repentance?', '["Repentance leads to joy in heaven and restoration in the Father''s house", "Repentance is mainly self-punishment", "Repentance earns sonship back by effort", "Repentance matters only for notorious sinners"]'::jsonb, 'Repentance leads to joy in heaven and restoration in the Father''s house', 'All three parables in Luke 15 climax in joy over the recovery of the lost.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Luke 15 teach about repentance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 15, 3, 'What is the father''s response to the prodigal meant to reveal in Luke 15?', '["God''s eager mercy toward repentant sinners", "A naive disregard for justice", "The superiority of younger sons", "The end of all moral accountability"]'::jsonb, 'God''s eager mercy toward repentant sinners', 'Luke 15:20-24 portrays lavish welcome and restoration.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the father''s response to the prodigal meant to reveal in Luke 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 15, 3, 'Why are the lost sheep and lost coin parables paired in Luke 15?', '["They show God''s active seeking and heaven''s joy over one repentant sinner", "They teach that small things matter more than people", "They compare men and women in Israel", "They are mainly about economic loss"]'::jsonb, 'They show God''s active seeking and heaven''s joy over one repentant sinner', 'Luke 15:4-10 pairs the parables around searching and rejoicing over recovery.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why are the lost sheep and lost coin parables paired in Luke 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 15, 3, 'Why are the three parables in Luke 15 told together?', '["They reveal God''s joy in recovering the lost and expose the resentment of the self-righteous", "They are three unrelated stories about money", "They deny the need for repentance", "They teach that only one sinner can be saved at a time"]'::jsonb, 'They reveal God''s joy in recovering the lost and expose the resentment of the self-righteous', 'Luke 15 answers Pharisees who grumbled that Jesus welcomed sinners.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why are the three parables in Luke 15 told together?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 15, 3, 'Why is the older brother crucial to the prodigal son parable?', '["He mirrors the self-righteous refusal to rejoice over grace given to sinners", "He is only a minor narrative detail", "He represents the tax collectors returning home", "He proves the father preferred one son over the other"]'::jsonb, 'He mirrors the self-righteous refusal to rejoice over grace given to sinners', 'Luke 15:25-32 reflects the grumbling attitude that opened the chapter.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the older brother crucial to the prodigal son parable?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 15, 4, 'How do the three parables escalate in Luke 15?', '["From one lost sheep to one lost coin to a lost son, increasing the emotional and relational stakes", "From money to animals to politics", "From public joy to private secrecy", "From repentance to rejection without mercy"]'::jsonb, 'From one lost sheep to one lost coin to a lost son, increasing the emotional and relational stakes', 'The sequence intensifies the value of what is lost and the depth of the celebration.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do the three parables escalate in Luke 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 15, 4, 'How does the father in the prodigal son parable challenge expected social patterns?', '["He runs, restores, and celebrates instead of maintaining distance and shame", "He forces his son to earn sonship back publicly", "He honors only the older brother''s complaint", "He refuses to divide property at any point"]'::jsonb, 'He runs, restores, and celebrates instead of maintaining distance and shame', 'Luke 15:20-24 depicts surprising paternal compassion and restoration.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the father in the prodigal son parable challenge expected social patterns?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 15, 4, 'What does the elder brother in the prodigal son story represent?', '["The resentful self-righteous who cannot rejoice in mercy", "The Gentiles who never knew the Father", "The apostles after the resurrection", "The tax collectors who returned home"]'::jsonb, 'The resentful self-righteous who cannot rejoice in mercy', 'Luke 15:25-32 mirrors the Pharisees'' inability to celebrate repentance.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does the elder brother in the prodigal son story represent?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 15, 4, 'What larger conflict does Luke 15 address through its parables?', '["Whether God''s people will share heaven''s joy over repentant sinners or resent grace", "Whether shepherding is more important than farming", "Whether younger sons should inherit first", "Whether meals with sinners are lawful under Rome"]'::jsonb, 'Whether God''s people will share heaven''s joy over repentant sinners or resent grace', 'The chapter answers the Pharisees'' grumbling about Jesus welcoming sinners.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger conflict does Luke 15 address through its parables?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 15, 4, 'Why is celebration so central to Luke 15?', '["The recovery of the lost reveals the joyful heart of God and should reshape the community''s response", "It minimizes the seriousness of sin", "It exists mainly to shame the older brother", "It replaces repentance with emotion"]'::jsonb, 'The recovery of the lost reveals the joyful heart of God and should reshape the community''s response', 'Luke 15 repeatedly moves from loss to recovery to shared joy.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is celebration so central to Luke 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 15, 5, 'How does Luke 15 connect Jesus''s ministry with God''s own heart?', '["Jesus receives sinners because he embodies the Father''s joy in recovering the lost", "Jesus is more merciful than the Father", "The Father remains hidden while Jesus acts alone", "Receiving sinners is merely a strategy to gain influence"]'::jsonb, 'Jesus receives sinners because he embodies the Father''s joy in recovering the lost', 'The chapter explains Jesus''s table fellowship with sinners by revealing God''s searching, rejoicing mercy.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 15 connect Jesus''s ministry with God''s own heart?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 15, 5, 'How does Luke 15 deepen the meaning of salvation?', '["Salvation is pictured as being found, restored, welcomed home, and joyfully celebrated", "Salvation is mainly legal acquittal without relationship", "Salvation belongs only to those already near", "Salvation removes all need for repentance"]'::jsonb, 'Salvation is pictured as being found, restored, welcomed home, and joyfully celebrated', 'Luke 15''s images are relational and celebratory, not merely formal.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 15 deepen the meaning of salvation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 15, 5, 'How does Luke 15 display the heart of God?', '["God actively seeks, welcomes, and celebrates the return of the lost", "God waits coldly for sinners to improve themselves", "God values the ninety-nine but not the one", "God offers mercy only reluctantly"]'::jsonb, 'God actively seeks, welcomes, and celebrates the return of the lost', 'Luke 15''s sheep, coin, and son parables all climax in joy over recovery.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 15 display the heart of God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 15, 5, 'What does Luke 15 suggest about the Father''s house?', '["It is a place of joyful restoration where the lost are received as sons, not merely tolerated as servants", "It has room only for the obedient older brother", "It is governed mainly by strict accounting", "It excludes anyone with a shameful past"]'::jsonb, 'It is a place of joyful restoration where the lost are received as sons, not merely tolerated as servants', 'Luke 15:22-24 shows full restoration and celebration in the father''s house.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Luke 15 suggest about the Father''s house?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 15, 5, 'Why is the elder brother left unresolved at the end of Luke 15?', '["The parable presses the hearer to decide whether to join the Father''s joy or remain outside", "Luke forgot to finish the story", "The older brother dies before the ending", "It proves the father''s mercy failed"]'::jsonb, 'The parable presses the hearer to decide whether to join the Father''s joy or remain outside', 'The open ending turns the challenge back on the grumbling hearers.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the elder brother left unresolved at the end of Luke 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 16, 1, 'What did Abraham say the rich man''s brothers had in Luke 16?', '["Moses and the prophets", "A direct sign from heaven", "The apostles already preaching to them", "The rich man''s testimony"]'::jsonb, 'Moses and the prophets', 'Luke 16:29 says, ''They have Moses and the prophets; let them hear them.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Abraham say the rich man''s brothers had in Luke 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 16, 1, 'What did the steward do when he was about to be removed in Luke 16?', '["He reduced his master''s debtors'' bills", "He fled to another city", "He confessed publicly to theft", "He gave all the money to the poor"]'::jsonb, 'He reduced his master''s debtors'' bills', 'Luke 16:5-7 says he reduced the amounts owed by the debtors.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the steward do when he was about to be removed in Luke 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 16, 1, 'What quality of the unjust steward is surprisingly commended in Luke 16?', '["His shrewdness", "His honesty", "His generosity to the poor", "His strict obedience to the law"]'::jsonb, 'His shrewdness', 'Luke 16:8 says the master commended the dishonest steward for acting shrewdly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'What quality of the unjust steward is surprisingly commended in Luke 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 16, 1, 'Where was Lazarus carried after he died in Luke 16?', '["To Abraham''s side", "To the temple courts", "To Jerusalem", "To the rich man''s house"]'::jsonb, 'To Abraham''s side', 'Luke 16:22 says Lazarus was carried to Abraham''s side.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'Where was Lazarus carried after he died in Luke 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 16, 1, 'Who sat at the rich man''s gate in Luke 16?', '["Lazarus", "Zacchaeus", "Bartimaeus", "Levi"]'::jsonb, 'Lazarus', 'Luke 16:20 says Lazarus lay at the rich man''s gate.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who sat at the rich man''s gate in Luke 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 16, 2, 'What did Jesus say about serving two masters in Luke 16?', '["You cannot serve God and mammon", "You should balance them carefully", "One master matters only on Sabbath days", "Rich people can serve both"]'::jsonb, 'You cannot serve God and mammon', 'Luke 16:13 says a person cannot serve both God and mammon.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say about serving two masters in Luke 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 16, 2, 'What did Jesus say had been preached since John in Luke 16?', '["The good news of the kingdom of God", "Only the law of Moses", "Judgment on Rome alone", "The restoration of the temple"]'::jsonb, 'The good news of the kingdom of God', 'Luke 16:16 says the good news of the kingdom of God has been preached since John.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say had been preached since John in Luke 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 16, 2, 'What did the rich man ask Abraham to send to his brothers in Luke 16?', '["Lazarus", "A prophet from Jerusalem", "An angel with a scroll", "A priest from the temple"]'::jsonb, 'Lazarus', 'Luke 16:27-28 says the rich man asked Abraham to send Lazarus to his brothers.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the rich man ask Abraham to send to his brothers in Luke 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 16, 2, 'Who was laid at the rich man''s gate in Luke 16?', '["Lazarus", "Bartimaeus", "Zacchaeus", "Jairus"]'::jsonb, 'Lazarus', 'Luke 16:20 says a poor man named Lazarus was laid at the rich man''s gate.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'Who was laid at the rich man''s gate in Luke 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 16, 2, 'Why did the master commend the unjust steward in Luke 16?', '["Because he acted shrewdly", "Because he became honest", "Because he repaid every debt fully", "Because he restored all lost property"]'::jsonb, 'Because he acted shrewdly', 'Luke 16:8 says the master commended him for acting shrewdly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why did the master commend the unjust steward in Luke 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 16, 3, 'What does Luke 16 reveal about the heart through money?', '["Money exposes loyalty, faithfulness, and whether one truly serves God", "Money is spiritually neutral in every respect", "Only public giving matters to God", "Wealth guarantees divine favor"]'::jsonb, 'Money exposes loyalty, faithfulness, and whether one truly serves God', 'Luke 16:10-15 ties money, faithfulness, and the heart together.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Luke 16 reveal about the heart through money?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 16, 3, 'What is Jesus teaching about money in Luke 16?', '["Wealth must be handled faithfully because it reveals the heart''s true master", "Money is irrelevant to discipleship", "Only the rich can be faithful", "Earthly wealth guarantees future security"]'::jsonb, 'Wealth must be handled faithfully because it reveals the heart''s true master', 'Luke 16:10-13 says one cannot serve both God and mammon.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is Jesus teaching about money in Luke 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 16, 3, 'What is Jesus teaching with the unjust steward in Luke 16?', '["Worldly resources should be handled with foresight in light of eternal realities", "Dishonesty is virtuous if it succeeds", "Money has no spiritual significance", "Only the poor can be faithful"]'::jsonb, 'Worldly resources should be handled with foresight in light of eternal realities', 'Luke 16:8-12 uses the steward''s shrewdness to teach wise and faithful use of resources.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is Jesus teaching with the unjust steward in Luke 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 16, 3, 'Why is Abraham''s appeal to Moses and the prophets important in Luke 16?', '["It shows Scripture already gives sufficient light for repentance and obedience", "It means miracles are never valuable", "It denies resurrection altogether", "It limits revelation to Abraham''s family only"]'::jsonb, 'It shows Scripture already gives sufficient light for repentance and obedience', 'Luke 16:29-31 stresses the sufficiency of Moses and the prophets.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is Abraham''s appeal to Moses and the prophets important in Luke 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 16, 3, 'Why is the rich man condemned in Luke 16?', '["He ignored Lazarus and lived self-indulgently without regard for God or mercy", "He possessed money at all", "He had too many servants in his house", "He failed to offer Lazarus a job"]'::jsonb, 'He ignored Lazarus and lived self-indulgently without regard for God or mercy', 'Luke 16:19-25 contrasts the rich man''s luxury with Lazarus''s misery and his failure of mercy.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the rich man condemned in Luke 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 16, 4, 'How do the steward parable and the rich man and Lazarus fit together in Luke 16?', '["Both warn that present use of wealth has eternal significance", "One is about money and the other cancels that theme", "They address different audiences with no connection", "Only the rich man story concerns judgment"]'::jsonb, 'Both warn that present use of wealth has eternal significance', 'Luke 16 moves from stewardship sayings to a narrative picture of eternal reversal tied to wealth.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do the steward parable and the rich man and Lazarus fit together in Luke 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 16, 4, 'How does Luke 16 relate law, kingdom, and wealth?', '["The coming kingdom intensifies rather than weakens the call to faithful, heart-level obedience", "The law is irrelevant once the kingdom is preached", "Wealth replaces obedience to the law", "The kingdom and Scripture stand opposed"]'::jsonb, 'The coming kingdom intensifies rather than weakens the call to faithful, heart-level obedience', 'Luke 16:16-18 sits within a chapter stressing God''s enduring moral demand.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Luke 16 relate law, kingdom, and wealth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 16, 4, 'What larger vision of judgment and reversal does Luke 16 present?', '["Present status can be overturned forever, and neglected mercy is revealed in the age to come", "The poor are automatically righteous regardless of response", "Judgment can be avoided by signs from the dead", "Earthly suffering always means divine disfavor"]'::jsonb, 'Present status can be overturned forever, and neglected mercy is revealed in the age to come', 'Luke 16''s rich man and Lazarus scene dramatizes eschatological reversal.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger vision of judgment and reversal does Luke 16 present?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 16, 4, 'Why does Jesus mention the Pharisees being lovers of money in Luke 16?', '["It explains their resistance to his teaching and exposes their false piety", "It shows the disciples had already surpassed them completely", "It shifts the chapter away from money", "It proves the Pharisees were secretly supporting Lazarus"]'::jsonb, 'It explains their resistance to his teaching and exposes their false piety', 'Luke 16:14-15 says the Pharisees, who were lovers of money, ridiculed Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Jesus mention the Pharisees being lovers of money in Luke 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 16, 4, 'Why does the rich man and Lazarus story end with Moses and the prophets?', '["Scripture already gives sufficient warning, even if someone rose from the dead", "The dead can ordinarily evangelize the living", "Miracles matter more than revelation", "Lazarus returns home later to preach"]'::jsonb, 'Scripture already gives sufficient warning, even if someone rose from the dead', 'Luke 16:29-31 says if they do not hear Moses and the prophets, they will not be persuaded otherwise.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does the rich man and Lazarus story end with Moses and the prophets?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 16, 5, 'How does Luke 16 challenge self-justification?', '["It exposes how what is highly esteemed by people can be detestable before God", "Self-justification is harmless if one knows the law", "Only the rich are tempted to justify themselves", "The chapter avoids speaking about the heart"]'::jsonb, 'It exposes how what is highly esteemed by people can be detestable before God', 'Luke 16:15 directly challenges self-justification before others.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 16 challenge self-justification?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 16, 5, 'How does Luke 16 connect stewardship and final reversal?', '["Present use of wealth is tied to eternal accountability and the reversal of fortunes before God", "Money cancels the need for repentance", "Only parables matter, not real ethics", "The rich man is condemned merely for being successful"]'::jsonb, 'Present use of wealth is tied to eternal accountability and the reversal of fortunes before God', 'Luke 16 moves from shrewd stewardship sayings to the rich man and Lazarus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 16 connect stewardship and final reversal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 16, 5, 'How does Luke 16 deepen Luke''s broader concern with possessions?', '["It shows possessions are a decisive testing ground of the heart and of readiness for eternity", "It teaches possessions are evil substances in themselves", "It abandons the issue of wealth after the steward parable", "It treats money as important only for rulers"]'::jsonb, 'It shows possessions are a decisive testing ground of the heart and of readiness for eternity', 'Luke 16 extends Luke''s recurring focus on wealth, stewardship, and reversal.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 16 deepen Luke''s broader concern with possessions?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 16, 5, 'What does Luke 16 imply about true prudence?', '["Real prudence prepares for God''s future by using present resources faithfully now", "Prudence means preserving wealth at all costs", "Prudence is less important than social status", "Prudence depends on spectacular revelations from the dead"]'::jsonb, 'Real prudence prepares for God''s future by using present resources faithfully now', 'The steward''s shrewdness is redirected toward faithful, kingdom-minded stewardship.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Luke 16 imply about true prudence?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 16, 5, 'Why is the gap between Lazarus and the rich man after death so significant in Luke 16?', '["It shows that ignored moral realities become fixed and undeniable in final judgment", "It means prayer for mercy is always useless", "It denies God''s compassion after death to everyone", "It suggests social class remains unchanged forever"]'::jsonb, 'It shows that ignored moral realities become fixed and undeniable in final judgment', 'Luke 16:26 speaks of a great chasm fixed between the two conditions.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the gap between Lazarus and the rich man after death so significant in Luke 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 17, 1, 'How many lepers returned to give thanks in Luke 17?', '["One", "Ten", "Five", "None"]'::jsonb, 'One', 'Luke 17:15-18 says only one returned to give thanks.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'How many lepers returned to give thanks in Luke 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 17, 1, 'How many lepers were cleansed in Luke 17?', '["Ten", "One", "Seven", "Twelve"]'::jsonb, 'Ten', 'Luke 17:12-14 tells of ten lepers being cleansed.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'How many lepers were cleansed in Luke 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 17, 1, 'How many of the cleansed lepers returned to give thanks in Luke 17?', '["One", "Ten", "Five", "None"]'::jsonb, 'One', 'Luke 17:15-18 says only one returned to give thanks.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'How many of the cleansed lepers returned to give thanks in Luke 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 17, 1, 'How many times did Jesus say a brother might repent in one day and still be forgiven in Luke 17?', '["Seven times", "Three times", "Once only", "Seventy times seven"]'::jsonb, 'Seven times', 'Luke 17:4 says if he sins seven times and returns in repentance, you must forgive him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'How many times did Jesus say a brother might repent in one day and still be forgiven in Luke 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 17, 1, 'What did the apostles ask Jesus to increase in Luke 17?', '["Their faith", "Their wealth", "Their authority", "Their honor"]'::jsonb, 'Their faith', 'Luke 17:5 says the apostles asked, ''Increase our faith.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the apostles ask Jesus to increase in Luke 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 17, 2, 'What did Jesus say about the kingdom when asked by the Pharisees in Luke 17?', '["The kingdom of God is in the midst of you", "The kingdom will come only after Rome falls", "The kingdom is visible only in the temple", "The kingdom belongs only to the righteous"]'::jsonb, 'The kingdom of God is in the midst of you', 'Luke 17:21 says the kingdom of God is in the midst of you.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say about the kingdom when asked by the Pharisees in Luke 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 17, 2, 'What did Jesus say servants should call themselves after doing what was commanded in Luke 17?', '["Unworthy servants", "Faithful rulers", "Children of the kingdom", "Heirs of David"]'::jsonb, 'Unworthy servants', 'Luke 17:10 says, ''We are unworthy servants; we have only done what was our duty.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say servants should call themselves after doing what was commanded in Luke 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 17, 2, 'What illustration did Jesus use for even a tiny amount of faith in Luke 17?', '["A mustard seed telling a mulberry tree to be uprooted", "A lamp on a stand", "A grain harvest in a field", "A fig tree by the road"]'::jsonb, 'A mustard seed telling a mulberry tree to be uprooted', 'Luke 17:6 uses a mustard seed and a mulberry tree.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'What illustration did Jesus use for even a tiny amount of faith in Luke 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 17, 2, 'Who was the one leper who returned to glorify God in Luke 17?', '["A Samaritan", "A priest", "A Pharisee", "A Galilean fisherman"]'::jsonb, 'A Samaritan', 'Luke 17:16 identifies the thankful leper as a Samaritan.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'Who was the one leper who returned to glorify God in Luke 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 17, 2, 'Whom did Jesus tell his hearers to remember in Luke 17?', '["Lot''s wife", "Sarah", "Miriam", "Deborah"]'::jsonb, 'Lot''s wife', 'Luke 17:32 says, ''Remember Lot''s wife.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'Whom did Jesus tell his hearers to remember in Luke 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 17, 3, 'What does Jesus teach about the kingdom when asked by the Pharisees in Luke 17?', '["The kingdom is not coming with outward signs but is among them", "The kingdom will arrive only through Rome''s fall", "The kingdom is visible only in the temple", "The kingdom belongs only to Samaritans"]'::jsonb, 'The kingdom is not coming with outward signs but is among them', 'Luke 17:20-21 answers the Pharisees about the kingdom''s presence.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Jesus teach about the kingdom when asked by the Pharisees in Luke 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 17, 3, 'What does Jesus teach by speaking of Noah and Lot in Luke 17?', '["The day of the Son of Man will interrupt ordinary life with sudden judgment", "The kingdom comes only through flood and fire imagery", "Daily life is sinful in itself", "Judgment can be escaped by looking back"]'::jsonb, 'The day of the Son of Man will interrupt ordinary life with sudden judgment', 'Luke 17:26-30 compares the Son of Man''s day to Noah and Lot.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Jesus teach by speaking of Noah and Lot in Luke 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 17, 3, 'What is the point of the servant saying in Luke 17?', '["Obedience to God does not put him in our debt", "Servants should never expect reward from God", "Faithfulness is impossible for disciples", "Only masters matter in the kingdom"]'::jsonb, 'Obedience to God does not put him in our debt', 'Luke 17:7-10 emphasizes humble duty rather than entitlement.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the point of the servant saying in Luke 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 17, 3, 'Why does Jesus connect forgiveness and faith in Luke 17?', '["Kingdom life requires trusting obedience in relational mercy, not just abstract belief", "Faith replaces the need to forgive others", "Forgiveness belongs only to leaders", "The chapter treats faith and forgiveness as unrelated topics"]'::jsonb, 'Kingdom life requires trusting obedience in relational mercy, not just abstract belief', 'Luke 17 moves from repeated forgiveness to a discussion of faith and obedient service.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Jesus connect forgiveness and faith in Luke 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 17, 3, 'Why is the thankful leper''s identity as a Samaritan significant in Luke 17?', '["It highlights grateful faith appearing in an unexpected outsider", "It means the other nine were Gentiles", "It proves Samaritans were ritually superior to Jews", "It removes Israel from the story entirely"]'::jsonb, 'It highlights grateful faith appearing in an unexpected outsider', 'Luke 17:16-18 stresses that the returning leper was a Samaritan.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the thankful leper''s identity as a Samaritan significant in Luke 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 17, 4, 'How do repeated forgiveness, mustard-seed faith, and unworthy servants fit together in Luke 17?', '["They portray discipleship as humble, dependent obedience in everyday kingdom life", "They are separate sayings without common direction", "They cancel one another out", "They apply only to apostles after Pentecost"]'::jsonb, 'They portray discipleship as humble, dependent obedience in everyday kingdom life', 'Luke 17 threads together mercy, faith, and humble service as one way of life.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do repeated forgiveness, mustard-seed faith, and unworthy servants fit together in Luke 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 17, 4, 'How does Luke 17 warn against divided allegiance?', '["The examples of Lot''s wife and gaining-losing life warn against clinging to the old world", "Only Samaritans face that danger", "The warning applies only during Noah''s flood", "Allegiance is treated as a private feeling only"]'::jsonb, 'The examples of Lot''s wife and gaining-losing life warn against clinging to the old world', 'Luke 17:31-33 warns against turning back and trying to preserve one''s life wrongly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Luke 17 warn against divided allegiance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 17, 4, 'What larger vision of the kingdom appears in Luke 17?', '["The kingdom is already present in Jesus yet will also be revealed decisively in the future", "The kingdom is only inward and never future", "The kingdom is only future and absent from Jesus''s ministry", "The kingdom belongs only to those who avoid suffering"]'::jsonb, 'The kingdom is already present in Jesus yet will also be revealed decisively in the future', 'Luke 17 holds together present and future dimensions of the kingdom.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger vision of the kingdom appears in Luke 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 17, 4, 'Why does Jesus move from the ten lepers to teaching on the coming kingdom in Luke 17?', '["The present experience of healing and gratitude points toward the larger reality of God''s reign and final revelation", "The healed lepers immediately become apostles", "The kingdom topic interrupts the narrative accidentally", "Thanksgiving is unrelated to eschatology"]'::jsonb, 'The present experience of healing and gratitude points toward the larger reality of God''s reign and final revelation', 'Luke 17 joins present signs of God''s work with teaching on the coming of the Son of Man.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Jesus move from the ten lepers to teaching on the coming kingdom in Luke 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 17, 4, 'Why does Jesus say ''Remember Lot''s wife'' in Luke 17?', '["Disciples must not cling backward when God''s judgment and salvation are at hand", "Salt is the main symbol of the kingdom", "Sodom will be rebuilt in the last days", "Lot''s wife serves as an example of successful escape"]'::jsonb, 'Disciples must not cling backward when God''s judgment and salvation are at hand', 'Luke 17:31-32 warns against turning back in the day of the Son of Man.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Jesus say ''Remember Lot''s wife'' in Luke 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 17, 5, 'How does Luke 17 connect gratitude and salvation?', '["The returning leper shows that true faith not only receives mercy but returns in worshipful gratitude", "Gratitude replaces faith entirely", "Salvation belongs equally to all ten in the same way without distinction", "Thanksgiving is only a social courtesy"]'::jsonb, 'The returning leper shows that true faith not only receives mercy but returns in worshipful gratitude', 'Luke 17:15-19 highlights gratitude as the fitting expression of saving faith.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 17 connect gratitude and salvation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 17, 5, 'How does Luke 17 connect ordinary obedience with eschatological readiness?', '["It joins repeated forgiveness, humble service, gratitude, and alertness for the Son of Man", "Only miraculous faith matters for the future", "Readiness makes daily obedience unnecessary", "The kingdom cancels all human responsibility"]'::jsonb, 'It joins repeated forgiveness, humble service, gratitude, and alertness for the Son of Man', 'Luke 17 spans forgiveness, servant humility, thankful faith, and the coming days of the Son of Man.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 17 connect ordinary obedience with eschatological readiness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 17, 5, 'How does Luke 17 portray discipleship between the times?', '["Disciples live in forgiving humility under a kingdom already present while awaiting its full unveiling", "They must withdraw from ordinary life entirely", "They should ignore future judgment as irrelevant", "They receive mercy but are not called to obedience"]'::jsonb, 'Disciples live in forgiving humility under a kingdom already present while awaiting its full unveiling', 'Luke 17 combines everyday obedience with eschatological expectancy.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 17 portray discipleship between the times?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 17, 5, 'What does Luke 17 imply about readiness for the day of the Son of Man?', '["Readiness requires mercy, humble obedience, gratitude, and freedom from backward-looking attachment", "Readiness comes from tracking dates precisely", "Readiness is mainly social privilege", "Readiness matters only for public leaders"]'::jsonb, 'Readiness requires mercy, humble obedience, gratitude, and freedom from backward-looking attachment', 'The chapter''s ethical teachings prepare for its eschatological warning.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Luke 17 imply about readiness for the day of the Son of Man?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 17, 5, 'Why is the phrase ''the kingdom of God is in the midst of you'' so important in Luke 17?', '["It locates God''s reign in relation to Jesus''s present ministry even while future consummation remains ahead", "It means the kingdom is purely private emotion", "It denies any future coming of the Son of Man", "It refers only to the Pharisees'' inner lives"]'::jsonb, 'It locates God''s reign in relation to Jesus''s present ministry even while future consummation remains ahead', 'Luke 17 balances present kingdom presence with future Son of Man revelation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the phrase ''the kingdom of God is in the midst of you'' so important in Luke 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 18, 1, 'What did Jesus say people must receive like a child in Luke 18?', '["The kingdom of God", "The law of Moses", "The temple tax", "A prophet''s reward"]'::jsonb, 'The kingdom of God', 'Luke 18:17 says the kingdom must be received like a child.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say people must receive like a child in Luke 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 18, 1, 'What did the blind beggar cry out to Jesus in Luke 18?', '["Jesus, Son of David, have mercy on me", "Teacher, explain the law", "Lord, send fire from heaven", "Remember my offering"]'::jsonb, 'Jesus, Son of David, have mercy on me', 'Luke 18:38 records the blind man''s cry.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the blind beggar cry out to Jesus in Luke 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 18, 1, 'What did the tax collector say in Jesus''s parable in Luke 18?', '["God, be merciful to me, a sinner", "I thank you that I am not like other men", "Lord, remember my offerings", "Judge my neighbor first"]'::jsonb, 'God, be merciful to me, a sinner', 'Luke 18:13 records the tax collector''s prayer.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the tax collector say in Jesus''s parable in Luke 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 18, 1, 'Who kept coming to the judge in Luke 18?', '["A widow", "A Pharisee", "A blind man", "A ruler"]'::jsonb, 'A widow', 'Luke 18:3 says a widow kept coming to the judge.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who kept coming to the judge in Luke 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 18, 1, 'Who went home justified in Jesus''s parable in Luke 18?', '["The tax collector", "The Pharisee", "Both men equally", "Neither man"]'::jsonb, 'The tax collector', 'Luke 18:14 says the tax collector went down to his house justified rather than the Pharisee.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who went home justified in Jesus''s parable in Luke 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 18, 2, 'What did Jesus say is easier than for a rich person to enter the kingdom in Luke 18?', '["For a camel to go through a needle''s eye", "For a mountain to move", "For a raven to sow seed", "For a judge to fear God"]'::jsonb, 'For a camel to go through a needle''s eye', 'Luke 18:25 uses that comparison.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say is easier than for a rich person to enter the kingdom in Luke 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 18, 2, 'What did Jesus say is impossible with men but possible with God in Luke 18?', '["Salvation", "Resurrection", "Prayer", "Travel to Jerusalem"]'::jsonb, 'Salvation', 'Luke 18:27 says what is impossible with men is possible with God.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say is impossible with men but possible with God in Luke 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 18, 2, 'What did Jesus say people must be like to receive the kingdom in Luke 18?', '["Like a little child", "Like a rich ruler", "Like a Pharisee", "Like a Roman centurion only"]'::jsonb, 'Like a little child', 'Luke 18:17 says whoever does not receive the kingdom like a child shall not enter it.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say people must be like to receive the kingdom in Luke 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 18, 2, 'What did Jesus say the rich ruler still lacked in Luke 18?', '["To sell all, distribute to the poor, and follow him", "To fast twice a week", "To become a priest", "To leave Jericho immediately"]'::jsonb, 'To sell all, distribute to the poor, and follow him', 'Luke 18:22 gives this command to the rich ruler.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say the rich ruler still lacked in Luke 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 18, 2, 'What did Jesus tell the disciples God would do for his elect in Luke 18?', '["Give them justice speedily", "Remove all earthly trials at once", "Make them rulers over Israel immediately", "Keep them from ever suffering loss"]'::jsonb, 'Give them justice speedily', 'Luke 18:7-8 says God will give justice to his elect speedily.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus tell the disciples God would do for his elect in Luke 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 18, 3, 'What does the healing of the blind beggar reveal in Luke 18?', '["Faith recognizes Jesus rightly and follows him openly", "Sight comes only through ritual washing", "Crowds always support true faith", "The blind man asks only for money"]'::jsonb, 'Faith recognizes Jesus rightly and follows him openly', 'Luke 18:35-43 shows Bartimaeus-like faith leading to sight and following.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the healing of the blind beggar reveal in Luke 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 18, 3, 'What is the point of the persistent widow parable in Luke 18?', '["Disciples should pray and not lose heart because God will hear his people", "God is like an unjust judge in every respect", "Prayer changes God''s character", "Justice comes only through persistence without faith"]'::jsonb, 'Disciples should pray and not lose heart because God will hear his people', 'Luke 18:1 gives the purpose: always pray and not lose heart.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the point of the persistent widow parable in Luke 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 18, 3, 'Why does Luke place the child saying next to the rich ruler story in chapter 18?', '["It contrasts dependent reception of the kingdom with possessive self-sufficiency", "Children and rulers share the same spiritual posture", "The rich ruler is praised for childlike humility", "The child saying applies only to families"]'::jsonb, 'It contrasts dependent reception of the kingdom with possessive self-sufficiency', 'Luke 18:15-30 juxtaposes childlike reception with the ruler''s attachment to wealth.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Luke place the child saying next to the rich ruler story in chapter 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 18, 3, 'Why is the persistent widow parable given in Luke 18?', '["To teach that people ought always to pray and not lose heart", "To show unjust judges are models for disciples", "To explain temple court procedure", "To discourage public prayer"]'::jsonb, 'To teach that people ought always to pray and not lose heart', 'Luke 18:1 gives the purpose of the parable directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the persistent widow parable given in Luke 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 18, 3, 'Why is the tax collector''s prayer in Luke 18 so important?', '["It models humble dependence on mercy rather than self-righteous comparison", "It shows the tax collector had mastered the law", "It proves temple prayer is unnecessary", "It means confession earns salvation automatically"]'::jsonb, 'It models humble dependence on mercy rather than self-righteous comparison', 'Luke 18:13-14 contrasts the tax collector''s plea for mercy with the Pharisee''s self-confidence.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the tax collector''s prayer in Luke 18 so important?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 18, 4, 'How do the widow, tax collector, children, rich ruler, and blind beggar fit together in Luke 18?', '["They show the kingdom belongs to the dependent, humble, and trusting rather than the self-assured", "They are unrelated episodes about prayer and travel", "The chapter mainly praises social status", "The rich ruler becomes the model disciple"]'::jsonb, 'They show the kingdom belongs to the dependent, humble, and trusting rather than the self-assured', 'Luke 18 consistently favors humble dependence over self-confidence and wealth.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do the widow, tax collector, children, rich ruler, and blind beggar fit together in Luke 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 18, 4, 'How does Luke 18 deepen the meaning of justification?', '["Justification belongs to the humble sinner pleading for mercy, not the self-exalting religious performer", "Justification comes through public success and fasting", "Justification is automatic for Israel''s leaders", "Justification is earned by almsgiving alone"]'::jsonb, 'Justification belongs to the humble sinner pleading for mercy, not the self-exalting religious performer', 'Luke 18:14 places justification with the humble tax collector.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Luke 18 deepen the meaning of justification?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 18, 4, 'What does the rich ruler story reveal about salvation in Luke 18?', '["What is impossible with humans is possible with God", "Moral law-keeping alone secures eternal life", "Selling possessions earns merit automatically", "Children and rulers enter the kingdom by the same status"]'::jsonb, 'What is impossible with humans is possible with God', 'Luke 18:24-27 climaxes with Jesus saying what is impossible with men is possible with God.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does the rich ruler story reveal about salvation in Luke 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 18, 4, 'What larger picture of prayer emerges in Luke 18?', '["Prayer is persistent trust that rests in God''s justice rather than in human merit", "Prayer works only if one is socially important", "Prayer belongs mainly to temple professionals", "Prayer is replaced by kingdom action later in the chapter"]'::jsonb, 'Prayer is persistent trust that rests in God''s justice rather than in human merit', 'Luke 18 begins with the widow and the tax collector, two portraits of dependent prayer.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger picture of prayer emerges in Luke 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 18, 4, 'Why is the disciples'' confusion after Jesus predicts his suffering important in Luke 18?', '["It shows that kingdom understanding still depends on revelation, even for insiders", "It means Jesus had spoken unclearly by mistake", "It proves the passion predictions are symbolic only", "It ends the disciples'' role in the story"]'::jsonb, 'It shows that kingdom understanding still depends on revelation, even for insiders', 'Luke 18:31-34 notes that the disciples did not understand these things.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is the disciples'' confusion after Jesus predicts his suffering important in Luke 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 18, 5, 'How does Luke 18 connect mercy, faith, and discipleship?', '["Those who cry for mercy and trust Jesus are the ones who are justified, healed, and able to follow", "Mercy replaces faith and obedience", "Discipleship belongs mainly to the socially successful", "Faith matters only for miracles, not salvation"]'::jsonb, 'Those who cry for mercy and trust Jesus are the ones who are justified, healed, and able to follow', 'Across Luke 18, mercy received by faith leads into kingdom life and following.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 18 connect mercy, faith, and discipleship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 18, 5, 'How does Luke 18 hold together prayer, humility, dependence, and sight?', '["Those justified by mercy and receiving the kingdom like children are the ones truly prepared to follow Jesus", "Persistence removes the need for humility", "The blind beggar is a side issue unrelated to faith", "The chapter praises religious self-confidence"]'::jsonb, 'Those justified by mercy and receiving the kingdom like children are the ones truly prepared to follow Jesus', 'Luke 18 moves from persistent prayer and humble justification to childlike reception and Bartimaeus-like faith.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 18 hold together prayer, humility, dependence, and sight?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 18, 5, 'How does Luke 18 portray entry into the kingdom?', '["It comes through humble, childlike dependence on God''s mercy and power", "It is secured by status, wealth, and public virtue", "It belongs first to those who justify themselves", "It depends on understanding everything before following"]'::jsonb, 'It comes through humble, childlike dependence on God''s mercy and power', 'Luke 18 repeatedly centers humility, dependence, and divine possibility.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 18 portray entry into the kingdom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 18, 5, 'What does Luke 18 imply about wealth and salvation?', '["Wealth is spiritually dangerous because it can resist the dependence the kingdom requires", "Wealth makes salvation impossible for every rich person without exception", "Poverty itself saves automatically", "Possessions are unrelated to discipleship"]'::jsonb, 'Wealth is spiritually dangerous because it can resist the dependence the kingdom requires', 'Luke 18:24-27 warns about riches while still affirming God''s power to save.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Luke 18 imply about wealth and salvation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 18, 5, 'Why is Bartimaeus an apt closing figure for Luke 18?', '["He embodies the seeing faith that many insiders still lack and follows Jesus on the way", "He replaces the Twelve as the main disciple group", "He asks for power rather than mercy", "He returns home instead of following"]'::jsonb, 'He embodies the seeing faith that many insiders still lack and follows Jesus on the way', 'Luke 18 ends with the blind man seeing, glorifying God, and following Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Bartimaeus an apt closing figure for Luke 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 19, 1, 'What animal did Jesus ride into Jerusalem in Luke 19?', '["A colt", "A horse", "A camel", "A donkey with a rider already on it"]'::jsonb, 'A colt', 'Luke 19:30-35 says Jesus rode on a colt.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'What animal did Jesus ride into Jerusalem in Luke 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 19, 1, 'What did Jesus say the stones would do in Luke 19 if the disciples were silent?', '["Cry out", "Fall from the walls", "Become bread", "Block the road"]'::jsonb, 'Cry out', 'Luke 19:40 says if these were silent, the stones would cry out.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say the stones would do in Luke 19 if the disciples were silent?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 19, 1, 'What did Zacchaeus say he would give to the poor in Luke 19?', '["Half of his goods", "A tenth of his goods", "All of his goods", "Two coins"]'::jsonb, 'Half of his goods', 'Luke 19:8 says Zacchaeus would give half of his goods to the poor.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Zacchaeus say he would give to the poor in Luke 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 19, 1, 'What kind of tree did Zacchaeus climb in Luke 19?', '["A sycamore tree", "An olive tree", "A fig tree", "A cedar tree"]'::jsonb, 'A sycamore tree', 'Luke 19:4 says Zacchaeus climbed a sycamore tree to see Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'What kind of tree did Zacchaeus climb in Luke 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 19, 1, 'Who climbed a sycamore tree to see Jesus in Luke 19?', '["Zacchaeus", "Levi", "Simeon", "Bartimaeus"]'::jsonb, 'Zacchaeus', 'Luke 19:2-4 says Zacchaeus climbed a sycamore tree to see Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who climbed a sycamore tree to see Jesus in Luke 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 19, 2, 'What did Jesus say had come to Zacchaeus''s house in Luke 19?', '["Salvation", "Judgment only", "The kingdom in parable form", "A prophet''s reward"]'::jsonb, 'Salvation', 'Luke 19:9 says, ''Today salvation has come to this house.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say had come to Zacchaeus''s house in Luke 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 19, 2, 'What did Jesus say had come to Zacchaeus''s house in Luke 19?', '["Salvation", "Judgment", "The kingdom''s delay", "A prophet''s reward"]'::jsonb, 'Salvation', 'Luke 19:9 says salvation had come to Zacchaeus''s house.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say had come to Zacchaeus''s house in Luke 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 19, 2, 'What did the nobleman tell his servants to do with the mina in Luke 19?', '["Engage in business until I come", "Hide it safely underground", "Bring it back untouched", "Give it all away immediately"]'::jsonb, 'Engage in business until I come', 'Luke 19:13 says, ''Engage in business until I come.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the nobleman tell his servants to do with the mina in Luke 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 19, 2, 'What title did the crowd cry out for Jesus in Luke 19 as he entered Jerusalem?', '["The King who comes in the name of the Lord", "The prophet from Nazareth", "Son of Abraham", "Teacher of Israel"]'::jsonb, 'The King who comes in the name of the Lord', 'Luke 19:38 records that acclamation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'What title did the crowd cry out for Jesus in Luke 19 as he entered Jerusalem?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 19, 2, 'Why did Jesus weep over Jerusalem in Luke 19?', '["It did not know the things that made for peace", "The city lacked enough pilgrims", "Rome had already destroyed it", "The disciples wanted to leave too soon"]'::jsonb, 'It did not know the things that made for peace', 'Luke 19:41-42 says Jesus wept because Jerusalem did not know the things for peace.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why did Jesus weep over Jerusalem in Luke 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 19, 3, 'What does Jesus''s lament over Jerusalem reveal in Luke 19?', '["His kingship is marked by grief over a city blind to peace", "He rejoices in the city''s coming downfall only", "He has no concern for Jerusalem''s future", "He speaks only of political loss"]'::jsonb, 'His kingship is marked by grief over a city blind to peace', 'Luke 19:41-44 combines royal entry with tears over Jerusalem.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Jesus''s lament over Jerusalem reveal in Luke 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 19, 3, 'What is the point of the parable of the minas in Luke 19?', '["Disciples are accountable for faithful stewardship while awaiting the king''s return", "Everyone receives equal reward regardless of response", "The kingdom arrives immediately without delay", "The safest path is to hide what is entrusted"]'::jsonb, 'Disciples are accountable for faithful stewardship while awaiting the king''s return', 'Luke 19:11-27 addresses faithfulness while the king is away.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the point of the parable of the minas in Luke 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 19, 3, 'What is the point of the parable of the pounds in Luke 19?', '["Servants are accountable for faithful use of what the master entrusts while he is away", "All servants receive the same reward regardless of response", "The kingdom comes immediately without delay", "Faithfulness means hiding what is given"]'::jsonb, 'Servants are accountable for faithful use of what the master entrusts while he is away', 'Luke 19:11-27 addresses stewardship while the king is away.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the point of the parable of the pounds in Luke 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 19, 3, 'Why is Zacchaeus significant in Luke 19?', '["He shows salvation reaching a wealthy, compromised outsider through joyful repentance", "He proves tax collectors are naturally righteous", "He remains unchanged after seeing Jesus", "He replaces Levi as an apostle"]'::jsonb, 'He shows salvation reaching a wealthy, compromised outsider through joyful repentance', 'Luke 19:1-10 presents Zacchaeus as a transformed recipient of salvation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is Zacchaeus significant in Luke 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 19, 3, 'Why is the triumphal entry important in Luke 19?', '["Jesus openly receives kingly acclamation while moving toward the city that will reject him", "It ends all tension with the Pharisees", "It reveals Jesus as a military conqueror", "It replaces the need for lament"]'::jsonb, 'Jesus openly receives kingly acclamation while moving toward the city that will reject him', 'Luke 19:28-40 presents royal entry amid rising conflict.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the triumphal entry important in Luke 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 19, 4, 'How do Zacchaeus, the minas, and the triumphal entry fit together in Luke 19?', '["Salvation, stewardship, and kingship all converge as Jesus moves decisively toward Jerusalem", "They are unrelated travel stories", "The triumphal entry cancels the lessons on stewardship", "Zacchaeus and the king in the parable represent the same role"]'::jsonb, 'Salvation, stewardship, and kingship all converge as Jesus moves decisively toward Jerusalem', 'Luke 19 presents Jesus saving, teaching accountability, and entering as king.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do Zacchaeus, the minas, and the triumphal entry fit together in Luke 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 19, 4, 'How does Luke 19 portray response to Jesus?', '["Some receive him with joy and bear fruit, while others resist his kingship or neglect their trust", "Everyone in the chapter responds positively", "Only Jerusalem rejects him while all others stay neutral", "Stewardship is unrelated to response"]'::jsonb, 'Some receive him with joy and bear fruit, while others resist his kingship or neglect their trust', 'The chapter contrasts Zacchaeus, faithful servants, hostile citizens, and resistant Jerusalem.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Luke 19 portray response to Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 19, 4, 'What larger picture of Jesus emerges in Luke 19?', '["He is the seeking Savior, demanding king, and grieving prophet over Jerusalem", "He is only a political reformer", "He avoids public claims to kingship", "He limits his concern to individual conversions"]'::jsonb, 'He is the seeking Savior, demanding king, and grieving prophet over Jerusalem', 'Luke 19 brings together salvation for Zacchaeus, accountability in the parable, and royal lament.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger picture of Jesus emerges in Luke 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 19, 4, 'Why does Jesus weep over Jerusalem in Luke 19?', '["The city did not know the things that made for peace in its visitation", "Its walls were already destroyed that day", "The disciples wanted to leave too soon", "The temple had stopped receiving sacrifices"]'::jsonb, 'The city did not know the things that made for peace in its visitation', 'Luke 19:41-44 says Jesus wept because Jerusalem did not know the things for peace.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Jesus weep over Jerusalem in Luke 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 19, 4, 'Why is ''today'' important in the Zacchaeus story in Luke 19?', '["It highlights the immediacy of salvation in Jesus''s presence", "It simply records the time of day", "It signals the end of all future hope", "It refers to the next feast in Jerusalem"]'::jsonb, 'It highlights the immediacy of salvation in Jesus''s presence', 'Luke 19:5 and 19:9 emphasize ''today'' in relation to Jesus''s visit and salvation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is ''today'' important in the Zacchaeus story in Luke 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 19, 5, 'How does Luke 19 connect joy and judgment?', '["Joy surrounds salvation and royal praise, yet judgment falls on refusal, negligence, and blindness", "Judgment disappears once joy is present", "Only joy matters in the chapter", "Judgment is reserved for outsiders and not God''s people"]'::jsonb, 'Joy surrounds salvation and royal praise, yet judgment falls on refusal, negligence, and blindness', 'Luke 19 combines celebration, accountability, and lament in one chapter.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 19 connect joy and judgment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 19, 5, 'How does Luke 19 deepen the theme of peace?', '["The king who is praised for peace also weeps because the city does not know the way of peace", "Peace is treated as a private emotion only", "Peace belongs only to Zacchaeus''s house", "The chapter abandons peace language after the parable"]'::jsonb, 'The king who is praised for peace also weeps because the city does not know the way of peace', 'Luke 19:38 and 19:42 connect praise and lament through the theme of peace.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 19 deepen the theme of peace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 19, 5, 'How does Luke 19 present Jesus as both Savior and king?', '["He brings salvation to Zacchaeus and enters Jerusalem in royal humility while lamenting its blindness", "He offers private salvation only with no public kingship", "Kingship replaces concern for sinners", "Jerusalem receives him without tension"]'::jsonb, 'He brings salvation to Zacchaeus and enters Jerusalem in royal humility while lamenting its blindness', 'Luke 19 joins household salvation, the minas parable, triumphal entry, and lament.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 19 present Jesus as both Savior and king?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 19, 5, 'What does Luke 19 imply about faithful discipleship during the king''s absence?', '["Faithful discipleship actively uses entrusted gifts in loyalty to the coming king", "The safest route is preserving what was given without risk", "Only public rulers are accountable", "The king does not care what happens while he is away"]'::jsonb, 'Faithful discipleship actively uses entrusted gifts in loyalty to the coming king', 'The minas parable in Luke 19 emphasizes active, accountable faithfulness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Luke 19 imply about faithful discipleship during the king''s absence?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 19, 5, 'Why is the Son of Man statement about seeking and saving the lost so central in Luke 19?', '["It interprets Zacchaeus and clarifies Jesus''s mission in one sentence", "It refers only to the parable of the minas", "It limits salvation to Israel''s rich", "It postpones Jesus''s mission until after Jerusalem"]'::jsonb, 'It interprets Zacchaeus and clarifies Jesus''s mission in one sentence', 'Luke 19:10 gives a mission statement that explains the Zacchaeus episode.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the Son of Man statement about seeking and saving the lost so central in Luke 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 20, 1, 'How did Jesus describe God in answer to the Sadducees in Luke 20?', '["God of the living", "God of the dead", "God of the temple only", "God of the scribes"]'::jsonb, 'God of the living', 'Luke 20:38 says God is not God of the dead, but of the living.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'How did Jesus describe God in answer to the Sadducees in Luke 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 20, 1, 'What counter-question did Jesus use when his authority was challenged in Luke 20?', '["Was John''s baptism from heaven or from men?", "Who built the temple?", "Whose image is on the coin?", "Why did David write the Psalms?"]'::jsonb, 'Was John''s baptism from heaven or from men?', 'Luke 20:3-4 answers the leaders with a question about John''s baptism.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'What counter-question did Jesus use when his authority was challenged in Luke 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 20, 1, 'What did Jesus say should be rendered to God in Luke 20?', '["The things that are God''s", "Only temple offerings", "The vineyard''s fruit", "Nothing at all"]'::jsonb, 'The things that are God''s', 'Luke 20:25 says to render to God the things that are God''s.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say should be rendered to God in Luke 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 20, 1, 'What did the tenants do to the vineyard owner''s beloved son in Luke 20?', '["They killed him", "They crowned him king", "They sent him away unharmed", "They hid him in the vineyard"]'::jsonb, 'They killed him', 'Luke 20:14-15 says the tenants cast out and killed the beloved son.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the tenants do to the vineyard owner''s beloved son in Luke 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 20, 1, 'What question did Jesus ask in response to the leaders questioning his authority in Luke 20?', '["Whether John''s baptism was from heaven or from men", "What Caesar''s image was on a coin", "Who built the temple", "Whether David wrote the Psalms"]'::jsonb, 'Whether John''s baptism was from heaven or from men', 'Luke 20:3-4 answers their challenge with a question about John''s baptism.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'What question did Jesus ask in response to the leaders questioning his authority in Luke 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 20, 2, 'What answer did the leaders give Jesus about John''s baptism in Luke 20?', '["They said they did not know where it came from", "They said it was from heaven", "They said it was from men", "They refused to speak at all"]'::jsonb, 'They said they did not know where it came from', 'Luke 20:7 says they answered that they did not know where it came from.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'What answer did the leaders give Jesus about John''s baptism in Luke 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 20, 2, 'What did Jesus say should be rendered to Caesar in Luke 20?', '["The things that are Caesar''s", "Nothing at all", "Only temple taxes", "The vineyard''s fruit"]'::jsonb, 'The things that are Caesar''s', 'Luke 20:25 says to render to Caesar what is Caesar''s and to God what is God''s.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say should be rendered to Caesar in Luke 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 20, 2, 'What did Jesus warn the people about concerning the scribes in Luke 20?', '["They loved honor and devoured widows'' houses", "They failed to fast enough", "They refused all public prayer", "They accepted too many Gentiles"]'::jsonb, 'They loved honor and devoured widows'' houses', 'Luke 20:46-47 warns against the scribes'' hypocrisy and exploitation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus warn the people about concerning the scribes in Luke 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 20, 2, 'What image was on the denarius in Luke 20?', '["Caesar''s image and inscription", "David''s seal", "The temple lampstand", "Abraham''s mark"]'::jsonb, 'Caesar''s image and inscription', 'Luke 20:24 points to the image and inscription on the coin.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'What image was on the denarius in Luke 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 20, 2, 'What psalm-like argument did Jesus use in Luke 20 to question the leaders?', '["If David calls him Lord, how is he his son?", "How can Jonah be a sign to Nineveh?", "Why did Moses lift up the serpent?", "Who among you convicts me of sin?"]'::jsonb, 'If David calls him Lord, how is he his son?', 'Luke 20:41-44 asks how the Christ can be only David''s son if David calls him Lord.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'What psalm-like argument did Jesus use in Luke 20 to question the leaders?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 20, 3, 'What do the warnings about the scribes reveal in Luke 20?', '["Religious status can hide greed, vanity, and judgment-worthy hypocrisy", "Public prayer is always wrong", "Long robes are inherently sinful", "Widows should avoid the temple entirely"]'::jsonb, 'Religious status can hide greed, vanity, and judgment-worthy hypocrisy', 'Luke 20:45-47 exposes the scribes'' love of honor and exploitation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'What do the warnings about the scribes reveal in Luke 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 20, 3, 'What does the coin question reveal about Jesus''s wisdom in Luke 20?', '["He avoids the trap by affirming proper obligations to both Caesar and God", "He chooses Rome over God", "He refuses all political questions as irrelevant", "He answers only with silence"]'::jsonb, 'He avoids the trap by affirming proper obligations to both Caesar and God', 'Luke 20:20-26 shows Jesus answering with remarkable wisdom and leaving them amazed.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the coin question reveal about Jesus''s wisdom in Luke 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 20, 3, 'What is the force of the vineyard parable in Luke 20?', '["The leaders are rejecting God''s beloved Son and stand under judgment", "The vineyard owner is unjust to his workers", "The crowd is condemned for listening to Jesus", "The parable is mainly about land ownership laws"]'::jsonb, 'The leaders are rejecting God''s beloved Son and stand under judgment', 'Luke 20:9-19 exposes the leaders through the parable of the tenants.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the force of the vineyard parable in Luke 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 20, 3, 'Why is Jesus''s answer to the Sadducees important in Luke 20?', '["He roots resurrection hope in Scripture and in the living God", "He changes the subject away from resurrection", "He says marriage continues unchanged forever", "He appeals only to popular opinion"]'::jsonb, 'He roots resurrection hope in Scripture and in the living God', 'Luke 20:34-38 answers from the nature of resurrection and God''s covenant identity.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is Jesus''s answer to the Sadducees important in Luke 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 20, 3, 'Why is the parable of the vineyard tenants so sharp in Luke 20?', '["It portrays Israel''s leaders as rejecting God''s messengers and ultimately his beloved Son", "It primarily teaches vineyard management", "It predicts the disciples will abandon Jesus", "It says the vineyard owner was unjust from the start"]'::jsonb, 'It portrays Israel''s leaders as rejecting God''s messengers and ultimately his beloved Son', 'Luke 20:9-19 directly exposes the leaders through the tenants'' violence.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the parable of the vineyard tenants so sharp in Luke 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 20, 4, 'How do the authority question, vineyard parable, and coin question fit together in Luke 20?', '["Jesus exposes the leaders'' rejection of God while displaying unmatched wisdom under challenge", "They are unrelated debates collected by chance", "Only the coin question concerns the leaders", "The vineyard parable softens the conflict"]'::jsonb, 'Jesus exposes the leaders'' rejection of God while displaying unmatched wisdom under challenge', 'Luke 20 builds sustained conflict through challenge, parable, and debate.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do the authority question, vineyard parable, and coin question fit together in Luke 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 20, 4, 'How does Jesus answer the Sadducees on resurrection in Luke 20?', '["He shows that God is God of the living and that resurrection life transcends earthly marriage patterns", "He denies resurrection entirely", "He postpones the question to after Passover", "He uses only philosophical reasoning with no Scripture"]'::jsonb, 'He shows that God is God of the living and that resurrection life transcends earthly marriage patterns', 'Luke 20:34-38 answers the Sadducees with both resurrection life and the God of Abraham argument.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Jesus answer the Sadducees on resurrection in Luke 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 20, 4, 'How does Luke 20 portray the leaders'' spiritual condition?', '["They are evasive, threatened by truth, and resistant to God''s beloved Son", "They are humble seekers needing only more time", "They understand Jesus fully but disagree politically", "They respond positively to every answer"]'::jsonb, 'They are evasive, threatened by truth, and resistant to God''s beloved Son', 'Across Luke 20, the leaders refuse straightforward response and seek to trap Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Luke 20 portray the leaders'' spiritual condition?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 20, 4, 'What larger portrait of Jesus emerges in Luke 20?', '["He is the authoritative teacher, beloved Son, and Lord who unmasks false religion", "He is mainly a political strategist", "He avoids confrontation whenever possible", "He answers only with parables and not Scripture"]'::jsonb, 'He is the authoritative teacher, beloved Son, and Lord who unmasks false religion', 'Luke 20 presents Jesus answering every challenge with truth and authority.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger portrait of Jesus emerges in Luke 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 20, 4, 'Why is the ''stone the builders rejected'' image significant in Luke 20?', '["It interprets the rejected Son as the central stone in God''s purpose", "It predicts only the destruction of the temple buildings", "It refers only to David''s military rule", "It means the leaders will later honor Jesus"]'::jsonb, 'It interprets the rejected Son as the central stone in God''s purpose', 'Luke 20:17 applies Psalm language to the son rejected by the leaders.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is the ''stone the builders rejected'' image significant in Luke 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 20, 5, 'How does Luke 20 connect Scripture and authority?', '["Jesus''s authority is displayed through his faithful interpretation of John, the Psalms, and resurrection hope", "Authority replaces the need for Scripture", "Scripture belongs mainly to the leaders, not Jesus", "The chapter sets authority and Scripture against each other"]'::jsonb, 'Jesus''s authority is displayed through his faithful interpretation of John, the Psalms, and resurrection hope', 'Luke 20 repeatedly shows Jesus answering from Scripture and prophetic logic.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 20 connect Scripture and authority?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 20, 5, 'How does Luke 20 deepen Luke''s critique of false religion?', '["It shows false religion as self-protective, self-exalting, and hostile to God''s purposes in Jesus", "It criticizes only Rome and leaves religion untouched", "It portrays all religious teachers as identical", "It suggests religious hypocrisy is a minor issue"]'::jsonb, 'It shows false religion as self-protective, self-exalting, and hostile to God''s purposes in Jesus', 'Luke 20 combines exploitation, evasiveness, and opposition to the Son in one critique.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 20 deepen Luke''s critique of false religion?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 20, 5, 'How does Luke 20 present Jesus in relation to Israel''s leaders and Scriptures?', '["He exposes hostile leaders while interpreting Scripture with unanswerable wisdom", "He submits every question back to the elders", "He avoids messianic claims entirely", "He rejects the authority of the Psalms"]'::jsonb, 'He exposes hostile leaders while interpreting Scripture with unanswerable wisdom', 'Luke 20 moves from authority challenges to Scripture-saturated answers and warnings.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 20 present Jesus in relation to Israel''s leaders and Scriptures?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 20, 5, 'What does Luke 20 imply about rejecting Jesus?', '["Rejecting him is rejecting God''s climactic self-disclosure and invites judgment", "It is a neutral intellectual disagreement", "It matters only to the leaders and not to others", "Rejection can be offset by public honor and religious dress"]'::jsonb, 'Rejecting him is rejecting God''s climactic self-disclosure and invites judgment', 'The beloved son parable and the rejected stone image both sharpen the gravity of refusal.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Luke 20 imply about rejecting Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 20, 5, 'Why is Jesus''s question about David''s Lord so significant in Luke 20?', '["It shows the Messiah is greater than a merely human descendant of David", "It denies the Messiah''s Davidic lineage altogether", "It proves David wrote no psalms", "It concerns only temple ritual"]'::jsonb, 'It shows the Messiah is greater than a merely human descendant of David', 'Luke 20:41-44 presses beyond simplistic categories of messiahship.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Jesus''s question about David''s Lord so significant in Luke 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 21, 1, 'What celestial language did Jesus use in Luke 21 about the coming of the Son of Man?', '["He will come in a cloud with power and great glory", "He will rise like the morning star only", "He will descend in fire on the temple alone", "He will remain hidden until the end"]'::jsonb, 'He will come in a cloud with power and great glory', 'Luke 21:27 uses that language for the coming of the Son of Man.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'What celestial language did Jesus use in Luke 21 about the coming of the Son of Man?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 21, 1, 'What did Jesus say would happen to the temple in Luke 21?', '["Not one stone would be left on another", "It would become the seat of the apostles", "It would shine with greater glory forever", "It would be moved to Galilee"]'::jsonb, 'Not one stone would be left on another', 'Luke 21:6 predicts the temple''s destruction.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say would happen to the temple in Luke 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 21, 1, 'What did the poor widow give in Luke 21?', '["Two small copper coins", "A lamb and grain", "One silver coin", "A jar of oil"]'::jsonb, 'Two small copper coins', 'Luke 21:2 says the poor widow put in two small coins.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the poor widow give in Luke 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 21, 1, 'What did the widow put into the offering box in Luke 21?', '["Two small copper coins", "A silver denarius", "A lamb and grain", "A costly jar of ointment"]'::jsonb, 'Two small copper coins', 'Luke 21:2 says the widow put in two small copper coins.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the widow put into the offering box in Luke 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 21, 1, 'What tree did Jesus use as an illustration in Luke 21?', '["A fig tree", "An olive tree", "A sycamore tree", "A cedar tree"]'::jsonb, 'A fig tree', 'Luke 21:29 gives the parable of the fig tree.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'What tree did Jesus use as an illustration in Luke 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 21, 2, 'What did Jesus say persecutions would become for the disciples in Luke 21?', '["An opportunity for testimony", "A sign they should stop preaching", "Proof the kingdom had failed", "A reason to return home permanently"]'::jsonb, 'An opportunity for testimony', 'Luke 21:13 says persecutions will turn out as an opportunity for testimony.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say persecutions would become for the disciples in Luke 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 21, 2, 'What did Jesus say would happen to the temple stones in Luke 21?', '["They would be thrown down", "They would shine more brightly", "They would be hidden for safety", "They would be restored in three days"]'::jsonb, 'They would be thrown down', 'Luke 21:6 says not one stone would be left on another.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say would happen to the temple stones in Luke 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 21, 2, 'What did Jesus tell his hearers to do with their hearts in Luke 21?', '["Watch yourselves lest they be weighed down", "Trust only in the temple", "Hide from every sign", "Forget the words he had spoken"]'::jsonb, 'Watch yourselves lest they be weighed down', 'Luke 21:34 warns against hearts weighed down with dissipation, drunkenness, and cares.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus tell his hearers to do with their hearts in Luke 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 21, 2, 'What did Jesus tell the disciples to do when they saw Jerusalem surrounded by armies in Luke 21?', '["Know that its desolation has come near and flee", "Gather in the temple courts", "Wait for the priests'' instructions", "Take up arms in the city"]'::jsonb, 'Know that its desolation has come near and flee', 'Luke 21:20-21 gives that warning about Jerusalem surrounded by armies.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus tell the disciples to do when they saw Jerusalem surrounded by armies in Luke 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 21, 2, 'Why did Jesus say the widow had given more than all in Luke 21?', '["She gave out of her poverty all she had to live on", "She gave the largest visible gift", "She was known by the priests", "She gave at the proper feast time"]'::jsonb, 'She gave out of her poverty all she had to live on', 'Luke 21:3-4 praises her total gift out of poverty.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why did Jesus say the widow had given more than all in Luke 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 21, 3, 'What does the widow''s offering reveal in Luke 21?', '["God measures gifts by wholehearted devotion, not visible amount", "Small gifts matter less than large ones", "Poverty itself earns merit automatically", "Widows should give only when publicly recognized"]'::jsonb, 'God measures gifts by wholehearted devotion, not visible amount', 'Luke 21:1-4 contrasts large gifts with the widow''s all-in gift.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the widow''s offering reveal in Luke 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 21, 3, 'What is the significance of Jerusalem''s desolation language in Luke 21?', '["It shows covenant judgment arriving in history, not merely abstract symbolism", "It means the city will never be mentioned again", "It denies any future hope for God''s people", "It concerns only Roman military strategy"]'::jsonb, 'It shows covenant judgment arriving in history, not merely abstract symbolism', 'Luke 21:20-24 speaks concretely of Jerusalem''s siege and desolation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the significance of Jerusalem''s desolation language in Luke 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 21, 3, 'Why do Jesus''s warnings about wars, earthquakes, and persecutions matter in Luke 21?', '["They prepare disciples for endurance and witness rather than panic", "They are given so dates can be calculated exactly", "They mean the mission should cease", "They apply only to Jerusalem''s rulers"]'::jsonb, 'They prepare disciples for endurance and witness rather than panic', 'Luke 21 repeatedly frames turmoil as a setting for perseverance and testimony.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why do Jesus''s warnings about wars, earthquakes, and persecutions matter in Luke 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 21, 3, 'Why does Jesus pair the fig tree with the call to watch in Luke 21?', '["Discernment of the season should produce alertness, not complacency", "The fig tree replaces all other signs", "Watchfulness is only for farmers", "The kingdom comes only when figs appear"]'::jsonb, 'Discernment of the season should produce alertness, not complacency', 'Luke 21:29-36 moves from the fig tree lesson to watchfulness and prayer.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Jesus pair the fig tree with the call to watch in Luke 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 21, 3, 'Why is the widow''s offering praised in Luke 21?', '["She gave out of her poverty all she had to live on", "She gave the largest amount publicly", "She was honored by the priests", "Her gift fulfilled a special vow"]'::jsonb, 'She gave out of her poverty all she had to live on', 'Luke 21:3-4 says she gave more than all because she gave from her need.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the widow''s offering praised in Luke 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 21, 4, 'How do the widow''s offering and the temple prediction fit together in Luke 21?', '["The chapter contrasts genuine devotion with the passing glory of the temple order", "The widow''s gift is meant to fund the temple''s repair", "Temple destruction makes giving irrelevant", "The two scenes are unrelated"]'::jsonb, 'The chapter contrasts genuine devotion with the passing glory of the temple order', 'Luke 21 moves from the widow''s true devotion to the predicted fall of the temple structure.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do the widow''s offering and the temple prediction fit together in Luke 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 21, 4, 'How does Luke 21 combine near historical judgment and future hope?', '["It speaks of Jerusalem''s fall while also lifting the eyes of disciples to the coming Son of Man", "It treats all prophecy as only symbolic", "It separates history completely from eschatology", "It limits hope to the temple''s survival"]'::jsonb, 'It speaks of Jerusalem''s fall while also lifting the eyes of disciples to the coming Son of Man', 'Luke 21 interweaves historical warnings with eschatological expectation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Luke 21 combine near historical judgment and future hope?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 21, 4, 'What is the purpose of Jesus''s apocalyptic warnings in Luke 21?', '["To prepare disciples for endurance, witness, and hopeful watchfulness", "To encourage panic and speculation only", "To prove the gospel will fail before the end", "To shift all focus away from obedience"]'::jsonb, 'To prepare disciples for endurance, witness, and hopeful watchfulness', 'Luke 21 includes warnings, promises of witness, and commands to watch and pray.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'What is the purpose of Jesus''s apocalyptic warnings in Luke 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 21, 4, 'What larger picture of discipleship emerges in Luke 21?', '["Disciples are called to endurance, testimony, vigilance, and prayer in a shaken world", "The end frees disciples from responsibility", "Only public miracles matter now", "Discipleship depends on safety and stability"]'::jsonb, 'Disciples are called to endurance, testimony, vigilance, and prayer in a shaken world', 'Luke 21 repeatedly calls disciples to persevere, testify, and watch.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger picture of discipleship emerges in Luke 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 21, 4, 'Why is the Son of Man''s coming important in Luke 21?', '["It places history, judgment, and hope under Jesus''s final authority and vindication", "It cancels the need to care about Jerusalem''s fate", "It means persecution will end immediately for every disciple", "It replaces all earlier kingdom teaching"]'::jsonb, 'It places history, judgment, and hope under Jesus''s final authority and vindication', 'Luke 21:27-28 ties the Son of Man''s coming to redemption drawing near.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is the Son of Man''s coming important in Luke 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 21, 5, 'How does Luke 21 combine judgment and hope?', '["Temple and city face judgment, yet redemption draws near for those who remain alert", "Judgment cancels all hope entirely", "Hope belongs only to Jerusalem''s leaders", "The coming of the Son of Man ends the need for faith"]'::jsonb, 'Temple and city face judgment, yet redemption draws near for those who remain alert', 'Luke 21 joins the fall of Jerusalem, cosmic upheaval, and the promise that redemption is drawing near.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 21 combine judgment and hope?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 21, 5, 'How does Luke 21 deepen the meaning of watchfulness?', '["Watchfulness is active, prayerful readiness that keeps the heart from being dulled by ordinary life", "Watchfulness means panic over every rumor", "Watchfulness replaces trust in God", "Watchfulness is only for the final generation"]'::jsonb, 'Watchfulness is active, prayerful readiness that keeps the heart from being dulled by ordinary life', 'Luke 21:34-36 defines watchfulness in moral and prayerful terms.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 21 deepen the meaning of watchfulness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 21, 5, 'How does Luke 21 shape hope for disciples under pressure?', '["Hope rests in the certainty of Jesus''s words and the coming of the Son of Man", "Hope depends mainly on reading the political moment correctly", "Pressure means the kingdom has failed", "Hope belongs only after suffering ends"]'::jsonb, 'Hope rests in the certainty of Jesus''s words and the coming of the Son of Man', 'Luke 21:33 says Jesus''s words will not pass away, grounding hope amid upheaval.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 21 shape hope for disciples under pressure?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 21, 5, 'What does Luke 21 imply about outward grandeur and true value?', '["The temple''s splendor will fall, but the widow''s hidden devotion and Jesus''s words endure", "Grandeur is always a sign of God''s favor", "Hidden devotion matters less than impressive buildings", "Only the temple can mediate lasting hope"]'::jsonb, 'The temple''s splendor will fall, but the widow''s hidden devotion and Jesus''s words endure', 'Luke 21 contrasts the widow''s offering, the temple''s fall, and Jesus''s enduring words.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Luke 21 imply about outward grandeur and true value?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 21, 5, 'Why is redemption language significant in Luke 21?', '["Even amid upheaval, Jesus directs disciples to see approaching deliverance, not only doom", "Redemption applies only to political liberation", "Redemption is postponed until all signs are understood perfectly", "The chapter uses judgment language without any hope"]'::jsonb, 'Even amid upheaval, Jesus directs disciples to see approaching deliverance, not only doom', 'Luke 21:28 says, ''Your redemption is drawing near.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is redemption language significant in Luke 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 22, 1, 'What did Jesus say he was among the disciples as in Luke 22?', '["One who serves", "The greatest ruler", "A judge at table", "A hidden guest"]'::jsonb, 'One who serves', 'Luke 22:27 says, ''I am among you as one who serves.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 22
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say he was among the disciples as in Luke 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 22, 1, 'What entered Judas before he arranged to betray Jesus in Luke 22?', '["Satan", "A demon of fear", "The spirit of Elijah", "An angel of judgment"]'::jsonb, 'Satan', 'Luke 22:3 says Satan entered into Judas.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 22
    AND q.difficulty_stage = 1
    AND q.prompt = 'What entered Judas before he arranged to betray Jesus in Luke 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 22, 1, 'What feast was drawing near at the start of Luke 22?', '["The Feast of Unleavened Bread", "Pentecost", "Tabernacles", "Purim"]'::jsonb, 'The Feast of Unleavened Bread', 'Luke 22:1 says the Feast of Unleavened Bread, called the Passover, was drawing near.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 22
    AND q.difficulty_stage = 1
    AND q.prompt = 'What feast was drawing near at the start of Luke 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 22, 1, 'What object did the disciples follow as a sign to prepare the Passover in Luke 22?', '["A man carrying a jar of water", "A star over the city", "A shepherd with a lamb", "A priest with incense"]'::jsonb, 'A man carrying a jar of water', 'Luke 22:10 tells them to follow a man carrying a jar of water.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 22
    AND q.difficulty_stage = 1
    AND q.prompt = 'What object did the disciples follow as a sign to prepare the Passover in Luke 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 22, 1, 'Who agreed to betray Jesus in Luke 22?', '["Judas Iscariot", "Peter", "John", "Joseph of Arimathea"]'::jsonb, 'Judas Iscariot', 'Luke 22:3-6 says Judas went away and discussed betraying Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 22
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who agreed to betray Jesus in Luke 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 22, 2, 'How did Judas identify Jesus to those arresting him in Luke 22?', '["With a kiss", "With a torch", "By pointing from a distance", "By calling him king"]'::jsonb, 'With a kiss', 'Luke 22:47-48 says Judas approached Jesus to kiss him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 22
    AND q.difficulty_stage = 2
    AND q.prompt = 'How did Judas identify Jesus to those arresting him in Luke 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 22, 2, 'What did Jesus pray in Gethsemane in Luke 22?', '["Not my will, but yours, be done", "Send legions of angels now", "Take the kingdom by force", "Hide us from our enemies"]'::jsonb, 'Not my will, but yours, be done', 'Luke 22:42 records Jesus''s prayer in Gethsemane.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 22
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus pray in Gethsemane in Luke 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 22, 2, 'What did Jesus say Peter would do before the rooster crowed in Luke 22?', '["Deny him three times", "Flee Jerusalem twice", "Return to fishing", "Betray him for silver"]'::jsonb, 'Deny him three times', 'Luke 22:34 says Peter would deny Jesus three times before the rooster crowed.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 22
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say Peter would do before the rooster crowed in Luke 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 22, 2, 'What did Jesus say the cup represented at the Last Supper in Luke 22?', '["The new covenant in my blood", "The glory of the kingdom", "The tears of Israel", "The fruit of the temple"]'::jsonb, 'The new covenant in my blood', 'Luke 22:20 says the cup is the new covenant in Jesus''s blood.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 22
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say the cup represented at the Last Supper in Luke 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 22, 2, 'What dispute arose among the disciples at the Last Supper in Luke 22?', '["Which of them was regarded as greatest", "Who would pay for the meal", "Who should return to Galilee first", "Which psalm to sing"]'::jsonb, 'Which of them was regarded as greatest', 'Luke 22:24 says a dispute arose over which of them was greatest.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 22
    AND q.difficulty_stage = 2
    AND q.prompt = 'What dispute arose among the disciples at the Last Supper in Luke 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 22, 3, 'What does Jesus teach about greatness in Luke 22?', '["The greatest should become like the youngest and the leader like one who serves", "Greatness belongs to those with the sharpest arguments", "The greatest should take the highest seat", "Only Judas is excluded from greatness"]'::jsonb, 'The greatest should become like the youngest and the leader like one who serves', 'Luke 22:25-27 defines greatness by service, not domination.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 22
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Jesus teach about greatness in Luke 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 22, 3, 'What does Jesus''s agony in Gethsemane reveal in Luke 22?', '["He fully embraces the Father''s will through real sorrow and struggle", "He is indifferent to the suffering ahead", "He doubts God''s existence", "He decides to avoid the cross"]'::jsonb, 'He fully embraces the Father''s will through real sorrow and struggle', 'Luke 22:41-44 shows Jesus in profound agony yet submitting to the Father''s will.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 22
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Jesus''s agony in Gethsemane reveal in Luke 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 22, 3, 'What does the dispute over greatness reveal in Luke 22?', '["Even at the table, the disciples still misunderstand leadership apart from Jesus''s model of service", "They had already fully grasped the kingdom ethic", "Judas had become the humblest disciple", "Greatness is unrelated to service in Luke"]'::jsonb, 'Even at the table, the disciples still misunderstand leadership apart from Jesus''s model of service', 'Luke 22:24-27 contrasts worldly greatness with Jesus''s servant model.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 22
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the dispute over greatness reveal in Luke 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 22, 3, 'Why is Peter''s denial important in Luke 22?', '["It exposes human weakness even in devoted disciples and magnifies Jesus''s foreknowledge and mercy", "It proves Peter was never truly called", "It means the apostolic mission ends there", "It replaces Judas''s betrayal in importance"]'::jsonb, 'It exposes human weakness even in devoted disciples and magnifies Jesus''s foreknowledge and mercy', 'Luke 22:31-34 and 22:54-62 frame Peter''s collapse under pressure.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 22
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is Peter''s denial important in Luke 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 22, 3, 'Why is the Last Supper so significant in Luke 22?', '["Jesus interprets his coming death as covenant-giving and to be remembered by his followers", "It replaces the need for the cross", "It is only a farewell meal with no theological meaning", "It marks Judas''s restoration"]'::jsonb, 'Jesus interprets his coming death as covenant-giving and to be remembered by his followers', 'Luke 22:19-20 ties bread and cup to Jesus''s body and blood in covenant language.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 22
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the Last Supper so significant in Luke 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 22, 4, 'How do the meal, the prayer, and the arrest fit together in Luke 22?', '["Jesus interprets his death, submits to it in prayer, and then enters it knowingly", "The prayer scene cancels the covenant meaning of the meal", "The arrest comes as a surprise that changes the mission", "Only Judas understands the significance of the meal"]'::jsonb, 'Jesus interprets his death, submits to it in prayer, and then enters it knowingly', 'Luke 22 links sacramental interpretation, obedient prayer, and arrest into one movement toward the cross.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 22
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do the meal, the prayer, and the arrest fit together in Luke 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 22, 4, 'How does Luke 22 portray Jesus''s leadership?', '["He leads by serving, interceding, and submitting to the Father''s will", "He leads mainly by withdrawing from the disciples", "He insists on rank and distance from followers", "He avoids explaining his death"]'::jsonb, 'He leads by serving, interceding, and submitting to the Father''s will', 'Luke 22 shows Jesus as servant, prayerful intercessor, and obedient Son.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 22
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Luke 22 portray Jesus''s leadership?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 22, 4, 'What larger picture of spiritual conflict emerges in Luke 22?', '["Satanic opposition, human failure, and divine purpose all converge around Jesus''s obedient path", "Spiritual conflict disappears once the meal begins", "Only Judas is involved in conflict", "The chapter presents no real testing for the disciples"]'::jsonb, 'Satanic opposition, human failure, and divine purpose all converge around Jesus''s obedient path', 'Luke 22 includes Satan entering Judas, sifting Peter, and the hour of darkness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 22
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger picture of spiritual conflict emerges in Luke 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 22, 4, 'Why is Gethsemane central in Luke 22?', '["Jesus willingly submits his will to the Father''s in the hour of testing", "The disciples overcome temptation there completely", "Judas repents before arriving", "The arrest is prevented by angelic armies"]'::jsonb, 'Jesus willingly submits his will to the Father''s in the hour of testing', 'Luke 22:39-46 centers on prayer, agony, and obedient submission.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 22
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is Gethsemane central in Luke 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 22, 4, 'Why is Jesus''s teaching on service especially powerful in Luke 22?', '["He speaks it on the eve of his suffering, embodying servant greatness in the act of giving himself", "It is a minor aside before the meal", "It applies only to future church leaders", "It is contradicted by the rest of the chapter"]'::jsonb, 'He speaks it on the eve of his suffering, embodying servant greatness in the act of giving himself', 'Luke 22 places servant teaching at the table just before Jesus''s passion.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 22
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is Jesus''s teaching on service especially powerful in Luke 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 22, 5, 'How does Luke 22 connect suffering and kingship?', '["The kingly one gives a kingdom to his disciples even as he moves into betrayal and death", "Kingship is postponed until after resurrection only", "Suffering disproves messiahship in the chapter", "Jesus avoids all royal language here"]'::jsonb, 'The kingly one gives a kingdom to his disciples even as he moves into betrayal and death', 'Luke 22:29-30 speaks of a kingdom in the midst of passion events.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 22
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 22 connect suffering and kingship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 22, 5, 'How does Luke 22 deepen the meaning of covenant?', '["The covenant is renewed through Jesus''s self-giving blood, not merely ritual repetition", "Covenant is abandoned in favor of private spirituality", "The cup symbolizes only future celebration", "The covenant belongs only to Judas and Peter"]'::jsonb, 'The covenant is renewed through Jesus''s self-giving blood, not merely ritual repetition', 'Luke 22:20 explicitly calls the cup the new covenant in Jesus''s blood.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 22
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 22 deepen the meaning of covenant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 22, 5, 'How does Luke 22 portray Jesus amid betrayal and failure?', '["He remains composed, serving, praying, and moving faithfully toward the Father''s purpose", "He loses control of events to the priests", "He turns away from the cup at the last moment", "He distances himself from the disciples entirely"]'::jsonb, 'He remains composed, serving, praying, and moving faithfully toward the Father''s purpose', 'Luke 22 contrasts Judas''s betrayal and Peter''s denial with Jesus''s faithful resolve.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 22
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 22 portray Jesus amid betrayal and failure?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 22, 5, 'What does Luke 22 imply about the shape of Christian remembrance?', '["Remembering Jesus means participating in the meaning of his self-giving death and covenant faithfulness", "Remembrance is merely nostalgic reflection on the past", "The meal replaces obedience and service", "Only the apostles are allowed to remember Jesus"]'::jsonb, 'Remembering Jesus means participating in the meaning of his self-giving death and covenant faithfulness', 'Luke 22:19 says, ''Do this in remembrance of me,'' in the context of body and blood.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 22
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Luke 22 imply about the shape of Christian remembrance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 22, 5, 'Why is Jesus''s word to Peter about strengthening his brothers so significant in Luke 22?', '["Failure is not final because Jesus''s intercession aims at restored service", "Peter''s role is permanently removed", "Strength comes only through natural courage", "The disciples should never return after denial"]'::jsonb, 'Failure is not final because Jesus''s intercession aims at restored service', 'Luke 22:31-32 combines warning, intercession, and future restoration.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 22
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Jesus''s word to Peter about strengthening his brothers so significant in Luke 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 23, 1, 'Before whom was Jesus sent after Pilate found no fault in him in Luke 23?', '["Herod", "Caiaphas", "Caesar", "Gamaliel"]'::jsonb, 'Herod', 'Luke 23:6-12 says Pilate sent Jesus to Herod.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 23
    AND q.difficulty_stage = 1
    AND q.prompt = 'Before whom was Jesus sent after Pilate found no fault in him in Luke 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 23, 1, 'Before whom was Jesus sent after Pilate learned he was from Galilee in Luke 23?', '["Herod", "Caiaphas", "Caesar", "Annas"]'::jsonb, 'Herod', 'Luke 23:6-7 says Pilate sent Jesus to Herod.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 23
    AND q.difficulty_stage = 1
    AND q.prompt = 'Before whom was Jesus sent after Pilate learned he was from Galilee in Luke 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 23, 1, 'What did one of the criminals ask Jesus in Luke 23?', '["Remember me when you come into your kingdom", "Come down and save us now", "Tell the crowd I am innocent", "Call Elijah for help"]'::jsonb, 'Remember me when you come into your kingdom', 'Luke 23:42 records that request.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 23
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did one of the criminals ask Jesus in Luke 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 23, 1, 'What were Jesus''s final words in Luke 23?', '["Father, into your hands I commit my spirit", "It is finished", "My God, why have you forsaken me?", "Peace be with you"]'::jsonb, 'Father, into your hands I commit my spirit', 'Luke 23:46 records Jesus''s final words in Luke.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 23
    AND q.difficulty_stage = 1
    AND q.prompt = 'What were Jesus''s final words in Luke 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 23, 1, 'Who carried Jesus''s cross in Luke 23?', '["Simon of Cyrene", "Joseph of Arimathea", "Peter", "The repentant criminal"]'::jsonb, 'Simon of Cyrene', 'Luke 23:26 says Simon of Cyrene carried the cross behind Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 23
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who carried Jesus''s cross in Luke 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 23, 2, 'What did Jesus say to the women who mourned for him in Luke 23?', '["Do not weep for me, but for yourselves and your children", "Return to your homes in peace", "Tell the disciples to hide", "Prepare spices for my burial"]'::jsonb, 'Do not weep for me, but for yourselves and your children', 'Luke 23:28 gives Jesus''s words to the women.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 23
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say to the women who mourned for him in Luke 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 23, 2, 'What did Pilate repeatedly say about Jesus in Luke 23?', '["He found no fault in him", "He was guilty of sedition", "He deserved exile only", "He should be stoned"]'::jsonb, 'He found no fault in him', 'Luke 23:4, 14, and 22 stress Pilate''s verdict of no guilt.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 23
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Pilate repeatedly say about Jesus in Luke 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 23, 2, 'What did one criminal ask Jesus on the cross in Luke 23?', '["Remember me when you come into your kingdom", "Come down and save us both now", "Send angels to free us", "Tell the crowd I am innocent"]'::jsonb, 'Remember me when you come into your kingdom', 'Luke 23:42 records the repentant criminal''s request.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 23
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did one criminal ask Jesus on the cross in Luke 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 23, 2, 'What promise did Jesus give the repentant criminal in Luke 23?', '["Today you will be with me in Paradise", "You will see me after three days", "Your sins will be considered later", "You will return home healed"]'::jsonb, 'Today you will be with me in Paradise', 'Luke 23:43 gives that promise.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 23
    AND q.difficulty_stage = 2
    AND q.prompt = 'What promise did Jesus give the repentant criminal in Luke 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 23, 2, 'Who buried Jesus in Luke 23?', '["Joseph of Arimathea", "Nicodemus", "Peter", "The centurion"]'::jsonb, 'Joseph of Arimathea', 'Luke 23:50-53 says Joseph of Arimathea buried Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 23
    AND q.difficulty_stage = 2
    AND q.prompt = 'Who buried Jesus in Luke 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 23, 3, 'What does Luke 23 emphasize about Jesus''s innocence?', '["Pilate, Herod, the criminal, and the centurion all reinforce it", "Only the disciples declare it", "Innocence is secondary to political guilt", "Luke intentionally leaves the question unresolved"]'::jsonb, 'Pilate, Herod, the criminal, and the centurion all reinforce it', 'Luke 23 layers multiple witnesses to Jesus''s innocence.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 23
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Luke 23 emphasize about Jesus''s innocence?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 23, 3, 'What does the centurion''s response reveal in Luke 23?', '["Even a Roman observer recognizes Jesus''s innocence and glorifies God", "The centurion becomes one of the twelve", "He denies the darkness as a sign", "He demands another trial for Jesus"]'::jsonb, 'Even a Roman observer recognizes Jesus''s innocence and glorifies God', 'Luke 23:47 says the centurion glorified God and declared Jesus righteous.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 23
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the centurion''s response reveal in Luke 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 23, 3, 'Why is Jesus''s interaction with the repentant criminal so significant in Luke 23?', '["It shows royal mercy and salvation granted even at the point of death through faith", "It means judgment no longer matters for anyone", "It proves the criminal was innocent all along", "It is mainly a rebuke to Pilate"]'::jsonb, 'It shows royal mercy and salvation granted even at the point of death through faith', 'Luke 23:39-43 presents immediate saving mercy from the crucified king.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 23
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is Jesus''s interaction with the repentant criminal so significant in Luke 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 23, 3, 'Why is Jesus''s prayer for forgiveness earlier in the crucifixion scene important in Luke 23?', '["It displays mercy toward enemies even while suffering unjustly", "It shows he did not understand what was happening", "It replaces the need for repentance", "It applies only to the Roman soldiers"]'::jsonb, 'It displays mercy toward enemies even while suffering unjustly', 'Luke 23:34 shows Jesus praying, ''Father, forgive them.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 23
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is Jesus''s prayer for forgiveness earlier in the crucifixion scene important in Luke 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 23, 3, 'Why is Jesus''s word to the repentant criminal significant in Luke 23?', '["It shows salvation and paradise are granted through trust in the crucified king", "It proves suffering automatically saves everyone nearby", "It postpones hope until a distant age only", "It means the kingdom is purely symbolic"]'::jsonb, 'It shows salvation and paradise are granted through trust in the crucified king', 'Luke 23:43 says, ''Today you will be with me in Paradise.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 23
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is Jesus''s word to the repentant criminal significant in Luke 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 23, 4, 'How do trial, crucifixion, and burial fit together in Luke 23?', '["The innocent one is condemned by human injustice yet honored by divine signs and faithful witnesses", "The burial cancels the importance of the trial", "The chapter minimizes the cross in favor of Herod''s curiosity", "Only the women matter in the burial scene"]'::jsonb, 'The innocent one is condemned by human injustice yet honored by divine signs and faithful witnesses', 'Luke 23 moves from unjust sentencing to crucifixion, signs, and careful burial.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 23
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do trial, crucifixion, and burial fit together in Luke 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 23, 4, 'How does Luke 23 portray the kingdom amid the crucifixion?', '["The kingdom appears paradoxically in the crucified king who can still promise paradise", "Kingship disappears completely at the cross", "The kingdom belongs only to the mockers in the scene", "The chapter postpones all kingdom language until the resurrection"]'::jsonb, 'The kingdom appears paradoxically in the crucified king who can still promise paradise', 'The repentant criminal''s request and Jesus''s response keep kingdom hope alive at the cross.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 23
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Luke 23 portray the kingdom amid the crucifixion?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 23, 4, 'How does Luke stress Jesus''s innocence in chapter 23?', '["Pilate, Herod, the criminal, and the centurion all reinforce it", "Only the disciples declare him innocent", "Luke avoids courtroom language entirely", "Jesus never speaks during the trials"]'::jsonb, 'Pilate, Herod, the criminal, and the centurion all reinforce it', 'Luke 23 repeatedly presents Jesus as innocent even while he is condemned.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 23
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Luke stress Jesus''s innocence in chapter 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 23, 4, 'What larger picture of Jesus emerges from Luke 23?', '["He is the righteous sufferer who forgives, promises paradise, and entrusts himself to the Father", "He is mainly a political victim with no deeper significance", "He loses all royal identity at the cross", "He is silent and passive in every respect"]'::jsonb, 'He is the righteous sufferer who forgives, promises paradise, and entrusts himself to the Father', 'Luke 23 presents Jesus''s innocence, mercy, and filial trust in suffering.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 23
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger picture of Jesus emerges from Luke 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 23, 4, 'Why is Joseph of Arimathea important in Luke 23?', '["He provides a dignified burial that confirms Jesus truly died and was honorably laid in a known tomb", "He replaces the disciples as the Gospel''s main witness", "He hides Jesus from the women intentionally", "He proves the Sanhedrin fully supported Jesus"]'::jsonb, 'He provides a dignified burial that confirms Jesus truly died and was honorably laid in a known tomb', 'Luke 23:50-53 underscores the reality and location of Jesus''s burial.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 23
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is Joseph of Arimathea important in Luke 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 23, 5, 'How does Luke 23 connect innocence and substitutionary mercy?', '["The righteous one suffers unjustly while extending salvation and forgiveness to the guilty", "Innocence and mercy are unrelated themes", "Only the criminal receives mercy, not the crowd", "Innocence means Jesus does not truly die"]'::jsonb, 'The righteous one suffers unjustly while extending salvation and forgiveness to the guilty', 'Luke 23 combines declared innocence with forgiveness and paradise for another.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 23
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 23 connect innocence and substitutionary mercy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 23, 5, 'How does Luke 23 deepen the theme of mercy?', '["Mercy is extended even from the cross to enemies and to a dying criminal", "Mercy is suspended during judgment scenes", "Mercy belongs only to the innocent, not the guilty", "The chapter replaces mercy with legal exactness"]'::jsonb, 'Mercy is extended even from the cross to enemies and to a dying criminal', 'Luke 23 centers mercy in Jesus''s prayer and promise.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 23
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 23 deepen the theme of mercy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 23, 5, 'How does Luke 23 portray Jesus in death?', '["He is the innocent sufferer who forgives, promises paradise, and entrusts himself to the Father", "He dies in despair with no trust in God", "He is abandoned without any witness to his righteousness", "His death is treated as a political accident only"]'::jsonb, 'He is the innocent sufferer who forgives, promises paradise, and entrusts himself to the Father', 'Luke 23 emphasizes forgiveness, innocence, kingdom mercy, and Jesus''s final trust in the Father.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 23
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 23 portray Jesus in death?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 23, 5, 'What does Luke 23 imply about the cross for Luke''s readers?', '["The cross reveals God''s mercy, Jesus''s righteousness, and the doorway of hope for repentant sinners", "The cross is mainly a tragic political ending", "The cross silences all kingdom themes", "The cross matters only as the cause of the resurrection later"]'::jsonb, 'The cross reveals God''s mercy, Jesus''s righteousness, and the doorway of hope for repentant sinners', 'Luke 23 interprets the crucifixion through innocence, forgiveness, and promised paradise.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 23
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Luke 23 imply about the cross for Luke''s readers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 23, 5, 'Why is Jesus''s final prayer to the Father significant in Luke 23?', '["It shows that even in death he entrusts himself fully to the Father in confidence and obedience", "It indicates despair and uncertainty about God", "It is merely a quotation without narrative importance", "It denies the suffering of the cross"]'::jsonb, 'It shows that even in death he entrusts himself fully to the Father in confidence and obedience', 'Luke 23:46 presents Jesus''s death as an act of trustful surrender.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 23
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Jesus''s final prayer to the Father significant in Luke 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 24, 1, 'How many men stood by the women in dazzling apparel in Luke 24?', '["Two", "One", "Three", "Twelve"]'::jsonb, 'Two', 'Luke 24:4 says two men stood by them in dazzling apparel.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 24
    AND q.difficulty_stage = 1
    AND q.prompt = 'How many men stood by the women in dazzling apparel in Luke 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 24, 1, 'What did Jesus eat before the disciples in Luke 24?', '["Broiled fish", "Bread and honey only", "Lamb and herbs", "A fig and a cup"]'::jsonb, 'Broiled fish', 'Luke 24:42-43 says Jesus ate broiled fish before them.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 24
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus eat before the disciples in Luke 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 24, 1, 'What did the two disciples say happened to their hearts on the Emmaus road in Luke 24?', '["They burned within them", "They were troubled with fear", "They became hardened", "They were filled with confusion only"]'::jsonb, 'They burned within them', 'Luke 24:32 says their hearts burned within them.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 24
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the two disciples say happened to their hearts on the Emmaus road in Luke 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 24, 1, 'What did the women find when they came to the tomb in Luke 24?', '["The stone rolled away", "The body wrapped in linen", "Roman guards asleep", "The disciples already gathered"]'::jsonb, 'The stone rolled away', 'Luke 24:2 says they found the stone rolled away from the tomb.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 24
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the women find when they came to the tomb in Luke 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 24, 1, 'Who found the empty tomb in Luke 24?', '["The women who came with spices", "Only Peter", "The Emmaus disciples first", "Joseph of Arimathea and Nicodemus"]'::jsonb, 'The women who came with spices', 'Luke 24:1-10 says the women came with spices and found the stone rolled away.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 24
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who found the empty tomb in Luke 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 24, 2, 'How did the disciples finally recognize Jesus at Emmaus in Luke 24?', '["In the breaking of the bread", "By his voice alone on the road", "When he healed someone in the village", "By seeing the empty tomb"]'::jsonb, 'In the breaking of the bread', 'Luke 24:30-31 says they recognized him in the breaking of the bread.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 24
    AND q.difficulty_stage = 2
    AND q.prompt = 'How did the disciples finally recognize Jesus at Emmaus in Luke 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 24, 2, 'What did Jesus open to the disciples in Luke 24?', '["The Scriptures and their minds to understand them", "The tomb and the city gates", "The heavens and the temple veil", "The sea and the net"]'::jsonb, 'The Scriptures and their minds to understand them', 'Luke 24:27 and 24:45 describe Jesus opening the Scriptures and their minds.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 24
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus open to the disciples in Luke 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 24, 2, 'What did Jesus say the disciples were in Luke 24?', '["Witnesses", "Judges of Israel", "Builders of the temple", "Princes over nations"]'::jsonb, 'Witnesses', 'Luke 24:48 says, ''You are witnesses of these things.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 24
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say the disciples were in Luke 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 24, 2, 'What did the angels ask the women at the tomb in Luke 24?', '["Why do you seek the living among the dead?", "Who will roll away the stone?", "Why are you weeping?", "Where are the eleven?"]'::jsonb, 'Why do you seek the living among the dead?', 'Luke 24:5 asks that question at the tomb.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 24
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the angels ask the women at the tomb in Luke 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 24, 2, 'Where did two disciples recognize Jesus in Luke 24?', '["In the breaking of bread at Emmaus", "At the empty tomb", "On the Mount of Olives first", "In Pilate''s court"]'::jsonb, 'In the breaking of bread at Emmaus', 'Luke 24:30-31 says their eyes were opened in the breaking of bread.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 24
    AND q.difficulty_stage = 2
    AND q.prompt = 'Where did two disciples recognize Jesus in Luke 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 24, 3, 'What does Luke 24 teach about the message to be proclaimed?', '["Repentance and forgiveness of sins in Jesus''s name to all nations", "Only resurrection as a private comfort", "Judgment on Rome alone", "A return to Galilee without mission"]'::jsonb, 'Repentance and forgiveness of sins in Jesus''s name to all nations', 'Luke 24:46-47 gives the content of the apostolic message.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 24
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Luke 24 teach about the message to be proclaimed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 24, 3, 'What is the significance of the Emmaus road story in Luke 24?', '["The risen Jesus interprets his suffering and glory through Scripture before being recognized", "It replaces Jerusalem as the center of the story", "It denies the reality of Jesus''s body", "It shows faith comes only through miracle"]'::jsonb, 'The risen Jesus interprets his suffering and glory through Scripture before being recognized', 'Luke 24:25-27 and 24:30-32 join scriptural understanding with recognition.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 24
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the significance of the Emmaus road story in Luke 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 24, 3, 'Why does Jesus show his hands and feet and eat in Luke 24?', '["To demonstrate the bodily reality of his resurrection", "To prove he is only a spirit appearance", "To end all questions about food laws", "To prepare another Passover meal"]'::jsonb, 'To demonstrate the bodily reality of his resurrection', 'Luke 24:39-43 emphasizes that the risen Jesus is not a ghost but bodily present.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 24
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Jesus show his hands and feet and eat in Luke 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 24, 3, 'Why is the Emmaus road story important in Luke 24?', '["It shows the risen Jesus interpreting Scripture so that his suffering and glory are understood rightly", "It proves the resurrection was only symbolic", "It replaces the witness of the women", "It teaches that Jerusalem no longer matters"]'::jsonb, 'It shows the risen Jesus interpreting Scripture so that his suffering and glory are understood rightly', 'Luke 24:25-27 and 24:32 center on Jesus opening the Scriptures to the disciples.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 24
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the Emmaus road story important in Luke 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 24, 3, 'Why is the empty tomb announcement in Luke 24 so important?', '["It declares that Jesus has truly risen and that death has not held him", "It merely creates suspense for later appearances", "It proves the women went to the wrong tomb", "It leaves resurrection uncertain"]'::jsonb, 'It declares that Jesus has truly risen and that death has not held him', 'Luke 24:5-7 and 24:23 center the resurrection announcement.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 24
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the empty tomb announcement in Luke 24 so important?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 24, 4, 'How do tomb, road, room, and ascension fit together in Luke 24?', '["The chapter moves from resurrection announcement to scriptural understanding, bodily appearance, and commissioned witness", "The scenes are unrelated traditions with no narrative movement", "The ascension cancels the importance of the resurrection appearances", "The Emmaus story stands outside the chapter''s main point"]'::jsonb, 'The chapter moves from resurrection announcement to scriptural understanding, bodily appearance, and commissioned witness', 'Luke 24 unfolds in a clear progression toward witness and blessing.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 24
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do tomb, road, room, and ascension fit together in Luke 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 24, 4, 'How does Luke 24 connect Jerusalem and the nations?', '["The witnesses are rooted in Jerusalem but sent with a message for all nations", "Jerusalem is abandoned once Jesus rises", "The nations replace Jerusalem completely", "Only Galilee remains important after the resurrection"]'::jsonb, 'The witnesses are rooted in Jerusalem but sent with a message for all nations', 'Luke 24:47-49 links Jerusalem as the starting point with a mission to all nations.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 24
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Luke 24 connect Jerusalem and the nations?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 24, 4, 'What does Jesus do for the disciples when he appears to them in Luke 24?', '["He shows his risen body and opens their minds to understand the Scriptures", "He sends them away without explanation", "He tells them to keep the resurrection private forever", "He rebukes them without giving peace"]'::jsonb, 'He shows his risen body and opens their minds to understand the Scriptures', 'Luke 24:36-49 combines bodily proof with scriptural explanation and commission.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 24
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Jesus do for the disciples when he appears to them in Luke 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 24, 4, 'What larger portrait of the risen Jesus emerges in Luke 24?', '["He is bodily alive, scripturally intelligible, and mission-giving to his witnesses", "He is mainly a memory in the disciples'' hearts", "He appears only to prove the tomb was empty", "He withdraws without commissioning anyone"]'::jsonb, 'He is bodily alive, scripturally intelligible, and mission-giving to his witnesses', 'Luke 24 combines bodily presence, scriptural explanation, and global commission.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 24
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger portrait of the risen Jesus emerges in Luke 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 24, 4, 'Why does Luke stress Scripture so strongly in Luke 24?', '["The resurrection and passion are shown as the fulfillment of God''s long-declared purpose", "Scripture becomes unnecessary once Jesus rises", "Only the disciples, not later readers, need Scripture", "The Old Testament is mentioned only for background color"]'::jsonb, 'The resurrection and passion are shown as the fulfillment of God''s long-declared purpose', 'Luke 24 repeatedly says these things were written and had to be fulfilled.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 24
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Luke stress Scripture so strongly in Luke 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 24, 5, 'How does Luke 24 deepen the meaning of resurrection faith?', '["Resurrection faith is grounded in divine testimony, Scripture, bodily encounter, and commissioned witness", "Faith means believing without any testimony at all", "Resurrection faith is only emotional consolation", "Faith rests solely on the empty tomb without interpretation"]'::jsonb, 'Resurrection faith is grounded in divine testimony, Scripture, bodily encounter, and commissioned witness', 'Luke 24 presents multiple converging grounds for resurrection faith.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 24
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 24 deepen the meaning of resurrection faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 24, 5, 'How does Luke 24 serve as a fitting conclusion to the whole Gospel?', '["It gathers Luke''s themes of promise, reversal, Scripture, salvation, joy, and mission into the risen Christ''s commissioning presence", "It leaves the main questions unresolved and the mission undefined", "It abandons Israel''s story for a new beginning without continuity", "It ends with the disciples returning to private life"]'::jsonb, 'It gathers Luke''s themes of promise, reversal, Scripture, salvation, joy, and mission into the risen Christ''s commissioning presence', 'Luke 24 closes the Gospel by gathering its major themes into resurrection, understanding, and mission.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 24
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke 24 serve as a fitting conclusion to the whole Gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 24, 5, 'How does Luke end his Gospel?', '["With the risen Christ commissioning witnesses and blessing them as he is carried up to heaven", "With the disciples returning to fishing in Galilee", "With uncertainty about whether Jesus truly rose", "With Jerusalem permanently abandoned by the disciples"]'::jsonb, 'With the risen Christ commissioning witnesses and blessing them as he is carried up to heaven', 'Luke 24:50-53 ends with Jesus blessing the disciples and being carried up, while they worship and return with joy.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 24
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Luke end his Gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 24, 5, 'What does Luke 24 imply about Christian witness?', '["Witness flows from encountering the risen Christ and understanding his work through Scripture", "Witness belongs only to angels and not disciples", "Witness is optional once joy has been restored", "Witness means recounting the empty tomb without repentance language"]'::jsonb, 'Witness flows from encountering the risen Christ and understanding his work through Scripture', 'Luke 24 ties witness to resurrection encounter and scriptural interpretation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 24
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Luke 24 imply about Christian witness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 42, 24, 5, 'Why is the ascension and blessing at the end of Luke 24 so significant?', '["It sends the disciples into worshipful joy under the continuing authority and blessing of the risen Lord", "It means Jesus is absent from their mission in every sense", "It replaces the need for witness", "It ends the story in uncertainty and fear"]'::jsonb, 'It sends the disciples into worshipful joy under the continuing authority and blessing of the risen Lord', 'Luke 24:50-53 ends with blessing, worship, joy, and the transition toward witness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 42
    AND q.chapter = 24
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the ascension and blessing at the end of Luke 24 so significant?'
);
