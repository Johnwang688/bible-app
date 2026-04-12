-- Re-seed after duplicate-prompt fix (clears partial rows from skipped INSERTs).
DELETE FROM quiz_question_bank WHERE book_number = 40;

-- ============================================================================
-- LOGOS LIGHT — Matthew (book 40) quiz questions from quiz-questions/matthew.json
-- ============================================================================
-- Idempotent: skips rows that already match (book_number, chapter, difficulty_stage, prompt).
-- ============================================================================

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 1, 1, 'According to Matthew 1, what was the name of Joseph''s wife?', '["Mary", "Elizabeth", "Martha", "Salome"]'::jsonb, 'Mary', 'Matthew 1:18 identifies Mary as the mother of Jesus and Joseph''s betrothed.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Matthew 1, what was the name of Joseph''s wife?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 1, 1, 'How does Matthew 1 describe Joseph in character?', '["A just man", "A priest", "A ruler", "A fisherman"]'::jsonb, 'A just man', 'Matthew 1:19 says Joseph was a righteous or just man.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'How does Matthew 1 describe Joseph in character?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 1, 1, 'What does the name Immanuel mean in Matthew 1:23?', '["God with us", "The Lord saves", "King of Israel", "Promised son"]'::jsonb, 'God with us', 'Matthew 1:23 explains Immanuel as "God with us."'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does the name Immanuel mean in Matthew 1:23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 1, 1, 'What name did the angel tell Joseph to give the child in Matthew 1?', '["Jesus", "John", "Immanuel", "Joseph"]'::jsonb, 'Jesus', 'Matthew 1:21 says, "You shall call his name Jesus."'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'What name did the angel tell Joseph to give the child in Matthew 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 1, 1, 'Who appeared to Joseph in a dream in Matthew 1?', '["An angel of the Lord", "Moses", "Gabriel by name", "A prophet from Bethlehem"]'::jsonb, 'An angel of the Lord', 'Matthew 1:20 says an angel of the Lord appeared to Joseph in a dream.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who appeared to Joseph in a dream in Matthew 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 1, 2, 'From whom does Matthew 1 begin Jesus''s genealogy?', '["Abraham", "Adam", "Moses", "Noah"]'::jsonb, 'Abraham', 'Matthew 1:1-2 begins with Abraham.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'From whom does Matthew 1 begin Jesus''s genealogy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 1, 2, 'How does Matthew summarize the structure of Jesus''s genealogy in Matthew 1:17?', '["Three sets of fourteen generations", "Two sets of twelve generations", "Seven complete generations", "Four sets of ten generations"]'::jsonb, 'Three sets of fourteen generations', 'Matthew 1:17 organizes the genealogy into three groups of fourteen generations.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does Matthew summarize the structure of Jesus''s genealogy in Matthew 1:17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 1, 2, 'What did Joseph do after he woke from the dream in Matthew 1?', '["He took Mary as his wife", "He sent Mary away secretly", "He went to Bethlehem alone", "He asked the priests for advice"]'::jsonb, 'He took Mary as his wife', 'Matthew 1:24 says Joseph did as the angel commanded and took Mary as his wife.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Joseph do after he woke from the dream in Matthew 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 1, 2, 'What reason does Matthew 1 give for naming the child Jesus?', '["He will save his people from their sins", "He will restore David''s throne immediately", "He will lead Israel out of Egypt", "He will rebuild the temple"]'::jsonb, 'He will save his people from their sins', 'Matthew 1:21 connects the name Jesus with saving his people from their sins.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What reason does Matthew 1 give for naming the child Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 1, 2, 'Why was Joseph told not to fear taking Mary as his wife?', '["The child conceived in her was from the Holy Spirit", "Her family had explained everything", "The census required it", "She had already given birth"]'::jsonb, 'The child conceived in her was from the Holy Spirit', 'Matthew 1:20 says the child in Mary was conceived by the Holy Spirit.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why was Joseph told not to fear taking Mary as his wife?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 1, 3, 'How does Matthew 1:23 help interpret Jesus''s identity in the Gospel?', '["Jesus is God''s presence with his people", "Jesus is only a symbolic king", "Jesus replaces all prophecy", "Jesus will remain hidden from Israel"]'::jsonb, 'Jesus is God''s presence with his people', 'Matthew 1:23 applies Isaiah''s prophecy and presents Jesus as "God with us."'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Matthew 1:23 help interpret Jesus''s identity in the Gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 1, 3, 'What does Matthew 1 emphasize by saying Joseph did not know Mary until she had given birth?', '["Jesus''s birth was virginal and not by ordinary human conception", "Joseph rejected Mary permanently", "Mary had been previously married", "The family lived apart for many years"]'::jsonb, 'Jesus''s birth was virginal and not by ordinary human conception', 'Matthew 1:25 underscores the virginal conception by clarifying Joseph had no marital relations with Mary before Jesus''s birth.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Matthew 1 emphasize by saying Joseph did not know Mary until she had given birth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 1, 3, 'What tension is resolved by Joseph planning to send Mary away quietly and then obeying the angel?', '["The tension between public shame and merciful obedience", "The tension between Rome and Israel", "The tension between Bethlehem and Nazareth", "The tension between priests and shepherds"]'::jsonb, 'The tension between public shame and merciful obedience', 'Matthew 1:19-24 shows Joseph''s desire to avoid exposing Mary and then his obedient acceptance of God''s message.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What tension is resolved by Joseph planning to send Mary away quietly and then obeying the angel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 1, 3, 'Why does Matthew include women like Tamar, Rahab, Ruth, and "the wife of Uriah" in the genealogy?', '["They highlight God''s surprising grace and providence in the Messiah''s line", "They were the only important ancestors Matthew knew", "They replaced the patriarchs in Israel''s history", "They prove the genealogy is incomplete"]'::jsonb, 'They highlight God''s surprising grace and providence in the Messiah''s line', 'Matthew 1:3-6 includes unexpected women in the line, showing God''s redemptive work through unusual and sometimes scandal-marked situations.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Matthew include women like Tamar, Rahab, Ruth, and "the wife of Uriah" in the genealogy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 1, 3, 'Why is Joseph called "son of David" by the angel in Matthew 1?', '["It highlights Jesus''s royal Davidic identity through Joseph''s legal line", "It means Joseph was the reigning king", "It proves Joseph wrote the genealogy himself", "It shows Joseph was born in Jerusalem"]'::jsonb, 'It highlights Jesus''s royal Davidic identity through Joseph''s legal line', 'Matthew 1:20 uses "son of David" to connect Joseph, and thus Jesus''s legal descent, to David''s royal line.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is Joseph called "son of David" by the angel in Matthew 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 1, 4, 'How does Joseph function in Matthew 1 as a model disciple?', '["He hears God''s word and obeys promptly despite personal cost", "He argues with the angel until convinced", "He performs miracles in Nazareth", "He preaches publicly before Jesus is born"]'::jsonb, 'He hears God''s word and obeys promptly despite personal cost', 'Matthew 1:24 shows Joseph immediately obeying the angel''s command.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joseph function in Matthew 1 as a model disciple?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 1, 4, 'How does Matthew 1 present Jesus as both royal heir and divine gift?', '["He comes through David''s line and is conceived by the Holy Spirit", "He is crowned in Jerusalem at birth", "He inherits the temple and the priesthood", "He defeats Herod in battle"]'::jsonb, 'He comes through David''s line and is conceived by the Holy Spirit', 'Matthew 1 joins Davidic genealogy with miraculous conception by the Holy Spirit.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Matthew 1 present Jesus as both royal heir and divine gift?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 1, 4, 'What is Matthew doing by linking Jesus to Abraham and David in the opening verse?', '["He frames Jesus as the fulfillment of covenant promises and messianic kingship", "He argues Jesus replaced both men historically", "He limits Jesus''s mission to Judah alone", "He introduces a priestly genealogy only"]'::jsonb, 'He frames Jesus as the fulfillment of covenant promises and messianic kingship', 'Matthew 1:1 ties Jesus to Abraham''s promise and David''s kingship from the outset.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What is Matthew doing by linking Jesus to Abraham and David in the opening verse?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 1, 4, 'What larger Gospel theme begins in Matthew 1 with the title Immanuel?', '["God''s abiding presence with his people", "Israel''s military restoration", "The end of all Gentile inclusion", "The rejection of the Law and Prophets"]'::jsonb, 'God''s abiding presence with his people', 'Matthew begins with "God with us" (1:23) and ends with Jesus promising, "I am with you always" (28:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger Gospel theme begins in Matthew 1 with the title Immanuel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 1, 4, 'Why is Matthew''s citation of Isaiah important in the infancy narrative?', '["It shows Jesus''s birth fulfills Scripture and is part of God''s planned redemption", "It proves Isaiah met Joseph in person", "It replaces the genealogy with prophecy", "It explains Roman rule over Judea"]'::jsonb, 'It shows Jesus''s birth fulfills Scripture and is part of God''s planned redemption', 'Matthew 1:22-23 explicitly says the virgin birth fulfills what the Lord spoke by the prophet.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is Matthew''s citation of Isaiah important in the infancy narrative?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 1, 5, 'How does Joseph''s righteousness in Matthew 1 differ from mere legal strictness?', '["It is expressed in mercy and obedience to God''s revelation, not only in public enforcement", "It means he ignored the law entirely", "It shows he feared Herod more than God", "It refers only to his ancestry from David"]'::jsonb, 'It is expressed in mercy and obedience to God''s revelation, not only in public enforcement', 'Matthew 1:19-24 portrays Joseph''s righteousness as compassionate and responsive to God''s word.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Joseph''s righteousness in Matthew 1 differ from mere legal strictness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 1, 5, 'How does Matthew 1 balance legal descent and divine sonship in presenting Jesus?', '["Jesus is legally placed in David''s line through Joseph while being conceived by the Holy Spirit", "Jesus is adopted by Herod and later declared divine", "Jesus descends physically from David through Joseph and Mary in the same way", "Jesus avoids all human lineage because only divinity matters"]'::jsonb, 'Jesus is legally placed in David''s line through Joseph while being conceived by the Holy Spirit', 'Matthew 1 presents Joseph as the legal Davidic father while insisting Jesus''s conception is by the Holy Spirit.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Matthew 1 balance legal descent and divine sonship in presenting Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 1, 5, 'How does Matthew 1 prepare the reader for the Gospel''s emphasis on fulfillment?', '["It immediately connects Jesus''s birth to prophetic Scripture and covenant history", "It avoids all Old Testament references until chapter 5", "It focuses only on Roman politics", "It presents Jesus chiefly as a new temple builder"]'::jsonb, 'It immediately connects Jesus''s birth to prophetic Scripture and covenant history', 'Matthew 1 combines genealogy and fulfilled prophecy, setting a pattern the Gospel repeats.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Matthew 1 prepare the reader for the Gospel''s emphasis on fulfillment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 1, 5, 'What does Matthew''s arrangement of fourteen generations most likely show?', '["A theologically shaped genealogy emphasizing Davidic fulfillment rather than a bare archival list", "An accidental counting mistake with no meaning", "A rejection of Abraham''s place in the story", "A hidden code about Roman emperors"]'::jsonb, 'A theologically shaped genealogy emphasizing Davidic fulfillment rather than a bare archival list', 'Matthew 1:17 presents the genealogy in a deliberate pattern, likely to stress structure and Davidic significance.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Matthew''s arrangement of fourteen generations most likely show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 1, 5, 'Why is the phrase "from whom Jesus was born" in Matthew 1:16 theologically significant?', '["It shifts attention to Mary and marks a break from the usual father-son pattern", "It denies Joseph had any role in naming Jesus", "It proves the genealogy ends in exile", "It means Jesus had no human mother"]'::jsonb, 'It shifts attention to Mary and marks a break from the usual father-son pattern', 'Matthew 1:16 breaks the repeated genealogy formula and signals Jesus''s unique birth.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the phrase "from whom Jesus was born" in Matthew 1:16 theologically significant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 2, 1, 'According to Matthew 2, where was Jesus born?', '["Bethlehem of Judea", "Nazareth of Galilee", "Jerusalem", "Bethany"]'::jsonb, 'Bethlehem of Judea', 'Matthew 2:1 says Jesus was born in Bethlehem of Judea.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Matthew 2, where was Jesus born?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 2, 1, 'What sign did the wise men say they had seen?', '["His star", "A pillar of fire", "An angelic army", "A rainbow"]'::jsonb, 'His star', 'Matthew 2:2 says they saw his star in the east.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'What sign did the wise men say they had seen?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 2, 1, 'Which gifts did the wise men present to the child Jesus?', '["Gold, frankincense, and myrrh", "Silver, wheat, and oil", "Gold, incense, and water", "Bread, wine, and salt"]'::jsonb, 'Gold, frankincense, and myrrh', 'Matthew 2:11 lists gold, frankincense, and myrrh.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which gifts did the wise men present to the child Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 2, 1, 'Which ruler was troubled when the wise men arrived in Jerusalem?', '["Herod", "Pilate", "Caesar Augustus", "Archelaus"]'::jsonb, 'Herod', 'Matthew 2:3 says Herod the king was troubled.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which ruler was troubled when the wise men arrived in Jerusalem?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 2, 1, 'Who came from the east to worship Jesus in Matthew 2?', '["Wise men", "Shepherds", "Priests", "Romans"]'::jsonb, 'Wise men', 'Matthew 2:1 describes wise men from the east coming to Jerusalem.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who came from the east to worship Jesus in Matthew 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 2, 2, 'How were the wise men prevented from returning to Herod?', '["They were warned in a dream", "The star disappeared", "Joseph sent them away", "Herod changed his mind"]'::jsonb, 'They were warned in a dream', 'Matthew 2:12 says they were warned in a dream not to return to Herod.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'How were the wise men prevented from returning to Herod?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 2, 2, 'What did Herod tell the wise men to do after finding the child?', '["Report back to him so he could come and worship too", "Bring the child to Jerusalem immediately", "Tell no one what they had seen", "Take gifts to the temple first"]'::jsonb, 'Report back to him so he could come and worship too', 'Matthew 2:8 records Herod''s deceptive request.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Herod tell the wise men to do after finding the child?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 2, 2, 'Where did Joseph take Mary and Jesus after being warned in a dream?', '["Egypt", "Nazareth", "Jericho", "Damascus"]'::jsonb, 'Egypt', 'Matthew 2:13-14 says Joseph fled to Egypt with the child and his mother.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'Where did Joseph take Mary and Jesus after being warned in a dream?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 2, 2, 'Why did Herod ask the chief priests and scribes where the Christ was to be born?', '["He wanted to locate the newborn king mentioned by the wise men", "He planned to move his palace there", "He was preparing a census", "He wanted to honor the temple priests"]'::jsonb, 'He wanted to locate the newborn king mentioned by the wise men', 'Matthew 2:3-6 shows Herod asking where the Christ would be born after hearing the wise men''s report.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why did Herod ask the chief priests and scribes where the Christ was to be born?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 2, 2, 'Why did Joseph settle in Galilee rather than return to Judea?', '["He was afraid of Archelaus ruling in Judea", "The wise men told him to do so", "Caesar ordered all families north", "The temple had been closed"]'::jsonb, 'He was afraid of Archelaus ruling in Judea', 'Matthew 2:22 says Joseph feared Archelaus, so he went to Galilee.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why did Joseph settle in Galilee rather than return to Judea?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 2, 3, 'How does Rachel weeping in Matthew 2 deepen the meaning of Herod''s slaughter?', '["It places the tragedy within Israel''s long history of exile and grief", "It identifies Rachel as Jesus''s grandmother", "It shows the wise men caused the violence", "It means Bethlehem was abandoned forever"]'::jsonb, 'It places the tragedy within Israel''s long history of exile and grief', 'Matthew 2:17-18 cites Jeremiah to connect the mourning in Bethlehem with Israel''s historic sorrow.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Rachel weeping in Matthew 2 deepen the meaning of Herod''s slaughter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 2, 3, 'How does the flight to Egypt shape Matthew''s portrait of Jesus?', '["It presents Jesus in a pattern that echoes Israel''s story", "It shows Jesus rejecting Jewish identity", "It proves Bethlehem was not his birthplace", "It means Jesus grew up only among Egyptians"]'::jsonb, 'It presents Jesus in a pattern that echoes Israel''s story', 'Matthew 2:15 cites, "Out of Egypt I called my son," connecting Jesus with Israel''s story.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does the flight to Egypt shape Matthew''s portrait of Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 2, 3, 'What contrast does Matthew 2 draw between the wise men and Herod?', '["The nations seek to worship the king while Herod seeks to destroy him", "Both groups honor Jesus equally", "Herod understands prophecy better than the wise men", "The wise men reject the child and Herod receives him"]'::jsonb, 'The nations seek to worship the king while Herod seeks to destroy him', 'Matthew 2 contrasts Gentile worshipers with Herod''s violent hostility.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What contrast does Matthew 2 draw between the wise men and Herod?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 2, 3, 'What does the star leading the wise men to the house emphasize in the story?', '["God actively guides seekers to the Messiah", "Astronomy replaces Scripture", "Herod was secretly righteous", "Bethlehem was difficult to locate"]'::jsonb, 'God actively guides seekers to the Messiah', 'Matthew 2:9-10 presents the star as divine guidance leading the wise men to Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the star leading the wise men to the house emphasize in the story?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 2, 3, 'Why is the chief priests'' and scribes'' response in Matthew 2 significant?', '["They know the prophecy but do not go worship the Messiah", "They cannot identify Bethlehem from Micah", "They escort the wise men to the house", "They warn Joseph before the angel does"]'::jsonb, 'They know the prophecy but do not go worship the Messiah', 'Matthew 2:4-6 shows religious leaders able to cite the text but absent from the act of worship.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the chief priests'' and scribes'' response in Matthew 2 significant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 2, 4, 'How does Herod''s response to the magi deepen Matthew 2''s conflict?', '["Earthly power reacts to the newborn king with fear and violence", "Herod becomes the child''s first protector", "Herod joins the magi in worship", "Herod ignores the news as unimportant"]'::jsonb, 'Earthly power reacts to the newborn king with fear and violence', 'Matthew 2:3-16 contrasts Herod''s murderous fear with the magi''s worship.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Herod''s response to the magi deepen Matthew 2''s conflict?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 2, 4, 'How does Jerusalem''s reaction to the wise men expose a paradox in Matthew 2?', '["The city of the king is troubled while foreigners rejoice to seek him", "Jerusalem celebrates while Bethlehem resists", "Herod is calm but the wise men are afraid", "The priests know nothing about the Messiah"]'::jsonb, 'The city of the king is troubled while foreigners rejoice to seek him', 'Matthew 2:2-3 contrasts the wise men''s worshipful intent with Jerusalem''s disturbed response.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Jerusalem''s reaction to the wise men expose a paradox in Matthew 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 2, 4, 'How does Matthew 2 present Jesus as a new Moses-like figure?', '["A wicked ruler seeks to kill the child, yet God preserves him", "Jesus parts the sea in infancy", "He receives the law on a mountain as a baby", "He grows up in Pharaoh''s palace"]'::jsonb, 'A wicked ruler seeks to kill the child, yet God preserves him', 'Matthew 2 echoes the pattern of Pharaoh''s threat in Exodus, with Herod trying to kill the child.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Matthew 2 present Jesus as a new Moses-like figure?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 2, 4, 'What larger Matthew theme is advanced by the wise men worshiping Jesus?', '["The Messiah''s significance extends beyond Israel to the nations", "Jerusalem has already fully received its king", "Jesus''s kingdom is purely political", "Only foreign astrologers can understand prophecy"]'::jsonb, 'The Messiah''s significance extends beyond Israel to the nations', 'Matthew 2 shows Gentiles coming to worship the Jewish Messiah, anticipating the Gospel''s global horizon.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger Matthew theme is advanced by the wise men worshiping Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 2, 4, 'Why does Matthew repeatedly note events happening to fulfill what was spoken by the prophets in chapter 2?', '["He is showing that Jesus''s early life unfolds according to God''s scriptural plan", "He is correcting mistakes in the prophets", "He wants to avoid mentioning Herod directly", "He is proving dreams are more important than Scripture"]'::jsonb, 'He is showing that Jesus''s early life unfolds according to God''s scriptural plan', 'Matthew 2:5-6, 15, 17-18, and 23 all stress fulfillment of Scripture.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Matthew repeatedly note events happening to fulfill what was spoken by the prophets in chapter 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 2, 5, 'How do dreams function in Matthew 2 as part of the chapter''s theology?', '["They show God''s sovereign guidance protecting the Messiah despite political danger", "They replace the need for obedience", "They are random experiences with no narrative role", "They are given only to hostile rulers"]'::jsonb, 'They show God''s sovereign guidance protecting the Messiah despite political danger', 'Matthew 2 repeatedly uses dreams to direct the wise men and Joseph, showing divine rule over events.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How do dreams function in Matthew 2 as part of the chapter''s theology?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 2, 5, 'How does Matthew 2 portray Jesus in relation to Israel''s story?', '["He relives key patterns of Israel''s history as the true Son called out of Egypt", "He is detached from Israel''s history entirely", "He replaces David but not Israel", "He is shown only as a local Galilean teacher"]'::jsonb, 'He relives key patterns of Israel''s history as the true Son called out of Egypt', 'Matthew 2:15 presents Jesus as recapitulating Israel''s story through the Egypt motif.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Matthew 2 portray Jesus in relation to Israel''s story?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 2, 5, 'How does Matthew 2 use Hosea 11:1 in a way that goes beyond a simple prediction-fulfillment formula?', '["It presents Jesus as recapitulating Israel''s story as God''s true Son", "It proves Hosea was only talking about the Messiah and never Israel", "It shows Egypt had become the center of redemption", "It denies the Exodus ever happened"]'::jsonb, 'It presents Jesus as recapitulating Israel''s story as God''s true Son', 'Matthew 2:15 applies "Out of Egypt I called my son" to Jesus, portraying him as embodying Israel''s calling.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Matthew 2 use Hosea 11:1 in a way that goes beyond a simple prediction-fulfillment formula?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 2, 5, 'What is the theological force of Herod and the Gentile magi appearing together in Matthew 2?', '["Responses to Jesus are divided by faith and hardness, not by ethnicity alone", "Gentiles are always faithful and Jews are always hostile", "Kings alone can recognize the Messiah", "Matthew rejects Israel''s Scriptures in favor of signs in the sky"]'::jsonb, 'Responses to Jesus are divided by faith and hardness, not by ethnicity alone', 'Matthew 2 contrasts worship and hostility without making ethnicity the sole explanation of response.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the theological force of Herod and the Gentile magi appearing together in Matthew 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 2, 5, 'Why is the move to Nazareth significant in Matthew''s narrative logic?', '["It joins Jesus to a humble, prophetically framed identity before his public ministry", "It proves Bethlehem was a mistake in the tradition", "It removes all Davidic associations from Jesus", "It makes Galilee the location of his birth"]'::jsonb, 'It joins Jesus to a humble, prophetically framed identity before his public ministry', 'Matthew 2:23 links Jesus with Nazareth, shaping expectations about the Messiah''s lowly and unexpected profile.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the move to Nazareth significant in Matthew''s narrative logic?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 3, 1, 'What did John wear according to Matthew 3?', '["Camel''s hair with a leather belt", "Fine linen and a sash", "Priestly robes", "A soldier''s tunic"]'::jsonb, 'Camel''s hair with a leather belt', 'Matthew 3:4 describes John''s clothing as camel''s hair and a leather belt.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did John wear according to Matthew 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 3, 1, 'What food did John eat in Matthew 3?', '["Locusts and wild honey", "Bread and fish", "Manna and quail", "Dates and olives"]'::jsonb, 'Locusts and wild honey', 'Matthew 3:4 says John''s food was locusts and wild honey.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'What food did John eat in Matthew 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 3, 1, 'What happened when Jesus came up from the water after being baptized?', '["The heavens were opened to him", "A storm began", "Herod sent soldiers", "The crowd scattered"]'::jsonb, 'The heavens were opened to him', 'Matthew 3:16 says the heavens were opened when Jesus came up from the water.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'What happened when Jesus came up from the water after being baptized?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 3, 1, 'What message did John the Baptizer preach in Matthew 3?', '["Repent, for the Kingdom of Heaven is at hand", "Follow me and I will make you fishers of men", "Blessed are the poor in spirit", "The Son of Man must suffer"]'::jsonb, 'Repent, for the Kingdom of Heaven is at hand', 'Matthew 3:2 records John''s message.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'What message did John the Baptizer preach in Matthew 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 3, 1, 'Who appears preaching in the wilderness of Judea in Matthew 3?', '["John the Baptizer", "Jesus", "Peter", "Elijah"]'::jsonb, 'John the Baptizer', 'Matthew 3:1 introduces John the Baptizer preaching in the wilderness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who appears preaching in the wilderness of Judea in Matthew 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 3, 2, 'How did John describe the one coming after him?', '["Mightier than I", "A teacher from Nazareth", "Equal to the prophets", "A ruler from Rome"]'::jsonb, 'Mightier than I', 'Matthew 3:11 says the one coming after John is mightier than he.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'How did John describe the one coming after him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 3, 2, 'What did John call the Pharisees and Sadducees who came to his baptism?', '["Offspring of vipers", "Children of Abraham", "Faithful shepherds", "Builders of the law"]'::jsonb, 'Offspring of vipers', 'Matthew 3:7 records John''s sharp rebuke.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did John call the Pharisees and Sadducees who came to his baptism?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 3, 2, 'What did people confess as they were baptized by John?', '["Their sins", "Their allegiance to Rome", "Their family ancestry", "Their temple vows"]'::jsonb, 'Their sins', 'Matthew 3:6 says they were baptized by John while confessing their sins.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did people confess as they were baptized by John?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 3, 2, 'What fruit did John say people should bear?', '["Fruit worthy of repentance", "Fruit of the land", "Fruit for the temple", "Fruit of prosperity"]'::jsonb, 'Fruit worthy of repentance', 'Matthew 3:8 says, "Bring forth therefore fruit worthy of repentance."'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What fruit did John say people should bear?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 3, 2, 'Why did John initially object to baptizing Jesus?', '["He felt that he himself needed to be baptized by Jesus", "He feared the Pharisees would be offended", "He thought Jesus was from the wrong tribe", "He had already ended his ministry"]'::jsonb, 'He felt that he himself needed to be baptized by Jesus', 'Matthew 3:14 says John tried to stop Jesus, saying he needed baptism from Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why did John initially object to baptizing Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 3, 3, 'What does John''s image of the axe at the root of the trees communicate?', '["Judgment is near for those who do not bear good fruit", "Israel''s agriculture is about to prosper", "The wilderness will become a forest", "The Romans will cut down Judea''s orchards"]'::jsonb, 'Judgment is near for those who do not bear good fruit', 'Matthew 3:10 uses the axe imagery to warn of imminent judgment.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does John''s image of the axe at the root of the trees communicate?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 3, 3, 'What does John''s statement about baptizing with the Holy Spirit and fire suggest?', '["The coming one will bring both renewal and judgment", "John''s water baptism is false", "Only priests can receive the Spirit", "Fire will replace repentance"]'::jsonb, 'The coming one will bring both renewal and judgment', 'Matthew 3:11-12 combines Spirit imagery with fire and chaff-burning judgment.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does John''s statement about baptizing with the Holy Spirit and fire suggest?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 3, 3, 'What is the significance of the Spirit descending like a dove on Jesus?', '["It marks Jesus out publicly for his messianic mission", "It means Jesus first received authority only after John left", "It shows the baptism was private and hidden", "It identifies John as the Messiah"]'::jsonb, 'It marks Jesus out publicly for his messianic mission', 'Matthew 3:16 depicts the Spirit descending on Jesus as a visible sign of divine approval and mission.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the significance of the Spirit descending like a dove on Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 3, 3, 'Why does Jesus say his baptism is fitting "to fulfill all righteousness"?', '["He is identifying with God''s saving purpose and obeying what is fitting before the Father", "He needs repentance for his own sins", "He wants to replace John''s ministry immediately", "He is performing a public miracle"]'::jsonb, 'He is identifying with God''s saving purpose and obeying what is fitting before the Father', 'Matthew 3:15 presents Jesus''s baptism as part of fulfilling God''s righteous will.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Jesus say his baptism is fitting "to fulfill all righteousness"?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 3, 3, 'Why does John warn against saying, "We have Abraham as our father"?', '["Ancestry alone is not enough without repentance", "Abraham was not part of Israel''s history", "John rejected all covenant promises", "He was speaking only to Gentiles"]'::jsonb, 'Ancestry alone is not enough without repentance', 'Matthew 3:9 rejects reliance on descent from Abraham as a substitute for true repentance.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does John warn against saying, "We have Abraham as our father"?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 3, 4, 'How does John''s warning to the religious leaders fit Matthew''s larger concern with true righteousness?', '["It shows external status is worthless without repentance and obedient fruit", "It proves religious leaders are always excluded from God''s mercy", "It means the Law itself is evil", "It replaces repentance with ritual washing"]'::jsonb, 'It shows external status is worthless without repentance and obedient fruit', 'Matthew 3:7-10 critiques reliance on appearance, ancestry, and status apart from real repentance.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does John''s warning to the religious leaders fit Matthew''s larger concern with true righteousness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 3, 4, 'How does Matthew 3 connect John''s ministry to Isaiah?', '["John is the voice in the wilderness preparing the Lord''s way", "John fulfills Isaiah by rebuilding the temple", "John repeats Isaiah''s courtroom speeches in Jerusalem", "John proves Isaiah was written after Jesus"]'::jsonb, 'John is the voice in the wilderness preparing the Lord''s way', 'Matthew 3:3 quotes Isaiah to identify John as the preparatory voice.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Matthew 3 connect John''s ministry to Isaiah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 3, 4, 'How does Matthew 3 prepare for Jesus''s later conflict with religious leaders?', '["John''s rebuke of fruitless religion anticipates Jesus''s later confrontations with hypocrisy", "It shows the Pharisees immediately becoming disciples", "It resolves all tension with the Sadducees", "It shifts attention away from repentance to ritual"]'::jsonb, 'John''s rebuke of fruitless religion anticipates Jesus''s later confrontations with hypocrisy', 'Matthew 3 introduces themes of fruit, repentance, and hypocrisy that resurface throughout the Gospel.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Matthew 3 prepare for Jesus''s later conflict with religious leaders?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 3, 4, 'What does the scene of Jesus''s baptism reveal about his relationship to the Father and the Spirit?', '["Father, Son, and Spirit are all present in coordinated revelation", "Only the Father acts while the Spirit remains absent", "Jesus becomes the Father at baptism", "The Spirit speaks while the Father descends visibly"]'::jsonb, 'Father, Son, and Spirit are all present in coordinated revelation', 'Matthew 3:16-17 presents Jesus in the water, the Spirit descending, and the Father''s voice from heaven.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does the scene of Jesus''s baptism reveal about his relationship to the Father and the Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 3, 4, 'Why is Jesus''s baptism an important transition point in Matthew''s narrative?', '["It publicly inaugurates his mission after John''s preparatory ministry", "It ends the relevance of the prophets entirely", "It moves the story from Galilee to Rome", "It reveals Herod''s repentance"]'::jsonb, 'It publicly inaugurates his mission after John''s preparatory ministry', 'Matthew 3 closes the preparation period and marks Jesus out before his public ministry begins.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is Jesus''s baptism an important transition point in Matthew''s narrative?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 3, 5, 'How does Matthew 3 prepare for later conflict in the Gospel?', '["John''s rebuke of unfruitful religion anticipates Jesus''s later confrontations with hypocrisy", "It resolves all tension with the Pharisees permanently", "It removes judgment language from the rest of the book", "It shows the Sadducees becoming Jesus''s first disciples"]'::jsonb, 'John''s rebuke of unfruitful religion anticipates Jesus''s later confrontations with hypocrisy', 'Matthew 3 introduces themes of repentance, fruit, and judgment that intensify in Jesus''s later teaching.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Matthew 3 prepare for later conflict in the Gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 3, 5, 'How does Matthew 3 unite repentance, revelation, and mission?', '["John calls Israel to repentance, the Father reveals the Son, and Jesus is publicly marked out for his mission", "Repentance is replaced once the voice from heaven speaks", "Mission begins without any relation to John''s ministry", "The chapter focuses only on baptism as ritual"]'::jsonb, 'John calls Israel to repentance, the Father reveals the Son, and Jesus is publicly marked out for his mission', 'Matthew 3 moves from John''s preaching to Jesus''s baptism and divine affirmation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Matthew 3 unite repentance, revelation, and mission?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 3, 5, 'How does the heavenly voice at Jesus''s baptism combine royal and servant imagery from the Old Testament?', '["It echoes both the royal Son language of Psalm 2 and the chosen servant language of Isaiah 42", "It quotes only Moses at Sinai", "It rejects all earlier messianic hopes", "It refers exclusively to David''s military victories"]'::jsonb, 'It echoes both the royal Son language of Psalm 2 and the chosen servant language of Isaiah 42', 'Matthew 3:17, "This is my beloved Son, in whom I am well pleased," resonates with both Psalm 2:7 and Isaiah 42:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does the heavenly voice at Jesus''s baptism combine royal and servant imagery from the Old Testament?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 3, 5, 'What is the narrative significance of heaven opening at Jesus''s baptism?', '["It signals divine revelation and endorsement at the start of Jesus''s public work", "It means the final judgment has already fully arrived", "It shows John is being taken into heaven", "It replaces the need for all future teaching"]'::jsonb, 'It signals divine revelation and endorsement at the start of Jesus''s public work', 'Matthew 3:16-17 presents the opened heavens as the setting for the Spirit''s descent and the Father''s declaration.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the narrative significance of heaven opening at Jesus''s baptism?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 3, 5, 'Why is John''s statement that God can raise up children to Abraham from stones theologically sharp?', '["It declares that God''s covenant purposes depend on his power, not human pedigree", "It means stones will literally replace Israel in every sense", "It denies Abraham''s importance in salvation history", "It teaches repentance is unnecessary for Gentiles"]'::jsonb, 'It declares that God''s covenant purposes depend on his power, not human pedigree', 'Matthew 3:9 undermines confidence in ancestry by emphasizing God''s sovereign power to create a people for himself.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is John''s statement that God can raise up children to Abraham from stones theologically sharp?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 4, 1, 'In Matthew 4, how long was Jesus in the wilderness being tempted?', '["Forty days and forty nights", "Seven days", "Twelve days", "Three months"]'::jsonb, 'Forty days and forty nights', 'Matthew 4:2 says Jesus fasted forty days and forty nights in the wilderness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'In Matthew 4, how long was Jesus in the wilderness being tempted?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 4, 1, 'What did Jesus begin to preach in Matthew 4?', '["Repent, for the kingdom of heaven is at hand", "Blessed are the poor in spirit", "Destroy this temple", "Come to me, all who labor"]'::jsonb, 'Repent, for the kingdom of heaven is at hand', 'Matthew 4:17 records the start of Jesus''s preaching in Galilee.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus begin to preach in Matthew 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 4, 1, 'What did Jesus do throughout Galilee in Matthew 4?', '["Teach, preach, and heal every disease and sickness", "Withdraw alone into the wilderness", "Travel only among the priests", "Avoid large crowds entirely"]'::jsonb, 'Teach, preach, and heal every disease and sickness', 'Matthew 4:23 summarizes Jesus''s Galilean ministry.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus do throughout Galilee in Matthew 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 4, 1, 'What did Simon Peter and Andrew do when Jesus called them in Matthew 4?', '["They left their nets and followed him", "They asked to bury their father first", "They returned to Jerusalem", "They brought him to John the Baptist"]'::jsonb, 'They left their nets and followed him', 'Matthew 4:20 says they immediately left their nets and followed Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Simon Peter and Andrew do when Jesus called them in Matthew 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 4, 1, 'Who was arrested before Jesus began preaching in Galilee in Matthew 4?', '["John the Baptist", "Peter", "Herod Antipas", "James"]'::jsonb, 'John the Baptist', 'Matthew 4:12 says Jesus withdrew into Galilee after hearing that John had been arrested.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who was arrested before Jesus began preaching in Galilee in Matthew 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 4, 2, 'What did Jesus quote to answer the temptation to worship the devil in Matthew 4?', '["You shall worship the Lord your God, and him only shall you serve", "The Lord is my shepherd", "I desire mercy and not sacrifice", "Love your neighbor as yourself"]'::jsonb, 'You shall worship the Lord your God, and him only shall you serve', 'Matthew 4:10 gives Jesus''s scriptural answer.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus quote to answer the temptation to worship the devil in Matthew 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 4, 2, 'What did Jesus say people should not live by alone in Matthew 4?', '["Bread alone", "Prayer alone", "Law alone", "Sacrifice alone"]'::jsonb, 'Bread alone', 'Matthew 4:4 says man shall not live by bread alone.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say people should not live by alone in Matthew 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 4, 2, 'What did Jesus say when he called Simon Peter and Andrew?', '["Follow me, and I will make you fishers of men", "Come after me to Jerusalem", "Leave your nets for the temple", "Repent and be baptized"]'::jsonb, 'Follow me, and I will make you fishers of men', 'Matthew 4:19 records Jesus calling them to become fishers of men.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say when he called Simon Peter and Andrew?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 4, 2, 'What did the devil show Jesus from a very high mountain in Matthew 4?', '["All the kingdoms of the world and their glory", "The temple courts of Jerusalem", "The Jordan River", "The armies of Rome"]'::jsonb, 'All the kingdoms of the world and their glory', 'Matthew 4:8 says the devil showed him all the kingdoms of the world and their glory.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the devil show Jesus from a very high mountain in Matthew 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 4, 2, 'What did the devil tell Jesus to make from stones in Matthew 4?', '["Bread", "Water", "A throne", "A temple"]'::jsonb, 'Bread', 'Matthew 4:3 records the temptation to turn stones into bread.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the devil tell Jesus to make from stones in Matthew 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 4, 3, 'How do temptation and healing belong together in Matthew 4?', '["The faithful Son who resists Satan now begins liberating and restoring others", "Healing corrects for Jesus''s failure in the wilderness", "They are unrelated traditions joined by chance", "Only the healings matter for Matthew''s theology"]'::jsonb, 'The faithful Son who resists Satan now begins liberating and restoring others', 'Matthew 4 moves from victory over temptation to kingdom healing ministry.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'How do temptation and healing belong together in Matthew 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 4, 3, 'What does Jesus''s refusal of the temple-jump temptation reveal in Matthew 4?', '["Faithful sonship trusts God without testing him for spectacle", "Jesus fears public ministry altogether", "Miracles are always wrong", "The temple is outside God''s concern"]'::jsonb, 'Faithful sonship trusts God without testing him for spectacle', 'Matthew 4:5-7 contrasts trust with presumptuous testing of God.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Jesus''s refusal of the temple-jump temptation reveal in Matthew 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 4, 3, 'What pattern marks Jesus''s answers to the devil in Matthew 4?', '["He answers each temptation with Scripture", "He stays silent through every temptation", "He calls down angels to answer", "He debates from Roman law"]'::jsonb, 'He answers each temptation with Scripture', 'Matthew 4:4, 4:7, and 4:10 show Jesus replying with words from Scripture.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What pattern marks Jesus''s answers to the devil in Matthew 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 4, 3, 'Why is Galilee of the Gentiles significant in Matthew 4?', '["It highlights that messianic light dawns in a region associated with darkness and the nations", "It shows Jesus rejecting Israel for Gentiles entirely", "It means Galilee replaces Jerusalem permanently", "It proves Jesus was born in Galilee"]'::jsonb, 'It highlights that messianic light dawns in a region associated with darkness and the nations', 'Matthew 4:15-16 cites Isaiah to interpret Jesus''s move to Galilee.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is Galilee of the Gentiles significant in Matthew 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 4, 3, 'Why is the calling of the first disciples important in Matthew 4?', '["Jesus''s kingdom mission immediately creates a following shaped by obedience and mission", "The disciples are presented as cautious and delayed", "It shows Jesus preferred Jerusalem elites", "It ends the need for further preaching"]'::jsonb, 'Jesus''s kingdom mission immediately creates a following shaped by obedience and mission', 'Matthew 4:18-22 shows immediate response to Jesus''s call.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the calling of the first disciples important in Matthew 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 4, 4, 'How does Matthew 4 portray Jesus as a new Israel?', '["He passes the wilderness testing where Israel failed and then brings light to the land", "He abandons the wilderness themes as irrelevant", "He repeats Israel''s rebellion in a better form", "He replaces Moses only through miracles"]'::jsonb, 'He passes the wilderness testing where Israel failed and then brings light to the land', 'Matthew 4 intentionally echoes Israel''s wilderness story through Jesus''s obedience.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Matthew 4 portray Jesus as a new Israel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 4, 4, 'How does Matthew 4 set up the Sermon on the Mount?', '["Jesus first manifests kingdom authority in word and deed, then teaches its ethic in chapters 5-7", "The sermon interrupts an unrelated healing section", "The disciples are called after the sermon, not before", "The chapter removes the need for further teaching"]'::jsonb, 'Jesus first manifests kingdom authority in word and deed, then teaches its ethic in chapters 5-7', 'Matthew 4 ends with crowds gathering around Jesus before the sermon begins in chapter 5.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Matthew 4 set up the Sermon on the Mount?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 4, 4, 'What larger picture of mission emerges in Matthew 4?', '["Kingdom proclamation, disciple-making, and healing move together from the start", "Mission is delayed until after the resurrection", "Healing comes before any message", "Discipleship remains private and hidden"]'::jsonb, 'Kingdom proclamation, disciple-making, and healing move together from the start', 'Matthew 4:17-25 combines preaching, calling disciples, and healing.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger picture of mission emerges in Matthew 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 4, 4, 'Why does Matthew emphasize ''immediately'' in the disciples'' response to Jesus?', '["It underscores the authority of Jesus''s call and the urgency of kingdom response", "It means the disciples had no prior knowledge of Jesus at all", "It proves they never returned home again in any sense", "It is only a stylistic detail with no meaning"]'::jsonb, 'It underscores the authority of Jesus''s call and the urgency of kingdom response', 'Matthew 4:20 and 4:22 stress their immediate response.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Matthew emphasize ''immediately'' in the disciples'' response to Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 4, 4, 'Why does Matthew mention Galilee of the Gentiles when Jesus begins ministry there?', '["To show prophecy about light dawning in a dark region is being fulfilled", "To prove Jesus avoided Jewish towns", "To explain why John baptized there", "To identify Galilee as Rome''s capital"]'::jsonb, 'To show prophecy about light dawning in a dark region is being fulfilled', 'Matthew 4:13-16 presents Jesus''s move to Galilee as fulfillment of Isaiah''s light prophecy.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Matthew mention Galilee of the Gentiles when Jesus begins ministry there?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 4, 5, 'How does Matthew 4 connect kingship and worship?', '["Jesus rejects false kingdoms because worship belongs to God alone, even though true kingship belongs to him", "Worship is shown to be politically irrelevant", "Kingship means taking power without suffering", "Only temple worship matters in Matthew 4"]'::jsonb, 'Jesus rejects false kingdoms because worship belongs to God alone, even though true kingship belongs to him', 'Matthew 4:8-10 ties worship and kingdom directly together.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Matthew 4 connect kingship and worship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 4, 5, 'How does Matthew 4 reveal the kind of Messiah Jesus is not?', '["He refuses to be a Messiah of appetite, spectacle, or coercive power", "He refuses all kingship entirely", "He rejects Scripture as the basis for mission", "He avoids any public identity"]'::jsonb, 'He refuses to be a Messiah of appetite, spectacle, or coercive power', 'The temptations in Matthew 4 clarify the false kinds of messiahship Jesus rejects.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Matthew 4 reveal the kind of Messiah Jesus is not?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 4, 5, 'How does Matthew 4 set the tone for Jesus''s public ministry?', '["Jesus overcomes the tempter, announces the kingdom, and begins gathering disciples", "Jesus withdraws from all public activity after John''s arrest", "Jesus becomes a political ruler in Capernaum", "Jesus limits his work to the temple courts"]'::jsonb, 'Jesus overcomes the tempter, announces the kingdom, and begins gathering disciples', 'Matthew 4 joins temptation victory, kingdom proclamation, calling disciples, and widespread healing into the opening pattern of Jesus''s ministry.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Matthew 4 set the tone for Jesus''s public ministry?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 4, 5, 'What does Matthew 4 suggest about the kingdom''s arrival?', '["It arrives through the obedient Son''s proclamation, power, and gathering of disciples", "It arrives by force and public spectacle", "It remains only a future hope with no present effects", "It is confined to Jerusalem''s temple leaders"]'::jsonb, 'It arrives through the obedient Son''s proclamation, power, and gathering of disciples', 'Matthew 4 portrays the kingdom as already active in Jesus''s ministry.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Matthew 4 suggest about the kingdom''s arrival?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 4, 5, 'Why is Scripture central in Matthew 4?', '["Jesus defines faithful sonship and mission through obedient submission to God''s word", "Scripture appears only as a debate tactic", "The devil uses Scripture correctly while Jesus does not", "Matthew presents mission without scriptural grounding"]'::jsonb, 'Jesus defines faithful sonship and mission through obedient submission to God''s word', 'Matthew 4 repeatedly shows Jesus answering temptation with Scripture.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Scripture central in Matthew 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 5, 1, 'According to Matthew 5, who are blessed because they shall inherit the earth?', '["The meek", "The rich", "The powerful", "The learned"]'::jsonb, 'The meek', 'Matthew 5:5 says the meek shall inherit the earth.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Matthew 5, who are blessed because they shall inherit the earth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 5, 1, 'What did Jesus say about the meek in Matthew 5?', '["They shall inherit the earth", "They shall see God", "They shall be filled", "They shall obtain mercy"]'::jsonb, 'They shall inherit the earth', 'Matthew 5:5 says the meek shall inherit the earth.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say about the meek in Matthew 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 5, 1, 'What did Jesus say his disciples are in relation to the world in Matthew 5?', '["The light of the world", "The leaven of the world", "The rulers of the world", "The hidden treasure of the world"]'::jsonb, 'The light of the world', 'Matthew 5:14 calls the disciples the light of the world.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say his disciples are in relation to the world in Matthew 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 5, 1, 'What did Jesus say should happen to a lamp in Matthew 5?', '["It should be put on a stand", "It should be hidden under a basket", "It should be extinguished at dawn", "It should be given only to priests"]'::jsonb, 'It should be put on a stand', 'Matthew 5:15 says a lamp is put on a stand to give light.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say should happen to a lamp in Matthew 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 5, 1, 'Who are called blessed because they are poor in spirit in Matthew 5?', '["For theirs is the kingdom of heaven", "For they will inherit the earth", "For they will laugh now", "For they will be called sons of peace"]'::jsonb, 'For theirs is the kingdom of heaven', 'Matthew 5:3 says, ''Blessed are the poor in spirit, for theirs is the kingdom of heaven.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who are called blessed because they are poor in spirit in Matthew 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 5, 2, 'How did Jesus summarize the command regarding enemies in Matthew 5?', '["Love your enemies and pray for those who persecute you", "Tolerate your enemies but avoid them", "Judge your enemies publicly", "Defeat your enemies before you pray"]'::jsonb, 'Love your enemies and pray for those who persecute you', 'Matthew 5:44 gives this command.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'How did Jesus summarize the command regarding enemies in Matthew 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 5, 2, 'What did Jesus say about anger toward a brother in Matthew 5?', '["It places a person in danger of judgment", "It is harmless if unspoken", "It matters only when seen publicly", "It is better than murder and therefore acceptable"]'::jsonb, 'It places a person in danger of judgment', 'Matthew 5:21-22 intensifies the commandment against murder to heart-level anger.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say about anger toward a brother in Matthew 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 5, 2, 'What did Jesus say about reconciliation before offering a gift at the altar in Matthew 5?', '["Be reconciled to your brother first", "The offering matters more than reconciliation", "Wait for the priest to decide first", "Return only after the feast"]'::jsonb, 'Be reconciled to your brother first', 'Matthew 5:23-24 tells the worshiper to be reconciled first.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say about reconciliation before offering a gift at the altar in Matthew 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 5, 2, 'What did Jesus say he came to do regarding the Law and the Prophets in Matthew 5?', '["Fulfill them, not abolish them", "Replace them entirely", "Delay them until the kingdom came", "Ignore them in favor of grace"]'::jsonb, 'Fulfill them, not abolish them', 'Matthew 5:17 says Jesus came not to abolish but to fulfill.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say he came to do regarding the Law and the Prophets in Matthew 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 5, 2, 'What two images does Jesus use for his disciples in Matthew 5?', '["Salt of the earth and light of the world", "Sheep and goats", "Bread and wine", "Wheat and tares"]'::jsonb, 'Salt of the earth and light of the world', 'Matthew 5:13-14 calls the disciples salt of the earth and light of the world.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'What two images does Jesus use for his disciples in Matthew 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 5, 3, 'What does Jesus intensify in Matthew 5 when speaking about murder and adultery?', '["The heart-level intent behind the commandment", "The need for more temple sacrifices", "The power of Roman courts", "The value of public reputation"]'::jsonb, 'The heart-level intent behind the commandment', 'Matthew 5:21-30 moves from outward acts to anger and lust at the heart level.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Jesus intensify in Matthew 5 when speaking about murder and adultery?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 5, 3, 'What does enemy-love reveal about God''s character in Matthew 5?', '["The Father shows kindness beyond natural reciprocity, and disciples are to reflect that", "God loves only the righteous and not enemies", "Prayer for enemies is a temporary command only", "Perfect love means avoiding conflict at all costs"]'::jsonb, 'The Father shows kindness beyond natural reciprocity, and disciples are to reflect that', 'Matthew 5:44-48 grounds enemy-love in the Father''s perfection.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does enemy-love reveal about God''s character in Matthew 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 5, 3, 'What is Jesus doing when he intensifies commands about murder and adultery in Matthew 5?', '["He moves righteousness from mere external compliance to the heart''s true condition", "He lowers the moral standard to make obedience easier", "He rejects the commandments entirely", "He addresses only Pharisees, not disciples"]'::jsonb, 'He moves righteousness from mere external compliance to the heart''s true condition', 'Matthew 5:21-30 deepens the commandments to motives and desires.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is Jesus doing when he intensifies commands about murder and adultery in Matthew 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 5, 3, 'Why are salt and light fitting images in Matthew 5?', '["Disciples are called to preserve, expose, and publicly display God''s kingdom ethic", "They show disciples should remain hidden from society", "They refer only to temple rituals", "They apply only to the apostles"]'::jsonb, 'Disciples are called to preserve, expose, and publicly display God''s kingdom ethic', 'Matthew 5:13-16 uses salt and light as public kingdom metaphors.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why are salt and light fitting images in Matthew 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 5, 3, 'Why is Jesus''s warning about oath-making important in Matthew 5?', '["Kingdom truthfulness should make manipulative oath systems unnecessary", "All promises are forbidden in every setting", "Speech has no moral significance", "Oaths matter more than plain honesty"]'::jsonb, 'Kingdom truthfulness should make manipulative oath systems unnecessary', 'Matthew 5:33-37 calls for simple, truthful speech.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is Jesus''s warning about oath-making important in Matthew 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 5, 4, 'How do the Beatitudes and the antitheses fit together in Matthew 5?', '["The blessed life of the kingdom is then defined in concrete patterns of deeper righteousness", "The Beatitudes are canceled by the later commands", "Only the antitheses apply to disciples", "The two sections address different audiences"]'::jsonb, 'The blessed life of the kingdom is then defined in concrete patterns of deeper righteousness', 'Matthew 5 moves from kingdom blessing to kingdom righteousness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do the Beatitudes and the antitheses fit together in Matthew 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 5, 4, 'How does Jesus describe his relationship to the Law and the Prophets in Matthew 5:17?', '["He came not to abolish but to fulfill", "He came to replace them entirely", "He came to postpone them", "He came to ignore them"]'::jsonb, 'He came not to abolish but to fulfill', 'Matthew 5:17 says Jesus came not to destroy the Law or the Prophets but to fulfill them.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Jesus describe his relationship to the Law and the Prophets in Matthew 5:17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 5, 4, 'How does Matthew 5 portray the disciple''s relation to the world?', '["Disciples are visibly present in the world as witnesses to the Father''s goodness", "Disciples should withdraw completely from public life", "The world is to be ignored rather than engaged", "Witness belongs only to miracle-workers"]'::jsonb, 'Disciples are visibly present in the world as witnesses to the Father''s goodness', 'Matthew 5:13-16 stresses visible good works and witness before others.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Matthew 5 portray the disciple''s relation to the world?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 5, 4, 'What larger vision of righteousness emerges in Matthew 5?', '["True righteousness exceeds the scribes and Pharisees by penetrating to motive, reconciliation, truthfulness, and love", "Righteousness is mainly ceremonial exactness", "Righteousness is optional once grace appears", "Only public behavior matters to God"]'::jsonb, 'True righteousness exceeds the scribes and Pharisees by penetrating to motive, reconciliation, truthfulness, and love', 'Matthew 5:20 and the following examples define deeper righteousness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger vision of righteousness emerges in Matthew 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 5, 4, 'Why is fulfillment language crucial in Matthew 5?', '["Jesus presents himself as the one who brings the Law and Prophets to their intended goal", "It means the Old Testament no longer matters at all", "It applies only to prophecy, not ethics", "It shows Jesus avoiding the issue of obedience"]'::jsonb, 'Jesus presents himself as the one who brings the Law and Prophets to their intended goal', 'Matthew 5:17-20 centers on fulfillment as the frame for Jesus''s teaching.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is fulfillment language crucial in Matthew 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 5, 5, 'How does Matthew 5 connect blessedness and obedience?', '["Those blessed by the kingdom are called into a transformed way of life that reflects its values", "Blessing replaces the need for obedience", "Obedience earns the Beatitudes retroactively", "The Beatitudes and commands are unrelated themes"]'::jsonb, 'Those blessed by the kingdom are called into a transformed way of life that reflects its values', 'Matthew 5 begins with kingdom blessing and unfolds into kingdom obedience.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Matthew 5 connect blessedness and obedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 5, 5, 'How does Matthew 5 deepen the meaning of perfection?', '["Perfection is framed as wholehearted conformity to the Father''s inclusive love", "Perfection means never needing mercy", "Perfection belongs only to heaven and not discipleship", "Perfection is reduced to ritual purity alone"]'::jsonb, 'Perfection is framed as wholehearted conformity to the Father''s inclusive love', 'Matthew 5:48 concludes the chapter with perfection tied to enemy-love and the Father''s character.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Matthew 5 deepen the meaning of perfection?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 5, 5, 'What does Matthew 5 imply about kingdom witness?', '["Kingdom witness consists in a life of visible good, truthful speech, reconciliation, and love shaped by the Father", "Witness depends mainly on public miracles", "Witness requires political power", "Witness can remain inward and hidden"]'::jsonb, 'Kingdom witness consists in a life of visible good, truthful speech, reconciliation, and love shaped by the Father', 'Matthew 5 joins salt/light imagery with concrete ethical instruction.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Matthew 5 imply about kingdom witness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 5, 5, 'Why does Jesus end this section with the call to be perfect as the Father is perfect?', '["He calls disciples to wholehearted kingdom righteousness shaped by the Father''s character", "He requires sinless performance by human strength alone", "He limits perfection to religious leaders", "He speaks only about ceremonial purity"]'::jsonb, 'He calls disciples to wholehearted kingdom righteousness shaped by the Father''s character', 'Matthew 5:43-48 climaxes in enemy-love and likeness to the Father''s perfect love.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does Jesus end this section with the call to be perfect as the Father is perfect?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 5, 5, 'Why is Jesus''s treatment of the law in Matthew 5 foundational for the Gospel?', '["It shows that Jesus authoritatively interprets Scripture while centering its deepest intent in himself", "It removes the Old Testament from Matthew''s storyline", "It proves Jesus is only one teacher among many", "It limits discipleship to moral effort without grace"]'::jsonb, 'It shows that Jesus authoritatively interprets Scripture while centering its deepest intent in himself', 'Matthew 5 establishes Jesus as the authoritative interpreter and fulfiller of Scripture.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Jesus''s treatment of the law in Matthew 5 foundational for the Gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 6, 1, 'How did Jesus say his disciples should address God in prayer in Matthew 6?', '["Our Father in heaven", "Lord of armies only", "God of Abraham only", "Most high judge alone"]'::jsonb, 'Our Father in heaven', 'Matthew 6:9 begins the prayer, ''Our Father in heaven.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'How did Jesus say his disciples should address God in prayer in Matthew 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 6, 1, 'In Matthew 6, how does Jesus say believers should pray?', '["In secret to the Father", "Only in the synagogues", "With many repeated phrases", "Only at feast days"]'::jsonb, 'In secret to the Father', 'Matthew 6:6 teaches praying to the Father in secret.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'In Matthew 6, how does Jesus say believers should pray?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 6, 1, 'What did Jesus say should be done on earth as it is in heaven in Matthew 6?', '["God''s will", "The law of Rome", "Temple sacrifice only", "The disciples'' plans"]'::jsonb, 'God''s will', 'Matthew 6:10 says, ''Your will be done, on earth as it is in heaven.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say should be done on earth as it is in heaven in Matthew 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 6, 1, 'What did Jesus tell people not to worry about in Matthew 6?', '["Their life, food, and clothing", "Their prayers being too long", "Their family tree", "Their place in the synagogue"]'::jsonb, 'Their life, food, and clothing', 'Matthew 6:25 says not to be anxious about life, food, drink, or clothing.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus tell people not to worry about in Matthew 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 6, 1, 'What kind of giving did Jesus warn against in Matthew 6?', '["Giving to be seen by others", "Giving to the poor in secret", "Giving with joy", "Giving through the temple treasury"]'::jsonb, 'Giving to be seen by others', 'Matthew 6:1-4 warns against practicing righteousness before others to be seen by them.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'What kind of giving did Jesus warn against in Matthew 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 6, 2, 'What did Jesus say hypocrites love when they give and pray in Matthew 6?', '["The praise of others", "Secret fellowship with God", "Private repentance", "Simple obedience"]'::jsonb, 'The praise of others', 'Matthew 6:2 and 6:5 say hypocrites do these things to be seen and praised by others.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say hypocrites love when they give and pray in Matthew 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 6, 2, 'What did Jesus say no one can serve in Matthew 6?', '["Two masters", "Two neighbors", "Two kingdoms", "Two prophets"]'::jsonb, 'Two masters', 'Matthew 6:24 says no one can serve two masters.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say no one can serve in Matthew 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 6, 2, 'What did Jesus say should be done with treasures in Matthew 6?', '["Lay them up in heaven", "Hide them from the poor", "Count them carefully every day", "Use them to gain public honor"]'::jsonb, 'Lay them up in heaven', 'Matthew 6:19-21 contrasts earthly treasure with treasure in heaven.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say should be done with treasures in Matthew 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 6, 2, 'What did Jesus say the Father sees in Matthew 6?', '["What is done in secret", "Only what happens in the temple", "Only public acts of righteousness", "Only the heart and not deeds"]'::jsonb, 'What is done in secret', 'Matthew 6:4, 6, and 18 say the Father sees in secret.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say the Father sees in Matthew 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 6, 2, 'What does Jesus tell his disciples to seek first?', '["The Kingdom of God and his righteousness", "A sign from heaven", "Daily prosperity", "Honor before people"]'::jsonb, 'The Kingdom of God and his righteousness', 'Matthew 6:33 says to seek first God''s kingdom and righteousness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Jesus tell his disciples to seek first?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 6, 3, 'What does Jesus mean by saying the eye is the lamp of the body in Matthew 6?', '["A person''s inward focus shapes the moral direction of the whole life", "Physical eyesight guarantees spiritual clarity", "Only prophets can have a healthy eye", "The eye matters only for judging others"]'::jsonb, 'A person''s inward focus shapes the moral direction of the whole life', 'Matthew 6:22-23 uses the eye as a metaphor for inward orientation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Jesus mean by saying the eye is the lamp of the body in Matthew 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 6, 3, 'What does fasting reveal when done rightly in Matthew 6?', '["Devotion is directed toward the Father rather than toward impressing others", "The body is evil and must be punished", "Public sadness proves spiritual sincerity", "Fasting replaces prayer and generosity"]'::jsonb, 'Devotion is directed toward the Father rather than toward impressing others', 'Matthew 6:16-18 contrasts hypocritical fasting with God-oriented fasting.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does fasting reveal when done rightly in Matthew 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 6, 3, 'What is Jesus correcting when he warns against giving, praying, and fasting to be seen by others?', '["Performative righteousness for human applause", "The existence of prayer itself", "Any public reading of Scripture", "Helping the poor in any form"]'::jsonb, 'Performative righteousness for human applause', 'Matthew 6:1-18 repeatedly warns against practicing devotion for public praise.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is Jesus correcting when he warns against giving, praying, and fasting to be seen by others?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 6, 3, 'Why are birds and lilies fitting examples in Matthew 6?', '["They illustrate the Father''s care and expose anxiety as unbelieving preoccupation", "They show that work is unnecessary for everyone", "They prove nature is more important than people", "They represent wealth and royal beauty only"]'::jsonb, 'They illustrate the Father''s care and expose anxiety as unbelieving preoccupation', 'Matthew 6:26-30 points to birds and lilies to teach trust in the Father''s care.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why are birds and lilies fitting examples in Matthew 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 6, 3, 'Why is secret devotion so important in Matthew 6?', '["It reorients righteousness toward the Father rather than human applause", "It forbids any public prayer or generosity", "It proves outward acts never matter", "It means disciples should hide their faith entirely"]'::jsonb, 'It reorients righteousness toward the Father rather than human applause', 'Matthew 6:1-18 repeatedly contrasts human applause with the Father''s reward.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is secret devotion so important in Matthew 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 6, 4, 'How do prayer, treasure, and anxiety fit together in Matthew 6?', '["The Father''s care frees disciples from anxious grasping and reorders their desires toward his kingdom", "Prayer removes the need for practical faithfulness", "Treasure and anxiety are unrelated topics", "The chapter moves away from the Father after the Lord''s Prayer"]'::jsonb, 'The Father''s care frees disciples from anxious grasping and reorders their desires toward his kingdom', 'Matthew 6 links Father-centered prayer with treasure in heaven and freedom from anxiety.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do prayer, treasure, and anxiety fit together in Matthew 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 6, 4, 'How does Matthew 6 challenge divided loyalty?', '["It shows that one cannot center life on both God and wealth or on both God and public approval", "Divided loyalty is acceptable if one is generous", "The issue concerns only the rich", "Loyalty is unrelated to anxiety"]'::jsonb, 'It shows that one cannot center life on both God and wealth or on both God and public approval', 'Matthew 6 exposes divided loyalties in devotion, treasure, and service.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Matthew 6 challenge divided loyalty?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 6, 4, 'How does the teaching on treasure, the eye, and mammon fit together in Matthew 6?', '["They all address undivided loyalty and what rules the heart", "They describe three unrelated topics with no connection", "They concern only agricultural wealth", "They replace prayer with financial giving"]'::jsonb, 'They all address undivided loyalty and what rules the heart', 'Matthew 6:19-24 ties treasure, vision, and masters together around the question of allegiance.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the teaching on treasure, the eye, and mammon fit together in Matthew 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 6, 4, 'What larger view of righteousness emerges in Matthew 6?', '["True righteousness is sincere, Father-facing, and free from performative religion", "Righteousness is mainly public visibility of devotion", "Hidden devotion is less valuable than open honor", "Righteousness concerns money only"]'::jsonb, 'True righteousness is sincere, Father-facing, and free from performative religion', 'Matthew 6 repeatedly emphasizes the Father''s sight over public display.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger view of righteousness emerges in Matthew 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 6, 4, 'Why is the Lord''s Prayer central in Matthew 6?', '["It provides a God-centered pattern for life under the Father''s rule", "It is included mainly as a liturgical formula without context", "It replaces all other kinds of prayer", "It belongs only to the apostles"]'::jsonb, 'It provides a God-centered pattern for life under the Father''s rule', 'Matthew 6:9-13 places the Lord''s Prayer at the center of Jesus''s teaching on prayer.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is the Lord''s Prayer central in Matthew 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 6, 5, 'How does Matthew 6 connect kingdom seeking with daily life?', '["Seeking the kingdom reshapes prayer, possessions, and freedom from anxiety in ordinary life", "The kingdom concerns only future events", "Daily needs are beneath kingdom concern", "Kingdom seeking is mainly public activism"]'::jsonb, 'Seeking the kingdom reshapes prayer, possessions, and freedom from anxiety in ordinary life', 'Matthew 6:33 grounds ordinary life in priority of the kingdom and righteousness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Matthew 6 connect kingdom seeking with daily life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 6, 5, 'How does Matthew 6 portray the Father?', '["As the one who sees in secret, knows needs, forgives, and cares for his children", "As distant and uninterested in daily life", "As concerned only with ritual precision", "As responding only to long public prayers"]'::jsonb, 'As the one who sees in secret, knows needs, forgives, and cares for his children', 'Matthew 6 consistently presents the Father as attentive and generous.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Matthew 6 portray the Father?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 6, 5, 'What does Matthew 6 imply about the disciple''s inner life?', '["The disciple''s hidden life before the Father is the true source of visible faithfulness", "Inner life is secondary to outward correctness", "Only public acts matter in the kingdom", "Anxiety is the normal sign of devotion"]'::jsonb, 'The disciple''s hidden life before the Father is the true source of visible faithfulness', 'The chapter repeatedly centers secret communion, trust, and desire before God.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Matthew 6 imply about the disciple''s inner life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 6, 5, 'Why does Jesus point to birds and lilies in Matthew 6?', '["To teach trust in the Father''s care rather than anxious striving", "To show nature is more important than people", "To command people not to work at all", "To compare birds with the temple priests"]'::jsonb, 'To teach trust in the Father''s care rather than anxious striving', 'Matthew 6:25-34 uses birds and lilies to show the Father''s care and to oppose anxiety.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does Jesus point to birds and lilies in Matthew 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 6, 5, 'Why is forgiveness important in the Lord''s Prayer context of Matthew 6?', '["Receiving and extending forgiveness are inseparable in life before the Father", "Forgiveness is only a private feeling", "The Father forgives regardless of how disciples treat others", "Forgiveness belongs only to temple ritual"]'::jsonb, 'Receiving and extending forgiveness are inseparable in life before the Father', 'Matthew 6:12 and 6:14-15 tie divine forgiveness and human forgiveness closely together.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is forgiveness important in the Lord''s Prayer context of Matthew 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 7, 1, 'What did Jesus say not to do hypocritically in Matthew 7?', '["Judge", "Pray", "Fast", "Give"]'::jsonb, 'Judge', 'Matthew 7:1-5 warns against hypocritical judgment.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say not to do hypocritically in Matthew 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 7, 1, 'What did Jesus tell people to do in Matthew 7 besides ask?', '["Seek and knock", "Watch and wait", "Fast and weep", "Build and fight"]'::jsonb, 'Seek and knock', 'Matthew 7:7 says to ask, seek, and knock.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus tell people to do in Matthew 7 besides ask?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 7, 1, 'What kind of gate did Jesus say leads to life in Matthew 7?', '["The narrow gate", "The wide gate", "The temple gate", "The eastern gate"]'::jsonb, 'The narrow gate', 'Matthew 7:13-14 contrasts the narrow gate leading to life with the broad way leading to destruction.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'What kind of gate did Jesus say leads to life in Matthew 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 7, 1, 'What object does Jesus say a hypocrite notices in his brother''s eye?', '["A speck", "A beam", "A veil", "A thorn bush"]'::jsonb, 'A speck', 'Matthew 7:3 refers to the speck in a brother''s eye.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'What object does Jesus say a hypocrite notices in his brother''s eye?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 7, 1, 'What rule did Jesus give that sums up the Law and the Prophets in Matthew 7?', '["Whatever you wish others would do to you, do also to them", "Love your enemies and hate no one", "Do not judge under any circumstances", "Seek first the kingdom and wealth"]'::jsonb, 'Whatever you wish others would do to you, do also to them', 'Matthew 7:12 gives the Golden Rule.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'What rule did Jesus give that sums up the Law and the Prophets in Matthew 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 7, 2, 'How are false prophets recognized in Matthew 7?', '["By their fruits", "By their clothing alone", "By their public titles", "By their miracles only"]'::jsonb, 'By their fruits', 'Matthew 7:15-20 says false prophets are known by their fruits.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'How are false prophets recognized in Matthew 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 7, 2, 'What did Jesus say to someone with a log in his own eye in Matthew 7?', '["First take the log out of your own eye", "Judge your brother more carefully", "Ignore the speck entirely", "Go to the synagogue leaders first"]'::jsonb, 'First take the log out of your own eye', 'Matthew 7:5 says to remove the log from your own eye first.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say to someone with a log in his own eye in Matthew 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 7, 2, 'What does Jesus say to do in Matthew 7:7?', '["Ask, seek, and knock", "Fast, give, and travel", "Judge, warn, and condemn", "Hide, wait, and fear"]'::jsonb, 'Ask, seek, and knock', 'Matthew 7:7 says to ask, seek, and knock.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Jesus say to do in Matthew 7:7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 7, 2, 'What happened to the house built on the rock in Matthew 7?', '["It did not fall", "It was swept away immediately", "It cracked but stood halfway", "It was abandoned before the storm"]'::jsonb, 'It did not fall', 'Matthew 7:25 says it did not fall because it was founded on the rock.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'What happened to the house built on the rock in Matthew 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 7, 2, 'Why were the crowds astonished at Jesus''s teaching in Matthew 7?', '["He taught with authority, not as the scribes", "He performed signs during the sermon", "He spoke in parables only", "He quoted no Scripture at all"]'::jsonb, 'He taught with authority, not as the scribes', 'Matthew 7:28-29 says the crowds were astonished because he taught with authority.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why were the crowds astonished at Jesus''s teaching in Matthew 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 7, 3, 'What does Jesus mean by ''not everyone who says to me, Lord, Lord'' in Matthew 7?', '["Verbal profession without obedient relationship is insufficient", "Confession of Jesus as Lord is wrong", "Works alone save apart from faith", "Miracles always prove true discipleship"]'::jsonb, 'Verbal profession without obedient relationship is insufficient', 'Matthew 7:21-23 warns that not all who claim Jesus as Lord truly belong to him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Jesus mean by ''not everyone who says to me, Lord, Lord'' in Matthew 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 7, 3, 'What does the narrow gate teaching reveal in Matthew 7?', '["The way to life is demanding and not aligned with the crowd''s easy path", "Only a literal gate in Jerusalem matters", "Most people are saved by the broad path after all", "The gate teaching replaces the need for discernment"]'::jsonb, 'The way to life is demanding and not aligned with the crowd''s easy path', 'Matthew 7:13-14 contrasts the broad and narrow ways.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the narrow gate teaching reveal in Matthew 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 7, 3, 'What main point is Jesus making with the images of trees and their fruit?', '["People are known by the results their lives produce", "Only farmers can understand the kingdom", "Fruit offerings save the righteous", "A good start always guarantees a good end"]'::jsonb, 'People are known by the results their lives produce', 'Matthew 7:16-20 says people are known by their fruits.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What main point is Jesus making with the images of trees and their fruit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 7, 3, 'Why does Jesus pair the speck and the log in Matthew 7?', '["Self-righteous judgment often ignores one''s own deeper need for correction", "Minor sins are always worse than major sins", "Judgment is impossible in any form", "Only leaders may correct others"]'::jsonb, 'Self-righteous judgment often ignores one''s own deeper need for correction', 'Matthew 7:3-5 exposes hypocrisy in moral judgment.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Jesus pair the speck and the log in Matthew 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 7, 3, 'Why is the rock-and-sand image important in Matthew 7?', '["It shows that obedience to Jesus''s words is the difference between endurance and collapse", "Storms only come to unbelievers", "Good intentions are equal to obedience", "Foundations refer only to church buildings"]'::jsonb, 'It shows that obedience to Jesus''s words is the difference between endurance and collapse', 'Matthew 7:24-27 contrasts doing Jesus''s words with merely hearing them.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the rock-and-sand image important in Matthew 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 7, 4, 'How do asking, judging, discernment, and foundations fit together in Matthew 7?', '["Jesus teaches dependent trust, moral clarity, careful discernment, and obedient endurance as one way of life", "The chapter contains unrelated proverbs only", "Dependence on God removes the need for discernment", "Only the final parable matters"]'::jsonb, 'Jesus teaches dependent trust, moral clarity, careful discernment, and obedient endurance as one way of life', 'Matthew 7 weaves together prayer, ethical vision, discernment, and obedience.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do asking, judging, discernment, and foundations fit together in Matthew 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 7, 4, 'How does Matthew 7 expose false security?', '["It warns that public religion, verbal confession, and appearances can hide disobedience and self-deception", "It teaches that anyone who says ''Lord'' is secure", "It makes miracles the sure foundation of discipleship", "It limits danger to false prophets only"]'::jsonb, 'It warns that public religion, verbal confession, and appearances can hide disobedience and self-deception', 'Matthew 7:15-27 repeatedly warns against deceptive appearances.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Matthew 7 expose false security?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 7, 4, 'How does the wise builder differ from the foolish builder in Matthew 7?', '["The wise one hears Jesus''s words and does them", "The wise one avoids storms entirely", "The wise one builds the largest house", "The wise one hires better workers"]'::jsonb, 'The wise one hears Jesus''s words and does them', 'Matthew 7:24-27 contrasts hearing and doing with hearing and not doing.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the wise builder differ from the foolish builder in Matthew 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 7, 4, 'What larger portrait of Jesus emerges at the close of the sermon in Matthew 7?', '["He speaks with divine-like authority that demands response, not mere admiration", "He presents himself only as another scribe", "He avoids placing weight on his own words", "He remains hidden behind Moses'' authority entirely"]'::jsonb, 'He speaks with divine-like authority that demands response, not mere admiration', 'Matthew 7:24-29 places decisive weight on Jesus''s words and authority.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger portrait of Jesus emerges at the close of the sermon in Matthew 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 7, 4, 'Why is fruit such an important category in Matthew 7?', '["It reveals the true nature of a person or teacher beyond outward claims", "Fruit matters only in agricultural parables", "Words are more important than character", "Fruit can be faked without consequence"]'::jsonb, 'It reveals the true nature of a person or teacher beyond outward claims', 'Matthew 7:16-20 uses fruit as a moral and spiritual indicator.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is fruit such an important category in Matthew 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 7, 5, 'How does Matthew 7 connect prayer and obedience?', '["Those who ask the Father must also hear and do the Son''s words", "Prayer replaces obedience when sincere", "Obedience makes prayer unnecessary", "Only prophets need both prayer and obedience"]'::jsonb, 'Those who ask the Father must also hear and do the Son''s words', 'Matthew 7 holds together asking the Father and obeying Jesus''s teaching.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Matthew 7 connect prayer and obedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 7, 5, 'How does Matthew 7 function as the climax to the Sermon on the Mount?', '["It presses the hearer toward decision by contrasting true and false responses to Jesus''s teaching", "It shifts away from application into abstraction", "It cancels the earlier ethical demands", "It ends with uncertainty about what obedience means"]'::jsonb, 'It presses the hearer toward decision by contrasting true and false responses to Jesus''s teaching', 'Matthew 7 closes the sermon with urgent contrasts and a call to obey.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Matthew 7 function as the climax to the Sermon on the Mount?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 7, 5, 'What does Matthew 7 imply about true wisdom?', '["Wisdom is hearing and obeying Jesus under real testing", "Wisdom is recognizing false prophets by appearance alone", "Wisdom means avoiding all judgment", "Wisdom is mainly rhetorical skill"]'::jsonb, 'Wisdom is hearing and obeying Jesus under real testing', 'The wise builder in Matthew 7 embodies practical obedience to Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Matthew 7 imply about true wisdom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 7, 5, 'Why is Jesus''s authority so central at the end of Matthew 7?', '["The whole sermon calls for hearing and doing his words as the decisive criterion for life", "Authority matters only because the crowds admire him", "His authority is borrowed temporarily from the scribes", "It is secondary to the parables themselves"]'::jsonb, 'The whole sermon calls for hearing and doing his words as the decisive criterion for life', 'Matthew 7:24-29 frames response to Jesus''s words as foundational.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Jesus''s authority so central at the end of Matthew 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 7, 5, 'Why were the crowds astonished at the end of Matthew 7?', '["Jesus taught as one having authority, not like their scribes", "Jesus performed a public sign there", "Jesus quoted no Scripture at all", "Jesus appointed twelve apostles on the spot"]'::jsonb, 'Jesus taught as one having authority, not like their scribes', 'Matthew 7:28-29 says the crowds were amazed because Jesus taught with authority.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why were the crowds astonished at the end of Matthew 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 8, 1, 'What did Jesus rebuke before the sea became calm in Matthew 8?', '["The winds and the sea", "The crowds", "The Pharisees", "Peter alone"]'::jsonb, 'The winds and the sea', 'Matthew 8:26 says Jesus rebuked the winds and the sea.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus rebuke before the sea became calm in Matthew 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 8, 1, 'What did the demons ask concerning the herd of pigs in Matthew 8?', '["To be sent into them", "To be cast into the abyss immediately", "To follow Jesus", "To remain in the tombs"]'::jsonb, 'To be sent into them', 'Matthew 8:31 asks Jesus to send them into the herd of pigs.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the demons ask concerning the herd of pigs in Matthew 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 8, 1, 'Who asked Jesus to heal his servant in Matthew 8?', '["A centurion", "A Pharisee", "A tax collector", "A scribe"]'::jsonb, 'A centurion', 'Matthew 8:5-6 says a centurion came asking help for his servant.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who asked Jesus to heal his servant in Matthew 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 8, 1, 'Whom did Jesus touch and cleanse in Matthew 8?', '["A leper", "A blind beggar", "A rich young ruler", "A Pharisee"]'::jsonb, 'A leper', 'Matthew 8:2-3 says Jesus touched and cleansed a leper.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'Whom did Jesus touch and cleanse in Matthew 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 8, 1, 'Whose servant did Jesus heal at a distance in Matthew 8?', '["A centurion''s servant", "Jairus''s servant", "Herod''s servant", "Pilate''s servant"]'::jsonb, 'A centurion''s servant', 'Matthew 8:5-13 tells of the centurion''s servant being healed.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'Whose servant did Jesus heal at a distance in Matthew 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 8, 2, 'What did Jesus rebuke before the sea became calm?', '["The winds and the sea", "The crowd and the city", "The demons only", "Peter and Andrew"]'::jsonb, 'The winds and the sea', 'Matthew 8:26 records Jesus rebuking the winds and the sea.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus rebuke before the sea became calm?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 8, 2, 'What did Jesus say about many coming from east and west in Matthew 8?', '["They will recline with Abraham, Isaac, and Jacob in the kingdom", "They will rebuild the temple", "They will judge the twelve tribes immediately", "They will replace the covenant promises"]'::jsonb, 'They will recline with Abraham, Isaac, and Jacob in the kingdom', 'Matthew 8:11 speaks of many coming from east and west to the kingdom feast.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say about many coming from east and west in Matthew 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 8, 2, 'What did the centurion say made Jesus''s visit to his house unnecessary in Matthew 8?', '["Only speak the word, and my servant will be healed", "My house is too far away", "The servant has already recovered", "The priests have taken over"]'::jsonb, 'Only speak the word, and my servant will be healed', 'Matthew 8:8 expresses the centurion''s confidence in Jesus''s word.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the centurion say made Jesus''s visit to his house unnecessary in Matthew 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 8, 2, 'What did the whole town ask Jesus to do after the swine incident in Matthew 8?', '["Leave their region", "Stay and teach", "Heal more sick people", "Go to the synagogue first"]'::jsonb, 'Leave their region', 'Matthew 8:34 says the town begged Jesus to leave their region.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the whole town ask Jesus to do after the swine incident in Matthew 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 8, 2, 'What happened to Peter''s mother-in-law after Jesus healed her in Matthew 8?', '["She arose and served him", "She went to the temple to testify", "She returned to bed to recover", "She followed Jesus on the road"]'::jsonb, 'She arose and served him', 'Matthew 8:15 says she arose and served him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'What happened to Peter''s mother-in-law after Jesus healed her in Matthew 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 8, 3, 'What does the calming of the storm reveal in Matthew 8?', '["Jesus exercises authority over creation itself", "The disciples had full faith all along", "Storms are mainly symbolic and not real danger", "Nature responds only after the disciples pray"]'::jsonb, 'Jesus exercises authority over creation itself', 'Matthew 8:26-27 shows the sea obeying Jesus''s rebuke.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the calming of the storm reveal in Matthew 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 8, 3, 'What does the reaction of the Gadarenes reveal in Matthew 8?', '["People may fear Jesus''s power even when it brings liberation", "Everyone naturally welcomes deliverance", "Demons are always stronger than townspeople", "The healed men return to the tombs"]'::jsonb, 'People may fear Jesus''s power even when it brings liberation', 'Matthew 8:34 shows the town preferring Jesus''s departure after the exorcism.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the reaction of the Gadarenes reveal in Matthew 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 8, 3, 'Why is the centurion''s faith remarkable in Matthew 8?', '["He believes Jesus can heal by a word without coming to the house", "He brings a large gift to Jesus", "He leaves his servant to follow Jesus", "He has memorized the whole Law"]'::jsonb, 'He believes Jesus can heal by a word without coming to the house', 'Matthew 8:8-10 highlights the centurion''s confidence in Jesus''s authority to heal at a distance.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the centurion''s faith remarkable in Matthew 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 8, 3, 'Why is the centurion''s faith so striking in Matthew 8?', '["A Gentile recognizes Jesus''s authority more clearly than many in Israel", "He has already read all the prophets", "He is the first person ever healed by Jesus", "He asks for a visible sign before trusting"]'::jsonb, 'A Gentile recognizes Jesus''s authority more clearly than many in Israel', 'Matthew 8:10-12 highlights the centurion''s extraordinary faith and its contrast with unbelief.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the centurion''s faith so striking in Matthew 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 8, 3, 'Why is the leper''s cleansing significant in Matthew 8?', '["Jesus''s holiness restores the unclean rather than becoming contaminated by them", "The law is shown to be irrelevant", "The leper heals himself by faith alone", "Only priests can restore lepers fully"]'::jsonb, 'Jesus''s holiness restores the unclean rather than becoming contaminated by them', 'Matthew 8:3 shows Jesus touching and cleansing the leper.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the leper''s cleansing significant in Matthew 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 8, 4, 'How do disease, distance, storm, and demons fit together in Matthew 8?', '["Matthew presents Jesus''s comprehensive authority over every realm of human brokenness and danger", "Only healing miracles matter in the chapter", "The storm scene interrupts the chapter''s theme", "Demons are treated as symbolic rather than real"]'::jsonb, 'Matthew presents Jesus''s comprehensive authority over every realm of human brokenness and danger', 'Matthew 8 moves across sickness, distance, nature, and demons under Jesus''s authority.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do disease, distance, storm, and demons fit together in Matthew 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 8, 4, 'How does Matthew 8 prepare for the authority themes of chapter 9?', '["It establishes Jesus''s authority over bodies, creation, and spirits before chapter 9 adds authority to forgive sins", "It shifts away from authority toward ethics only", "It ends miracle themes permanently", "It focuses only on Gentiles and not Israel"]'::jsonb, 'It establishes Jesus''s authority over bodies, creation, and spirits before chapter 9 adds authority to forgive sins', 'Matthew 8-9 together form a broad authority section.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Matthew 8 prepare for the authority themes of chapter 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 8, 4, 'What does Matthew 8 reveal about Jesus''s authority?', '["He has authority over sickness, demons, and nature", "He rules only over disease but not creation", "He acts only when the crowds approve", "He avoids Gentiles entirely"]'::jsonb, 'He has authority over sickness, demons, and nature', 'Matthew 8 moves from healing to exorcism to calming the storm, showing broad authority.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Matthew 8 reveal about Jesus''s authority?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 8, 4, 'What larger picture of discipleship emerges in Matthew 8?', '["Following Jesus means trusting his authority even amid uncleanness, danger, and fear", "Discipleship is mainly about avoiding crowds", "The disciples already understand Jesus perfectly", "Faith is unnecessary once miracles occur"]'::jsonb, 'Following Jesus means trusting his authority even amid uncleanness, danger, and fear', 'Matthew 8 includes both miracles and scenes exposing the disciples'' fears.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger picture of discipleship emerges in Matthew 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 8, 4, 'Why does Matthew include the saying about the kingdom feast with Abraham in chapter 8?', '["To show that faith, not ethnic presumption, is decisive for participation in the kingdom", "To deny Abraham''s role in salvation history", "To teach that Gentiles replace Israel in every sense", "To explain the feeding miracles later"]'::jsonb, 'To show that faith, not ethnic presumption, is decisive for participation in the kingdom', 'Matthew 8:11-12 uses the centurion setting to speak about kingdom inclusion and exclusion.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Matthew include the saying about the kingdom feast with Abraham in chapter 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 8, 5, 'How does Matthew 8 portray Jesus in relation to Israel and the nations?', '["He ministers within Israel yet honors surprising Gentile faith and speaks of kingdom inclusion beyond Israel", "He rejects Israel completely for Gentiles", "He avoids all Gentile contact", "The nations are absent from the chapter"]'::jsonb, 'He ministers within Israel yet honors surprising Gentile faith and speaks of kingdom inclusion beyond Israel', 'The centurion episode in Matthew 8 makes this explicit.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Matthew 8 portray Jesus in relation to Israel and the nations?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 8, 5, 'How does Matthew 8 reveal messianic authority?', '["Jesus commands with a word and reality obeys across sickness, distance, nature, and demons", "Messianic authority appears only in public kingship", "Authority depends on ritual approval from priests", "The chapter avoids explicit authority themes"]'::jsonb, 'Jesus commands with a word and reality obeys across sickness, distance, nature, and demons', 'Matthew 8 repeatedly emphasizes the efficacy of Jesus''s authoritative word.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Matthew 8 reveal messianic authority?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 8, 5, 'How does the response of the town after the demoniacs are healed add irony to the chapter?', '["They ask Jesus to leave even after a display of liberating power", "They all become disciples immediately", "They crown him king of the region", "They bring Herod to worship him"]'::jsonb, 'They ask Jesus to leave even after a display of liberating power', 'Matthew 8:34 says the whole city asked Jesus to depart after the deliverance.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does the response of the town after the demoniacs are healed add irony to the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 8, 5, 'What does Matthew 8 imply about fear?', '["Fear can either shrink from Jesus''s power or turn into faith-filled amazement before it", "Fear is always the proper response to Jesus with no correction", "The disciples are praised for fear alone", "Only Gentiles experience fear in the chapter"]'::jsonb, 'Fear can either shrink from Jesus''s power or turn into faith-filled amazement before it', 'The disciples and the town both respond to Jesus''s power, but in very different ways.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Matthew 8 imply about fear?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 8, 5, 'Why is the question ''What sort of man is this?'' so important in Matthew 8?', '["It captures the chapter''s cumulative revelation that Jesus''s authority exceeds ordinary categories", "It shows the disciples already have the full answer", "It is resolved only by the townspeople", "It minimizes the importance of the miracles"]'::jsonb, 'It captures the chapter''s cumulative revelation that Jesus''s authority exceeds ordinary categories', 'Matthew 8:27 crystallizes the chapter''s rising sense of Jesus''s identity.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the question ''What sort of man is this?'' so important in Matthew 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 9, 1, 'What did Jesus first say to the paralytic in Matthew 9?', '["Take heart, son; your sins are forgiven", "Rise and follow me", "Your faith has made you well", "Come out of him"]'::jsonb, 'Take heart, son; your sins are forgiven', 'Matthew 9:2 records Jesus first pronouncing forgiveness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus first say to the paralytic in Matthew 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 9, 1, 'What did Jesus say the harvest was in Matthew 9?', '["Plentiful", "Too small to gather", "Ready for fire", "Delayed until the end"]'::jsonb, 'Plentiful', 'Matthew 9:37 says the harvest is plentiful.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say the harvest was in Matthew 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 9, 1, 'What touched Jesus''s garment in Matthew 9 hoping to be healed?', '["A woman with a discharge of blood", "Jairus''s daughter", "Mary Magdalene", "A Canaanite woman"]'::jsonb, 'A woman with a discharge of blood', 'Matthew 9:20-21 tells of the woman touching Jesus''s garment.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'What touched Jesus''s garment in Matthew 9 hoping to be healed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 9, 1, 'Whom did Jesus call from the tax booth in Matthew 9?', '["Matthew", "Zacchaeus", "Nicodemus", "Judas"]'::jsonb, 'Matthew', 'Matthew 9:9 says Jesus called Matthew from the tax booth.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'Whom did Jesus call from the tax booth in Matthew 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 9, 1, 'Whom did Jesus call from the tax office in Matthew 9?', '["Matthew", "Zacchaeus", "Nicodemus", "Thomas"]'::jsonb, 'Matthew', 'Matthew 9:9 says Jesus saw a man called Matthew sitting at the tax office and called him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'Whom did Jesus call from the tax office in Matthew 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 9, 2, 'What did Jesus say about the harvest in Matthew 9?', '["The harvest is plentiful, but the laborers are few", "The fields are not yet ready", "The harvest belongs only to Israel''s rulers", "The laborers should wait until tomorrow"]'::jsonb, 'The harvest is plentiful, but the laborers are few', 'Matthew 9:37 says the harvest is plentiful but the laborers are few.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say about the harvest in Matthew 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 9, 2, 'What did Jesus say he desired rather than sacrifice in Matthew 9?', '["Mercy", "Fasting", "Temple tax", "Silence"]'::jsonb, 'Mercy', 'Matthew 9:13 says, ''I desire mercy, and not sacrifice.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say he desired rather than sacrifice in Matthew 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 9, 2, 'What happened when the ruler''s daughter was raised in Matthew 9?', '["The report spread through that district", "The Pharisees repented", "Jesus commanded silence and no one heard", "The ruler immediately joined the Twelve"]'::jsonb, 'The report spread through that district', 'Matthew 9:26 says the report went through all that district.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'What happened when the ruler''s daughter was raised in Matthew 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 9, 2, 'What title did the two blind men use for Jesus in Matthew 9?', '["Son of David", "Rabbi", "Prophet of Nazareth", "Holy One of God"]'::jsonb, 'Son of David', 'Matthew 9:27 says the blind men cried out, ''Have mercy on us, Son of David.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'What title did the two blind men use for Jesus in Matthew 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 9, 2, 'Why did the scribes accuse Jesus of blasphemy in Matthew 9?', '["He forgave the paralytic''s sins", "He healed on the Sabbath", "He ate with tax collectors", "He spoke in parables"]'::jsonb, 'He forgave the paralytic''s sins', 'Matthew 9:3 says the scribes judged Jesus blasphemous for forgiving sins.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why did the scribes accuse Jesus of blasphemy in Matthew 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 9, 3, 'What does Jesus''s compassion for the crowds reveal in Matthew 9?', '["He sees them as harassed and helpless, requiring shepherding and laborers", "He prefers solitude to public ministry", "He intends to withdraw permanently from the crowds", "He is frustrated mainly by their need for bread"]'::jsonb, 'He sees them as harassed and helpless, requiring shepherding and laborers', 'Matthew 9:36 portrays the crowds as sheep without a shepherd.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Jesus''s compassion for the crowds reveal in Matthew 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 9, 3, 'What does the meal with tax collectors and sinners reveal in Matthew 9?', '["Jesus''s mission is directed toward the spiritually sick rather than the self-righteous", "Jesus approves every kind of life without repentance", "Meals are more important than teaching", "Only tax collectors can become disciples"]'::jsonb, 'Jesus''s mission is directed toward the spiritually sick rather than the self-righteous', 'Matthew 9:10-13 explains Jesus''s table fellowship through his mission to sinners.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the meal with tax collectors and sinners reveal in Matthew 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 9, 3, 'Why are the miracles of the bleeding woman and the ruler''s daughter linked in Matthew 9?', '["They display Jesus''s authority over uncleanness, delay, and death through faith", "They show one miracle canceling the other", "They prove the crowds understood Jesus perfectly", "They are included only to raise public excitement"]'::jsonb, 'They display Jesus''s authority over uncleanness, delay, and death through faith', 'Matthew 9:18-26 interweaves the stories around trust in Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why are the miracles of the bleeding woman and the ruler''s daughter linked in Matthew 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 9, 3, 'Why did Jesus heal the paralytic in connection with forgiving him?', '["To show the Son of Man has authority on earth to forgive sins", "To avoid speaking to the scribes", "To prove sickness is always caused by personal sin", "To demonstrate skill in medicine"]'::jsonb, 'To show the Son of Man has authority on earth to forgive sins', 'Matthew 9:2-8 links the healing with authority to forgive sins.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why did Jesus heal the paralytic in connection with forgiving him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 9, 3, 'Why is the paralytic story significant in Matthew 9?', '["It reveals Jesus''s authority to forgive sins as well as heal bodies", "It proves physical healing is the whole point of Jesus''s ministry", "It ends all controversy with the scribes", "It shows faith is unnecessary for forgiveness"]'::jsonb, 'It reveals Jesus''s authority to forgive sins as well as heal bodies', 'Matthew 9:6 ties the healing to authority to forgive sins.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the paralytic story significant in Matthew 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 9, 4, 'How do forgiveness, table fellowship, healing, and harvest belong together in Matthew 9?', '["They present Jesus as the merciful shepherd who restores and gathers the needy into God''s kingdom", "They are unrelated miracle and meal scenes", "The harvest saying interrupts the chapter''s themes", "Table fellowship belongs only to Matthew''s call narrative"]'::jsonb, 'They present Jesus as the merciful shepherd who restores and gathers the needy into God''s kingdom', 'Matthew 9 moves from individual restoration to the need for wider labor in the harvest.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do forgiveness, table fellowship, healing, and harvest belong together in Matthew 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 9, 4, 'How does Matthew 9 prepare for chapter 10?', '["Compassion for the crowds and the harvest saying set up the sending of laborers", "The chapter ends with the crowds fully discipled already", "The Pharisees agree to join the mission", "Jesus turns from Israel to Rome"]'::jsonb, 'Compassion for the crowds and the harvest saying set up the sending of laborers', 'Matthew 9:37-38 leads directly into the mission discourse of chapter 10.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Matthew 9 prepare for chapter 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 9, 4, 'How does the meal with tax collectors and sinners explain Jesus''s mission?', '["He comes as a physician for the spiritually sick, not the self-righteous", "He approves every choice people make", "He rejects all forms of repentance", "He begins a tax reform movement"]'::jsonb, 'He comes as a physician for the spiritually sick, not the self-righteous', 'Matthew 9:12-13 says the healthy do not need a physician but the sick do, and Jesus came to call sinners.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the meal with tax collectors and sinners explain Jesus''s mission?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 9, 4, 'What larger picture of authority emerges across Matthew 8-9 and climaxes here?', '["Jesus''s authority extends from creation and demons to forgiveness, healing, and the gathering of a mission community", "Authority is reduced to teaching only", "Chapter 9 abandons authority for compassion", "Only the disciples exercise true authority"]'::jsonb, 'Jesus''s authority extends from creation and demons to forgiveness, healing, and the gathering of a mission community', 'Matthew 8-9 forms a broad authority section culminating in mission.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger picture of authority emerges across Matthew 8-9 and climaxes here?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 9, 4, 'Why is the physician metaphor important in Matthew 9?', '["It interprets Jesus''s presence among sinners as healing mercy, not moral compromise", "It limits Jesus''s mission to physical sickness only", "It denies the need for repentance", "It applies only to Matthew himself"]'::jsonb, 'It interprets Jesus''s presence among sinners as healing mercy, not moral compromise', 'Matthew 9:12-13 uses the physician image to explain Jesus''s mission.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is the physician metaphor important in Matthew 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 9, 5, 'How does Matthew 9 define the proper response to Jesus?', '["Trust, repentance, following, and participation in his mission are the fitting responses", "Admiration without obedience is enough", "Only physical healing matters", "Response is left entirely undefined"]'::jsonb, 'Trust, repentance, following, and participation in his mission are the fitting responses', 'Across Matthew 9, characters respond by believing, following, receiving mercy, and joining the mission movement.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Matthew 9 define the proper response to Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 9, 5, 'How does Matthew 9 portray Jesus''s mercy?', '["His mercy addresses sin, sickness, social exclusion, weakness, and spiritual need together", "Mercy is secondary to miracle spectacle", "Mercy applies only to those with strong faith already", "Mercy and judgment are never connected"]'::jsonb, 'His mercy addresses sin, sickness, social exclusion, weakness, and spiritual need together', 'Matthew 9 shows layered mercy across many forms of brokenness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Matthew 9 portray Jesus''s mercy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 9, 5, 'What does Matthew 9 imply about the kingdom''s expansion?', '["The kingdom grows through Jesus''s restorative mercy and then through prayed-for laborers sent into the harvest", "Expansion depends mainly on public status", "The kingdom is complete before the disciples are sent", "Harvest belongs only to the Twelve"]'::jsonb, 'The kingdom grows through Jesus''s restorative mercy and then through prayed-for laborers sent into the harvest', 'Matthew 9 culminates in prayer for more laborers for the plentiful harvest.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Matthew 9 imply about the kingdom''s expansion?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 9, 5, 'What larger transition happens at the end of Matthew 9?', '["Jesus''s compassion for the crowds leads toward mission through more workers", "Jesus withdraws completely from public ministry", "The Pharisees openly become his disciples", "The kingdom message is replaced by political teaching"]'::jsonb, 'Jesus''s compassion for the crowds leads toward mission through more workers', 'Matthew 9:36-38 turns from healing crowds to praying for laborers for the harvest.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger transition happens at the end of Matthew 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 9, 5, 'Why is the title ''Son of David'' significant in Matthew 9?', '["It links Jesus''s healing mercy with messianic kingship", "It refers only to his genealogy and not his ministry", "It is used ironically by opponents alone", "It means Jesus avoids suffering entirely"]'::jsonb, 'It links Jesus''s healing mercy with messianic kingship', 'The blind men in Matthew 9 use ''Son of David'' as a messianic plea for mercy.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the title ''Son of David'' significant in Matthew 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 10, 1, 'How many apostles does Jesus name in Matthew 10?', '["Twelve", "Seven", "Ten", "Seventy"]'::jsonb, 'Twelve', 'Matthew 10:1-4 names the twelve apostles.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'How many apostles does Jesus name in Matthew 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 10, 1, 'To whom were the twelve first sent in Matthew 10?', '["The lost sheep of the house of Israel", "All the Gentiles first", "The priests in Jerusalem only", "Samaria first"]'::jsonb, 'The lost sheep of the house of Israel', 'Matthew 10:5-6 tells them to go to the lost sheep of Israel.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'To whom were the twelve first sent in Matthew 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 10, 1, 'What authority did Jesus give the twelve in Matthew 10?', '["Authority over unclean spirits and to heal every disease", "Authority to judge Rome immediately", "Authority to collect temple taxes", "Authority to crown a king in Jerusalem"]'::jsonb, 'Authority over unclean spirits and to heal every disease', 'Matthew 10:1 says Jesus gave them authority over unclean spirits and disease.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'What authority did Jesus give the twelve in Matthew 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 10, 1, 'What did Jesus tell the disciples to proclaim in Matthew 10?', '["The kingdom of heaven is at hand", "Repent, for the temple is near", "The law has ended", "Jerusalem will fall today"]'::jsonb, 'The kingdom of heaven is at hand', 'Matthew 10:7 gives their message.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus tell the disciples to proclaim in Matthew 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 10, 1, 'What simple act of hospitality did Jesus say would not lose its reward in Matthew 10?', '["A cup of cold water", "A banquet for the poor", "A temple offering", "A new garment"]'::jsonb, 'A cup of cold water', 'Matthew 10:42 says even a cup of cold water given to a disciple will be rewarded.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'What simple act of hospitality did Jesus say would not lose its reward in Matthew 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 10, 2, 'To whom were the Twelve first sent in Matthew 10?', '["The lost sheep of the house of Israel", "All the Gentile nations", "Rome and Greece first", "Only the priests in Jerusalem"]'::jsonb, 'The lost sheep of the house of Israel', 'Matthew 10:5-6 says they were sent first to Israel''s lost sheep.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'To whom were the Twelve first sent in Matthew 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 10, 2, 'What did Jesus say a disciple must take up in Matthew 10?', '["His cross", "A lamp", "A net", "A scroll"]'::jsonb, 'His cross', 'Matthew 10:38 says whoever does not take his cross is not worthy of Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say a disciple must take up in Matthew 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 10, 2, 'What did Jesus say the Spirit would do when the disciples were delivered up in Matthew 10?', '["Give them what to say", "Rescue them from every trial immediately", "Keep them from all persecution", "Speak only through the apostles Peter and John"]'::jsonb, 'Give them what to say', 'Matthew 10:19-20 says the Spirit will give them what to speak.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say the Spirit would do when the disciples were delivered up in Matthew 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 10, 2, 'What did Jesus tell the disciples to be like among wolves in Matthew 10?', '["Wise as serpents and innocent as doves", "Silent as lambs and fierce as lions", "Bold as kings and hidden as foxes", "Pure as priests and strong as soldiers"]'::jsonb, 'Wise as serpents and innocent as doves', 'Matthew 10:16 gives this instruction.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus tell the disciples to be like among wolves in Matthew 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 10, 2, 'What did Jesus tell the disciples to take regarding money in Matthew 10?', '["Take no gold, silver, or copper", "Take enough for every town", "Take Roman coinage only", "Take temple funds from the priests"]'::jsonb, 'Take no gold, silver, or copper', 'Matthew 10:9 tells them not to take money.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus tell the disciples to take regarding money in Matthew 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 10, 3, 'What does Jesus mean by calling the disciples sheep in the midst of wolves?', '["Their mission will be vulnerable and dangerous, requiring wisdom and innocence", "They should avoid all preaching", "They will become political rulers", "They should carry weapons for every town"]'::jsonb, 'Their mission will be vulnerable and dangerous, requiring wisdom and innocence', 'Matthew 10:16 speaks of danger and calls for wisdom as serpents and innocence as doves.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Jesus mean by calling the disciples sheep in the midst of wolves?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 10, 3, 'What does Jesus mean by saying he sends them as sheep among wolves in Matthew 10?', '["Mission will be dangerous and require both prudence and integrity", "The disciples should blend into the crowd and say little", "The enemies are mainly wild animals in Galilee", "It means disciples should expect political power"]'::jsonb, 'Mission will be dangerous and require both prudence and integrity', 'Matthew 10:16 frames mission as vulnerable and contested.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Jesus mean by saying he sends them as sheep among wolves in Matthew 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 10, 3, 'What is the significance of losing life to find it in Matthew 10?', '["True life is found through costly allegiance to Jesus rather than self-preservation", "Physical death is always required of every disciple", "Life and discipleship are separate themes", "It applies only to martyrs and not ordinary believers"]'::jsonb, 'True life is found through costly allegiance to Jesus rather than self-preservation', 'Matthew 10:39 gives this paradox of discipleship.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the significance of losing life to find it in Matthew 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 10, 3, 'Why does Jesus speak so strongly about family division in Matthew 10?', '["Loyalty to him may cut across even the closest natural bonds", "He rejects family as part of creation", "He speaks only of future civil war", "He means disciples must always abandon families physically"]'::jsonb, 'Loyalty to him may cut across even the closest natural bonds', 'Matthew 10:34-37 emphasizes supreme allegiance to Jesus over family ties.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Jesus speak so strongly about family division in Matthew 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 10, 3, 'Why is the instruction to go first to Israel important in Matthew 10?', '["Jesus''s mission honors salvation-historical priority while preparing for broader later mission", "It proves Gentiles are excluded forever", "It means Samaritans are superior to Israel", "It cancels the Abrahamic promise"]'::jsonb, 'Jesus''s mission honors salvation-historical priority while preparing for broader later mission', 'Matthew 10:5-6 sets an initial focus on Israel without exhausting Matthew''s later global horizon.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the instruction to go first to Israel important in Matthew 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 10, 4, 'How do provision instructions, persecution warnings, and reward sayings fit together in Matthew 10?', '["The mission requires dependence, endurance, and trust in God''s valuation of faithfulness", "Persecution cancels mission success", "Rewards belong only to prophets, not disciples", "Provision means disciples should rely on wealth"]'::jsonb, 'The mission requires dependence, endurance, and trust in God''s valuation of faithfulness', 'Matthew 10 holds together dependence, hardship, and reward within one mission discourse.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do provision instructions, persecution warnings, and reward sayings fit together in Matthew 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 10, 4, 'How does Matthew 10 connect discipleship with allegiance to Jesus?', '["Jesus must be loved above family, comfort, and even life itself", "Discipleship means keeping faith private", "Only apostles are asked to sacrifice", "Following Jesus removes all suffering"]'::jsonb, 'Jesus must be loved above family, comfort, and even life itself', 'Matthew 10:37-39 ties discipleship to taking the cross and valuing Jesus above all.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Matthew 10 connect discipleship with allegiance to Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 10, 4, 'How does Matthew 10 prepare readers for the rest of the Gospel?', '["It establishes that following Jesus involves both mission and suffering, not triumph alone", "It signals that suffering will end after this discourse", "It moves the Gospel away from discipleship toward politics", "It limits Jesus''s message to one short mission"]'::jsonb, 'It establishes that following Jesus involves both mission and suffering, not triumph alone', 'Themes of opposition, confession, and endurance introduced here continue throughout Matthew.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Matthew 10 prepare readers for the rest of the Gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 10, 4, 'What larger picture of witness emerges in Matthew 10?', '["Witness is public, costly, Spirit-assisted, and bound up with allegiance to Jesus", "Witness belongs mainly to quiet private devotion", "Witness ends once persecution begins", "Witness is measured only by visible success"]'::jsonb, 'Witness is public, costly, Spirit-assisted, and bound up with allegiance to Jesus', 'Matthew 10 prepares the disciples for a mission shaped by conflict and confession.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger picture of witness emerges in Matthew 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 10, 4, 'Why does Jesus repeatedly say ''fear not'' in Matthew 10?', '["He relocates fear from human opposition to confidence in the Father''s sovereign care", "He denies that persecution is real", "He commands emotional numbness", "He says fear is always sinful in every form"]'::jsonb, 'He relocates fear from human opposition to confidence in the Father''s sovereign care', 'Matthew 10:26-31 grounds courage in God''s knowledge and care.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Jesus repeatedly say ''fear not'' in Matthew 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 10, 5, 'How does Matthew 10 connect courage and value?', '["Disciples can endure fearlessly because they are known and valued by the Father", "Courage depends on ignoring suffering", "Value comes from public recognition", "The Father''s care applies only to apostles"]'::jsonb, 'Disciples can endure fearlessly because they are known and valued by the Father', 'Matthew 10:29-31 grounds courage in the Father''s care for sparrows and his children.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Matthew 10 connect courage and value?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 10, 5, 'How does Matthew 10 deepen the meaning of mission?', '["Mission is participation in Jesus''s own contested work, sustained by the Father and Spirit", "Mission is mainly an administrative assignment", "Mission belongs only to those with public honor", "Mission is separate from discipleship"]'::jsonb, 'Mission is participation in Jesus''s own contested work, sustained by the Father and Spirit', 'Matthew 10 presents mission as relationally tied to Jesus and supported by divine care.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Matthew 10 deepen the meaning of mission?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 10, 5, 'What does Matthew 10 imply about receiving Jesus''s messengers?', '["Reception of his messengers is tied to reception of Jesus and the One who sent him", "Messengers matter less than miracles", "Only prophets can be truly received", "Hospitality is optional and spiritually neutral"]'::jsonb, 'Reception of his messengers is tied to reception of Jesus and the One who sent him', 'Matthew 10:40-42 ties reception of disciples to reception of Jesus and the Father.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Matthew 10 imply about receiving Jesus''s messengers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 10, 5, 'Why does the promise about a cup of cold water matter at the end of Matthew 10?', '["Even small acts done for Jesus''s messengers are seen and rewarded by God", "Only dramatic miracles count in the kingdom", "Hospitality replaces preaching entirely", "Rewards belong only to prophets"]'::jsonb, 'Even small acts done for Jesus''s messengers are seen and rewarded by God', 'Matthew 10:42 says even a cup of cold water given to a disciple will not lose its reward.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does the promise about a cup of cold water matter at the end of Matthew 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 10, 5, 'Why is the cross saying in Matthew 10 especially significant at this early point?', '["It shows from the outset that following Jesus will be shaped by suffering before glory", "It refers only to Roman execution later and has no present meaning", "It is meant only for Judas", "It replaces the kingdom message entirely"]'::jsonb, 'It shows from the outset that following Jesus will be shaped by suffering before glory', 'Matthew 10:38 brings cruciform discipleship into focus well before the passion narrative.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the cross saying in Matthew 10 especially significant at this early point?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 11, 1, 'What cities did Jesus rebuke in Matthew 11?', '["Chorazin, Bethsaida, and Capernaum", "Nazareth, Cana, and Jericho", "Bethlehem, Emmaus, and Nain", "Tyre, Sidon, and Damascus"]'::jsonb, 'Chorazin, Bethsaida, and Capernaum', 'Matthew 11:20-24 rebukes those cities.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'What cities did Jesus rebuke in Matthew 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 11, 1, 'What did Jesus say people had not gone into the wilderness to see in Matthew 11?', '["A reed shaken by the wind", "A Roman soldier", "A king on horseback", "A lamp on a stand"]'::jsonb, 'A reed shaken by the wind', 'Matthew 11:7 asks if they went out to see a reed shaken by the wind.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say people had not gone into the wilderness to see in Matthew 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 11, 1, 'What invitation did Jesus give the weary in Matthew 11?', '["Come to me, and I will give you rest", "Come to the temple and bring your offering", "Wait until the kingdom arrives fully", "Return to John in the wilderness"]'::jsonb, 'Come to me, and I will give you rest', 'Matthew 11:28 gives this invitation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'What invitation did Jesus give the weary in Matthew 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 11, 1, 'What question did John''s disciples ask Jesus in Matthew 11?', '["Are you the one who is coming, or should we look for another?", "Why do your disciples fast so little?", "Will you destroy the temple?", "When will Rome fall?"]'::jsonb, 'Are you the one who is coming, or should we look for another?', 'Matthew 11:3 records the question from John''s disciples.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'What question did John''s disciples ask Jesus in Matthew 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 11, 1, 'What question did John''s disciples bring to Jesus in Matthew 11?', '["Are you the one who is to come?", "Why do your disciples not fast?", "When will the temple fall?", "Where is Elijah now?"]'::jsonb, 'Are you the one who is to come?', 'Matthew 11:3 records John''s question through his disciples.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'What question did John''s disciples bring to Jesus in Matthew 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 11, 2, 'To whom did Jesus say the Father reveals these things in Matthew 11?', '["Little children", "The wise and understanding only", "Temple leaders", "Roman rulers"]'::jsonb, 'Little children', 'Matthew 11:25 says the Father reveals these things to little children.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'To whom did Jesus say the Father reveals these things in Matthew 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 11, 2, 'What did Jesus say about John the Baptist in Matthew 11?', '["Among those born of women none is greater", "He is the least of all the prophets", "He has already entered the kingdom fully", "He failed in his mission"]'::jsonb, 'Among those born of women none is greater', 'Matthew 11:11 says none born of women is greater than John.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say about John the Baptist in Matthew 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 11, 2, 'What did Jesus say his yoke is in Matthew 11?', '["Easy", "Heavy and hidden", "Reserved for the apostles", "Only for the righteous"]'::jsonb, 'Easy', 'Matthew 11:30 says, ''My yoke is easy, and my burden is light.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say his yoke is in Matthew 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 11, 2, 'What invitation does Jesus give to the weary in Matthew 11?', '["Come to me, and I will give you rest", "Come to the temple, and you will find peace", "Wait for Elijah to return first", "Carry your burden alone a little longer"]'::jsonb, 'Come to me, and I will give you rest', 'Matthew 11:28 invites the weary to come to Jesus for rest.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'What invitation does Jesus give to the weary in Matthew 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 11, 2, 'What signs did Jesus point to when answering John''s question in Matthew 11?', '["The blind see, the lame walk, and the poor receive good news", "The temple veil is torn", "The sea has been calmed", "The magi have returned"]'::jsonb, 'The blind see, the lame walk, and the poor receive good news', 'Matthew 11:4-5 answers with messianic signs drawn from Jesus''s ministry.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'What signs did Jesus point to when answering John''s question in Matthew 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 11, 3, 'How does Jesus answer John''s question about his identity?', '["By pointing to his works of healing and good news as messianic signs", "By refusing any answer at all", "By appealing mainly to Roman authority", "By asking John to come out of prison first"]'::jsonb, 'By pointing to his works of healing and good news as messianic signs', 'Matthew 11:4-5 lists signs like the blind seeing and the poor having good news preached to them.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Jesus answer John''s question about his identity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 11, 3, 'What do the woes on unrepentant cities reveal in Matthew 11?', '["Privilege and exposure to Jesus''s works intensify responsibility to repent", "Miracles automatically produce faith", "Only Gentile cities are under judgment", "Repentance is less important than amazement"]'::jsonb, 'Privilege and exposure to Jesus''s works intensify responsibility to repent', 'Matthew 11:20-24 rebukes cities that saw mighty works but did not repent.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What do the woes on unrepentant cities reveal in Matthew 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 11, 3, 'What does Matthew 11 reveal about revelation?', '["The Father reveals the Son in a way that overturns merely worldly wisdom", "Revelation belongs only to scholars and scribes", "Revelation is detached from Jesus''s person", "The wise always receive revelation best"]'::jsonb, 'The Father reveals the Son in a way that overturns merely worldly wisdom', 'Matthew 11:25-27 emphasizes revelatory dependence on the Father and the Son.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Matthew 11 reveal about revelation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 11, 3, 'Why is Jesus''s answer to John important in Matthew 11?', '["He identifies himself through messianic works rather than bare assertion", "He refuses to answer the question at all", "He redirects attention entirely away from himself", "He denies any connection to the prophets"]'::jsonb, 'He identifies himself through messianic works rather than bare assertion', 'Matthew 11:4-6 points to Jesus''s works as evidence of his identity.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is Jesus''s answer to John important in Matthew 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 11, 3, 'Why is Jesus''s invitation to rest so significant in Matthew 11?', '["He presents himself as the personal source of the rest God''s people need", "Rest comes only through strict law-keeping", "John the Baptist remains the main giver of rest", "Rest means withdrawal from obedience"]'::jsonb, 'He presents himself as the personal source of the rest God''s people need', 'Matthew 11:28-30 centers rest in coming to Jesus himself.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is Jesus''s invitation to rest so significant in Matthew 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 11, 4, 'How do John''s question, the city woes, and the rest invitation fit together in Matthew 11?', '["The chapter moves from messianic identity to human response and finally to Jesus as the source of rest", "The sections are disconnected sayings", "Only John''s question matters for Matthew''s theology", "The rest invitation cancels the woes"]'::jsonb, 'The chapter moves from messianic identity to human response and finally to Jesus as the source of rest', 'Matthew 11 unfolds from identity to judgment to invitation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do John''s question, the city woes, and the rest invitation fit together in Matthew 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 11, 4, 'How does Matthew 11 challenge expectations of the kingdom?', '["The kingdom is present in Jesus''s works, yet many still resist and must repent", "The kingdom comes only with visible political overthrow", "John must complete the kingdom before Jesus can begin", "Rest means the kingdom has no demands"]'::jsonb, 'The kingdom is present in Jesus''s works, yet many still resist and must repent', 'Matthew 11 presents both messianic fulfillment and stubborn unbelief.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Matthew 11 challenge expectations of the kingdom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 11, 4, 'What larger picture of Jesus emerges in Matthew 11?', '["He is the awaited one, the judge of unbelief, and the giver of divine rest", "He is only a teacher of ethics", "He avoids speaking of judgment altogether", "He remains subordinate to John throughout"]'::jsonb, 'He is the awaited one, the judge of unbelief, and the giver of divine rest', 'Matthew 11 combines signs, woes, revelation, and invitation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger picture of Jesus emerges in Matthew 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 11, 4, 'Why are Chorazin, Bethsaida, and Capernaum condemned in Matthew 11?', '["They witnessed mighty works yet did not repent", "They lacked access to the Scriptures", "They were Gentile cities only", "They had never heard John preach"]'::jsonb, 'They witnessed mighty works yet did not repent', 'Matthew 11:20-24 condemns those cities for failing to repent despite mighty works.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why are Chorazin, Bethsaida, and Capernaum condemned in Matthew 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 11, 4, 'Why is John called more than a prophet in Matthew 11?', '["He is the promised messenger preparing the way for the Lord", "He performs greater miracles than Jesus", "He replaces Elijah and Moses entirely", "He becomes the first apostle"]'::jsonb, 'He is the promised messenger preparing the way for the Lord', 'Matthew 11:9-10 cites prophecy to define John''s role.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is John called more than a prophet in Matthew 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 11, 5, 'How do the themes of revelation and rest fit together in Matthew 11?', '["The Father reveals the Son to the lowly, and the Son gives rest to those who come to him", "Only the wise can know the Son, and rest comes through status", "John''s disciples receive rest by returning to prison", "Rest is postponed until after the resurrection only"]'::jsonb, 'The Father reveals the Son to the lowly, and the Son gives rest to those who come to him', 'Matthew 11:25-30 joins divine revelation to little ones with Jesus''s invitation to rest.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'How do the themes of revelation and rest fit together in Matthew 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 11, 5, 'How does Matthew 11 connect revelation and refuge?', '["The one uniquely revealed by the Father is also the one who gives rest to the weary", "Revelation is for debate only, not comfort", "Rest comes apart from knowing the Son", "Refuge belongs only to Israel''s leaders"]'::jsonb, 'The one uniquely revealed by the Father is also the one who gives rest to the weary', 'Matthew 11:25-30 joins revelation in the Son with invitation to rest in him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Matthew 11 connect revelation and refuge?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 11, 5, 'How does Matthew 11 deepen the significance of Jesus''s yoke?', '["It presents discipleship under Jesus as restful because it is shaped by his gentle authority", "It removes all obligation from discipleship", "It applies only after resurrection", "It refers only to physical healing"]'::jsonb, 'It presents discipleship under Jesus as restful because it is shaped by his gentle authority', 'Matthew 11:29-30 links Jesus''s gentleness with the yoke he gives.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Matthew 11 deepen the significance of Jesus''s yoke?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 11, 5, 'What does Matthew 11 imply about unbelief?', '["Unbelief can persist even in the face of remarkable revelation and mighty works", "Unbelief disappears whenever miracles happen", "Only Gentiles struggle with unbelief", "Unbelief is merely an intellectual issue with no moral dimension"]'::jsonb, 'Unbelief can persist even in the face of remarkable revelation and mighty works', 'The city woes in Matthew 11 make this point directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Matthew 11 imply about unbelief?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 11, 5, 'Why is the least in the kingdom greater than John in Matthew 11?', '["The coming kingdom order surpasses even the greatness of the greatest preparatory prophet", "John had failed morally and lost his place", "The statement denies John''s prophetic role", "It means all Christians are morally superior to John"]'::jsonb, 'The coming kingdom order surpasses even the greatness of the greatest preparatory prophet', 'Matthew 11:11 contrasts John''s greatness with the surpassing privilege of the kingdom.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the least in the kingdom greater than John in Matthew 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 12, 1, 'How did Jesus define his true family in Matthew 12?', '["Whoever does the will of my Father", "Those physically descended from David", "Only the twelve disciples", "His mother and brothers alone"]'::jsonb, 'Whoever does the will of my Father', 'Matthew 12:50 defines Jesus''s true family that way.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'How did Jesus define his true family in Matthew 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 12, 1, 'In Matthew 12, what did the disciples do on the Sabbath that drew criticism?', '["They plucked heads of grain and ate", "They carried water to the temple", "They bought animals in the market", "They traveled to Samaria"]'::jsonb, 'They plucked heads of grain and ate', 'Matthew 12:1-2 says the disciples plucked grain on the Sabbath.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'In Matthew 12, what did the disciples do on the Sabbath that drew criticism?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 12, 1, 'What did the disciples do on the Sabbath in Matthew 12 that drew criticism?', '["Plucked heads of grain and ate", "Carried a paralyzed man to Jesus", "Bought food in the market", "Offered incense in the temple"]'::jsonb, 'Plucked heads of grain and ate', 'Matthew 12:1-2 records the disciples plucking grain on the Sabbath.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the disciples do on the Sabbath in Matthew 12 that drew criticism?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 12, 1, 'What kind of hand did the man have whom Jesus healed in Matthew 12?', '["A withered hand", "A bleeding hand", "A chained hand", "A burned hand"]'::jsonb, 'A withered hand', 'Matthew 12:10 says the man had a withered hand.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'What kind of hand did the man have whom Jesus healed in Matthew 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 12, 1, 'What sign did Jesus say would be given in Matthew 12?', '["The sign of Jonah", "A sign from heaven immediately", "The rebuilding of the temple", "The return of Elijah in visible glory"]'::jsonb, 'The sign of Jonah', 'Matthew 12:39-40 says no sign would be given except the sign of Jonah.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'What sign did Jesus say would be given in Matthew 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 12, 2, 'What accusation did the Pharisees make after Jesus cast out a demon in Matthew 12?', '["He casts out demons by Beelzebul", "He learned magic in Egypt", "He breaks the law of Moses entirely", "He is possessed by John the Baptist"]'::jsonb, 'He casts out demons by Beelzebul', 'Matthew 12:24 gives that accusation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'What accusation did the Pharisees make after Jesus cast out a demon in Matthew 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 12, 2, 'What did Jesus say he desires rather than sacrifice in Matthew 12?', '["Mercy", "Silence", "Fasting", "Public honor"]'::jsonb, 'Mercy', 'Matthew 12:7 repeats, ''I desire mercy, and not sacrifice.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say he desires rather than sacrifice in Matthew 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 12, 2, 'What queen did Jesus mention in Matthew 12 as rising in judgment?', '["The queen of the South", "Queen Esther", "Athaliah", "Jezebel"]'::jsonb, 'The queen of the South', 'Matthew 12:42 mentions the queen of the South.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'What queen did Jesus mention in Matthew 12 as rising in judgment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 12, 2, 'What sign did Jesus say would be given to that generation?', '["The sign of Jonah", "A rainbow over Jerusalem", "Fire from heaven", "The rebuilding of the temple"]'::jsonb, 'The sign of Jonah', 'Matthew 12:39-40 says only the sign of Jonah would be given.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'What sign did Jesus say would be given to that generation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 12, 2, 'What title did Jesus use for himself in relation to the Sabbath in Matthew 12?', '["Lord of the Sabbath", "King of Israel", "Prophet of Nazareth", "Servant of the temple"]'::jsonb, 'Lord of the Sabbath', 'Matthew 12:8 says the Son of Man is Lord of the Sabbath.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'What title did Jesus use for himself in relation to the Sabbath in Matthew 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 12, 3, 'What does Jesus''s family redefinition reveal in Matthew 12?', '["Obedience to the Father creates the deepest covenant kinship around Jesus", "Natural family ties no longer matter at all", "The disciples replace Israel entirely", "Only Jesus''s mother remains central to the Gospel"]'::jsonb, 'Obedience to the Father creates the deepest covenant kinship around Jesus', 'Matthew 12:46-50 redefines family around doing the Father''s will.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Jesus''s family redefinition reveal in Matthew 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 12, 3, 'What does the house-divided saying reveal in Matthew 12?', '["Satan''s kingdom cannot logically stand if Jesus''s exorcisms come from Satan", "Jesus denies the reality of demonic powers", "The Pharisees are internally united and therefore right", "The kingdom is politically divided between Israel and Rome"]'::jsonb, 'Satan''s kingdom cannot logically stand if Jesus''s exorcisms come from Satan', 'Matthew 12:25-29 answers the Beelzebul accusation logically and theologically.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the house-divided saying reveal in Matthew 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 12, 3, 'What principle does Jesus use to interpret Sabbath controversies in Matthew 12?', '["Mercy is more central than rigid ceremonialism", "The Sabbath has no meaning at all", "Only priests may do good on the Sabbath", "Sabbath rules apply only to Gentiles"]'::jsonb, 'Mercy is more central than rigid ceremonialism', 'Matthew 12:7 and 12 emphasize mercy and doing good on the Sabbath.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What principle does Jesus use to interpret Sabbath controversies in Matthew 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 12, 3, 'Why is blasphemy against the Spirit treated with such seriousness in Matthew 12?', '["It is a hardened rejection of God''s manifest work in Jesus", "It refers to every careless word without distinction", "It means doubting once in private", "It applies only to Judas and not others"]'::jsonb, 'It is a hardened rejection of God''s manifest work in Jesus', 'Matthew 12:31-32 places the warning in the context of attributing God''s work to evil.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is blasphemy against the Spirit treated with such seriousness in Matthew 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 12, 3, 'Why is the Sabbath controversy important in Matthew 12?', '["Jesus asserts that mercy and his own authority rightly interpret Sabbath observance", "He abolishes the Sabbath entirely", "He avoids the issue and walks away", "He limits the Sabbath to priests"]'::jsonb, 'Jesus asserts that mercy and his own authority rightly interpret Sabbath observance', 'Matthew 12:1-13 ties Sabbath interpretation to mercy and Jesus''s lordship.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the Sabbath controversy important in Matthew 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 12, 4, 'How do Sabbath, exorcism, Jonah, and family fit together in Matthew 12?', '["The chapter presents Jesus''s authority over law, evil, judgment, and covenant identity", "They are unrelated controversies without a common center", "Jonah replaces the Sabbath as Matthew''s main concern", "Family language softens the earlier authority claims"]'::jsonb, 'The chapter presents Jesus''s authority over law, evil, judgment, and covenant identity', 'Matthew 12 is a concentrated chapter of conflict and revelation around Jesus''s authority.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do Sabbath, exorcism, Jonah, and family fit together in Matthew 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 12, 4, 'How does Matthew 12 portray Jesus as greater than earlier figures?', '["He is greater than the temple, Jonah, and Solomon", "He is another prophet equal with Jonah", "He rejects comparison with Israel''s past", "He is greater only in miracle-working"]'::jsonb, 'He is greater than the temple, Jonah, and Solomon', 'Matthew 12:6, 41, and 42 make those explicit comparisons.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Matthew 12 portray Jesus as greater than earlier figures?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 12, 4, 'What larger picture of opposition emerges in Matthew 12?', '["Opposition hardens even in the face of mercy and power, escalating toward deadly hostility", "The conflict with the Pharisees is resolved peacefully", "Only the crowds resist Jesus now", "Opposition concerns Sabbath alone and nothing else"]'::jsonb, 'Opposition hardens even in the face of mercy and power, escalating toward deadly hostility', 'Matthew 12:14 shows the Pharisees plotting to destroy Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger picture of opposition emerges in Matthew 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 12, 4, 'Why is Jonah an apt sign in Matthew 12?', '["It points to death and vindication while also condemning an unresponsive generation", "It predicts only a sea miracle", "It removes resurrection hope from the Gospel", "It identifies Jesus chiefly as a prophet of judgment only"]'::jsonb, 'It points to death and vindication while also condemning an unresponsive generation', 'Matthew 12:40 links Jonah''s three days to the Son of Man''s coming burial and rising.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is Jonah an apt sign in Matthew 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 12, 4, 'Why is blasphemy against the Spirit treated so seriously in Matthew 12?', '["It is a hardened rejection of God''s evident work in Jesus", "It refers to every careless word ever spoken", "It means doubting once in private", "It applies only to the disciples"]'::jsonb, 'It is a hardened rejection of God''s evident work in Jesus', 'Matthew 12:22-32 places the warning in the context of attributing Jesus''s Spirit-empowered work to evil.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is blasphemy against the Spirit treated so seriously in Matthew 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 12, 5, 'How does Jesus redefine family at the end of Matthew 12?', '["Those who do the Father''s will are his true family", "Only his biological relatives count", "Family ties no longer matter in any sense", "The crowds become his brothers by birth"]'::jsonb, 'Those who do the Father''s will are his true family', 'Matthew 12:48-50 says whoever does the Father''s will is Jesus''s brother, sister, and mother.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Jesus redefine family at the end of Matthew 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 12, 5, 'How does Matthew 12 deepen the meaning of mercy?', '["Mercy is not softness but the right expression of God''s kingdom over against hard-hearted religion", "Mercy means setting aside all truth claims", "Mercy belongs only to Sabbath healing stories", "Mercy replaces all judgment language"]'::jsonb, 'Mercy is not softness but the right expression of God''s kingdom over against hard-hearted religion', 'Matthew 12 repeatedly pits mercy against hypocritical rigidity.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Matthew 12 deepen the meaning of mercy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 12, 5, 'How does Matthew 12 function in the Gospel''s narrative movement?', '["It marks a major intensification of conflict while clarifying Jesus''s authority and identity", "It pauses the conflict to focus on genealogy", "It resolves all messianic questions definitively for every character", "It turns away from Israel toward Rome"]'::jsonb, 'It marks a major intensification of conflict while clarifying Jesus''s authority and identity', 'Matthew 12 is a crucial turning point of conflict and revelation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Matthew 12 function in the Gospel''s narrative movement?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 12, 5, 'What does Matthew 12 suggest about words and the heart?', '["Speech reveals the stored treasure of the heart and will be judged accordingly", "Words matter little if intentions are good", "Only blasphemy counts as a spoken sin", "The heart is unknowable and thus irrelevant"]'::jsonb, 'Speech reveals the stored treasure of the heart and will be judged accordingly', 'Matthew 12:33-37 links the heart, words, and final account.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Matthew 12 suggest about words and the heart?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 12, 5, 'Why is Jesus''s self-presentation in Matthew 12 so theologically weighty?', '["He locates final judgment, true worship, and covenant identity in relation to himself", "He speaks only as an interpreter of earlier authorities", "He avoids placing weight on his own person", "He shifts the focus entirely to John the Baptist"]'::jsonb, 'He locates final judgment, true worship, and covenant identity in relation to himself', 'Matthew 12''s greater-than sayings and family redefinition center everything on Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Jesus''s self-presentation in Matthew 12 so theologically weighty?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 13, 1, 'What did Jesus compare the kingdom to that a man found hidden in a field in Matthew 13?', '["Treasure", "Leaven", "A net", "A lamp"]'::jsonb, 'Treasure', 'Matthew 13:44 compares the kingdom to treasure hidden in a field.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus compare the kingdom to that a man found hidden in a field in Matthew 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 13, 1, 'What did the people of Nazareth call Jesus in Matthew 13 that contributed to their offense?', '["The carpenter''s son", "The king of Israel", "The prophet from the east", "The son of Zechariah"]'::jsonb, 'The carpenter''s son', 'Matthew 13:55 says they called him the carpenter''s son.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the people of Nazareth call Jesus in Matthew 13 that contributed to their offense?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 13, 1, 'What kind of ground received the seed and bore fruit in Matthew 13?', '["Good soil", "Rocky ground", "Thorny ground", "The path"]'::jsonb, 'Good soil', 'Matthew 13:8 says seed on good soil bore fruit.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'What kind of ground received the seed and bore fruit in Matthew 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 13, 1, 'What kind of seed fell on good soil in the parable of the sower?', '["Seed that produced fruit", "Seed eaten by birds", "Seed scorched on rocky ground", "Seed choked by thorns"]'::jsonb, 'Seed that produced fruit', 'Matthew 13:8 and 13:23 describe good soil as hearing and bearing fruit.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'What kind of seed fell on good soil in the parable of the sower?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 13, 1, 'Where did Jesus teach the parables in Matthew 13?', '["By the sea from a boat", "In the temple treasury", "On a high mountain", "In Herod''s court"]'::jsonb, 'By the sea from a boat', 'Matthew 13:1-2 says Jesus taught by the sea from a boat.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'Where did Jesus teach the parables in Matthew 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 13, 2, 'What did Jesus compare the kingdom to that was cast into the sea in Matthew 13?', '["A net", "A pearl", "A mustard seed", "A seed bag"]'::jsonb, 'A net', 'Matthew 13:47 compares the kingdom to a net cast into the sea.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus compare the kingdom to that was cast into the sea in Matthew 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 13, 2, 'What did Jesus say the enemy sowed among the wheat in Matthew 13?', '["Weeds", "Thorns", "Wild grapes", "Stone"]'::jsonb, 'Weeds', 'Matthew 13:25 says the enemy sowed weeds among the wheat.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say the enemy sowed among the wheat in Matthew 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 13, 2, 'What did Jesus say the mustard seed becomes in Matthew 13?', '["A tree where birds make nests", "A field full of wheat", "A vine with many branches", "A lamp that gives light"]'::jsonb, 'A tree where birds make nests', 'Matthew 13:31-32 says it becomes a tree where birds nest.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say the mustard seed becomes in Matthew 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 13, 2, 'What two things does Jesus compare the kingdom to in short treasure parables?', '["A hidden treasure and a pearl of great price", "A sword and a shield", "A fig tree and a vine", "A palace and a throne"]'::jsonb, 'A hidden treasure and a pearl of great price', 'Matthew 13:44-46 compares the kingdom to treasure and a pearl.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'What two things does Jesus compare the kingdom to in short treasure parables?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 13, 2, 'Why did Jesus say he spoke to the crowds in parables in Matthew 13?', '["Because seeing they do not see and hearing they do not hear", "Because the disciples preferred stories", "Because Scripture had ended", "Because miracles were no longer needed"]'::jsonb, 'Because seeing they do not see and hearing they do not hear', 'Matthew 13:10-15 explains the purpose of parables in relation to hardened hearing.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why did Jesus say he spoke to the crowds in parables in Matthew 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 13, 3, 'What does Nazareth''s offense reveal at the end of Matthew 13?', '["Familiarity can blind people to Jesus''s true identity and authority", "Jesus''s teaching had become unclear", "The miracles had failed entirely everywhere", "Only Gentiles could ever respond to Jesus"]'::jsonb, 'Familiarity can blind people to Jesus''s true identity and authority', 'Matthew 13:53-58 ends with Nazareth''s offense and unbelief.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Nazareth''s offense reveal at the end of Matthew 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 13, 3, 'What does the weeds parable teach about the kingdom''s present age in Matthew 13?', '["Good and evil coexist until the final harvest", "The wicked are removed immediately upon appearing", "The church should uproot all weeds now by force", "The harvest has already fully arrived"]'::jsonb, 'Good and evil coexist until the final harvest', 'Matthew 13:24-30 and 36-43 teach delayed separation until the end of the age.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the weeds parable teach about the kingdom''s present age in Matthew 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 13, 3, 'Why are treasure and pearl fitting kingdom images in Matthew 13?', '["They highlight the surpassing worth of the kingdom, worthy of total response", "They imply the kingdom is hidden forever", "They teach salvation can be bought", "They refer only to Israel''s wealth"]'::jsonb, 'They highlight the surpassing worth of the kingdom, worthy of total response', 'Matthew 13:44-46 emphasizes the kingdom''s value and joyful sacrifice.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why are treasure and pearl fitting kingdom images in Matthew 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 13, 3, 'Why does Jesus say he speaks to the crowds in parables?', '["To reveal kingdom truth to disciples while exposing others'' dullness of heart", "Because the crowds cannot understand plain speech at all", "To avoid all conflict with the Pharisees", "Because prophecy had ended"]'::jsonb, 'To reveal kingdom truth to disciples while exposing others'' dullness of heart', 'Matthew 13:10-17 explains the mixed purpose of parables.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Jesus say he speaks to the crowds in parables?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 13, 3, 'Why is the parable explanation to the disciples important in Matthew 13?', '["It shows that understanding the kingdom depends on Jesus''s own interpretation", "Parables are meant to remain forever opaque", "Only the crowds are meant to understand", "The disciples already knew the meanings fully"]'::jsonb, 'It shows that understanding the kingdom depends on Jesus''s own interpretation', 'Matthew 13:18-23 and 36-43 show Jesus privately interpreting parables.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the parable explanation to the disciples important in Matthew 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 13, 4, 'How do the parables of sowing, growth, treasure, and judgment fit together in Matthew 13?', '["They present the kingdom as hidden, growing, precious, and ultimately decisive in judgment", "They contradict one another about the kingdom''s nature", "Only the sower parable matters for interpretation", "The chapter shifts away from kingdom themes at the end"]'::jsonb, 'They present the kingdom as hidden, growing, precious, and ultimately decisive in judgment', 'Matthew 13''s parables together offer a many-sided portrait of the kingdom.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do the parables of sowing, growth, treasure, and judgment fit together in Matthew 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 13, 4, 'How does Matthew 13 prepare for the rejection scenes that follow?', '["It teaches in advance that the kingdom''s growth occurs amid misunderstanding, resistance, and mixed response", "It guarantees that understanding will now be universal", "It replaces conflict with purely inward spirituality", "It means Nazareth''s response is unexpected and unrelated"]'::jsonb, 'It teaches in advance that the kingdom''s growth occurs amid misunderstanding, resistance, and mixed response', 'The discourse anticipates the rejection and mixed responses that continue in Matthew.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Matthew 13 prepare for the rejection scenes that follow?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 13, 4, 'What does the parable of the weeds among the wheat teach about the present kingdom age?', '["Good and evil remain mixed until the final harvest", "The wicked are removed immediately when they appear", "Israel alone is the field and nothing more", "The kingdom grows only through force"]'::jsonb, 'Good and evil remain mixed until the final harvest', 'Matthew 13:24-30 and 13:36-43 explain separation at the end of the age.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does the parable of the weeds among the wheat teach about the present kingdom age?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 13, 4, 'What larger role does Matthew 13 play in the Gospel?', '["It explains the hidden form of the kingdom amid mixed responses to Jesus", "It ends Jesus''s teaching ministry permanently", "It focuses mainly on family conflict rather than kingdom", "It postpones all judgment language until chapter 24"]'::jsonb, 'It explains the hidden form of the kingdom amid mixed responses to Jesus', 'Matthew 13 is the Gospel''s central parable discourse on the kingdom.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger role does Matthew 13 play in the Gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 13, 4, 'Why is the distinction between crowd and disciple understanding important in Matthew 13?', '["It highlights that kingdom truth is both revealed and resisted depending on response to Jesus", "The crowds understand more than the disciples", "Understanding no longer matters once parables are told", "The distinction is merely social and not spiritual"]'::jsonb, 'It highlights that kingdom truth is both revealed and resisted depending on response to Jesus', 'Matthew 13:10-17 stresses differing responses to revelation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is the distinction between crowd and disciple understanding important in Matthew 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 13, 5, 'How does Matthew 13 deepen the mystery of the kingdom?', '["The kingdom is truly present yet not fully consummated, hidden in growth and awaiting final separation", "The kingdom is only invisible with no present effects", "Mystery means it cannot be understood at all", "The kingdom has already completed its work in Galilee"]'::jsonb, 'The kingdom is truly present yet not fully consummated, hidden in growth and awaiting final separation', 'Matthew 13 repeatedly balances present hiddenness with future harvest.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Matthew 13 deepen the mystery of the kingdom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 13, 5, 'How does Matthew 13 portray final judgment?', '["The kingdom''s hidden present will culminate in a clear and irreversible separation at the end of the age", "Judgment occurs immediately whenever seed is sown", "Judgment is absent from the kingdom parables", "Only the Nazarenes face judgment"]'::jsonb, 'The kingdom''s hidden present will culminate in a clear and irreversible separation at the end of the age', 'The weeds and net parables both end with final sorting and judgment.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Matthew 13 portray final judgment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 13, 5, 'How does Nazareth''s response at the end of Matthew 13 fit the chapter''s themes?', '["Even after kingdom teaching, unbelief still resists Jesus nearby and familiar", "Nazareth becomes the center of worldwide mission immediately", "The people there understand every parable perfectly", "Jesus chooses to stop teaching because faith is universal"]'::jsonb, 'Even after kingdom teaching, unbelief still resists Jesus nearby and familiar', 'Matthew 13:53-58 ends with Nazareth taking offense and Jesus doing few mighty works there.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Nazareth''s response at the end of Matthew 13 fit the chapter''s themes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 13, 5, 'What does Matthew 13 suggest about response to revelation?', '["Revelation can soften and bear fruit or harden and leave a person offended", "Everyone who hears automatically understands", "Fruitfulness depends mainly on social position", "Offense at Jesus is a minor issue with no consequence"]'::jsonb, 'Revelation can soften and bear fruit or harden and leave a person offended', 'The chapter moves from soils to Nazareth''s offense as contrasting responses.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Matthew 13 suggest about response to revelation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 13, 5, 'Why is Jesus''s role as interpreter crucial in Matthew 13?', '["He is not only the teller of kingdom mysteries but the authoritative revealer of their meaning", "The disciples understand apart from him", "Interpretation belongs only to scribes", "Parables function best without explanation"]'::jsonb, 'He is not only the teller of kingdom mysteries but the authoritative revealer of their meaning', 'Matthew 13 shows Jesus as the one who reveals the kingdom''s secret to disciples.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Jesus''s role as interpreter crucial in Matthew 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 14, 1, 'How many fish were with the five loaves in Matthew 14?', '["Two", "Five", "Seven", "Twelve"]'::jsonb, 'Two', 'Matthew 14:17 says the disciples had five loaves and two fish.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'How many fish were with the five loaves in Matthew 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 14, 1, 'What did Peter ask Jesus to command in Matthew 14?', '["Command me to come to you on the water", "Command the crowd to sit down", "Command Herod to repent", "Command the storm to stop"]'::jsonb, 'Command me to come to you on the water', 'Matthew 14:28 records Peter''s request.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Peter ask Jesus to command in Matthew 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 14, 1, 'What did the disciples say after Jesus walked on the water in Matthew 14?', '["Truly you are the Son of God", "You are a great prophet", "Lord, teach us to pray", "This is the sign of Jonah"]'::jsonb, 'Truly you are the Son of God', 'Matthew 14:33 records their confession.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the disciples say after Jesus walked on the water in Matthew 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 14, 1, 'Who did Herod think Jesus might be in Matthew 14?', '["John the Baptist raised from the dead", "Elijah returned in glory", "Moses come again", "A prophet from Bethlehem only"]'::jsonb, 'John the Baptist raised from the dead', 'Matthew 14:1-2 says Herod thought Jesus was John raised from the dead.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who did Herod think Jesus might be in Matthew 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 14, 1, 'Who was beheaded in Matthew 14?', '["John the Baptizer", "James the son of Zebedee", "Stephen", "Peter"]'::jsonb, 'John the Baptizer', 'Matthew 14:10 says Herod sent and beheaded John in prison.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who was beheaded in Matthew 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 14, 2, 'How many baskets full of leftovers were taken up after the feeding in Matthew 14?', '["Twelve", "Seven", "Five", "Two"]'::jsonb, 'Twelve', 'Matthew 14:20 says twelve baskets full of leftovers were taken up.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'How many baskets full of leftovers were taken up after the feeding in Matthew 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 14, 2, 'How many loaves did Jesus use to feed the five thousand in Matthew 14?', '["Five loaves", "Seven loaves", "Twelve loaves", "Two loaves"]'::jsonb, 'Five loaves', 'Matthew 14:17 says they had five loaves and two fish.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'How many loaves did Jesus use to feed the five thousand in Matthew 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 14, 2, 'What did Jesus do before the crowd ate in Matthew 14?', '["He looked up to heaven and blessed the food", "He sent everyone home first", "He asked Herod for help", "He told the disciples to fast"]'::jsonb, 'He looked up to heaven and blessed the food', 'Matthew 14:19 says Jesus looked up to heaven, blessed, and broke the loaves.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus do before the crowd ate in Matthew 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 14, 2, 'What happened when Peter saw the wind in Matthew 14?', '["He became afraid and began to sink", "He kept walking steadily to Jesus", "He rebuked the sea himself", "He returned to the boat without trouble"]'::jsonb, 'He became afraid and began to sink', 'Matthew 14:30 says Peter became afraid and began to sink.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'What happened when Peter saw the wind in Matthew 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 14, 2, 'Why was John the Baptist imprisoned in Matthew 14?', '["He rebuked Herod over Herodias", "He refused to honor Caesar", "He stirred up a revolt in Jerusalem", "He baptized Gentiles in Galilee"]'::jsonb, 'He rebuked Herod over Herodias', 'Matthew 14:3-4 explains John''s imprisonment.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why was John the Baptist imprisoned in Matthew 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 14, 3, 'How does the John the Baptist flashback function in Matthew 14?', '["It places Jesus''s ministry in the shadow of prophetic rejection and impending suffering", "It proves Herod has become spiritually sensitive", "It interrupts the Gospel''s main themes without connection", "It shows John rivaled Jesus successfully"]'::jsonb, 'It places Jesus''s ministry in the shadow of prophetic rejection and impending suffering', 'Matthew 14 connects John''s death with Herod''s fear and the dangerous climate around Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does the John the Baptist flashback function in Matthew 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 14, 3, 'What does Peter''s sinking on the water reveal in Matthew 14?', '["Fear and little faith disrupt confident trust in Jesus", "Walking on water is forbidden to disciples", "The storm was stronger than Jesus", "Peter was never really in the boat"]'::jsonb, 'Fear and little faith disrupt confident trust in Jesus', 'Matthew 14:28-31 shows Peter sinking when he becomes afraid and doubts.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Peter''s sinking on the water reveal in Matthew 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 14, 3, 'What does Peter''s sinking reveal in Matthew 14?', '["Faith can falter when attention shifts from Jesus to threatening circumstances", "Walking on water was sinful in itself", "Peter lacked any prior trust in Jesus", "The storm had more authority than Jesus"]'::jsonb, 'Faith can falter when attention shifts from Jesus to threatening circumstances', 'Matthew 14:29-31 links Peter''s fear with his sinking.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Peter''s sinking reveal in Matthew 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 14, 3, 'Why is the disciples'' worship at the end of Matthew 14 important?', '["It marks a deepened recognition of Jesus''s divine sonship after his authority over the sea", "It shows they no longer need further teaching", "It proves they fully understand the cross already", "It is a routine act with no narrative weight"]'::jsonb, 'It marks a deepened recognition of Jesus''s divine sonship after his authority over the sea', 'Matthew 14:33 records worship and confession after the sea miracle.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the disciples'' worship at the end of Matthew 14 important?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 14, 3, 'Why is the feeding of the five thousand significant in Matthew 14?', '["It displays Jesus''s compassionate provision and messianic abundance in the wilderness", "It is mainly a lesson in crowd organization", "It replaces the need for preaching", "It shows the disciples can provide without Jesus"]'::jsonb, 'It displays Jesus''s compassionate provision and messianic abundance in the wilderness', 'Matthew 14:13-21 presents Jesus as compassionate provider for the multitude.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the feeding of the five thousand significant in Matthew 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 14, 4, 'How do John''s death, the feeding, and the walking on water fit together in Matthew 14?', '["The chapter moves from the cost of prophetic faithfulness to Jesus''s compassionate and sovereign care for his people", "Only the feeding matters thematically", "The miracles erase the significance of John''s death", "Herod remains the chapter''s true center"]'::jsonb, 'The chapter moves from the cost of prophetic faithfulness to Jesus''s compassionate and sovereign care for his people', 'Matthew 14 combines martyrdom, provision, and divine-like authority.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do John''s death, the feeding, and the walking on water fit together in Matthew 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 14, 4, 'How do the feeding miracle and the sea miracle together deepen Matthew''s portrait of Jesus?', '["He has both compassionate provision and divine authority over chaos", "He is only a prophet like John", "He depends entirely on the disciples for power", "He avoids revealing his identity to the Twelve"]'::jsonb, 'He has both compassionate provision and divine authority over chaos', 'Matthew 14 presents Jesus feeding the crowd and then walking on the sea, showing compassion and authority.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do the feeding miracle and the sea miracle together deepen Matthew''s portrait of Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 14, 4, 'How does Matthew 14 present Jesus in relation to Old Testament expectations?', '["He appears as the compassionate shepherd-provider and the one who treads over the sea in sovereign authority", "He is portrayed only as another prophet like John", "He fulfills only royal expectations and not prophetic ones", "Old Testament echoes are absent from the chapter"]'::jsonb, 'He appears as the compassionate shepherd-provider and the one who treads over the sea in sovereign authority', 'Matthew 14 evokes wilderness provision and divine authority over the waters.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Matthew 14 present Jesus in relation to Old Testament expectations?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 14, 4, 'What larger picture of discipleship emerges in Matthew 14?', '["Disciples are called to trust Jesus amid scarcity, fear, and suffering", "Discipleship is mainly about managing crowds efficiently", "The disciples have reached complete understanding", "Only Peter is addressed in the chapter"]'::jsonb, 'Disciples are called to trust Jesus amid scarcity, fear, and suffering', 'Matthew 14 tests discipleship through hunger, storm, and fear.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger picture of discipleship emerges in Matthew 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 14, 4, 'Why is Jesus''s prayer alone on the mountain important in Matthew 14?', '["It frames his miraculous power within communion with the Father", "It shows he wanted to avoid the disciples permanently", "It means prayer replaced action for the night", "It explains why the crowd went away disappointed"]'::jsonb, 'It frames his miraculous power within communion with the Father', 'Matthew 14:23 places solitary prayer between the feeding and sea miracle.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is Jesus''s prayer alone on the mountain important in Matthew 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 14, 5, 'How does Matthew 14 connect compassion and glory?', '["Jesus''s glory is not detached power but power exercised in compassionate care for needy people", "Glory appears only in the water-walking and not the feeding", "Compassion is a lesser theme than fear", "Glory and compassion remain unrelated in the chapter"]'::jsonb, 'Jesus''s glory is not detached power but power exercised in compassionate care for needy people', 'The feeding and the healings in Gennesaret show glory expressed as mercy.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Matthew 14 connect compassion and glory?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 14, 5, 'How does Matthew 14 deepen the meaning of faith?', '["Faith trusts Jesus''s sufficiency in hunger, danger, and uncertainty, even when understanding is partial", "Faith means never feeling fear", "Faith belongs only to miraculous moments and not ordinary need", "Faith is replaced by worship at the end"]'::jsonb, 'Faith trusts Jesus''s sufficiency in hunger, danger, and uncertainty, even when understanding is partial', 'Matthew 14 shows faith tested in multiple settings, especially Peter on the water.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Matthew 14 deepen the meaning of faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 14, 5, 'What does Matthew 14 imply about kings and kingdoms?', '["Earthly rulers like Herod kill prophets, while Jesus exercises life-giving authority and receives worship", "Herod and Jesus share the same kind of authority", "The true kingdom belongs to Herod for now", "Kingship is irrelevant to the chapter''s meaning"]'::jsonb, 'Earthly rulers like Herod kill prophets, while Jesus exercises life-giving authority and receives worship', 'Herod''s violence is contrasted with Jesus''s compassionate authority throughout Matthew 14.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Matthew 14 imply about kings and kingdoms?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 14, 5, 'Why is the disciples'' worship in Matthew 14:33 significant?', '["They confess Jesus as the Son of God after seeing his power over the sea", "They merely thank him for more bread", "They decide to return to fishing permanently", "They ask him to leave like the Gadarenes"]'::jsonb, 'They confess Jesus as the Son of God after seeing his power over the sea', 'Matthew 14:33 records the disciples worshiping Jesus and calling him the Son of God.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the disciples'' worship in Matthew 14:33 significant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 14, 5, 'Why is the phrase ''Truly you are the Son of God'' so important in Matthew 14?', '["It crystallizes the chapter''s revelation of Jesus through miraculous provision and mastery over the sea", "It merely repeats what everyone already knew without development", "It belongs only to Peter and not the group", "It settles every christological question in Matthew"]'::jsonb, 'It crystallizes the chapter''s revelation of Jesus through miraculous provision and mastery over the sea', 'Matthew 14:33 is a climactic confession in response to Jesus''s works.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the phrase ''Truly you are the Son of God'' so important in Matthew 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 15, 1, 'According to Matthew 15, what does not defile a person?', '["Eating with unwashed hands", "Harboring evil thoughts", "Murder", "False witness"]'::jsonb, 'Eating with unwashed hands', 'Matthew 15:20 says eating with unwashed hands does not defile a person.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Matthew 15, what does not defile a person?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 15, 2, 'What request did the Canaanite woman make of Jesus?', '["That he heal her demon-tormented daughter", "That he raise her husband", "That he give her bread for the journey", "That he make her one of the Twelve"]'::jsonb, 'That he heal her demon-tormented daughter', 'Matthew 15:22 asks mercy for her daughter, who was severely demonized.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'What request did the Canaanite woman make of Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 15, 3, 'What is Jesus teaching when he says defilement comes from within?', '["The heart is the true source of moral uncleanness", "Food laws alone determine righteousness", "Tradition is always evil", "Washing is forbidden"]'::jsonb, 'The heart is the true source of moral uncleanness', 'Matthew 15:17-20 says evil thoughts and sins come out of the heart and defile a person.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is Jesus teaching when he says defilement comes from within?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 15, 4, 'Why is the Canaanite woman''s faith striking in Matthew 15?', '["She persists humbly and trusts Jesus beyond initial barriers", "She demands a sign from heaven", "She refuses to acknowledge Israel''s priority", "She keeps silent until the disciples speak"]'::jsonb, 'She persists humbly and trusts Jesus beyond initial barriers', 'Matthew 15:21-28 highlights her persistent, humble, and effective faith.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is the Canaanite woman''s faith striking in Matthew 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 15, 5, 'How do the disputes about tradition and the healing/feedings in Matthew 15 work together?', '["Jesus exposes false purity standards while welcoming faith and meeting need", "Jesus shifts his mission entirely away from Israel", "The chapter proves miracles matter more than truth", "Tradition and mercy are shown to be identical"]'::jsonb, 'Jesus exposes false purity standards while welcoming faith and meeting need', 'Matthew 15 contrasts heart-defilement teaching with compassionate healing and feeding, including a Gentile woman''s faith.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'How do the disputes about tradition and the healing/feedings in Matthew 15 work together?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 16, 1, 'At Caesarea Philippi, what did Peter confess about Jesus?', '["You are the Christ, the Son of the living God", "You are Elijah returned", "You are John the Baptizer", "You are the temple''s new high priest"]'::jsonb, 'You are the Christ, the Son of the living God', 'Matthew 16:16 gives Peter''s confession.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'At Caesarea Philippi, what did Peter confess about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 16, 2, 'What did Jesus tell his disciples to take up if they would follow him?', '["Their cross", "A lamp", "A sword", "Their nets"]'::jsonb, 'Their cross', 'Matthew 16:24 says disciples must deny themselves and take up their cross.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus tell his disciples to take up if they would follow him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 16, 3, 'What is Jesus warning about with the leaven of the Pharisees and Sadducees?', '["Their teaching and corrupting influence", "Ordinary bread from Jerusalem", "Temple sacrifices", "Roman taxation"]'::jsonb, 'Their teaching and corrupting influence', 'Matthew 16:12 says the disciples understood he meant the teaching of the Pharisees and Sadducees.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is Jesus warning about with the leaven of the Pharisees and Sadducees?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 16, 4, 'Why does Peter move so quickly from confession to rebuke in Matthew 16?', '["He accepts a glorious Messiah but resists a suffering one", "He never believed Jesus was the Christ", "He is confused about John''s baptism only", "He wants Jesus to leave Galilee sooner"]'::jsonb, 'He accepts a glorious Messiah but resists a suffering one', 'Matthew 16:21-23 shows Peter confessing Jesus rightly yet rejecting the prediction of suffering.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Peter move so quickly from confession to rebuke in Matthew 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 16, 5, 'How does Matthew 16 hold together kingdom authority and suffering discipleship?', '["Peter receives keys, yet all followers must embrace the path of the cross", "Authority replaces suffering entirely", "Only leaders suffer while others reign now", "Suffering belongs only to Jesus and not his disciples"]'::jsonb, 'Peter receives keys, yet all followers must embrace the path of the cross', 'Matthew 16 combines Peter''s confession and keys with Jesus''s call to deny self and lose life to find it.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Matthew 16 hold together kingdom authority and suffering discipleship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 17, 1, 'Who appeared with Jesus at the transfiguration in Matthew 17?', '["Moses and Elijah", "Abraham and David", "Isaiah and Jeremiah", "Peter and John"]'::jsonb, 'Moses and Elijah', 'Matthew 17:3 says Moses and Elijah appeared talking with Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who appeared with Jesus at the transfiguration in Matthew 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 17, 2, 'What did the voice from heaven say about Jesus at the transfiguration?', '["This is my beloved Son; listen to him", "This is my servant John", "Follow Moses and Elijah equally", "Go tell everyone immediately"]'::jsonb, 'This is my beloved Son; listen to him', 'Matthew 17:5 records the Father''s voice telling the disciples to listen to Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the voice from heaven say about Jesus at the transfiguration?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 17, 3, 'Why could the disciples not cast out the demonized boy in Matthew 17?', '["Because of little faith and failure in dependent prayer", "Because demons feared only John", "Because Jesus had revoked their authority permanently", "Because the boy was pretending"]'::jsonb, 'Because of little faith and failure in dependent prayer', 'Matthew 17:19-21 connects their failure with little faith and prayer.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why could the disciples not cast out the demonized boy in Matthew 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 17, 4, 'How does the transfiguration shape the meaning of Jesus''s coming suffering?', '["It reveals his glory before the path to the cross fully unfolds", "It cancels the need for suffering altogether", "It proves Elijah will die in Jesus''s place", "It shows the kingdom has already ended"]'::jsonb, 'It reveals his glory before the path to the cross fully unfolds', 'Matthew 17 follows the prediction of suffering with a revelation of Jesus''s glory and sonship.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the transfiguration shape the meaning of Jesus''s coming suffering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 17, 5, 'Why does Jesus provide the temple tax coin through a fish?', '["To avoid offense even though the Son is free", "To display wealth to the crowds", "To pay Rome''s taxes miraculously", "To feed the disciples in Capernaum"]'::jsonb, 'To avoid offense even though the Son is free', 'Matthew 17:24-27 says the sons are free, yet Jesus pays so as not to cause offense.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does Jesus provide the temple tax coin through a fish?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 18, 1, 'According to Matthew 18, who is greatest in the Kingdom of Heaven (Matt 18:3)?', '["One who humbles himself like a little child", "The oldest disciple", "The one who speaks most often", "The one with the most wealth"]'::jsonb, 'One who humbles himself like a little child', 'Matthew 18:3-4 says greatness belongs to the one who becomes humble like a child.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Matthew 18, who is greatest in the Kingdom of Heaven (Matt 18:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 18, 2, 'How many times did Jesus tell Peter to forgive?', '["Seventy times seven", "Seven times only", "Twelve times", "As many times as a judge allows"]'::jsonb, 'Seventy times seven', 'Matthew 18:21-22 answers Peter''s question with seventy times seven.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'How many times did Jesus tell Peter to forgive?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 18, 3, 'What is the point of the parable of the unforgiving servant?', '["Those forgiven greatly must forgive others from the heart", "Small debts matter more than large ones", "Mercy is optional in the kingdom", "Only kings are allowed to forgive"]'::jsonb, 'Those forgiven greatly must forgive others from the heart', 'Matthew 18:23-35 ends by warning against refusing mercy after receiving mercy.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the point of the parable of the unforgiving servant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 18, 4, 'How does the lost sheep parable support the chapter''s teaching about little ones?', '["It shows the Father''s concern for the wandering and vulnerable", "It argues that only large crowds matter", "It teaches that discipline is unnecessary", "It proves children should never be corrected"]'::jsonb, 'It shows the Father''s concern for the wandering and vulnerable', 'Matthew 18:10-14 stresses that the Father does not will that one of these little ones perish.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the lost sheep parable support the chapter''s teaching about little ones?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 18, 5, 'What is the aim of the step-by-step process for confronting a sinning brother in Matthew 18?', '["To gain the brother if possible through accountable restoration", "To shame him publicly as fast as possible", "To avoid witnesses in every case", "To replace forgiveness with punishment"]'::jsonb, 'To gain the brother if possible through accountable restoration', 'Matthew 18:15 says the goal is to gain your brother.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the aim of the step-by-step process for confronting a sinning brother in Matthew 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 19, 1, 'What did Jesus say God made at the beginning in Matthew 19?', '["Male and female", "Priests and Levites", "Kings and prophets", "Jews and Gentiles separately"]'::jsonb, 'Male and female', 'Matthew 19:4 cites creation: God made them male and female.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say God made at the beginning in Matthew 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 19, 2, 'Who came to Jesus asking what good thing he must do to have eternal life?', '["A rich young man", "A centurion", "A lawyer testing him", "Nicodemus"]'::jsonb, 'A rich young man', 'Matthew 19:16-22 records the rich young man''s question.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'Who came to Jesus asking what good thing he must do to have eternal life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 19, 3, 'What does Jesus expose through his command to sell possessions and follow him?', '["The man''s heart was attached to his wealth more than to discipleship", "The Law was no longer relevant", "Poverty itself guarantees salvation", "Only the rich may become disciples"]'::jsonb, 'The man''s heart was attached to his wealth more than to discipleship', 'Matthew 19:21-22 shows the man leaving sorrowful because he had great possessions.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Jesus expose through his command to sell possessions and follow him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 19, 4, 'How do the teachings on marriage, children, and wealth fit together in Matthew 19?', '["They all call for receiving God''s kingdom on his terms rather than protecting status or control", "They are unrelated sayings collected at random", "They teach children must renounce marriage", "They argue possessions are evil in themselves"]'::jsonb, 'They all call for receiving God''s kingdom on his terms rather than protecting status or control', 'Matthew 19 ties covenant faithfulness, childlike reception, and costly discipleship together.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do the teachings on marriage, children, and wealth fit together in Matthew 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 19, 5, 'Why does Jesus say the last will be first and the first last at the end of Matthew 19?', '["Kingdom reward is governed by God''s grace, not human ranking", "Social rank determines heavenly honor", "The disciples will lose every promise given to them", "Only children enter the kingdom"]'::jsonb, 'Kingdom reward is governed by God''s grace, not human ranking', 'Matthew 19:27-30 closes with promised reward and the reversal saying that leads into chapter 20.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does Jesus say the last will be first and the first last at the end of Matthew 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 20, 1, 'In Matthew 20, what kind of workers are hired at different hours?', '["Workers in a vineyard", "Builders of a tower", "Fishermen on the sea", "Servants in a palace"]'::jsonb, 'Workers in a vineyard', 'Matthew 20:1-7 describes workers hired into a vineyard throughout the day.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'In Matthew 20, what kind of workers are hired at different hours?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 20, 2, 'What title did the two blind men cry out to Jesus as he passed by?', '["Lord, Son of David", "Rabbi of Nazareth", "Prophet of Galilee", "King of Rome"]'::jsonb, 'Lord, Son of David', 'Matthew 20:30-31 says the blind men cried, ''Lord, have mercy on us, Son of David!'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'What title did the two blind men cry out to Jesus as he passed by?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 20, 3, 'What does the parable of the vineyard laborers emphasize about God?', '["He is generous beyond human calculations of fairness", "He rewards only the earliest workers", "He values grumbling as honesty", "He ignores those who come late"]'::jsonb, 'He is generous beyond human calculations of fairness', 'Matthew 20:13-15 centers on the master''s right to be generous.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the parable of the vineyard laborers emphasize about God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 20, 4, 'How does Jesus redefine greatness after the request of James and John''s mother?', '["Greatness is serving others, not ruling over them", "Greatness belongs to the most honored seat alone", "Greatness is proven by family ties", "Greatness comes through avoiding suffering"]'::jsonb, 'Greatness is serving others, not ruling over them', 'Matthew 20:25-28 contrasts Gentile rulers with servant greatness among Jesus''s followers.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Jesus redefine greatness after the request of James and John''s mother?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 20, 5, 'How does Matthew 20 connect Jesus''s death with discipleship?', '["Jesus gives his life as a ransom, and his followers are called to a path of humble service", "Jesus dies only as a political martyr", "Discipleship removes all suffering after conversion", "The blind men understand less than the Twelve"]'::jsonb, 'Jesus gives his life as a ransom, and his followers are called to a path of humble service', 'Matthew 20:17-28 joins the passion prediction with the teaching that the Son of Man came to serve and give his life as a ransom.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Matthew 20 connect Jesus''s death with discipleship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 21, 1, 'What animal did Jesus ride into Jerusalem in Matthew 21 (Matt 21:5)?', '["A donkey", "A horse", "A camel", "A chariot"]'::jsonb, 'A donkey', 'Matthew 21:5-7 presents Jesus entering Jerusalem on a donkey.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'What animal did Jesus ride into Jerusalem in Matthew 21 (Matt 21:5)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 21, 2, 'What did Jesus do in the temple in Matthew 21?', '["He drove out the buyers and sellers", "He crowned a new high priest", "He hid from the crowds", "He offered incense at the altar"]'::jsonb, 'He drove out the buyers and sellers', 'Matthew 21:12 says Jesus drove out those buying and selling in the temple.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus do in the temple in Matthew 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 21, 3, 'What does the withered fig tree symbolize in Matthew 21?', '["Judgment on fruitless profession", "The end of agriculture in Judea", "A promise of endless harvest", "The disciples'' future prosperity"]'::jsonb, 'Judgment on fruitless profession', 'Matthew 21:18-22 uses the fig tree in a context of fruitlessness and judgment.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the withered fig tree symbolize in Matthew 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 21, 4, 'How do the parables of the two sons and the tenants expose Israel''s leaders?', '["They reject God''s messengers and refuse the obedience they claim to honor", "They are praised for careful vineyard management", "They are shown to welcome the Son gladly", "They are described mainly as politically weak"]'::jsonb, 'They reject God''s messengers and refuse the obedience they claim to honor', 'Matthew 21:28-46 indicts leaders who would not obey John and who reject the Son.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do the parables of the two sons and the tenants expose Israel''s leaders?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 21, 5, 'Why is the rejected-stone quotation significant in Matthew 21?', '["It declares that the rejected Son becomes the cornerstone of God''s purpose", "It predicts the temple''s immediate reconstruction", "It praises the builders for their wisdom", "It applies only to David and not to Jesus"]'::jsonb, 'It declares that the rejected Son becomes the cornerstone of God''s purpose', 'Matthew 21:42 applies Psalm language to Jesus as the rejected yet chosen cornerstone.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the rejected-stone quotation significant in Matthew 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 22, 1, 'What image opens Matthew 22?', '["A wedding feast for a king''s son", "A vineyard harvest", "A shepherd dividing sheep", "A storm at sea"]'::jsonb, 'A wedding feast for a king''s son', 'Matthew 22:2 begins with a parable about a king giving a wedding feast for his son.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 22
    AND q.difficulty_stage = 1
    AND q.prompt = 'What image opens Matthew 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 22, 2, 'What did Jesus say should be rendered to Caesar?', '["The things that are Caesar''s", "Only the temple tax", "Nothing at all", "The worship due to God"]'::jsonb, 'The things that are Caesar''s', 'Matthew 22:21 says to render to Caesar what is Caesar''s and to God what is God''s.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 22
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say should be rendered to Caesar?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 22, 3, 'How does Jesus answer the Sadducees'' challenge about resurrection?', '["He says they do not know the Scriptures or the power of God", "He agrees resurrection is impossible", "He postpones the answer for later", "He changes the subject to taxes"]'::jsonb, 'He says they do not know the Scriptures or the power of God', 'Matthew 22:29 rebukes the Sadducees for misunderstanding Scripture and God''s power.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 22
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Jesus answer the Sadducees'' challenge about resurrection?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 22, 4, 'Why does Jesus join love for God and love for neighbor as the great commandment?', '["The whole Law and the Prophets hang on these two commands", "One command replaces the other entirely", "Neighbor-love matters only after resurrection", "Love is unrelated to obedience"]'::jsonb, 'The whole Law and the Prophets hang on these two commands', 'Matthew 22:37-40 says all the Law and the Prophets depend on these two commands.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 22
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Jesus join love for God and love for neighbor as the great commandment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 22, 5, 'What is the force of Jesus''s question about David calling the Messiah ''Lord''?', '["The Messiah is more than merely David''s descendant", "David was not really Israel''s king", "The Psalms should be ignored in debate", "The Pharisees no longer believed in the Messiah"]'::jsonb, 'The Messiah is more than merely David''s descendant', 'Matthew 22:41-46 uses Psalm 110 to show the Messiah''s superiority to simple descent categories.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 22
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the force of Jesus''s question about David calling the Messiah ''Lord''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 23, 1, 'What did Jesus say the scribes and Pharisees love in Matthew 23?', '["Places of honor and impressive titles", "Serving the poor quietly", "Private repentance", "Being unknown in public"]'::jsonb, 'Places of honor and impressive titles', 'Matthew 23:5-7 says they loved public honor, greetings, and titles.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 23
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say the scribes and Pharisees love in Matthew 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 23, 2, 'What image did Jesus use for the scribes and Pharisees in Matthew 23:27?', '["Whitewashed tombs", "Fruitful vineyards", "Shining lamps", "Solid foundations"]'::jsonb, 'Whitewashed tombs', 'Matthew 23:27 compares them to whitewashed tombs.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 23
    AND q.difficulty_stage = 2
    AND q.prompt = 'What image did Jesus use for the scribes and Pharisees in Matthew 23:27?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 23, 3, 'What is the central problem Jesus exposes in the woes of Matthew 23?', '["Religious hypocrisy that looks clean outwardly while remaining corrupt within", "A lack of education in the Law", "Insufficient interest in politics", "Too much mercy toward sinners"]'::jsonb, 'Religious hypocrisy that looks clean outwardly while remaining corrupt within', 'Matthew 23 repeatedly contrasts outward appearance with inward corruption.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 23
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the central problem Jesus exposes in the woes of Matthew 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 23, 4, 'How does Jesus summarize the neglected weightier matters of the law?', '["Justice, mercy, and faithfulness", "Fasting, washing, and travel", "Tithing, sacrifice, and rank", "Silence, secrecy, and tradition"]'::jsonb, 'Justice, mercy, and faithfulness', 'Matthew 23:23 says they neglected justice, mercy, and faithfulness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 23
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Jesus summarize the neglected weightier matters of the law?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 23, 5, 'Why does Jesus lament over Jerusalem at the end of Matthew 23?', '["The city resists the prophets and refuses his gathering care", "The Romans have already destroyed it", "The disciples want to leave the city", "The temple has ceased all worship"]'::jsonb, 'The city resists the prophets and refuses his gathering care', 'Matthew 23:37 laments Jerusalem for killing the prophets and refusing to be gathered.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 23
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does Jesus lament over Jerusalem at the end of Matthew 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 24, 1, 'What did Jesus say would happen to the temple buildings in Matthew 24?', '["Not one stone would be left on another", "They would be expanded and beautified", "They would become a fortress for the disciples", "They would be moved to Galilee"]'::jsonb, 'Not one stone would be left on another', 'Matthew 24:2 foretells the temple''s destruction.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 24
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say would happen to the temple buildings in Matthew 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 24, 2, 'How did Jesus describe the day and hour of his coming?', '["No one knows it, except the Father", "The disciples could calculate it exactly", "The Pharisees had already determined it", "It would happen before the next Sabbath"]'::jsonb, 'No one knows it, except the Father', 'Matthew 24:36 says no one knows the day or hour except the Father.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 24
    AND q.difficulty_stage = 2
    AND q.prompt = 'How did Jesus describe the day and hour of his coming?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 24, 3, 'What is the function of Jesus''s warnings about wars, famines, and false christs?', '["To call for endurance and discernment, not panic or deception", "To encourage date-setting", "To show the gospel should stop spreading", "To prove every rumor is the end"]'::jsonb, 'To call for endurance and discernment, not panic or deception', 'Matthew 24 presents these as birth pains and warnings, calling disciples to watchfulness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 24
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the function of Jesus''s warnings about wars, famines, and false christs?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 24, 4, 'Why does Jesus compare his coming to the days of Noah?', '["People will be living ordinarily and unprepared when judgment arrives", "Only flood survivors will understand the kingdom", "The ark will reappear in Jerusalem", "The disciples must build boats"]'::jsonb, 'People will be living ordinarily and unprepared when judgment arrives', 'Matthew 24:37-39 compares ordinary life before the flood with unexpected judgment at the Son of Man''s coming.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 24
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Jesus compare his coming to the days of Noah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 24, 5, 'How does the faithful servant image summarize Matthew 24?', '["Disciples must remain watchful and obedient because the master may come unexpectedly", "Only leaders need to be ready", "Preparation means withdrawing from all work", "Judgment belongs only to past generations"]'::jsonb, 'Disciples must remain watchful and obedient because the master may come unexpectedly', 'Matthew 24:45-51 ends by contrasting faithful readiness with careless delay.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 24
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does the faithful servant image summarize Matthew 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 25, 1, 'In the parable of the ten virgins, what distinguished the wise from the foolish?', '["The wise had oil ready", "The wise arrived first at the feast", "The wise brought more lamps than others", "The wise knew the bridegroom personally by family ties"]'::jsonb, 'The wise had oil ready', 'Matthew 25:1-13 contrasts wise virgins with oil and foolish ones without it.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 25
    AND q.difficulty_stage = 1
    AND q.prompt = 'In the parable of the ten virgins, what distinguished the wise from the foolish?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 25, 2, 'What did the master say to the faithful servants in the talents parable?', '["Well done, good and faithful servant", "You should have buried more carefully", "Your reward is only temporary", "Return when you have more confidence"]'::jsonb, 'Well done, good and faithful servant', 'Matthew 25:21 and 25:23 commend the faithful servants with those words.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 25
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the master say to the faithful servants in the talents parable?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 25, 3, 'What do the parables of the virgins and talents share?', '["Both call for readiness expressed in faithful action before the master''s return", "Both teach that effort earns salvation mechanically", "Both reject final judgment", "Both are only about financial planning"]'::jsonb, 'Both call for readiness expressed in faithful action before the master''s return', 'Matthew 25 links watchfulness with responsible stewardship while awaiting the master''s coming.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 25
    AND q.difficulty_stage = 3
    AND q.prompt = 'What do the parables of the virgins and talents share?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 25, 4, 'Why are the sheep commended in the final judgment scene?', '["They served the king by caring for the least of his brothers", "They predicted the exact day of his coming", "They performed signs greater than the apostles", "They withdrew from society completely"]'::jsonb, 'They served the king by caring for the least of his brothers', 'Matthew 25:34-40 commends acts of mercy done to the least of these.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 25
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why are the sheep commended in the final judgment scene?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 25, 5, 'How does Matthew 25 hold together preparedness, stewardship, and judgment?', '["Those truly awaiting the king live faithfully, mercifully, and responsibly now", "Judgment is postponed for all regardless of conduct", "Oil, talents, and sheep are unrelated images", "Only public ministry matters to the Son of Man"]'::jsonb, 'Those truly awaiting the king live faithfully, mercifully, and responsibly now', 'Matthew 25 weaves together readiness, entrusted responsibility, and final separation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 25
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Matthew 25 hold together preparedness, stewardship, and judgment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 26, 1, 'Who agreed to betray Jesus for silver in Matthew 26 (Matt 26:14)?', '["Judas Iscariot", "Peter", "Caiaphas", "Pilate"]'::jsonb, 'Judas Iscariot', 'Matthew 26:14-15 says Judas agreed to betray Jesus for thirty pieces of silver.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 26
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who agreed to betray Jesus for silver in Matthew 26 (Matt 26:14)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 26, 2, 'What did Jesus say the cup represented at the Last Supper?', '["His blood of the covenant poured out for many for forgiveness of sins", "The judgment of Rome", "The tears of the prophets", "The wisdom of Solomon"]'::jsonb, 'His blood of the covenant poured out for many for forgiveness of sins', 'Matthew 26:27-28 explains the cup in covenant and forgiveness language.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 26
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say the cup represented at the Last Supper?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 26, 3, 'What does Jesus''s prayer in Gethsemane reveal?', '["He submits his human will to the Father''s purpose in deep anguish", "He tries to escape the Father''s plan permanently", "He doubts God''s existence", "He asks the disciples to fight for him"]'::jsonb, 'He submits his human will to the Father''s purpose in deep anguish', 'Matthew 26:39 shows Jesus praying, ''Not as I will, but as you will.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 26
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Jesus''s prayer in Gethsemane reveal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 26, 4, 'How do the anointing, supper, and arrest scenes fit together in Matthew 26?', '["They interpret Jesus''s death as purposeful, covenantal, and willingly embraced", "They show the disciples fully understanding everything", "They postpone the passion until after Passover", "They focus mainly on temple politics"]'::jsonb, 'They interpret Jesus''s death as purposeful, covenantal, and willingly embraced', 'Matthew 26 links burial preparation, covenant meal, and obedient surrender.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 26
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do the anointing, supper, and arrest scenes fit together in Matthew 26?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 26, 5, 'Why is Peter''s denial significant within Matthew 26?', '["It shows the failure of even devoted disciples apart from steadfast watchfulness and grace", "It proves Peter was never called", "It fulfills Judas''s role instead", "It ends Peter''s place in the Gospel entirely"]'::jsonb, 'It shows the failure of even devoted disciples apart from steadfast watchfulness and grace', 'Matthew 26:31-35 and 69-75 frame Peter''s confidence and collapse.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 26
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Peter''s denial significant within Matthew 26?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 27, 1, 'Whom did the crowd ask Pilate to release instead of Jesus?', '["Barabbas", "Judas", "Caiaphas", "Simon of Cyrene"]'::jsonb, 'Barabbas', 'Matthew 27:21 says the crowd chose Barabbas.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 27
    AND q.difficulty_stage = 1
    AND q.prompt = 'Whom did the crowd ask Pilate to release instead of Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 27, 2, 'What confession did the centurion make after Jesus died?', '["Truly this was the Son of God", "Surely this man was innocent only", "This was Elijah", "This was the king of Rome"]'::jsonb, 'Truly this was the Son of God', 'Matthew 27:54 records the centurion''s confession.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 27
    AND q.difficulty_stage = 2
    AND q.prompt = 'What confession did the centurion make after Jesus died?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 27, 3, 'What is signified by the tearing of the temple veil in Matthew 27?', '["Jesus''s death opens a decisive new reality in access to God and judgment on the old order", "The priests had made a mistake in the temple service", "The temple immediately ceased to exist physically", "Only the centurion was allowed inside the sanctuary"]'::jsonb, 'Jesus''s death opens a decisive new reality in access to God and judgment on the old order', 'Matthew 27:51 links Jesus''s death with the veil being torn from top to bottom.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 27
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is signified by the tearing of the temple veil in Matthew 27?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 27, 4, 'How does Matthew portray Jesus during trial and crucifixion?', '["As the rejected yet true king who suffers according to God''s purpose", "As a failed teacher surprised by events", "As one whose mission ended before the cross", "As merely another political rebel"]'::jsonb, 'As the rejected yet true king who suffers according to God''s purpose', 'Matthew 27 highlights mock kingship language even as Jesus fulfills the path to the cross.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 27
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Matthew portray Jesus during trial and crucifixion?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 27, 5, 'Why is Joseph of Arimathea''s burial of Jesus important in Matthew 27?', '["It confirms Jesus truly died and was laid in a known tomb", "It proves the disciples stole the body immediately", "It hides the location from everyone", "It replaces the resurrection hope with memorial honor"]'::jsonb, 'It confirms Jesus truly died and was laid in a known tomb', 'Matthew 27:57-61 gives a concrete burial account in Joseph''s new tomb.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 27
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Joseph of Arimathea''s burial of Jesus important in Matthew 27?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 28, 1, 'Who first came to see the tomb in Matthew 28?', '["Mary Magdalene and the other Mary", "Peter and John", "The chief priests", "Joseph and Nicodemus"]'::jsonb, 'Mary Magdalene and the other Mary', 'Matthew 28:1 names Mary Magdalene and the other Mary at the tomb.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 28
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who first came to see the tomb in Matthew 28?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 28, 2, 'What did Jesus claim before giving the Great Commission?', '["All authority in heaven and on earth has been given to me", "The temple will be rebuilt in three days", "Only Galilee belongs to him", "The nations will come without preaching"]'::jsonb, 'All authority in heaven and on earth has been given to me', 'Matthew 28:18 introduces the commission with Jesus''s universal authority.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 28
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus claim before giving the Great Commission?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 28, 3, 'Why is the angel''s message ''He is not here, for he has risen'' central to Matthew 28?', '["It announces that Jesus has conquered death and the tomb is empty", "It means the women went to the wrong place", "It denies Jesus had truly died", "It shifts attention away from Galilee"]'::jsonb, 'It announces that Jesus has conquered death and the tomb is empty', 'Matthew 28:5-6 announces the resurrection plainly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 28
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the angel''s message ''He is not here, for he has risen'' central to Matthew 28?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 28, 4, 'How does the bribing of the guards function in Matthew 28?', '["It contrasts official suppression with the true resurrection witness", "It proves the body was actually stolen", "It shows the priests came to faith quickly", "It replaces the need for the disciples'' testimony"]'::jsonb, 'It contrasts official suppression with the true resurrection witness', 'Matthew 28:11-15 reports the bribery as an attempted counter-story to the resurrection.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 28
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the bribing of the guards function in Matthew 28?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 28, 5, 'How does Matthew''s ending echo its beginning?', '["The Gospel opens with Immanuel and ends with Jesus promising to be with his disciples always", "It begins in Galilee and ends in Egypt", "It opens with John the Baptizer and ends with Herod", "It begins with law and ends by rejecting obedience"]'::jsonb, 'The Gospel opens with Immanuel and ends with Jesus promising to be with his disciples always', 'Matthew 1:23 calls Jesus Immanuel, and Matthew 28:20 ends with Jesus promising to be with his disciples always.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 28
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Matthew''s ending echo its beginning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 15, 1, 'In Matthew 15, what did the Pharisees criticize the disciples for not doing?', '["Washing their hands before eating", "Keeping the Sabbath fast", "Paying the temple tax", "Offering incense"]'::jsonb, 'Washing their hands before eating', 'The Pharisees and scribes objected that Jesus'' disciples ate bread without first washing their hands according to tradition.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'In Matthew 15, what did the Pharisees criticize the disciples for not doing?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 15, 1, 'What happened to the Canaanite woman''s daughter in Matthew 15?', '["She was healed", "She was baptized", "She followed Jesus", "She fed the crowd"]'::jsonb, 'She was healed', 'Jesus granted the Canaanite woman''s request and healed her daughter from that hour.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'What happened to the Canaanite woman''s daughter in Matthew 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 15, 1, 'How many loaves were used to feed the four thousand in Matthew 15?', '["Seven", "Five", "Twelve", "Three"]'::jsonb, 'Seven', 'Jesus used seven loaves, along with a few small fish, to feed the crowd of four thousand.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'How many loaves were used to feed the four thousand in Matthew 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 15, 1, 'How many baskets of leftovers were collected after feeding the four thousand?', '["Seven", "Twelve", "Four", "Ten"]'::jsonb, 'Seven', 'After everyone ate, the disciples took up seven baskets full of broken pieces.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'How many baskets of leftovers were collected after feeding the four thousand?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 15, 2, 'According to Jesus in Matthew 15, what truly defiles a person?', '["What comes out of the mouth from the heart", "Eating with unwashed hands", "Walking through Gentile land", "Failing to give money to the poor"]'::jsonb, 'What comes out of the mouth from the heart', 'Jesus taught that defilement comes from the heart and is expressed in evil words and actions, not from unwashed hands.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Jesus in Matthew 15, what truly defiles a person?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 15, 2, 'What title did the Canaanite woman use when she cried out to Jesus?', '["Lord, Son of David", "Rabbi of Nazareth", "Holy Prophet", "King of Israel"]'::jsonb, 'Lord, Son of David', 'She addressed Jesus as ''Lord, Son of David'' while asking mercy for her demon-oppressed daughter.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'What title did the Canaanite woman use when she cried out to Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 15, 2, 'Where did Jesus say evil thoughts and sins come from in Matthew 15?', '["The heart", "The hands", "The marketplace", "The wilderness"]'::jsonb, 'The heart', 'Jesus listed evil thoughts, murders, adulteries, and other sins as proceeding from the heart.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'Where did Jesus say evil thoughts and sins come from in Matthew 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 15, 2, 'How long had the crowd been with Jesus before he fed the four thousand?', '["Three days", "One day", "Seven days", "Forty days"]'::jsonb, 'Three days', 'Jesus said he had compassion because the crowd had remained with him for three days and had nothing to eat.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'How long had the crowd been with Jesus before he fed the four thousand?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 15, 3, 'What metaphor did Jesus use before praising the Canaanite woman''s faith?', '["Children''s bread and little dogs", "A fig tree and its fruit", "A lamp under a basket", "New wine in old wineskins"]'::jsonb, 'Children''s bread and little dogs', 'Jesus spoke of not taking the children''s bread and throwing it to the little dogs, and the woman responded humbly and faithfully.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'What metaphor did Jesus use before praising the Canaanite woman''s faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 15, 3, 'Which sins are specifically named by Jesus as coming from the heart in Matthew 15?', '["Murders, adulteries, and false witness", "Wars, famines, and earthquakes", "Pride, sleepiness, and hunger", "Taxes, debts, and droughts"]'::jsonb, 'Murders, adulteries, and false witness', 'Jesus named a list of heart-sins including murders, adulteries, sexual sins, thefts, false testimony, and blasphemies.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which sins are specifically named by Jesus as coming from the heart in Matthew 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 15, 3, 'What was the disciples'' concern about sending the crowd away in Matthew 15?', '["They might faint on the way", "They might start a revolt", "They might miss the Passover", "They might be arrested"]'::jsonb, 'They might faint on the way', 'Jesus noted that many had come from far away and might faint if sent away hungry.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'What was the disciples'' concern about sending the crowd away in Matthew 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 15, 3, 'After leaving that region in Matthew 15, where did Jesus come by boat?', '["The region of Magdala", "Bethany near Jerusalem", "Nazareth of Galilee", "Caesarea Philippi"]'::jsonb, 'The region of Magdala', 'After feeding the four thousand, Jesus entered the boat and came into the borders of Magdala.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'After leaving that region in Matthew 15, where did Jesus come by boat?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 15, 4, 'Why did Jesus say the Pharisees transgressed God''s commandment?', '["They used tradition to avoid honoring father and mother", "They refused to read Moses publicly", "They denied David was king", "They worked as tax collectors"]'::jsonb, 'They used tradition to avoid honoring father and mother', 'Jesus rebuked them for allowing vows like ''Whatever help you might have received from me is given to God,'' which undermined honoring parents.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did Jesus say the Pharisees transgressed God''s commandment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 15, 4, 'What did Jesus call the Pharisees when speaking to the disciples after the confrontation?', '["Blind guides", "Faithful stewards", "Wise builders", "Children of Abraham"]'::jsonb, 'Blind guides', 'Jesus said they were blind guides, and if the blind lead the blind, both fall into a pit.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'What did Jesus call the Pharisees when speaking to the disciples after the confrontation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 15, 4, 'Besides the lame and blind, what other kinds of afflicted people were brought to Jesus on the mountain?', '["Mute and maimed people", "Only lepers", "Only children", "Only soldiers"]'::jsonb, 'Mute and maimed people', 'The crowds brought the lame, blind, mute, maimed, and many others, and Jesus healed them.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'Besides the lame and blind, what other kinds of afflicted people were brought to Jesus on the mountain?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 15, 4, 'What did the crowd do after seeing the mute speak and the lame walk?', '["They glorified the God of Israel", "They demanded a sign from heaven", "They tried to crown Jesus in Jerusalem", "They returned to Tyre"]'::jsonb, 'They glorified the God of Israel', 'The crowd marveled and glorified the God of Israel after witnessing the healings.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'What did the crowd do after seeing the mute speak and the lame walk?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 15, 5, 'How did the Canaanite woman answer Jesus'' saying about the little dogs?', '["Even the little dogs eat the crumbs that fall from their masters'' table", "Lord, call down fire from heaven on my enemies", "I am not worthy to come under your roof", "Speak the word only and she will be healed"]'::jsonb, 'Even the little dogs eat the crumbs that fall from their masters'' table', 'Her humble and faithful reply showed confidence in Jesus'' mercy, and he praised her great faith.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'How did the Canaanite woman answer Jesus'' saying about the little dogs?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 15, 5, 'What Old Testament prophet did Jesus quote when calling the Pharisees'' worship vain?', '["Isaiah", "Jeremiah", "Ezekiel", "Hosea"]'::jsonb, 'Isaiah', 'Jesus quoted Isaiah: the people honor God with their lips, but their heart is far from him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What Old Testament prophet did Jesus quote when calling the Pharisees'' worship vain?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 15, 5, 'What reason did Jesus give for not wanting to send the crowd away fasting?', '["He did not want them to faint on the way", "He wanted them to stay for another Sabbath", "He needed witnesses for a miracle in Jerusalem", "He was preparing them for temple service"]'::jsonb, 'He did not want them to faint on the way', 'Jesus'' compassion for the hungry crowd moved him to provide food rather than dismiss them weak and fasting.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What reason did Jesus give for not wanting to send the crowd away fasting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 15, 5, 'What did Jesus declare about every plant his heavenly Father had not planted?', '["It would be rooted up", "It would bear no leaves only", "It would be burned that night", "It would grow among thorns"]'::jsonb, 'It would be rooted up', 'Jesus said every plant not planted by his Father would be uprooted, highlighting the temporary nature of false religious teaching.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus declare about every plant his heavenly Father had not planted?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 16, 1, 'What kind of sign did the Pharisees and Sadducees ask Jesus to show in Matthew 16?', '["A sign from heaven", "A sign in the temple treasury", "A sign from the sea", "A sign in Bethlehem"]'::jsonb, 'A sign from heaven', 'The Pharisees and Sadducees came testing Jesus and asked him to show them a sign from heaven.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'What kind of sign did the Pharisees and Sadducees ask Jesus to show in Matthew 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 16, 1, 'Who confessed, ''You are the Christ, the Son of the living God'' in Matthew 16?', '["Peter", "John the Baptist", "Pilate", "Judas"]'::jsonb, 'Peter', 'Simon Peter made that confession at Caesarea Philippi.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who confessed, ''You are the Christ, the Son of the living God'' in Matthew 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 16, 1, 'What did Jesus say his disciples must take up in order to follow him?', '["Their cross", "A fishing net", "A temple offering", "A lamp"]'::jsonb, 'Their cross', 'Jesus said that anyone who wanted to follow him must deny himself, take up his cross, and follow.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say his disciples must take up in order to follow him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 16, 1, 'What did Jesus warn his disciples to beware of in Matthew 16?', '["The leaven of the Pharisees and Sadducees", "Roman taxation", "The storm on the sea", "The crowds in Jerusalem"]'::jsonb, 'The leaven of the Pharisees and Sadducees', 'Jesus warned them about the leaven of the Pharisees and Sadducees, meaning their teaching.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus warn his disciples to beware of in Matthew 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 16, 2, 'What misunderstanding did the disciples first have about Jesus'' warning concerning leaven?', '["They thought he was talking about bread", "They thought he meant temple incense", "They thought he meant baptismal water", "They thought he meant the Passover lamb"]'::jsonb, 'They thought he was talking about bread', 'The disciples reasoned among themselves that Jesus said this because they had brought no bread.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'What misunderstanding did the disciples first have about Jesus'' warning concerning leaven?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 16, 2, 'At what place did Peter make his confession in Matthew 16?', '["Caesarea Philippi", "Bethlehem", "Nazareth", "Jericho"]'::jsonb, 'Caesarea Philippi', 'Jesus asked his disciples who people said he was when they came into the region of Caesarea Philippi.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'At what place did Peter make his confession in Matthew 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 16, 2, 'What did Jesus say he would build on the rock?', '["His church", "A new temple", "A royal palace", "An altar of stone"]'::jsonb, 'His church', 'Jesus said, ''On this rock I will build my assembly,'' often rendered ''church.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say he would build on the rock?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 16, 2, 'What did Jesus begin to show his disciples must happen to him in Jerusalem?', '["He must suffer, be killed, and be raised the third day", "He must be crowned king immediately", "He must rebuild the temple", "He must flee to Egypt again"]'::jsonb, 'He must suffer, be killed, and be raised the third day', 'After Peter''s confession, Jesus began openly teaching about his coming suffering, death, and resurrection.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus begin to show his disciples must happen to him in Jerusalem?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 16, 3, 'What sign did Jesus say would be given to that evil and adulterous generation?', '["The sign of Jonah", "The sign of Moses", "The sign of Elijah''s fire", "The sign of David''s throne"]'::jsonb, 'The sign of Jonah', 'Jesus refused their demand for another sign and said only the sign of Jonah would be given.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'What sign did Jesus say would be given to that evil and adulterous generation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 16, 3, 'How did Jesus explain the ''leaven'' of the Pharisees and Sadducees?', '["It referred to their teaching", "It referred to unclean food", "It referred to Roman politics", "It referred to temple sacrifices"]'::jsonb, 'It referred to their teaching', 'The disciples finally understood that Jesus was warning them about the doctrine or teaching of those groups.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'How did Jesus explain the ''leaven'' of the Pharisees and Sadducees?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 16, 3, 'What did Jesus promise concerning the gates of Hades?', '["They would not prevail against his church", "They would open for the righteous immediately", "They would swallow Jerusalem first", "They would be rebuilt by Peter"]'::jsonb, 'They would not prevail against his church', 'Jesus promised that the gates of Hades would not overpower the assembly he would build.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did Jesus promise concerning the gates of Hades?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 16, 3, 'What did Jesus say a person gains if he wins the whole world but loses his life?', '["Nothing of lasting value", "Honor among men", "Authority over nations", "A crown in Jerusalem"]'::jsonb, 'Nothing of lasting value', 'Jesus asked what profit there is in gaining the whole world and forfeiting one''s soul or life.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did Jesus say a person gains if he wins the whole world but loses his life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 16, 4, 'What did Jesus say had revealed Peter''s confession to him?', '["The Father in heaven", "Moses and the prophets only", "His own reasoning alone", "The crowds of Galilee"]'::jsonb, 'The Father in heaven', 'Jesus told Peter that flesh and blood had not revealed this to him, but his Father in heaven.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'What did Jesus say had revealed Peter''s confession to him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 16, 4, 'What was Peter''s reaction when Jesus predicted his suffering and death?', '["He began rebuking Jesus", "He worshiped silently", "He asked for another parable", "He went back to fishing"]'::jsonb, 'He began rebuking Jesus', 'Peter took Jesus aside and rebuked him, saying this would never happen.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'What was Peter''s reaction when Jesus predicted his suffering and death?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 16, 4, 'How did Jesus respond to Peter''s rebuke?', '["Get behind me, Satan", "You speak wisely, Peter", "Ask James for counsel", "Keep this hidden from the others"]'::jsonb, 'Get behind me, Satan', 'Jesus sharply corrected Peter because he was setting his mind on human interests rather than God''s.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'How did Jesus respond to Peter''s rebuke?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 16, 4, 'What authority did Jesus say he would give Peter in language of keys and binding?', '["The keys of the Kingdom of Heaven", "The high priest''s breastplate", "The courts of the Gentiles", "The throne of David"]'::jsonb, 'The keys of the Kingdom of Heaven', 'Jesus told Peter he would give him the keys of the Kingdom, with binding and loosing language attached.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'What authority did Jesus say he would give Peter in language of keys and binding?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 16, 5, 'After Peter''s confession, what did Jesus strictly command the disciples not to tell anyone yet?', '["That he was Jesus the Christ", "That John had been executed", "That Rome would fall soon", "That the temple tax was unlawful"]'::jsonb, 'That he was Jesus the Christ', 'Jesus directed them not to publicize that he was the Messiah at that stage.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'After Peter''s confession, what did Jesus strictly command the disciples not to tell anyone yet?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 16, 5, 'What did Jesus say the Son of Man would do when he comes in the glory of his Father?', '["Repay each person according to his deeds", "Establish twelve bakeries for the poor", "Call only Israel to judgment", "Offer no more parables"]'::jsonb, 'Repay each person according to his deeds', 'Jesus taught that the Son of Man would come with his angels and render to each according to what he had done.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus say the Son of Man would do when he comes in the glory of his Father?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 16, 5, 'What did Jesus say some standing there would not do before seeing the Son of Man coming in his Kingdom?', '["Taste death", "Enter Jerusalem", "Go hungry", "Sleep again"]'::jsonb, 'Taste death', 'Jesus said some present would not taste death until they saw the Son of Man coming in his Kingdom.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus say some standing there would not do before seeing the Son of Man coming in his Kingdom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 16, 5, 'Why did Jesus remind the disciples about the five loaves and the seven loaves?', '["To show they should not have worried about literal bread", "To teach them baking for the crowds", "To explain temple offerings", "To appoint new deacons"]'::jsonb, 'To show they should not have worried about literal bread', 'He pointed to the feeding miracles so they would understand he was not warning them about ordinary bread shortages.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why did Jesus remind the disciples about the five loaves and the seven loaves?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 17, 1, 'Who was transfigured before Peter, James, and John in Matthew 17?', '["Jesus", "Moses", "Elijah", "John the Baptist"]'::jsonb, 'Jesus', 'Jesus was transfigured before the three disciples on the mountain.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who was transfigured before Peter, James, and John in Matthew 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 17, 1, 'Which two Old Testament figures appeared with Jesus at the transfiguration?', '["Moses and Elijah", "Abraham and Isaac", "David and Samuel", "Elisha and Isaiah"]'::jsonb, 'Moses and Elijah', 'Moses and Elijah appeared talking with Jesus on the mountain.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which two Old Testament figures appeared with Jesus at the transfiguration?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 17, 1, 'Whose son did Jesus heal after coming down from the mountain?', '["A man''s demon-oppressed son", "Jairus''s daughter", "A centurion''s servant", "Peter''s mother-in-law"]'::jsonb, 'A man''s demon-oppressed son', 'A father brought his afflicted son to Jesus after the disciples had been unable to heal him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'Whose son did Jesus heal after coming down from the mountain?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 17, 1, 'Where did the coin come from to pay the temple tax in Matthew 17?', '["From a fish''s mouth", "From Judas''s money bag", "From the temple treasury", "From under a fig tree"]'::jsonb, 'From a fish''s mouth', 'Jesus told Peter to catch a fish and find a coin in its mouth for the tax payment.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'Where did the coin come from to pay the temple tax in Matthew 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 17, 2, 'What did the voice from the bright cloud say about Jesus?', '["This is my beloved Son; listen to him", "This is my servant David", "This is Elijah returned", "This is the prophet like Moses only"]'::jsonb, 'This is my beloved Son; listen to him', 'The Father identified Jesus as his beloved Son and commanded the disciples to listen to him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the voice from the bright cloud say about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 17, 2, 'What did Peter suggest making on the mountain?', '["Three shelters", "A stone altar", "A fishing camp", "A royal throne"]'::jsonb, 'Three shelters', 'Peter proposed making three tents or shelters: one for Jesus, one for Moses, and one for Elijah.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Peter suggest making on the mountain?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 17, 2, 'What did Jesus say the disciples lacked when they could not cast out the demon?', '["Faith", "Compassion", "Knowledge of Greek", "Temple permission"]'::jsonb, 'Faith', 'Jesus connected their failure to little faith and then taught about faith like a mustard seed.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say the disciples lacked when they could not cast out the demon?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 17, 2, 'Where were Jesus and the disciples when the temple-tax collectors approached Peter?', '["Capernaum", "Jerusalem", "Bethlehem", "Tyre"]'::jsonb, 'Capernaum', 'The collectors of the didrachma tax came to Peter in Capernaum.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'Where were Jesus and the disciples when the temple-tax collectors approached Peter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 17, 3, 'What happened to Jesus'' face during the transfiguration?', '["It shone like the sun", "It became hidden by darkness", "It was covered with dust", "It turned away from the disciples"]'::jsonb, 'It shone like the sun', 'Matthew says Jesus'' face shone like the sun and his garments became white as the light.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'What happened to Jesus'' face during the transfiguration?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 17, 3, 'How did the disciples react when they heard the voice from the cloud?', '["They fell on their faces and were very afraid", "They ran to Jerusalem", "They argued with Peter", "They asked for bread"]'::jsonb, 'They fell on their faces and were very afraid', 'The voice terrified them, and they fell face down until Jesus touched them.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'How did the disciples react when they heard the voice from the cloud?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 17, 3, 'What did Jesus tell the three disciples not to report until after his resurrection?', '["The vision on the mountain", "The feeding of the five thousand", "The Sermon on the Mount", "The call of Matthew"]'::jsonb, 'The vision on the mountain', 'Jesus told them to tell no one the vision until the Son of Man had risen from the dead.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did Jesus tell the three disciples not to report until after his resurrection?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 17, 3, 'Whom did Jesus say had already come, though people did not recognize him?', '["Elijah, in the ministry of John the Baptist", "Moses returned from Sinai", "David restored to the throne", "Samuel in the temple"]'::jsonb, 'Elijah, in the ministry of John the Baptist', 'Jesus explained that Elijah had already come, and the disciples understood he was speaking of John the Baptist.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'Whom did Jesus say had already come, though people did not recognize him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 17, 4, 'What comparison did Jesus use to describe effective faith?', '["A mustard seed moving a mountain", "A cedar shaking the desert", "A lamp filling the temple", "A river flooding a city"]'::jsonb, 'A mustard seed moving a mountain', 'Jesus said faith as small as a mustard seed could tell a mountain to move, and it would move.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'What comparison did Jesus use to describe effective faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 17, 4, 'What did Jesus predict again while they were staying in Galilee?', '["The Son of Man would be delivered, killed, and raised on the third day", "Peter would become high priest", "Jerusalem would accept him immediately", "Rome would lose power that week"]'::jsonb, 'The Son of Man would be delivered, killed, and raised on the third day', 'Jesus again told the disciples about his coming betrayal, death, and resurrection.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'What did Jesus predict again while they were staying in Galilee?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 17, 4, 'Why did Jesus choose to pay the temple tax despite saying the sons are free?', '["So as not to cause them to stumble", "Because he owed Rome interest", "Because Peter had promised extra coins", "So the priests would crown him"]'::jsonb, 'So as not to cause them to stumble', 'Jesus said the sons are free, but they would pay in order not to offend or cause stumbling.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did Jesus choose to pay the temple tax despite saying the sons are free?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 17, 4, 'What did Jesus tell Peter to do in order to obtain the tax coin?', '["Cast a hook, take the first fish, and open its mouth", "Sell his fishing boat in Capernaum", "Borrow from Matthew the tax collector", "Ask the crowd for an offering"]'::jsonb, 'Cast a hook, take the first fish, and open its mouth', 'Jesus gave Peter specific instructions that led to the miraculous provision of the coin.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'What did Jesus tell Peter to do in order to obtain the tax coin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 17, 5, 'Who went up the high mountain with Jesus in Matthew 17?', '["Peter, James, and John", "Peter, Andrew, and Philip", "James, Matthew, and Thomas", "All twelve disciples"]'::jsonb, 'Peter, James, and John', 'Jesus took only Peter, James, and John up the mountain where he was transfigured.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who went up the high mountain with Jesus in Matthew 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 17, 5, 'What question did the disciples ask after the transfiguration about Elijah?', '["Why do the scribes say Elijah must come first?", "Why did Elijah refuse to stay?", "Why did Elijah not pay the temple tax?", "Why did Elijah appear without Elisha?"]'::jsonb, 'Why do the scribes say Elijah must come first?', 'The disciples asked about the scribal teaching concerning Elijah''s coming, and Jesus connected it to John the Baptist.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'What question did the disciples ask after the transfiguration about Elijah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 17, 5, 'How did Jesus describe the generation when the afflicted boy was brought to him?', '["Faithless and perverse", "Blessed and hungry", "Meek and lowly", "Wise and understanding"]'::jsonb, 'Faithless and perverse', 'Jesus lamented the unbelief around him by calling it a faithless and perverse generation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'How did Jesus describe the generation when the afflicted boy was brought to him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 17, 5, 'For whom did the coin from the fish''s mouth pay the tax?', '["For Jesus and Peter", "For all twelve disciples", "For Peter alone", "For Jesus'' family"]'::jsonb, 'For Jesus and Peter', 'Jesus told Peter to give the coin ''for me and you,'' covering both of them.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'For whom did the coin from the fish''s mouth pay the tax?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 18, 1, 'According to Matthew 18, who is greatest in the Kingdom of Heaven (One who becomes like a little child)?', '["One who becomes like a little child", "The richest disciple", "The chief priest", "The oldest apostle"]'::jsonb, 'One who becomes like a little child', 'Jesus placed a little child in their midst and taught that humility like a child marks greatness in the Kingdom.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Matthew 18, who is greatest in the Kingdom of Heaven (One who becomes like a little child)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 18, 1, 'How many times did Jesus tell Peter to forgive his brother?', '["Seventy times seven", "Three times", "Seven times only", "Twelve times"]'::jsonb, 'Seventy times seven', 'Jesus told Peter that forgiveness should not stop at seven times but extend seventy times seven.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'How many times did Jesus tell Peter to forgive his brother?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 18, 1, 'What animal did Jesus mention in the parable about the one that wandered away?', '["A sheep", "A camel", "A dove", "A goat"]'::jsonb, 'A sheep', 'Jesus described a shepherd leaving ninety-nine sheep to seek one that had gone astray.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'What animal did Jesus mention in the parable about the one that wandered away?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 18, 1, 'What object did Jesus say would be better tied around a person''s neck than causing little ones to stumble?', '["A millstone", "A bell", "A rope ladder", "A fig branch"]'::jsonb, 'A millstone', 'Jesus said it would be better to have a great millstone hung around one''s neck than to cause one of these little ones to stumble.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'What object did Jesus say would be better tied around a person''s neck than causing little ones to stumble?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 18, 2, 'What did Jesus say to do first if your brother sins against you?', '["Go and show him his fault in private", "Take him directly to the governor", "Announce it to the whole assembly", "Refuse to speak to him again"]'::jsonb, 'Go and show him his fault in private', 'The first step in Matthew 18 discipline is a private conversation aimed at gaining your brother.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say to do first if your brother sins against you?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 18, 2, 'If the brother will not listen privately, what is the next step in Matthew 18?', '["Take one or two more with you", "Expel him immediately", "Write to Rome", "Offer a sacrifice for him"]'::jsonb, 'Take one or two more with you', 'Jesus instructed the offended person to return with one or two others so every word may be established.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'If the brother will not listen privately, what is the next step in Matthew 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 18, 2, 'What did Jesus say to do if a hand or foot causes you to stumble?', '["Cut it off and cast it from you", "Hide it under a garment", "Wash it in the Jordan", "Bind it with a rope"]'::jsonb, 'Cut it off and cast it from you', 'Jesus used severe imagery to stress the seriousness of dealing with sin.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say to do if a hand or foot causes you to stumble?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 18, 2, 'What did the king first do for the servant with the huge debt?', '["He forgave the debt", "He increased the debt", "He sent him to Rome", "He made him governor"]'::jsonb, 'He forgave the debt', 'In the parable, the lord had compassion and forgave the servant''s enormous debt.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the king first do for the servant with the huge debt?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 18, 3, 'How does Matthew 18 describe the Father''s concern for little ones?', '["Their angels always see the Father''s face", "They need no instruction", "They will never wander away", "They rule the nations already"]'::jsonb, 'Their angels always see the Father''s face', 'Jesus said that the angels of these little ones continually behold the face of his Father in heaven.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Matthew 18 describe the Father''s concern for little ones?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 18, 3, 'If a sinning brother refuses to hear even the assembly, how should he be treated?', '["As a Gentile and a tax collector", "As a priest in training", "As a king''s son", "As one already glorified"]'::jsonb, 'As a Gentile and a tax collector', 'Persistent refusal to listen even to the church results in treatment as an outsider.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'If a sinning brother refuses to hear even the assembly, how should he be treated?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 18, 3, 'What promise did Jesus give when two agree on earth concerning what they ask?', '["It will be done by the Father in heaven", "They will never suffer again", "They will rule over angels", "They will see the temple rebuilt at once"]'::jsonb, 'It will be done by the Father in heaven', 'Jesus promised the Father''s response in the context of gathered agreement and discipline.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'What promise did Jesus give when two agree on earth concerning what they ask?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 18, 3, 'What did the unforgiving servant do to his fellow servant who owed him much less?', '["He seized him and demanded payment", "He forgave him immediately", "He invited him to a feast", "He paid his debt himself"]'::jsonb, 'He seized him and demanded payment', 'Though he had been forgiven a huge debt, he grabbed his fellow servant and demanded repayment.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did the unforgiving servant do to his fellow servant who owed him much less?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 18, 4, 'What comparison did Jesus make about entering life versus being cast into eternal fire?', '["Better to enter maimed than with two hands or feet be cast into eternal fire", "Better to be rich and blind than poor and whole", "Better to lose a coin than a sheep", "Better to flee to Egypt than Jerusalem"]'::jsonb, 'Better to enter maimed than with two hands or feet be cast into eternal fire', 'Jesus used strong comparisons to show the radical seriousness of dealing with sin that causes stumbling.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'What comparison did Jesus make about entering life versus being cast into eternal fire?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 18, 4, 'How did the lord respond when he learned of the servant''s refusal to forgive?', '["He delivered him to the tormentors until he should pay all", "He forgave him again without warning", "He promoted him over other servants", "He sent him back to his village"]'::jsonb, 'He delivered him to the tormentors until he should pay all', 'The master called him wicked and handed him over in judgment because he had shown no mercy.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'How did the lord respond when he learned of the servant''s refusal to forgive?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 18, 4, 'What does the parable of the wandering sheep show about the Father''s will?', '["He does not want one of these little ones to perish", "He prefers the ninety-nine over the one", "He values flocks only by size", "He saves only the strongest sheep"]'::jsonb, 'He does not want one of these little ones to perish', 'Jesus concluded that it is not the Father''s will that one of these little ones should perish.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does the parable of the wandering sheep show about the Father''s will?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 18, 4, 'What authority did Jesus describe with the phrase ''bind on earth'' and ''loose on earth''?', '["A heaven-backed authority exercised among his gathered people", "A Roman legal code", "The right to collect temple taxes", "Power to command the weather"]'::jsonb, 'A heaven-backed authority exercised among his gathered people', 'Jesus used binding and loosing language in the context of church discipline and agreement before God.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'What authority did Jesus describe with the phrase ''bind on earth'' and ''loose on earth''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 18, 5, 'What question prompted Jesus'' teaching on repeated forgiveness?', '["Peter asked how often he should forgive a sinning brother", "James asked who would sit at Jesus'' right hand", "John asked when the Kingdom would appear", "Matthew asked about fasting rules"]'::jsonb, 'Peter asked how often he should forgive a sinning brother', 'Peter asked whether forgiving seven times was enough, and Jesus expanded the answer far beyond that.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'What question prompted Jesus'' teaching on repeated forgiveness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 18, 5, 'What were the disciples arguing about at the beginning of Matthew 18?', '["Who is greatest in the Kingdom of Heaven", "Who should pay the temple tax", "Who will betray Jesus", "Who feeds the crowds"]'::jsonb, 'Who is greatest in the Kingdom of Heaven', 'Their question about greatness led Jesus to teach humility using a little child.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'What were the disciples arguing about at the beginning of Matthew 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 18, 5, 'What did Jesus say about his presence when two or three are gathered in his name?', '["He is there among them", "He sends only angels instead", "He remains only in the temple", "He speaks only through dreams"]'::jsonb, 'He is there among them', 'Jesus promised his presence among those gathered in his name.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus say about his presence when two or three are gathered in his name?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 18, 5, 'What should happen if the private and small-group appeals succeed?', '["You have gained your brother", "The case must still go before all", "A written certificate is required", "The offender must leave the city"]'::jsonb, 'You have gained your brother', 'The goal of the process is restoration, and Jesus says that listening means you have gained your brother.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'What should happen if the private and small-group appeals succeed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 19, 1, 'In Matthew 19, who came to Jesus asking whether it was lawful to divorce a wife for every reason?', '["Pharisees", "Sadducees", "Romans", "Samaritans"]'::jsonb, 'Pharisees', 'The Pharisees came testing Jesus with a question about divorce.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'In Matthew 19, who came to Jesus asking whether it was lawful to divorce a wife for every reason?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 19, 1, 'Who did Jesus say should be allowed to come to him in Matthew 19?', '["Little children", "Only priests", "Only the Twelve", "Only the poor"]'::jsonb, 'Little children', 'Jesus told the disciples to let the little children come to him and not forbid them.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who did Jesus say should be allowed to come to him in Matthew 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 19, 1, 'What kind of man came asking Jesus what good thing he must do to have eternal life?', '["A rich young man", "A blind beggar", "A Roman soldier", "A fisherman"]'::jsonb, 'A rich young man', 'Matthew 19 records the rich young ruler asking about eternal life.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'What kind of man came asking Jesus what good thing he must do to have eternal life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 19, 1, 'What animal did Jesus mention when describing how hard it is for a rich person to enter the Kingdom?', '["A camel", "A horse", "A lamb", "A lion"]'::jsonb, 'A camel', 'Jesus compared it to a camel going through the eye of a needle.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'What animal did Jesus mention when describing how hard it is for a rich person to enter the Kingdom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 19, 2, 'What did Jesus say the Creator made in the beginning?', '["Male and female", "Priests and Levites", "Kings and prophets", "Jews and Gentiles"]'::jsonb, 'Male and female', 'Jesus cited Genesis, saying the Creator made them male and female from the beginning.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say the Creator made in the beginning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 19, 2, 'Why did Moses allow certificates of divorce according to Jesus?', '["Because of hardness of heart", "Because marriage had ended", "Because the temple commanded it", "Because Rome required it"]'::jsonb, 'Because of hardness of heart', 'Jesus said Moses permitted divorce because of human hardness of heart, but it was not so from the beginning.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why did Moses allow certificates of divorce according to Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 19, 2, 'What did Jesus do when little children were brought to him?', '["He laid his hands on them", "He sent them away", "He tested them with questions", "He gave them coins"]'::jsonb, 'He laid his hands on them', 'Jesus blessed the children by laying his hands on them.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus do when little children were brought to him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 19, 2, 'What was the rich young man''s reaction when Jesus told him to sell his possessions and follow?', '["He went away sorrowful", "He obeyed immediately", "He laughed at the command", "He asked for more witnesses"]'::jsonb, 'He went away sorrowful', 'He went away grieving because he had many possessions.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was the rich young man''s reaction when Jesus told him to sell his possessions and follow?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 19, 3, 'What reason did Jesus give as the exception in his teaching on divorce?', '["Sexual immorality", "Poverty", "Childlessness", "Travel"]'::jsonb, 'Sexual immorality', 'Jesus said that divorcing a wife and marrying another is adultery except in the case of sexual immorality.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'What reason did Jesus give as the exception in his teaching on divorce?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 19, 3, 'How did the disciples react to Jesus'' teaching about marriage?', '["They said it might be better not to marry", "They asked for a wedding feast", "They wanted to become judges", "They returned to Galilee at once"]'::jsonb, 'They said it might be better not to marry', 'The disciples thought the strictness of the marriage bond made singleness seem preferable.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'How did the disciples react to Jesus'' teaching about marriage?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 19, 3, 'Which commandments did Jesus mention to the rich young man?', '["Do not murder, commit adultery, steal, bear false witness; honor your father and mother; love your neighbor", "Remember the Sabbath, build an altar, and wear tassels", "Keep the feast of booths and offer incense daily", "Fast twice a week and avoid Gentiles"]'::jsonb, 'Do not murder, commit adultery, steal, bear false witness; honor your father and mother; love your neighbor', 'Jesus listed commandments from the law and included loving one''s neighbor as oneself.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which commandments did Jesus mention to the rich young man?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 19, 3, 'What did Jesus say is impossible with men but possible with God?', '["Salvation", "Crossing the sea on foot", "Finding money in a fish", "Building the temple"]'::jsonb, 'Salvation', 'When the disciples asked who could be saved, Jesus answered that with men it is impossible, but with God all things are possible.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did Jesus say is impossible with men but possible with God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 19, 4, 'What did Jesus say happens when a man and woman are joined in marriage?', '["The two become one flesh", "They become like angels", "They must leave all possessions", "They enter the priesthood"]'::jsonb, 'The two become one flesh', 'Jesus quoted Genesis to show the permanence and unity of marriage.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'What did Jesus say happens when a man and woman are joined in marriage?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 19, 4, 'What question did Peter ask after the rich young man left?', '["What then will we have, since we left everything?", "Who will betray you?", "Will Israel destroy Rome?", "Can we call down fire now?"]'::jsonb, 'What then will we have, since we left everything?', 'Peter contrasted the disciples'' sacrifice with the rich man''s refusal and asked what their reward would be.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'What question did Peter ask after the rich young man left?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 19, 4, 'What future role did Jesus promise the twelve in the renewal?', '["They would sit on twelve thrones judging the twelve tribes of Israel", "They would rebuild the temple stones", "They would become kings over Rome", "They would each receive a separate kingdom in Galilee"]'::jsonb, 'They would sit on twelve thrones judging the twelve tribes of Israel', 'Jesus promised a place of honor and judgment for the twelve in the regeneration.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'What future role did Jesus promise the twelve in the renewal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 19, 4, 'What general reversal did Jesus announce at the chapter''s end?', '["Many who are first will be last, and the last first", "The poor will become priests immediately", "The children will replace the apostles", "Jerusalem will become Egypt"]'::jsonb, 'Many who are first will be last, and the last first', 'Jesus closed the chapter with a warning that human rankings are often reversed in God''s Kingdom.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'What general reversal did Jesus announce at the chapter''s end?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 19, 5, 'What did Jesus say about eunuchs in Matthew 19?', '["Some are born so, some made so by men, and some made themselves so for the Kingdom", "All must become so to be saved", "None can understand the saying", "They alone may judge Israel"]'::jsonb, 'Some are born so, some made so by men, and some made themselves so for the Kingdom', 'Jesus described three kinds of eunuchs and said the one able to receive the saying should receive it.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus say about eunuchs in Matthew 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 19, 5, 'Why were the little children brought to Jesus according to Matthew 19?', '["So he might lay his hands on them and pray", "So he could teach them to fish", "So they could testify against Pharisees", "So he might send them into villages"]'::jsonb, 'So he might lay his hands on them and pray', 'The children were brought so Jesus would place his hands on them and pray for them.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why were the little children brought to Jesus according to Matthew 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 19, 5, 'What did Jesus tell the rich young man he still lacked?', '["Sell his possessions, give to the poor, and follow Jesus", "A place in the synagogue", "Knowledge of the prophets", "Baptism in the Jordan"]'::jsonb, 'Sell his possessions, give to the poor, and follow Jesus', 'Jesus exposed the man''s heart by calling him to surrender wealth, give to the poor, and follow him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus tell the rich young man he still lacked?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 19, 5, 'What reward did Jesus promise to everyone who left houses or family for his name''s sake?', '["They will receive many times more and inherit eternal life", "They will avoid every earthly trial", "They will never die physically", "They will rule from Jerusalem immediately"]'::jsonb, 'They will receive many times more and inherit eternal life', 'Jesus promised abundant reward and eternal life to those who sacrifice for his name.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'What reward did Jesus promise to everyone who left houses or family for his name''s sake?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 20, 1, 'In Matthew 20, what kind of workers are featured in Jesus'' parable?', '["Vineyard laborers", "Fishermen", "Temple guards", "Shepherds"]'::jsonb, 'Vineyard laborers', 'Jesus told a parable about laborers hired at different hours to work in a vineyard.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'In Matthew 20, what kind of workers are featured in Jesus'' parable?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 20, 1, 'Who asked for seats at Jesus'' right and left hand for her sons?', '["The mother of the sons of Zebedee", "Mary Magdalene", "Martha of Bethany", "Herodias"]'::jsonb, 'The mother of the sons of Zebedee', 'The mother of James and John came with her sons asking for places of honor in the Kingdom.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who asked for seats at Jesus'' right and left hand for her sons?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 20, 1, 'How many blind men cried out to Jesus as he left Jericho in Matthew 20?', '["Two", "One", "Three", "Twelve"]'::jsonb, 'Two', 'Matthew records two blind men sitting by the road who cried out for mercy.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'How many blind men cried out to Jesus as he left Jericho in Matthew 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 20, 1, 'What title did the blind men use for Jesus in Matthew 20?', '["Lord, Son of David", "Rabbi of Galilee", "King of Rome", "Prophet of Nazareth"]'::jsonb, 'Lord, Son of David', 'The blind men cried, ''Have mercy on us, Lord, Son of David!'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'What title did the blind men use for Jesus in Matthew 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 20, 2, 'What was the usual daily wage agreed on in the vineyard parable?', '["A denarius", "Two denarii", "A talent", "Five loaves"]'::jsonb, 'A denarius', 'The landowner agreed with the first workers for a denarius for the day.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was the usual daily wage agreed on in the vineyard parable?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 20, 2, 'What did Jesus predict again on the way up to Jerusalem?', '["His suffering, death, and resurrection", "The rebuilding of the temple that day", "The fall of Rome within a week", "A famine in Galilee"]'::jsonb, 'His suffering, death, and resurrection', 'Jesus again told the twelve that he would be condemned, mocked, crucified, and raised the third day.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus predict again on the way up to Jerusalem?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 20, 2, 'How did Jesus say greatness is shown among his disciples?', '["By serving others", "By collecting taxes", "By gaining political office", "By speaking the loudest"]'::jsonb, 'By serving others', 'Jesus said whoever wants to become great must be a servant.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'How did Jesus say greatness is shown among his disciples?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 20, 2, 'What did Jesus do for the blind men near Jericho?', '["He healed their eyes", "He gave them money", "He sent them to the priests", "He told them to wait in Jerusalem"]'::jsonb, 'He healed their eyes', 'Jesus touched their eyes, and immediately they received sight and followed him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus do for the blind men near Jericho?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 20, 3, 'Why did the workers hired first grumble at the end of the day?', '["Those hired later received the same pay", "They were sent away early", "They got no food", "They had to work in the rain"]'::jsonb, 'Those hired later received the same pay', 'They complained because the late workers were made equal to them in pay.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why did the workers hired first grumble at the end of the day?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 20, 3, 'What cup did Jesus ask James and John about?', '["The cup of suffering he was about to drink", "The cup of temple incense", "The Passover cup from childhood", "The cup used by Pilate"]'::jsonb, 'The cup of suffering he was about to drink', 'Jesus asked whether they were able to drink the cup he was about to drink, referring to suffering.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'What cup did Jesus ask James and John about?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 20, 3, 'What did Jesus say the Son of Man came to do?', '["Serve and give his life as a ransom for many", "Rule by force over the nations", "Call down angels to destroy Rome", "Take the throne of Herod immediately"]'::jsonb, 'Serve and give his life as a ransom for many', 'Jesus contrasted worldly rulers with his own mission of service and sacrificial redemption.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did Jesus say the Son of Man came to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 20, 3, 'How did the crowd respond to the blind men crying out?', '["They rebuked them and told them to be quiet", "They praised them as prophets", "They carried them to Jesus", "They asked them to lead the way"]'::jsonb, 'They rebuked them and told them to be quiet', 'The crowd tried to silence them, but they cried out even more loudly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'How did the crowd respond to the blind men crying out?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 20, 4, 'What reason did the landowner give for paying the late workers generously?', '["He chose to be generous with what was his", "He had made a mistake in counting", "He feared the governor", "He disliked the early workers"]'::jsonb, 'He chose to be generous with what was his', 'The master defended his generosity by saying he was free to do what he wanted with his own money.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'What reason did the landowner give for paying the late workers generously?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 20, 4, 'To whom did Jesus say the places at his right and left belong?', '["Those for whom they have been prepared by the Father", "Whoever asks first", "Only Peter and John", "The rulers of the Gentiles"]'::jsonb, 'Those for whom they have been prepared by the Father', 'Jesus said those places were not his to grant arbitrarily but belonged to those prepared by the Father.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'To whom did Jesus say the places at his right and left belong?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 20, 4, 'How did the other ten disciples react to the request of Zebedee''s sons?', '["They were indignant", "They celebrated it", "They left Jesus immediately", "They asked for wages"]'::jsonb, 'They were indignant', 'The ten became angry with the two brothers over their request for honor.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'How did the other ten disciples react to the request of Zebedee''s sons?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 20, 4, 'What contrast did Jesus draw between Gentile rulers and his followers?', '["Gentile rulers lord it over others, but his followers must serve", "Gentile rulers fast more, but disciples eat freely", "Gentile rulers stay in cities, but disciples stay in deserts", "Gentile rulers study law, but disciples ignore it"]'::jsonb, 'Gentile rulers lord it over others, but his followers must serve', 'Jesus rejected power-seeking leadership and redefined greatness as humble service.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'What contrast did Jesus draw between Gentile rulers and his followers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 20, 5, 'What proverb-like statement frames both the vineyard parable and the chapter''s theme of reversal?', '["The last will be first, and the first last", "Blessed are the meek", "A prophet is not without honor", "Many are called from the east and west"]'::jsonb, 'The last will be first, and the first last', 'The parable highlights God''s surprising reversals, echoing Jesus'' saying about the last and the first.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'What proverb-like statement frames both the vineyard parable and the chapter''s theme of reversal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 20, 5, 'What exactly did the blind men ask Jesus to do for them?', '["Have mercy on us and open our eyes", "Make us sit at your right hand", "Give us bread for the road", "Lead us to the temple"]'::jsonb, 'Have mercy on us and open our eyes', 'When Jesus asked what they wanted, they requested that their eyes be opened.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'What exactly did the blind men ask Jesus to do for them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 20, 5, 'How did the healed blind men respond after receiving sight?', '["They followed Jesus", "They returned to Jericho only", "They went to Rome", "They became tax collectors"]'::jsonb, 'They followed Jesus', 'After Jesus healed them, the two blind men followed him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'How did the healed blind men respond after receiving sight?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 20, 5, 'What did Jesus say his followers should become if they want to be first?', '["Servants and slaves of others", "Teachers of the law only", "Wealthy landowners", "Captains over armies"]'::jsonb, 'Servants and slaves of others', 'Jesus said whoever wants to be first among his disciples must become a servant, even a slave, to others.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus say his followers should become if they want to be first?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 21, 1, 'What animal did Jesus ride into Jerusalem in Matthew 21 (A donkey)?', '["A donkey", "A horse", "A camel", "A mule cart"]'::jsonb, 'A donkey', 'Jesus entered Jerusalem riding on a donkey, fulfilling prophecy.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'What animal did Jesus ride into Jerusalem in Matthew 21 (A donkey)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 21, 1, 'What did the crowds cry out as Jesus entered Jerusalem?', '["Hosanna to the Son of David", "Long live Caesar", "Blessed is Herod", "Glory to the temple tax"]'::jsonb, 'Hosanna to the Son of David', 'The crowds shouted ''Hosanna to the Son of David'' as Jesus entered the city.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the crowds cry out as Jesus entered Jerusalem?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 21, 1, 'What did Jesus do in the temple after entering Jerusalem?', '["He drove out the buyers and sellers", "He paid the guards", "He built a new altar", "He hid from the priests"]'::jsonb, 'He drove out the buyers and sellers', 'Jesus cleansed the temple by driving out those buying and selling there.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus do in the temple after entering Jerusalem?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 21, 1, 'What happened to the fig tree that Jesus cursed?', '["It withered at once", "It bore fruit immediately", "It was struck by lightning", "It fell into the sea"]'::jsonb, 'It withered at once', 'The fig tree withered after Jesus pronounced judgment on it.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'What happened to the fig tree that Jesus cursed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 21, 2, 'What prophecy did Jesus'' entry on a donkey fulfill?', '["Behold, your King comes to you humble and riding on a donkey", "Out of Egypt I called my son", "The stone the builders rejected", "Rachel weeping for her children"]'::jsonb, 'Behold, your King comes to you humble and riding on a donkey', 'Matthew links the triumphal entry to Zechariah''s prophecy of Zion''s king coming humbly on a donkey.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'What prophecy did Jesus'' entry on a donkey fulfill?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 21, 2, 'What did Jesus call the temple when rebuking its corruption?', '["A house of prayer", "A fortress of Israel", "A school of prophets", "A royal court"]'::jsonb, 'A house of prayer', 'Jesus said God''s house should be called a house of prayer, not a den of robbers.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus call the temple when rebuking its corruption?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 21, 2, 'Who was healed in the temple after Jesus drove out the sellers?', '["The blind and the lame", "Only lepers", "Only children", "Only priests"]'::jsonb, 'The blind and the lame', 'After cleansing the temple, Jesus healed the blind and the lame who came to him there.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'Who was healed in the temple after Jesus drove out the sellers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 21, 2, 'When the chief priests asked Jesus by what authority he acted, what question did he ask them in return?', '["Whether John''s baptism was from heaven or from men", "Whether Caesar should receive taxes", "Whether David wrote the Psalms", "Whether Elijah had already come"]'::jsonb, 'Whether John''s baptism was from heaven or from men', 'Jesus answered their question with one about the origin of John''s baptism.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'When the chief priests asked Jesus by what authority he acted, what question did he ask them in return?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 21, 3, 'What lesson did Jesus connect to the withered fig tree?', '["Faith without doubting can accomplish what seems impossible", "Israel should plant more orchards", "Jerusalem must avoid all figs", "The temple will soon produce fruit"]'::jsonb, 'Faith without doubting can accomplish what seems impossible', 'Jesus used the withered fig tree to teach about believing prayer and mountain-moving faith.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'What lesson did Jesus connect to the withered fig tree?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 21, 3, 'In the parable of the two sons, which son did the will of his father?', '["The one who first said no but later went", "The one who politely said yes but never went", "Both sons equally", "Neither son"]'::jsonb, 'The one who first said no but later went', 'The son who repented and obeyed did the father''s will.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'In the parable of the two sons, which son did the will of his father?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 21, 3, 'What did the tenants do to the vineyard owner''s son?', '["They killed him", "They crowned him", "They paid him rent", "They hid him in the tower"]'::jsonb, 'They killed him', 'In the parable, the tenants cast the son out of the vineyard and killed him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did the tenants do to the vineyard owner''s son?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 21, 3, 'What stone quotation did Jesus apply to himself in Matthew 21?', '["The stone which the builders rejected has become the cornerstone", "The Lord is my shepherd", "I desire mercy and not sacrifice", "Out of the mouths of infants"]'::jsonb, 'The stone which the builders rejected has become the cornerstone', 'Jesus quoted Psalm 118 about the rejected stone becoming the cornerstone.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'What stone quotation did Jesus apply to himself in Matthew 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 21, 4, 'What answer did the chief priests and elders give to Jesus about John''s baptism?', '["They said, ''We don''t know''", "They said, ''From heaven''", "They said, ''From men''", "They refused to speak at all"]'::jsonb, 'They said, ''We don''t know''', 'Fearing the crowd and unwilling to admit the truth, they answered that they did not know.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'What answer did the chief priests and elders give to Jesus about John''s baptism?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 21, 4, 'Who did Jesus say would enter the Kingdom of God before the religious leaders?', '["Tax collectors and prostitutes who believed John", "Roman governors and soldiers", "Only the rich young rulers", "The scribes from Babylon"]'::jsonb, 'Tax collectors and prostitutes who believed John', 'Jesus said repentant outcasts were entering before leaders who rejected John''s message.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'Who did Jesus say would enter the Kingdom of God before the religious leaders?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 21, 4, 'What would happen to the Kingdom according to Jesus'' conclusion to the tenants parable?', '["It would be taken from those leaders and given to a people producing its fruit", "It would be abolished completely", "It would pass only to Rome", "It would remain hidden until after the temple was rebuilt"]'::jsonb, 'It would be taken from those leaders and given to a people producing its fruit', 'Jesus warned that the Kingdom would be taken from unfruitful leaders and given to others who bear fruit.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'What would happen to the Kingdom according to Jesus'' conclusion to the tenants parable?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 21, 4, 'How did the leaders react when they realized Jesus had spoken the parables against them?', '["They wanted to arrest him but feared the crowds", "They repented immediately", "They invited him to teach in the council", "They crowned him in the temple"]'::jsonb, 'They wanted to arrest him but feared the crowds', 'The leaders understood he meant them, but fear of the people restrained them.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'How did the leaders react when they realized Jesus had spoken the parables against them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 21, 5, 'What did the children cry out in the temple that angered the chief priests and scribes?', '["Hosanna to the Son of David", "Blessed is Caesar", "Glory to Herod''s house", "Down with the prophets"]'::jsonb, 'Hosanna to the Son of David', 'Children continued proclaiming Jesus as David''s Son in the temple, provoking the leaders.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did the children cry out in the temple that angered the chief priests and scribes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 21, 5, 'What Scripture did Jesus quote when defending the praise of the children?', '["Out of the mouth of infants and nursing babies you have perfected praise", "The just shall live by faith", "The Lord is one", "I will open my mouth in parables"]'::jsonb, 'Out of the mouth of infants and nursing babies you have perfected praise', 'Jesus appealed to Scripture to justify the children''s praise.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'What Scripture did Jesus quote when defending the praise of the children?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 21, 5, 'Where did Jesus stay after leaving the city that evening?', '["Bethany", "Nazareth", "Jericho", "Capernaum"]'::jsonb, 'Bethany', 'Jesus left the city and lodged in Bethany.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'Where did Jesus stay after leaving the city that evening?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 21, 5, 'What did Jesus say is necessary for receiving what you ask in prayer?', '["Believing", "Traveling to Jerusalem", "Fasting forty days first", "Paying temple taxes"]'::jsonb, 'Believing', 'Jesus taught that if they believed, they would receive whatever they asked in prayer.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus say is necessary for receiving what you ask in prayer?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 22, 1, 'In Matthew 22, what event is the kingdom compared to in the parable?', '["A wedding feast for a king''s son", "A harvest in Galilee", "A fishing expedition", "A temple dedication"]'::jsonb, 'A wedding feast for a king''s son', 'Jesus compared the Kingdom of Heaven to a king who gave a wedding feast for his son.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 22
    AND q.difficulty_stage = 1
    AND q.prompt = 'In Matthew 22, what event is the kingdom compared to in the parable?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 22, 1, 'What did Jesus say should be rendered to Caesar?', '["The things that are Caesar''s", "The temple sacrifices", "Only the poor''s alms", "The vineyard wages"]'::jsonb, 'The things that are Caesar''s', 'Jesus said to render to Caesar what belongs to Caesar, and to God what belongs to God.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 22
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say should be rendered to Caesar?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 22, 1, 'Which group questioned Jesus about the resurrection in Matthew 22?', '["Sadducees", "Pharisees", "Essenes", "Zealots"]'::jsonb, 'Sadducees', 'The Sadducees, who deny the resurrection, posed the question about the woman with seven husbands.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 22
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which group questioned Jesus about the resurrection in Matthew 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 22, 1, 'What commandment did Jesus call the great and first commandment?', '["Love the Lord your God with all your heart, soul, and mind", "Honor your father and mother", "Remember the Sabbath day", "Do not steal"]'::jsonb, 'Love the Lord your God with all your heart, soul, and mind', 'Jesus said the greatest commandment is wholehearted love for God.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 22
    AND q.difficulty_stage = 1
    AND q.prompt = 'What commandment did Jesus call the great and first commandment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 22, 2, 'What happened to the invited guests in the wedding feast parable?', '["Many refused to come and some mistreated the king''s servants", "They all arrived on time", "They paid the wedding expenses", "They crowned the bridegroom"]'::jsonb, 'Many refused to come and some mistreated the king''s servants', 'Those first invited would not come, and some seized and killed the servants.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 22
    AND q.difficulty_stage = 2
    AND q.prompt = 'What happened to the invited guests in the wedding feast parable?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 22, 2, 'What image on the coin did Jesus ask about in the tax question?', '["Caesar''s image and inscription", "Moses'' face", "Herod''s palace", "The temple veil"]'::jsonb, 'Caesar''s image and inscription', 'Jesus asked whose image and inscription were on the tribute coin.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 22
    AND q.difficulty_stage = 2
    AND q.prompt = 'What image on the coin did Jesus ask about in the tax question?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 22, 2, 'What did Jesus say people are like in the resurrection?', '["Like angels in heaven, not marrying", "Like kings on earth, marrying many", "Like children in Nazareth", "Like priests in the temple"]'::jsonb, 'Like angels in heaven, not marrying', 'Jesus corrected the Sadducees by saying that in the resurrection people neither marry nor are given in marriage.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 22
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say people are like in the resurrection?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 22, 2, 'What is the second commandment like the first, according to Jesus?', '["Love your neighbor as yourself", "Honor the Sabbath and the feasts", "Give tithes of all you own", "Fast twice each week"]'::jsonb, 'Love your neighbor as yourself', 'Jesus paired love of neighbor with love of God as the second great commandment.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 22
    AND q.difficulty_stage = 2
    AND q.prompt = 'What is the second commandment like the first, according to Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 22, 3, 'What happened to the man found without a wedding garment?', '["He was bound and cast into outer darkness", "He was seated near the king", "He was made a servant at the table", "He was told to return later"]'::jsonb, 'He was bound and cast into outer darkness', 'The unprepared guest was expelled, showing that invitation alone is not enough.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 22
    AND q.difficulty_stage = 3
    AND q.prompt = 'What happened to the man found without a wedding garment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 22, 3, 'How did Jesus describe the Sadducees'' error?', '["They knew neither the Scriptures nor the power of God", "They spoke too softly", "They had forgotten the temple tax", "They had traveled from the wrong city"]'::jsonb, 'They knew neither the Scriptures nor the power of God', 'Jesus rebuked the Sadducees for misunderstanding both Scripture and God''s power.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 22
    AND q.difficulty_stage = 3
    AND q.prompt = 'How did Jesus describe the Sadducees'' error?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 22, 3, 'From which passage did Jesus argue for the resurrection?', '["I am the God of Abraham, Isaac, and Jacob", "The Lord is my shepherd", "Out of Egypt I called my son", "The just shall live by faith"]'::jsonb, 'I am the God of Abraham, Isaac, and Jacob', 'Jesus used God''s present-tense declaration to Moses to show that God is not the God of the dead but of the living.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 22
    AND q.difficulty_stage = 3
    AND q.prompt = 'From which passage did Jesus argue for the resurrection?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 22, 3, 'What question did Jesus ask the Pharisees about the Christ?', '["Whose son is he?", "Where was he born?", "How much tax should he pay?", "Which school trained him?"]'::jsonb, 'Whose son is he?', 'Jesus asked what they thought about the Christ and whose son he is.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 22
    AND q.difficulty_stage = 3
    AND q.prompt = 'What question did Jesus ask the Pharisees about the Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 22, 4, 'What did the king do after the invited guests rejected the wedding feast?', '["He sent servants to gather others from the highways", "He canceled the wedding", "He fled to Egypt", "He gave the feast only to priests"]'::jsonb, 'He sent servants to gather others from the highways', 'The king opened the invitation broadly and filled the hall with guests gathered from the roads.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 22
    AND q.difficulty_stage = 4
    AND q.prompt = 'What did the king do after the invited guests rejected the wedding feast?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 22, 4, 'Why were the Pharisees amazed after Jesus answered about taxes?', '["His answer escaped their trap with wisdom", "He handed them a miracle coin", "He rebuked Caesar by name", "He refused to speak at all"]'::jsonb, 'His answer escaped their trap with wisdom', 'Jesus'' reply avoided the political trap and exposed their insincerity.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 22
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why were the Pharisees amazed after Jesus answered about taxes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 22, 4, 'What summary did Jesus give about the whole law and the prophets?', '["They hang on the commandments to love God and neighbor", "They can be ignored if you are sincere", "They concern only temple ceremonies", "They are fulfilled by paying taxes"]'::jsonb, 'They hang on the commandments to love God and neighbor', 'Jesus summarized the law and the prophets under the twin commands of love for God and neighbor.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 22
    AND q.difficulty_stage = 4
    AND q.prompt = 'What summary did Jesus give about the whole law and the prophets?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 22, 4, 'What Psalm did Jesus cite in asking how David''s son can also be David''s Lord?', '["Psalm 110", "Psalm 23", "Psalm 51", "Psalm 1"]'::jsonb, 'Psalm 110', 'Jesus quoted, ''The Lord said to my Lord,'' from Psalm 110.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 22
    AND q.difficulty_stage = 4
    AND q.prompt = 'What Psalm did Jesus cite in asking how David''s son can also be David''s Lord?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 22, 5, 'What closing statement does Jesus make at the end of the wedding feast parable?', '["Many are called, but few chosen", "Seek and you will find", "The meek shall inherit the earth", "Blessed are the pure in heart"]'::jsonb, 'Many are called, but few chosen', 'Jesus concluded the parable with the warning that many are invited, but few are chosen.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 22
    AND q.difficulty_stage = 5
    AND q.prompt = 'What closing statement does Jesus make at the end of the wedding feast parable?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 22, 5, 'How did the crowds react to Jesus'' teaching on the resurrection?', '["They were astonished at his teaching", "They all left him at once", "They stoned the Sadducees", "They demanded another sign"]'::jsonb, 'They were astonished at his teaching', 'The crowds were astonished by Jesus'' authoritative answer.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 22
    AND q.difficulty_stage = 5
    AND q.prompt = 'How did the crowds react to Jesus'' teaching on the resurrection?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 22, 5, 'After Jesus asked about David''s Lord, what could the Pharisees do?', '["They could not answer him a word", "They crowned him king", "They arrested him immediately", "They offered temple incense"]'::jsonb, 'They could not answer him a word', 'Jesus'' question silenced them, and from then on no one dared question him further.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 22
    AND q.difficulty_stage = 5
    AND q.prompt = 'After Jesus asked about David''s Lord, what could the Pharisees do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 22, 5, 'What did Jesus say must be given to God?', '["The things that are God''s", "Only offerings from the poor", "The Roman tribute money", "The vineyards of Galilee"]'::jsonb, 'The things that are God''s', 'Jesus paired Caesar''s due with the higher duty of rendering to God what belongs to God.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 22
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus say must be given to God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 23, 1, 'Whom did Jesus warn the crowds not to imitate in Matthew 23?', '["The scribes and Pharisees", "The fishermen of Galilee", "The Roman soldiers", "The women at the tomb"]'::jsonb, 'The scribes and Pharisees', 'Jesus warned against following the hypocritical example of the scribes and Pharisees.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 23
    AND q.difficulty_stage = 1
    AND q.prompt = 'Whom did Jesus warn the crowds not to imitate in Matthew 23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 23, 1, 'What did Jesus say the scribes and Pharisees do with heavy burdens?', '["They tie them on others but will not move them themselves", "They carry them joyfully for the poor", "They place them only on Roman soldiers", "They cast them into the sea"]'::jsonb, 'They tie them on others but will not move them themselves', 'Jesus said they bind heavy burdens on others while refusing to lift them with a finger.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 23
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say the scribes and Pharisees do with heavy burdens?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 23, 1, 'What did Jesus say about those who exalt themselves?', '["They will be humbled", "They will be praised by angels", "They will inherit thrones immediately", "They will never mourn"]'::jsonb, 'They will be humbled', 'Jesus taught that everyone who exalts himself will be humbled, and the humble will be exalted.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 23
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say about those who exalt themselves?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 23, 1, 'How did Jesus describe Jerusalem at the end of the chapter?', '["A city that kills the prophets", "The joy of all nations already", "A city without sin", "The final throne of Caesar"]'::jsonb, 'A city that kills the prophets', 'Jesus lamented over Jerusalem as the city that kills the prophets and stones those sent to her.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 23
    AND q.difficulty_stage = 1
    AND q.prompt = 'How did Jesus describe Jerusalem at the end of the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 23, 2, 'What titles did Jesus tell his disciples not to seek as marks of status?', '["Rabbi, father, and leader", "King, priest, and judge", "Merchant, farmer, and scribe", "Brother, servant, and disciple"]'::jsonb, 'Rabbi, father, and leader', 'Jesus told his followers not to seek exalted titles because they have one Teacher and one Father in heaven.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 23
    AND q.difficulty_stage = 2
    AND q.prompt = 'What titles did Jesus tell his disciples not to seek as marks of status?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 23, 2, 'What did Jesus say the Pharisees loved at feasts and synagogues?', '["Places of honor and prominent seats", "Serving in secret", "Giving quietly", "Praying in the wilderness"]'::jsonb, 'Places of honor and prominent seats', 'He criticized their love of status, greetings, and chief places.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 23
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say the Pharisees loved at feasts and synagogues?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 23, 2, 'What smaller spices did Jesus say they tithed while neglecting weightier matters?', '["Mint, dill, and cumin", "Wheat, barley, and rye", "Frankincense, myrrh, and cassia", "Olives, grapes, and figs"]'::jsonb, 'Mint, dill, and cumin', 'Jesus said they tithed tiny herbs while neglecting justice, mercy, and faithfulness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 23
    AND q.difficulty_stage = 2
    AND q.prompt = 'What smaller spices did Jesus say they tithed while neglecting weightier matters?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 23, 2, 'What did Jesus call the Pharisees for cleaning the outside but not the inside?', '["Whitewashed tombs and unclean cups", "Faithful shepherds", "Living stones", "Branches of the vine"]'::jsonb, 'Whitewashed tombs and unclean cups', 'Jesus exposed their hypocrisy with images of cups clean outside and tombs beautiful outwardly but full of uncleanness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 23
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus call the Pharisees for cleaning the outside but not the inside?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 23, 3, 'What did Jesus say the Pharisees shut in people''s faces?', '["The Kingdom of Heaven", "The city gate", "The temple treasury", "The road to Galilee"]'::jsonb, 'The Kingdom of Heaven', 'One woe says they shut the Kingdom of Heaven in people''s faces and neither enter nor allow others to enter.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 23
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did Jesus say the Pharisees shut in people''s faces?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 23, 3, 'How did Jesus describe their converts made through long travel?', '["Twice as much a child of Gehenna", "Leaders of Israel", "Examples of mercy", "Free from judgment"]'::jsonb, 'Twice as much a child of Gehenna', 'Jesus said their proselytes became even more fitting for judgment than they were.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 23
    AND q.difficulty_stage = 3
    AND q.prompt = 'How did Jesus describe their converts made through long travel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 23, 3, 'What weightier matters of the law did Jesus say they neglected?', '["Justice, mercy, and faithfulness", "Sacrifice, incense, and oil", "War, tribute, and census", "Music, poetry, and wisdom"]'::jsonb, 'Justice, mercy, and faithfulness', 'Jesus rebuked them for focusing on minor tithes while neglecting the law''s weightier matters.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 23
    AND q.difficulty_stage = 3
    AND q.prompt = 'What weightier matters of the law did Jesus say they neglected?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 23, 3, 'What insects and animals did Jesus use in the saying about strained priorities?', '["A gnat and a camel", "A lion and a lamb", "A dove and a serpent", "A fox and a hen"]'::jsonb, 'A gnat and a camel', 'Jesus said they strain out a gnat but swallow a camel.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 23
    AND q.difficulty_stage = 3
    AND q.prompt = 'What insects and animals did Jesus use in the saying about strained priorities?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 23, 4, 'Why did Jesus say they were sons of those who murdered the prophets?', '["Because they were continuing the same murderous pattern", "Because they were genealogically priests only", "Because they lived in Jerusalem", "Because they rebuilt old tombs"]'::jsonb, 'Because they were continuing the same murderous pattern', 'Though they honored the prophets'' tombs, their actions showed they shared the same spirit as their fathers.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 23
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did Jesus say they were sons of those who murdered the prophets?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 23, 4, 'What image did Jesus use for his desire to gather Jerusalem''s children?', '["A hen gathering her chicks under her wings", "A shepherd driving sheep with a rod", "An eagle training its young", "A farmer storing grain in barns"]'::jsonb, 'A hen gathering her chicks under her wings', 'Jesus pictured himself as a mother hen longing to gather and protect Jerusalem''s children.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 23
    AND q.difficulty_stage = 4
    AND q.prompt = 'What image did Jesus use for his desire to gather Jerusalem''s children?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 23, 4, 'What did Jesus say would happen to their house?', '["It would be left desolate", "It would become the new temple forever", "It would be filled with harvest", "It would be guarded by angels daily"]'::jsonb, 'It would be left desolate', 'Jesus pronounced desolation on their house as part of his judgment on Jerusalem.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 23
    AND q.difficulty_stage = 4
    AND q.prompt = 'What did Jesus say would happen to their house?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 23, 4, 'How did Jesus describe the Pharisees and scribes near the end of his woes?', '["Serpents, offspring of vipers", "Righteous shepherds", "Wise builders", "Children of peace"]'::jsonb, 'Serpents, offspring of vipers', 'Jesus used severe language to expose the depth of their hypocrisy and coming judgment.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 23
    AND q.difficulty_stage = 4
    AND q.prompt = 'How did Jesus describe the Pharisees and scribes near the end of his woes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 23, 5, 'What did Jesus acknowledge about the scribes and Pharisees sitting in Moses'' seat?', '["People should observe what they truly teach from Moses, but not imitate their works", "They have replaced Moses entirely", "They should no longer be heard at all", "They should be made kings over Israel"]'::jsonb, 'People should observe what they truly teach from Moses, but not imitate their works', 'Jesus distinguished between the authority of Moses'' teaching and the hypocrisy of their conduct.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 23
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus acknowledge about the scribes and Pharisees sitting in Moses'' seat?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 23, 5, 'What did Jesus say they did to the tombs of the prophets and monuments of the righteous?', '["They built and decorated them", "They tore them down", "They sold them for money", "They ignored them completely"]'::jsonb, 'They built and decorated them', 'Jesus noted their outward honor toward the dead prophets while exposing their inward hostility to God''s messengers.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 23
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus say they did to the tombs of the prophets and monuments of the righteous?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 23, 5, 'What did Jesus say would not happen again until Jerusalem says, ''Blessed is he who comes in the name of the Lord''?', '["They would not see him", "The temple would not open", "Rome would not fall", "The Passover would not be kept"]'::jsonb, 'They would not see him', 'Jesus said Jerusalem would not see him again until that future acknowledgment.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 23
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus say would not happen again until Jerusalem says, ''Blessed is he who comes in the name of the Lord''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 23, 5, 'What did Jesus say the greatest among his followers must be?', '["Their servant", "Their tax collector", "Their military captain", "Their public judge"]'::jsonb, 'Their servant', 'Jesus again defined greatness by service rather than status.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 23
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus say the greatest among his followers must be?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 24, 1, 'What did Jesus predict about the temple in Matthew 24?', '["Not one stone would be left on another", "It would be rebuilt in three days by Herod", "It would become Rome''s palace", "It would never again be questioned"]'::jsonb, 'Not one stone would be left on another', 'Jesus foretold the temple''s destruction, saying not one stone would be left upon another.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 24
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus predict about the temple in Matthew 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 24, 1, 'What did Jesus say would increase before the end in Matthew 24?', '["Wars and rumors of wars", "Universal peace", "Temple sacrifices", "Roman celebrations"]'::jsonb, 'Wars and rumors of wars', 'Jesus warned of wars and rumors of wars as part of the birth pains before the end.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 24
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say would increase before the end in Matthew 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 24, 1, 'What example from Noah''s days did Jesus use in Matthew 24?', '["People were eating and drinking until judgment came", "The flood never arrived", "Noah refused to build the ark", "Animals escaped from the ark"]'::jsonb, 'People were eating and drinking until judgment came', 'Jesus said people carried on normally in Noah''s time until the flood came and took them away.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 24
    AND q.difficulty_stage = 1
    AND q.prompt = 'What example from Noah''s days did Jesus use in Matthew 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 24, 1, 'What did Jesus say about the day and hour of his coming?', '["No one knows", "Only the Pharisees know", "It can be calculated exactly", "The disciples would announce it first"]'::jsonb, 'No one knows', 'Jesus said no one knows the day or hour, but watchfulness is required.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 24
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say about the day and hour of his coming?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 24, 2, 'What did Jesus say would be preached in the whole world before the end comes?', '["The good news of the Kingdom", "The law of Moses only", "The census of Caesar", "The rebuilding of the temple"]'::jsonb, 'The good news of the Kingdom', 'Jesus said the gospel of the Kingdom would be proclaimed in the whole world as a testimony to all nations.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 24
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say would be preached in the whole world before the end comes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 24, 2, 'What should those in Judea do when they see the abomination of desolation?', '["Flee to the mountains", "Gather in the temple", "Hide in boats", "Travel to Egypt for taxes"]'::jsonb, 'Flee to the mountains', 'Jesus warned those in Judea to flee immediately when the abomination of desolation appears.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 24
    AND q.difficulty_stage = 2
    AND q.prompt = 'What should those in Judea do when they see the abomination of desolation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 24, 2, 'What sign appears in heaven before the Son of Man comes with power and great glory?', '["The sign of the Son of Man", "A rainbow over Jerusalem only", "The ark of Noah", "A new temple curtain"]'::jsonb, 'The sign of the Son of Man', 'Jesus said the sign of the Son of Man will appear in heaven before his coming.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 24
    AND q.difficulty_stage = 2
    AND q.prompt = 'What sign appears in heaven before the Son of Man comes with power and great glory?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 24, 2, 'What lesson did Jesus say to learn from the fig tree?', '["When its branch becomes tender and puts out leaves, summer is near", "It never bears fruit again", "Its roots must be uprooted", "It grows only in winter"]'::jsonb, 'When its branch becomes tender and puts out leaves, summer is near', 'Jesus used the fig tree as a picture of recognizing the nearness of what he foretold.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 24
    AND q.difficulty_stage = 2
    AND q.prompt = 'What lesson did Jesus say to learn from the fig tree?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 24, 3, 'How did Jesus describe the beginning troubles before the end?', '["The beginning of birth pains", "The final peace of the nations", "The restoration of David''s throne", "The silence before the feast"]'::jsonb, 'The beginning of birth pains', 'Wars, famines, and earthquakes were described as the beginning of labor pains, not the end itself.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 24
    AND q.difficulty_stage = 3
    AND q.prompt = 'How did Jesus describe the beginning troubles before the end?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 24, 3, 'What would false christs and false prophets show, according to Jesus?', '["Great signs and wonders to mislead if possible", "Only written arguments", "Temple blueprints", "Roman military strength"]'::jsonb, 'Great signs and wonders to mislead if possible', 'Jesus warned that deceptive leaders would perform signs and wonders in an attempt to deceive.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 24
    AND q.difficulty_stage = 3
    AND q.prompt = 'What would false christs and false prophets show, according to Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 24, 3, 'How did Jesus describe his coming compared with lightning?', '["It will be visible from east to west", "It will be hidden in the wilderness", "It will occur only in Jerusalem''s courts", "It will be seen only by priests"]'::jsonb, 'It will be visible from east to west', 'Jesus said his coming would be unmistakable, like lightning flashing across the sky.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 24
    AND q.difficulty_stage = 3
    AND q.prompt = 'How did Jesus describe his coming compared with lightning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 24, 3, 'Who will gather the elect at the coming of the Son of Man?', '["Angels with a great trumpet", "The Roman armies", "The priests of the temple", "The twelve disciples alone"]'::jsonb, 'Angels with a great trumpet', 'Jesus said his angels would gather his elect from the four winds.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 24
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who will gather the elect at the coming of the Son of Man?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 24, 4, 'Why would the days of tribulation be shortened?', '["For the sake of the elect", "Because Rome demanded it", "Because the temple priests repented", "Because Noah''s example required it"]'::jsonb, 'For the sake of the elect', 'Jesus said those days would be shortened for the sake of the elect, otherwise no flesh would be saved.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 24
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why would the days of tribulation be shortened?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 24, 4, 'What comparison did Jesus use for the timing of his coming?', '["Like the days of Noah and like a thief in the night", "Like the reign of Solomon only", "Like the exodus from Egypt", "Like the temple dedication under Zerubbabel"]'::jsonb, 'Like the days of Noah and like a thief in the night', 'Jesus stressed unexpectedness with the examples of Noah''s days and a thief coming when the householder does not expect him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 24
    AND q.difficulty_stage = 4
    AND q.prompt = 'What comparison did Jesus use for the timing of his coming?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 24, 4, 'What is the faithful and wise servant doing when the master returns?', '["Giving food at the proper time", "Sleeping in the courtyard", "Hiding his talent", "Arguing over seats"]'::jsonb, 'Giving food at the proper time', 'The faithful servant is found doing his assigned work of caring for the household.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 24
    AND q.difficulty_stage = 4
    AND q.prompt = 'What is the faithful and wise servant doing when the master returns?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 24, 4, 'What happens to the wicked servant who says his master is delayed and abuses others?', '["He is judged severely and assigned a place with the hypocrites", "He is promoted over the household", "He is ignored completely", "He becomes ruler in Jerusalem"]'::jsonb, 'He is judged severely and assigned a place with the hypocrites', 'The wicked servant is cut off in judgment because his behavior exposed unbelief and abuse.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 24
    AND q.difficulty_stage = 4
    AND q.prompt = 'What happens to the wicked servant who says his master is delayed and abuses others?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 24, 5, 'What did the disciples ask Jesus while sitting on the Mount of Olives?', '["When these things would be and what would be the sign of his coming and of the end of the age", "Whether they should collect temple taxes", "Who would betray him first", "Where to find the donkey for entry into Jerusalem"]'::jsonb, 'When these things would be and what would be the sign of his coming and of the end of the age', 'Their questions about the temple and the end prompted the Olivet discourse.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 24
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did the disciples ask Jesus while sitting on the Mount of Olives?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 24, 5, 'What effect would increasing lawlessness have on many people''s love?', '["It would grow cold", "It would burn brighter", "It would become political power", "It would end all sorrow immediately"]'::jsonb, 'It would grow cold', 'Jesus warned that because lawlessness increases, the love of many will grow cold.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 24
    AND q.difficulty_stage = 5
    AND q.prompt = 'What effect would increasing lawlessness have on many people''s love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 24, 5, 'What did Jesus say about one taken and one left in the examples of field and mill?', '["They illustrate sudden separation at his coming", "They refer only to Roman taxation", "They describe ordinary harvest schedules", "They prove no one can be deceived"]'::jsonb, 'They illustrate sudden separation at his coming', 'Jesus used the paired examples to show the sudden and dividing character of his coming.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 24
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus say about one taken and one left in the examples of field and mill?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 24, 5, 'What repeated command summarizes Jesus'' application in Matthew 24?', '["Watch, because you do not know when your Lord is coming", "Sell all and move to the desert", "Build a second ark immediately", "Stop preaching to the nations"]'::jsonb, 'Watch, because you do not know when your Lord is coming', 'Jesus repeatedly called for readiness and watchfulness because the timing is unknown.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 24
    AND q.difficulty_stage = 5
    AND q.prompt = 'What repeated command summarizes Jesus'' application in Matthew 24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 25, 1, 'In Matthew 25, how many virgins were in Jesus'' parable?', '["Ten", "Five", "Twelve", "Twenty"]'::jsonb, 'Ten', 'Jesus told a parable about ten virgins waiting for the bridegroom.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 25
    AND q.difficulty_stage = 1
    AND q.prompt = 'In Matthew 25, how many virgins were in Jesus'' parable?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 25, 1, 'How many of the virgins were wise?', '["Five", "Ten", "Two", "Seven"]'::jsonb, 'Five', 'Five virgins were wise and brought extra oil, while five were foolish.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 25
    AND q.difficulty_stage = 1
    AND q.prompt = 'How many of the virgins were wise?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 25, 1, 'What did the master entrust to his servants in the next parable?', '["Talents", "Vineyards", "Fishing boats", "Temple garments"]'::jsonb, 'Talents', 'The master entrusted different amounts of talents to his servants.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 25
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the master entrust to his servants in the next parable?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 25, 1, 'Into what two groups are the nations divided in the final judgment scene?', '["Sheep and goats", "Wise and foolish builders", "Rich and poor", "Priests and tax collectors"]'::jsonb, 'Sheep and goats', 'The Son of Man separates the nations as a shepherd separates sheep from goats.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 25
    AND q.difficulty_stage = 1
    AND q.prompt = 'Into what two groups are the nations divided in the final judgment scene?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 25, 2, 'What made the wise virgins different from the foolish ones?', '["They brought extra oil for their lamps", "They arrived earlier in the day", "They had richer clothing", "They knew the bridegroom personally"]'::jsonb, 'They brought extra oil for their lamps', 'The wise virgins were prepared with extra oil when the bridegroom delayed.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 25
    AND q.difficulty_stage = 2
    AND q.prompt = 'What made the wise virgins different from the foolish ones?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 25, 2, 'What happened to the door after the wise virgins entered with the bridegroom?', '["It was shut", "It stayed open all night", "It was guarded by soldiers", "It collapsed"]'::jsonb, 'It was shut', 'Once the prepared virgins entered, the door was shut and the foolish ones were left outside.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 25
    AND q.difficulty_stage = 2
    AND q.prompt = 'What happened to the door after the wise virgins entered with the bridegroom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 25, 2, 'What did the servant with one talent do with it?', '["He hid it in the ground", "He doubled it", "He gave it to the poor", "He returned only half"]'::jsonb, 'He hid it in the ground', 'The fearful servant buried the one talent instead of using it faithfully.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 25
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the servant with one talent do with it?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 25, 2, 'Whom did Jesus say the righteous served when they fed the hungry and welcomed strangers?', '["Him", "Only the disciples", "The temple priests", "The Roman poor"]'::jsonb, 'Him', 'Jesus said whatever they did for the least of these, they did for him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 25
    AND q.difficulty_stage = 2
    AND q.prompt = 'Whom did Jesus say the righteous served when they fed the hungry and welcomed strangers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 25, 3, 'What cry was heard at midnight in the parable of the ten virgins?', '["Behold, the bridegroom is coming", "Wake the city gates", "Prepare the temple incense", "The harvest is finished"]'::jsonb, 'Behold, the bridegroom is coming', 'At midnight the announcement came that the bridegroom was arriving.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 25
    AND q.difficulty_stage = 3
    AND q.prompt = 'What cry was heard at midnight in the parable of the ten virgins?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 25, 3, 'What reward did the master give the servants who used their talents faithfully?', '["Enter into the joy of your lord", "Seats in Caesar''s court", "Exemption from all labor", "A title above the others"]'::jsonb, 'Enter into the joy of your lord', 'The faithful servants were commended and invited into their master''s joy.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 25
    AND q.difficulty_stage = 3
    AND q.prompt = 'What reward did the master give the servants who used their talents faithfully?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 25, 3, 'What accusation did the wicked servant make about his master?', '["That he was a hard man reaping where he had not sown", "That he was too merciful", "That he paid late wages", "That he forgot the feast"]'::jsonb, 'That he was a hard man reaping where he had not sown', 'The wicked servant justified his inactivity by accusing his master of hardness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 25
    AND q.difficulty_stage = 3
    AND q.prompt = 'What accusation did the wicked servant make about his master?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 25, 3, 'Where are the goats placed in the judgment scene?', '["On the left", "On the right", "In the center", "Outside the field"]'::jsonb, 'On the left', 'The sheep are set on the right hand and the goats on the left.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 25
    AND q.difficulty_stage = 3
    AND q.prompt = 'Where are the goats placed in the judgment scene?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 25, 4, 'What was the wise virgins'' answer when the foolish asked for oil?', '["There may not be enough for us and for you; go buy some", "Take all of ours freely", "Wait until morning", "Ask the bridegroom yourself"]'::jsonb, 'There may not be enough for us and for you; go buy some', 'The wise virgins emphasized preparedness that could not be borrowed at the last moment.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 25
    AND q.difficulty_stage = 4
    AND q.prompt = 'What was the wise virgins'' answer when the foolish asked for oil?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 25, 4, 'What was done with the one talent after the wicked servant returned it?', '["It was taken from him and given to the servant with ten", "It was divided among the poor", "It was buried again as a warning", "It was offered at the temple"]'::jsonb, 'It was taken from him and given to the servant with ten', 'The master removed the unused talent from the wicked servant and gave it to the most fruitful servant.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 25
    AND q.difficulty_stage = 4
    AND q.prompt = 'What was done with the one talent after the wicked servant returned it?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 25, 4, 'What sentence is given to those on the left in the sheep and goats judgment?', '["Depart from me, you cursed, into the eternal fire prepared for the devil and his angels", "Enter into the joy of your lord", "Sit on twelve thrones", "Wait outside until morning"]'::jsonb, 'Depart from me, you cursed, into the eternal fire prepared for the devil and his angels', 'The goats are condemned because their failure to love the needy revealed rejection of the King.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 25
    AND q.difficulty_stage = 4
    AND q.prompt = 'What sentence is given to those on the left in the sheep and goats judgment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 25, 4, 'What acts of mercy does Jesus mention in this chapter?', '["Feeding the hungry, welcoming strangers, clothing the naked, visiting the sick and imprisoned", "Only offering sacrifices", "Winning political debates", "Building city walls"]'::jsonb, 'Feeding the hungry, welcoming strangers, clothing the naked, visiting the sick and imprisoned', 'Jesus lists practical deeds of compassion as evidence of loyalty to him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 25
    AND q.difficulty_stage = 4
    AND q.prompt = 'What acts of mercy does Jesus mention in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 25, 5, 'What command closes the parable of the ten virgins?', '["Watch therefore, for you do not know the day nor the hour", "Sell your lamp and follow me", "Go into all the world", "Take up your cross"]'::jsonb, 'Watch therefore, for you do not know the day nor the hour', 'The lesson of the parable is readiness because the exact time is unknown.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 25
    AND q.difficulty_stage = 5
    AND q.prompt = 'What command closes the parable of the ten virgins?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 25, 5, 'What principle did the master state about the one who has and the one who does not have?', '["To everyone who has, more will be given; from the one who does not have, even what he has will be taken", "Every servant will receive the same reward regardless of faithfulness", "The last will never be first", "Only the poor can be trusted"]'::jsonb, 'To everyone who has, more will be given; from the one who does not have, even what he has will be taken', 'The master declared the principle of increase for faithful stewardship and loss for fruitless neglect.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 25
    AND q.difficulty_stage = 5
    AND q.prompt = 'What principle did the master state about the one who has and the one who does not have?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 25, 5, 'How did the righteous respond when Jesus said they had served him?', '["They asked when they had seen him hungry, thirsty, or in need", "They said they always knew it was him", "They denied helping anyone", "They asked for a greater reward"]'::jsonb, 'They asked when they had seen him hungry, thirsty, or in need', 'The righteous were surprised, showing they had served from genuine compassion rather than self-display.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 25
    AND q.difficulty_stage = 5
    AND q.prompt = 'How did the righteous respond when Jesus said they had served him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 25, 5, 'How does Matthew 25 end for the two groups?', '["The righteous go into eternal life, and the wicked into eternal punishment", "Both are restored equally", "Everyone returns to earthly life", "Only Israel is judged"]'::jsonb, 'The righteous go into eternal life, and the wicked into eternal punishment', 'Jesus ends the chapter with a final division into eternal life and eternal punishment.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 25
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Matthew 25 end for the two groups?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 26, 1, 'Who agreed to betray Jesus for silver in Matthew 26 (Judas Iscariot)?', '["Judas Iscariot", "Peter", "John", "Pilate"]'::jsonb, 'Judas Iscariot', 'Judas went to the chief priests and agreed to betray Jesus for thirty pieces of silver.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 26
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who agreed to betray Jesus for silver in Matthew 26 (Judas Iscariot)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 26, 1, 'What meal was Jesus preparing to eat with his disciples in Matthew 26?', '["Passover", "Pentecost feast", "Wedding feast", "Sabbath breakfast"]'::jsonb, 'Passover', 'Jesus gathered with his disciples to eat the Passover meal.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 26
    AND q.difficulty_stage = 1
    AND q.prompt = 'What meal was Jesus preparing to eat with his disciples in Matthew 26?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 26, 1, 'Where did Jesus pray in deep sorrow after the supper?', '["Gethsemane", "Nazareth", "Jericho", "Caesarea"]'::jsonb, 'Gethsemane', 'Jesus went to Gethsemane and prayed there in anguish before his arrest.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 26
    AND q.difficulty_stage = 1
    AND q.prompt = 'Where did Jesus pray in deep sorrow after the supper?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 26, 1, 'How many times did Peter deny Jesus before the rooster crowed?', '["Three", "One", "Two", "Seven"]'::jsonb, 'Three', 'Peter denied Jesus three times, just as Jesus had predicted.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 26
    AND q.difficulty_stage = 1
    AND q.prompt = 'How many times did Peter deny Jesus before the rooster crowed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 26, 2, 'What did a woman pour on Jesus'' head at Bethany?', '["Very costly ointment", "Water from the Jordan", "Temple oil for lamps", "Perfume mixed with dust"]'::jsonb, 'Very costly ointment', 'A woman anointed Jesus with very costly ointment, and he said she had prepared him for burial.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 26
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did a woman pour on Jesus'' head at Bethany?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 26, 2, 'What words did Jesus say over the bread at the supper?', '["Take, eat; this is my body", "This bread is for the poor only", "Break this for Caesar", "Keep this for tomorrow"]'::jsonb, 'Take, eat; this is my body', 'Jesus gave the bread to the disciples and identified it with his body.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 26
    AND q.difficulty_stage = 2
    AND q.prompt = 'What words did Jesus say over the bread at the supper?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 26, 2, 'What words did Jesus say about the cup?', '["This is my blood of the covenant, poured out for many for the forgiveness of sins", "This cup belongs only to priests", "This is the cup of Elijah", "Drink later after the feast"]'::jsonb, 'This is my blood of the covenant, poured out for many for the forgiveness of sins', 'Jesus gave the cup as a covenant sign pointing to his sacrificial death.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 26
    AND q.difficulty_stage = 2
    AND q.prompt = 'What words did Jesus say about the cup?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 26, 2, 'How did Judas identify Jesus to the arresting crowd?', '["With a kiss", "By handing over a coin", "By shouting from the gate", "By pointing from a distance"]'::jsonb, 'With a kiss', 'Judas gave the agreed sign by kissing Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 26
    AND q.difficulty_stage = 2
    AND q.prompt = 'How did Judas identify Jesus to the arresting crowd?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 26, 3, 'How much were the chief priests willing to give Judas?', '["Thirty pieces of silver", "Ten denarii", "A talent of gold", "Seven silver coins"]'::jsonb, 'Thirty pieces of silver', 'Judas received thirty pieces of silver for agreeing to betray Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 26
    AND q.difficulty_stage = 3
    AND q.prompt = 'How much were the chief priests willing to give Judas?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 26, 3, 'What did Jesus predict the disciples would do that night?', '["They would all fall away because of him", "They would all remain awake", "They would overthrow the priests", "They would enter the temple courts"]'::jsonb, 'They would all fall away because of him', 'Jesus quoted Scripture and said the disciples would all be made to stumble that night.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 26
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did Jesus predict the disciples would do that night?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 26, 3, 'Which disciples did Jesus take farther with him in Gethsemane?', '["Peter, James, and John", "Andrew, Philip, and Thomas", "Matthew, James son of Alphaeus, and Thaddaeus", "All eleven"]'::jsonb, 'Peter, James, and John', 'Jesus took Peter and the two sons of Zebedee deeper into the garden while the others waited.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 26
    AND q.difficulty_stage = 3
    AND q.prompt = 'Which disciples did Jesus take farther with him in Gethsemane?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 26, 3, 'What happened when one of Jesus'' companions drew a sword?', '["Jesus told him to put it back, saying those who take the sword perish by it", "Jesus told him to strike again", "The crowd fled in fear forever", "Peter was crowned brave by the disciples"]'::jsonb, 'Jesus told him to put it back, saying those who take the sword perish by it', 'Jesus rejected violent rescue and submitted to the Father''s plan.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 26
    AND q.difficulty_stage = 3
    AND q.prompt = 'What happened when one of Jesus'' companions drew a sword?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 26, 4, 'Why did Jesus defend the woman''s anointing against the disciples'' criticism?', '["She had done a beautiful thing and prepared him for burial", "She had fulfilled the temple tax", "She was one of the chief priests'' daughters", "She had promised more ointment later"]'::jsonb, 'She had done a beautiful thing and prepared him for burial', 'Jesus said her act was fitting because it anticipated his burial and would be remembered wherever the gospel is preached.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 26
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did Jesus defend the woman''s anointing against the disciples'' criticism?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 26, 4, 'What request did Jesus repeat in prayer, while submitting to the Father''s will?', '["If possible, let this cup pass from me; nevertheless not as I will, but as you will", "Send twelve legions now and destroy Rome", "Build a tabernacle in the garden", "Let the disciples sleep forever"]'::jsonb, 'If possible, let this cup pass from me; nevertheless not as I will, but as you will', 'Jesus prayed honestly about the coming suffering while fully submitting to the Father''s will.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 26
    AND q.difficulty_stage = 4
    AND q.prompt = 'What request did Jesus repeat in prayer, while submitting to the Father''s will?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 26, 4, 'What false testimony was finally brought against Jesus at the trial?', '["That he said he could destroy the temple and rebuild it in three days", "That he refused all prayer", "That he denied David existed", "That he stole money from the poor"]'::jsonb, 'That he said he could destroy the temple and rebuild it in three days', 'The false witnesses twisted Jesus'' words about the temple.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 26
    AND q.difficulty_stage = 4
    AND q.prompt = 'What false testimony was finally brought against Jesus at the trial?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 26, 4, 'What answer did Jesus give when asked if he was the Christ, the Son of God?', '["You have said so; and you will see the Son of Man seated at the right hand of Power", "I refuse to answer forever", "Only Peter knows the truth", "Ask Judas instead"]'::jsonb, 'You have said so; and you will see the Son of Man seated at the right hand of Power', 'Jesus affirmed his identity and spoke of future exaltation, which the high priest treated as blasphemy.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 26
    AND q.difficulty_stage = 4
    AND q.prompt = 'What answer did Jesus give when asked if he was the Christ, the Son of God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 26, 5, 'What hymn did Jesus and the disciples sing before going out to the Mount of Olives?', '["A hymn after the meal", "The song of Moses at the sea", "Psalm 23 only", "No hymn was sung"]'::jsonb, 'A hymn after the meal', 'Matthew records that after singing a hymn, they went out to the Mount of Olives.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 26
    AND q.difficulty_stage = 5
    AND q.prompt = 'What hymn did Jesus and the disciples sing before going out to the Mount of Olives?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 26, 5, 'What specific boast did Peter make before his denials?', '["Even if all fall away, I never will", "I will never sleep again", "I can call down angels now", "I will pay the temple tax for everyone"]'::jsonb, 'Even if all fall away, I never will', 'Peter insisted he would remain loyal even if all the others fell away.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 26
    AND q.difficulty_stage = 5
    AND q.prompt = 'What specific boast did Peter make before his denials?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 26, 5, 'What did Jesus say he could call on if he wished to avoid arrest by force?', '["More than twelve legions of angels", "All the priests in Jerusalem", "The armies of Rome", "Fire from heaven on the crowd"]'::jsonb, 'More than twelve legions of angels', 'Jesus said he could ask the Father for angelic help, but the Scriptures had to be fulfilled.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 26
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus say he could call on if he wished to avoid arrest by force?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 26, 5, 'What did Peter do after remembering Jesus'' prediction about the rooster crowing?', '["He went out and wept bitterly", "He returned to the trial and confessed", "He struck the servant again", "He followed Judas to the priests"]'::jsonb, 'He went out and wept bitterly', 'Peter''s bitter weeping showed grief after he realized Jesus'' words had come true.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 26
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Peter do after remembering Jesus'' prediction about the rooster crowing?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 27, 1, 'Whom did the crowd choose to release instead of Jesus in Matthew 27?', '["Barabbas", "Judas", "Caiaphas", "Simon of Cyrene"]'::jsonb, 'Barabbas', 'Pilate offered to release Jesus or Barabbas, and the crowd chose Barabbas.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 27
    AND q.difficulty_stage = 1
    AND q.prompt = 'Whom did the crowd choose to release instead of Jesus in Matthew 27?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 27, 1, 'Who carried Jesus'' cross in Matthew 27?', '["Simon of Cyrene", "Peter", "Joseph of Arimathea", "Barabbas"]'::jsonb, 'Simon of Cyrene', 'The soldiers compelled Simon of Cyrene to carry Jesus'' cross.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 27
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who carried Jesus'' cross in Matthew 27?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 27, 1, 'What happened in the land from the sixth hour to the ninth hour?', '["Darkness covered the land", "The temple was rebuilt", "Rain washed the city", "The sea flooded Jerusalem"]'::jsonb, 'Darkness covered the land', 'A darkness came over all the land during those hours of the crucifixion.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 27
    AND q.difficulty_stage = 1
    AND q.prompt = 'What happened in the land from the sixth hour to the ninth hour?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 27, 1, 'Who buried Jesus in his own new tomb?', '["Joseph of Arimathea", "Nicodemus", "Pilate", "John"]'::jsonb, 'Joseph of Arimathea', 'Joseph of Arimathea asked for Jesus'' body and laid it in his own new tomb.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 27
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who buried Jesus in his own new tomb?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 27, 2, 'What happened to Judas after he returned the silver?', '["He went away and hanged himself", "He followed Jesus to Golgotha", "He became a witness before Pilate", "He fled to Galilee"]'::jsonb, 'He went away and hanged himself', 'After returning the silver and confessing his sin, Judas went and hanged himself.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 27
    AND q.difficulty_stage = 2
    AND q.prompt = 'What happened to Judas after he returned the silver?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 27, 2, 'What warning did Pilate receive from his wife?', '["Have nothing to do with that righteous man", "Do not release Barabbas", "Leave Jerusalem tonight", "Do not enter the temple"]'::jsonb, 'Have nothing to do with that righteous man', 'Pilate''s wife sent word because she had suffered much in a dream because of Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 27
    AND q.difficulty_stage = 2
    AND q.prompt = 'What warning did Pilate receive from his wife?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 27, 2, 'What title was placed over Jesus'' head on the cross?', '["This is Jesus, the King of the Jews", "Prophet of Nazareth", "Teacher of Israel", "Enemy of Caesar"]'::jsonb, 'This is Jesus, the King of the Jews', 'The accusation posted over Jesus'' head read, ''This is Jesus, the King of the Jews.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 27
    AND q.difficulty_stage = 2
    AND q.prompt = 'What title was placed over Jesus'' head on the cross?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 27, 2, 'What happened to the temple veil when Jesus died?', '["It was torn in two from top to bottom", "It turned black", "It was taken by soldiers", "It was sewn thicker"]'::jsonb, 'It was torn in two from top to bottom', 'At Jesus'' death the veil of the temple was torn in two from top to bottom.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 27
    AND q.difficulty_stage = 2
    AND q.prompt = 'What happened to the temple veil when Jesus died?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 27, 3, 'What did Pilate do with water before the crowd?', '["He washed his hands, saying he was innocent of Jesus'' blood", "He baptized Barabbas", "He offered Jesus a drink", "He cleansed the temple steps"]'::jsonb, 'He washed his hands, saying he was innocent of Jesus'' blood', 'Pilate symbolically washed his hands before the crowd while handing Jesus over.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 27
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did Pilate do with water before the crowd?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 27, 3, 'What did the soldiers put on Jesus while mocking him?', '["A scarlet robe and a crown of thorns", "A priestly ephod and sandals", "White linen and gold", "A fisherman''s cloak"]'::jsonb, 'A scarlet robe and a crown of thorns', 'The soldiers mocked Jesus as king by dressing him in a robe and pressing a crown of thorns on his head.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 27
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did the soldiers put on Jesus while mocking him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 27, 3, 'What cry did Jesus utter about being forsaken?', '["My God, my God, why have you forsaken me?", "Father, forgive them all forever", "Peace, be still", "It is enough"]'::jsonb, 'My God, my God, why have you forsaken me?', 'Jesus cried out with words from Psalm 22 during the crucifixion.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 27
    AND q.difficulty_stage = 3
    AND q.prompt = 'What cry did Jesus utter about being forsaken?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 27, 3, 'How did the centurion respond after Jesus died and the earthquake occurred?', '["Truly this was the Son of God", "Surely this man was innocent only", "Caesar is lord", "The temple must be rebuilt"]'::jsonb, 'Truly this was the Son of God', 'The centurion and those with him were filled with fear and confessed Jesus as God''s Son.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 27
    AND q.difficulty_stage = 3
    AND q.prompt = 'How did the centurion respond after Jesus died and the earthquake occurred?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 27, 4, 'Why did the chief priests buy the potter''s field with Judas'' silver?', '["It was not lawful to put blood money into the treasury", "They wanted a vineyard there", "Pilate commanded them to do it", "It belonged to Joseph already"]'::jsonb, 'It was not lawful to put blood money into the treasury', 'The priests called the returned silver blood money and used it to buy a burial field for strangers.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 27
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did the chief priests buy the potter''s field with Judas'' silver?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 27, 4, 'What mixed drink was offered to Jesus before the crucifixion?', '["Wine mixed with gall", "Water mixed with oil", "Milk and honey", "Vinegar mixed with myrrh only"]'::jsonb, 'Wine mixed with gall', 'They gave Jesus wine mixed with gall, but he would not drink it after tasting it.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 27
    AND q.difficulty_stage = 4
    AND q.prompt = 'What mixed drink was offered to Jesus before the crucifixion?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 27, 4, 'What unusual event involving tombs happened after Jesus'' death?', '["Tombs were opened and many bodies of saints were raised", "All tombs were sealed shut permanently", "Pilate ordered every grave searched", "The dead appeared only to soldiers"]'::jsonb, 'Tombs were opened and many bodies of saints were raised', 'Matthew records an extraordinary sign in which tombs opened and many holy ones were raised.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 27
    AND q.difficulty_stage = 4
    AND q.prompt = 'What unusual event involving tombs happened after Jesus'' death?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 27, 4, 'Why did the leaders ask Pilate to secure the tomb?', '["They feared the disciples might steal the body and claim resurrection", "They wanted to honor Jesus privately", "They planned another trial after Sabbath", "They expected Barabbas to hide there"]'::jsonb, 'They feared the disciples might steal the body and claim resurrection', 'Remembering Jesus'' prediction, they requested a guard to prevent a resurrection claim.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 27
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did the leaders ask Pilate to secure the tomb?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 27, 5, 'What did the crowd say when Pilate asked what he should do with Jesus?', '["Let him be crucified", "Seat him on David''s throne", "Release him to Galilee", "Send him to Egypt"]'::jsonb, 'Let him be crucified', 'The stirred-up crowd demanded crucifixion instead of Jesus'' release.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 27
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did the crowd say when Pilate asked what he should do with Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 27, 5, 'What was the name of the place where Jesus was crucified?', '["Golgotha", "Bethany", "Nazareth", "Emmaus"]'::jsonb, 'Golgotha', 'Golgotha is explained as ''Place of a Skull.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 27
    AND q.difficulty_stage = 5
    AND q.prompt = 'What was the name of the place where Jesus was crucified?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 27, 5, 'What did Jesus'' mockers challenge him to do if he was the Son of God?', '["Come down from the cross", "Call Elijah to crown him", "Destroy the temple at once", "Strike Pilate with lightning"]'::jsonb, 'Come down from the cross', 'The mockers taunted Jesus to save himself and come down from the cross.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 27
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus'' mockers challenge him to do if he was the Son of God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 27, 5, 'Who were among the women watching from a distance?', '["Mary Magdalene, Mary the mother of James and Joseph, and the mother of Zebedee''s sons", "Only Pilate''s wife", "Martha, Mary, and Lazarus", "Deborah and Ruth"]'::jsonb, 'Mary Magdalene, Mary the mother of James and Joseph, and the mother of Zebedee''s sons', 'Matthew names these women as witnesses of the crucifixion from a distance.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 27
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who were among the women watching from a distance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 28, 1, 'Who went to see Jesus'' tomb in Matthew 28?', '["Mary Magdalene and the other Mary", "Peter and John", "Pilate and the guards", "Joseph and Nicodemus"]'::jsonb, 'Mary Magdalene and the other Mary', 'Matthew names Mary Magdalene and the other Mary as the women who came to the tomb.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 28
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who went to see Jesus'' tomb in Matthew 28?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 28, 1, 'What did the angel say about Jesus in Matthew 28?', '["He has risen", "He is still here", "He has gone to Egypt", "He is asleep"]'::jsonb, 'He has risen', 'The angel announced that Jesus was not in the tomb because he had risen.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 28
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the angel say about Jesus in Matthew 28?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 28, 1, 'Where did Jesus tell his disciples to go to see him after the resurrection?', '["Galilee", "Jerusalem''s temple", "Bethany only", "The Jordan wilderness"]'::jsonb, 'Galilee', 'Both the angel and Jesus said the disciples would see him in Galilee.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 28
    AND q.difficulty_stage = 1
    AND q.prompt = 'Where did Jesus tell his disciples to go to see him after the resurrection?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 28, 1, 'What did Jesus command his disciples to make of all nations?', '["Disciples", "Kings", "Soldiers", "Tax collectors"]'::jsonb, 'Disciples', 'In the Great Commission, Jesus commanded the disciples to make disciples of all nations.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 28
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus command his disciples to make of all nations?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 28, 2, 'What dramatic event accompanied the angel''s arrival at the tomb?', '["A great earthquake", "A flood in the Kidron valley", "Fire from heaven consuming the tomb", "The temple veil sewing itself"]'::jsonb, 'A great earthquake', 'Matthew reports a great earthquake as the angel descended and rolled away the stone.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 28
    AND q.difficulty_stage = 2
    AND q.prompt = 'What dramatic event accompanied the angel''s arrival at the tomb?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 28, 2, 'What happened to the guards when they saw the angel?', '["They shook and became like dead men", "They worshiped with the women", "They opened the tomb themselves", "They fled to Galilee"]'::jsonb, 'They shook and became like dead men', 'The guards trembled in fear and became like dead men when the angel appeared.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 28
    AND q.difficulty_stage = 2
    AND q.prompt = 'What happened to the guards when they saw the angel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 28, 2, 'How did Jesus greet the women when they met him?', '["Rejoice", "Do not mourn forever", "Peace to Caesar", "Return to Nazareth"]'::jsonb, 'Rejoice', 'Jesus met the women and greeted them with a word of joy.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 28
    AND q.difficulty_stage = 2
    AND q.prompt = 'How did Jesus greet the women when they met him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 28, 2, 'Into what threefold name did Jesus command disciples to baptize?', '["The Father, the Son, and the Holy Spirit", "Abraham, Isaac, and Jacob", "Moses, Elijah, and David", "Heaven, earth, and sea"]'::jsonb, 'The Father, the Son, and the Holy Spirit', 'Jesus instructed the apostles to baptize in the name of the Father and of the Son and of the Holy Spirit.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 28
    AND q.difficulty_stage = 2
    AND q.prompt = 'Into what threefold name did Jesus command disciples to baptize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 28, 3, 'What did the angel invite the women to do at the tomb?', '["Come, see the place where the Lord lay", "Guard the tomb until evening", "Take the stone back to the door", "Call the chief priests"]'::jsonb, 'Come, see the place where the Lord lay', 'The angel showed them the empty place and then sent them to tell the disciples.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 28
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did the angel invite the women to do at the tomb?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 28, 3, 'What were the women instructed to tell the disciples?', '["Jesus has risen and is going before them into Galilee", "The guards have taken the body", "Pilate wants another hearing", "They should remain hidden in Jerusalem forever"]'::jsonb, 'Jesus has risen and is going before them into Galilee', 'The women were told to announce the resurrection and the meeting in Galilee.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 28
    AND q.difficulty_stage = 3
    AND q.prompt = 'What were the women instructed to tell the disciples?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 28, 3, 'What false story were the soldiers paid to spread?', '["His disciples came by night and stole him away while we slept", "Jesus never died on the cross", "The women opened the tomb themselves", "Pilate removed the body to Rome"]'::jsonb, 'His disciples came by night and stole him away while we slept', 'The chief priests bribed the soldiers to spread the theft story.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 28
    AND q.difficulty_stage = 3
    AND q.prompt = 'What false story were the soldiers paid to spread?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 28, 3, 'How did the disciples respond when they saw Jesus in Galilee?', '["They worshiped him, though some doubted", "They all fled in fear", "They returned to fishing immediately", "They asked for silver from the priests"]'::jsonb, 'They worshiped him, though some doubted', 'Matthew says the disciples worshiped Jesus, though some hesitated or doubted.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 28
    AND q.difficulty_stage = 3
    AND q.prompt = 'How did the disciples respond when they saw Jesus in Galilee?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 28, 4, 'What reason did the chief priests give the guards not to fear punishment?', '["They would persuade the governor and keep them out of trouble", "The Sabbath law protected them", "The crowds would forget by morning", "Herod had already pardoned them"]'::jsonb, 'They would persuade the governor and keep them out of trouble', 'The leaders promised to satisfy Pilate and keep the soldiers safe if the story reached him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 28
    AND q.difficulty_stage = 4
    AND q.prompt = 'What reason did the chief priests give the guards not to fear punishment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 28, 4, 'What authority did Jesus declare before giving the Great Commission?', '["All authority in heaven and on earth has been given to me", "Only authority over Israel has been given to me", "The temple authority is now mine alone", "Authority belongs only to Caesar"]'::jsonb, 'All authority in heaven and on earth has been given to me', 'Jesus grounded the commission in his universal authority.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 28
    AND q.difficulty_stage = 4
    AND q.prompt = 'What authority did Jesus declare before giving the Great Commission?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 28, 4, 'What were the disciples to teach the nations after baptizing them?', '["To observe all that Jesus commanded", "To keep Roman law above all", "To rebuild the Jerusalem temple", "To seek signs in heaven"]'::jsonb, 'To observe all that Jesus commanded', 'The commission includes ongoing teaching in obedience to Jesus'' commands.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 28
    AND q.difficulty_stage = 4
    AND q.prompt = 'What were the disciples to teach the nations after baptizing them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 28, 4, 'What promise did Jesus give about his presence?', '["I am with you always, even to the end of the age", "I will visit only at Passover", "I am with you only in Galilee", "I will return after the temple falls"]'::jsonb, 'I am with you always, even to the end of the age', 'Jesus ended Matthew with a promise of his continual presence.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 28
    AND q.difficulty_stage = 4
    AND q.prompt = 'What promise did Jesus give about his presence?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 28, 5, 'What did the women do when they met the risen Jesus?', '["They took hold of his feet and worshiped him", "They asked him for proof from heaven", "They ran away and hid again", "They returned to the tomb alone"]'::jsonb, 'They took hold of his feet and worshiped him', 'The women responded to the risen Jesus with worship.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 28
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did the women do when they met the risen Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 28, 5, 'Where did Jesus meet the eleven disciples after his resurrection according to Matthew?', '["On the mountain in Galilee that he had appointed", "In the upper room in Jerusalem only", "At the Jordan where John baptized", "In Nazareth''s synagogue"]'::jsonb, 'On the mountain in Galilee that he had appointed', 'Matthew places the risen Jesus'' meeting with the eleven on a mountain in Galilee.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 28
    AND q.difficulty_stage = 5
    AND q.prompt = 'Where did Jesus meet the eleven disciples after his resurrection according to Matthew?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 28, 5, 'How does Matthew describe the spread of the guards'' false report?', '["It became commonly reported among the Jews", "It ended the same day", "It convinced the disciples to stop preaching", "It was written on the temple veil"]'::jsonb, 'It became commonly reported among the Jews', 'Matthew notes that the bribed report spread widely among the Jews.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 28
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Matthew describe the spread of the guards'' false report?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 40, 28, 5, 'What two actions are central in the Great Commission besides going?', '["Baptizing and teaching", "Fasting and weeping", "Building and guarding", "Buying and selling"]'::jsonb, 'Baptizing and teaching', 'Jesus'' commission centers on making disciples through baptism and teaching obedience.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 40
    AND q.chapter = 28
    AND q.difficulty_stage = 5
    AND q.prompt = 'What two actions are central in the Great Commission besides going?'
);
