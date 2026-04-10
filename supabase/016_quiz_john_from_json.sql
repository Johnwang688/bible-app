-- ============================================================================
-- LOGOS LIGHT — John (book 43) quiz questions from quiz-questions/john.json
-- ============================================================================
-- Idempotent: skips rows that already match (book_number, chapter, difficulty_stage, prompt).
-- Safe to run after 014 (which seeds the same MVP John set from SQL).
-- ============================================================================

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 1, 'According to John 1, who bore witness about the light?', '["John the Baptist", "Peter (a common guess, but not what John says here)", "Moses", "Elijah"]'::jsonb, 'John the Baptist', 'John the Baptist was sent to bear witness about the light (John 1:6–8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to John 1, who bore witness about the light?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 1, 'From what town were Andrew and Peter?', '["Bethsaida", "Nazareth (a common guess, but not what John says here)", "Capernaum", "Jerusalem"]'::jsonb, 'Bethsaida', 'Andrew and Peter were from Bethsaida (John 1:44).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'From what town were Andrew and Peter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 1, 'What did John 1:14 say the Word became?', '["Flesh", "Spirit", "Light", "Voice"]'::jsonb, 'Flesh', '"The Word became flesh and dwelt among us."'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did John 1:14 say the Word became?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 1, 'What did John say he was not, when asked if he was the Christ?', '["He said he was not", "He said he was", "He refused to answer", "He was silent"]'::jsonb, 'He said he was not', 'John clearly stated "I am not the Christ" (John 1:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did John say he was not, when asked if he was the Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 1, 'What did Philip tell Nathanael when he invited him to see Jesus?', '["Come and see", "Read and believe", "Follow and learn", "Ask and receive"]'::jsonb, 'Come and see', 'Philip said "Come and see" in John 1:46.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Philip tell Nathanael when he invited him to see Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 1, 'What does John 1:1 say was "in the beginning"?', '["The Word", "The Spirit", "The Law", "The Gospel"]'::jsonb, 'The Word', 'John 1:1 says "In the beginning was the Word."'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does John 1:1 say was "in the beginning"?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 1, 'What new name did Jesus give Simon?', '["Peter (Cephas)", "Paul (a common guess, but not what John says here)", "James", "Stephen"]'::jsonb, 'Peter (Cephas)', 'Jesus said "You shall be called Cephas" (which means Peter) in John 1:42.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'What new name did Jesus give Simon?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 1, 'What title did John use to describe Jesus in John 1:29?', '["Lamb of God", "King of Israel", "Son of David", "Light of the World"]'::jsonb, 'Lamb of God', '"Behold, the Lamb of God, who takes away the sin of the world!" (John 1:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'What title did John use to describe Jesus in John 1:29?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 1, 'Where was "the Word" in the beginning, according to John 1:1?', '["With God", "In heaven", "In Israel", "In the temple"]'::jsonb, 'With God', '"In the beginning was the Word, and the Word was with God."'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'Where was "the Word" in the beginning, according to John 1:1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 1, 'Who did Jesus see coming toward him and called "Lamb of God"?', '["Jesus himself saw John come to be baptized", "None — John spoke about Jesus", "Peter came first", "Andrew arrived"]'::jsonb, 'None — John spoke about Jesus', 'John the Baptist said "Behold, the Lamb of God" when he saw Jesus coming toward him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who did Jesus see coming toward him and called "Lamb of God"?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 2, 'In John 1, John the Baptist described himself as "the voice of one crying in the wilderness." What did he say to do?', '["Make straight the way of the Lord", "Repent of your sins", "Follow the Lamb (a common guess, but not what John says here)", "Come to the temple"]'::jsonb, 'Make straight the way of the Lord', 'John quoted Isaiah: "Make straight the way of the Lord" (John 1:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'In John 1, John the Baptist described himself as "the voice of one crying in the wilderness." What did he say to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 2, 'John 1:12 says that to all who received Jesus, he gave the right to become what?', '["Children of God", "Disciples", "Apostles", "Priests (a common guess, but not what John says here)"]'::jsonb, 'Children of God', '"To all who received him, he gave the right to become children of God" (John 1:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'John 1:12 says that to all who received Jesus, he gave the right to become what?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 2, 'John 1:17 contrasts the law given through Moses with grace and truth that came through whom?', '["Jesus Christ", "The Holy Spirit", "The Prophets", "John the Baptist"]'::jsonb, 'Jesus Christ', '"Grace and truth came through Jesus Christ" (John 1:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'John 1:17 contrasts the law given through Moses with grace and truth that came through whom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 2, 'The Word was the light of men. What did John 1:5 say about the darkness?', '["The darkness has not overcome it", "The darkness fled from it (a common guess, but not what John says here)", "The darkness did not exist", "The darkness became light"]'::jsonb, 'The darkness has not overcome it', '"The light shines in the darkness, and the darkness has not overcome it" (John 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'The Word was the light of men. What did John 1:5 say about the darkness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 2, 'What did Jesus promise Nathanael he would see in John 1:51?', '["Angels ascending and descending on the Son of Man", "The temple rebuilt", "Water turned to wine", "The resurrection (a common guess, but not what John says here)"]'::jsonb, 'Angels ascending and descending on the Son of Man', '"You will see heaven opened, and the angels of God ascending and descending on the Son of Man" (John 1:51).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus promise Nathanael he would see in John 1:51?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 2, 'What did Nathanael call Jesus after Jesus said he had seen him under the fig tree?', '["Rabbi, Son of God, King of Israel", "Teacher, Messiah, Prophet", "Lord, Savior, King (a common guess, but not what John says here)", "The Word, The Light, The Way"]'::jsonb, 'Rabbi, Son of God, King of Israel', 'Nathanael answered "Rabbi, you are the Son of God! You are the King of Israel!" (John 1:49).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Nathanael call Jesus after Jesus said he had seen him under the fig tree?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 2, 'What did Nathanael say about Nazareth when Philip told him about Jesus?', '["Can anything good come out of Nazareth?", "Nazareth is too far (a common guess, but not what John says here)", "I know no one from Nazareth", "Nazareth is not in the prophecy"]'::jsonb, 'Can anything good come out of Nazareth?', 'Nathanael said "Can anything good come out of Nazareth?" in John 1:46.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Nathanael say about Nazareth when Philip told him about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 2, 'When Andrew found his brother Simon and said "We have found the Messiah," what does "Messiah" mean according to John 1:41?', '["Christ", "Savior", "Lord", "Teacher"]'::jsonb, 'Christ', '"We have found the Messiah (which means Christ)" (John 1:41).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'When Andrew found his brother Simon and said "We have found the Messiah," what does "Messiah" mean according to John 1:41?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 2, 'Who did John say was coming after him whose sandal strap he was not worthy to untie?', '["Jesus", "The Messiah (unspecified)", "Elijah", "The Prophet"]'::jsonb, 'Jesus', 'John 1:27 says "he who comes after me, the strap of whose sandal I am not worthy to untie."'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'Who did John say was coming after him whose sandal strap he was not worthy to untie?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 2, 'Who was the first person Jesus called as a disciple in John 1?', '["Andrew", "Peter", "Philip", "Nathanael"]'::jsonb, 'Andrew', 'Andrew, one of the two who heard John and followed Jesus, is named first (John 1:40).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'Who was the first person Jesus called as a disciple in John 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 3, 'According to John 1:16, from whose fullness did believers receive grace?', '["From John the Baptist''s baptism", "From the temple", "From Moses alone", "From the Word''s fullness"]'::jsonb, 'From the Word''s fullness', '"From his fullness we have all received, grace upon grace" (John 1:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to John 1:16, from whose fullness did believers receive grace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 3, 'How does John 1:13 describe those who became children of God?', '["Born not of blood, nor of the will of the flesh, nor of the will of man, but of God", "Born of the Spirit alone", "Born of their own faith (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Born through the apostles'' teaching"]'::jsonb, 'Born not of blood, nor of the will of the flesh, nor of the will of man, but of God', 'John 1:13 describes spiritual rebirth as entirely from God, not human effort.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does John 1:13 describe those who became children of God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 3, 'In John 1, the Word came to "his own." What was their response?', '["His own people did not receive him", "His own people welcomed him", "His own people worshiped him", "His own people were afraid (a common guess, but not what John says here)"]'::jsonb, 'His own people did not receive him', '"He came to his own, and his own people did not receive him" (John 1:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'In John 1, the Word came to "his own." What was their response?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 3, 'In John 1, who among the disciples was "with Jesus and stayed with him" first?', '["Andrew and another unnamed disciple", "Peter and John (a common guess, but not what John says here)", "Philip and Nathanael", "James and Thomas"]'::jsonb, 'Andrew and another unnamed disciple', 'Andrew and an unnamed disciple (likely the author John) first followed Jesus (John 1:35–40).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'In John 1, who among the disciples was "with Jesus and stayed with him" first?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 3, 'John 1 says the world was made through the Word. How did the world respond?', '["It did not know him", "It worshiped him", "It feared him", "It rejected him with violence"]'::jsonb, 'It did not know him', '"He was in the world… yet the world did not know him" (John 1:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'John 1 says the world was made through the Word. How did the world respond?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 3, 'John 1:14 says the Word became flesh and dwelt among us. What did the disciples behold?', '["His glory", "Angels only", "The temple veil", "Only his humility"]'::jsonb, 'His glory', 'They saw his glory, glory as of the only Son from the Father (John 1:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'John 1:14 says the Word became flesh and dwelt among us. What did the disciples behold?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 3, 'John 1:16 says "from his fullness we have all received grace upon grace." What does this phrase suggest?', '["Abundant, overflowing grace", "A single act of grace (a common guess, but not what John says here)", "Grace equal to our sin", "Grace earned by works"]'::jsonb, 'Abundant, overflowing grace', '"Grace upon grace" (or "grace for grace") suggests an inexhaustible supply of grace.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'John 1:16 says "from his fullness we have all received grace upon grace." What does this phrase suggest?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 3, 'What contrast does John 1:17 draw between Moses and Jesus Christ?', '["The law was given through Moses; grace and truth came through Jesus Christ", "Moses gave grace; Jesus gave law", "Both gave only law (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Neither Moses nor Jesus gave law"]'::jsonb, 'The law was given through Moses; grace and truth came through Jesus Christ', 'Grace and truth came through Jesus Christ (John 1:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What contrast does John 1:17 draw between Moses and Jesus Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 3, 'What did John the Baptist say he was not worthy to do regarding the one coming after him?', '["Baptize him (a common guess, but not what John says here)", "Sit at his right hand", "Name him publicly", "Untie the strap of his sandal"]'::jsonb, 'Untie the strap of his sandal', 'John said he was not worthy to untie the strap of his sandal (John 1:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did John the Baptist say he was not worthy to do regarding the one coming after him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 3, 'Who is said in John 1:18 to have made the Father known?', '["Elijah", "The only God, who is at the Father''s side", "Moses (a common guess, but not what John says here)", "The high priest"]'::jsonb, 'The only God, who is at the Father''s side', 'The only God, who is at the Father''s side, has made him known (John 1:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who is said in John 1:18 to have made the Father known?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 4, 'How does "the Word was God" (John 1:1) relate to "the Word was with God"?', '["It distinguishes persons within the Godhead while affirming full deity of the Word", "It means two separate gods", "It contradicts monotheism (a common guess, but not what John says here) (does not match John’s wording in this verse)", "It refers only to a human messenger"]'::jsonb, 'It distinguishes persons within the Godhead while affirming full deity of the Word', 'The Word is distinct from the Father yet fully God.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does "the Word was God" (John 1:1) relate to "the Word was with God"?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 4, 'In what way does Nathanael''s confession ("Son of God… King of Israel") connect with the rest of John''s Gospel?', '["It previews the two main titles John uses for Jesus throughout", "It was just politeness (a common guess, but not what John says here)", "It was quickly retracted", "It referred only to Jesus'' earthly kingship"]'::jsonb, 'It previews the two main titles John uses for Jesus throughout', 'John''s Gospel builds toward these two titles: divine Son and royal Messiah.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'In what way does Nathanael''s confession ("Son of God… King of Israel") connect with the rest of John''s Gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 4, 'Jesus'' statement to Nathanael about "angels ascending and descending on the Son of Man" echoes which Old Testament event?', '["Jacob''s ladder at Bethel", "Moses at the burning bush", "Elijah''s chariot of fire", "Isaiah''s vision of the throne"]'::jsonb, 'Jacob''s ladder at Bethel', 'Genesis 28:12 describes angels ascending and descending; Jesus identifies himself as the new "Bethel" (house of God).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Jesus'' statement to Nathanael about "angels ascending and descending on the Son of Man" echoes which Old Testament event?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 4, 'John 1 says John came as a witness to the light "so that all might believe through him." Why does John clarify that John was NOT the light?', '["To prevent people from mistaking John for the Messiah", "Because John sinned (a common guess, but not what John says here)", "Because John came before creation", "Because John was afraid"]'::jsonb, 'To prevent people from mistaking John for the Messiah', 'John 1:8 clarifies the Baptist''s role: he was a witness, not the light itself.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'John 1 says John came as a witness to the light "so that all might believe through him." Why does John clarify that John was NOT the light?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 4, 'John 1:3 states "without him was not any thing made that was made." How does this relate to the claim that the Word was God?', '["It affirms the Word''s divine creative power, supporting his deity", "It means the Word was a lesser deity", "It only applies to earthly things (a common guess, but not what John says here)", "It contradicts the creation account in Genesis"]'::jsonb, 'It affirms the Word''s divine creative power, supporting his deity', 'Universal creative agency belongs only to God; the Word being the agent of all creation confirms his deity.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'John 1:3 states "without him was not any thing made that was made." How does this relate to the claim that the Word was God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 4, 'The Pharisees questioned John about his identity and baptizing. What right did they imply was needed to baptize?', '["Being the Christ, Elijah, or the Prophet", "Being a Levite (a common guess, but not what John says here)", "Having a temple commission", "Being sent by the Sanhedrin"]'::jsonb, 'Being the Christ, Elijah, or the Prophet', 'They asked "Why then are you baptizing, if you are neither the Christ, nor Elijah, nor the Prophet?" (John 1:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'The Pharisees questioned John about his identity and baptizing. What right did they imply was needed to baptize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 4, 'What does the Baptist''s denial sequence (not Christ, Elijah, the Prophet) accomplish narratively?', '["It proves the Baptist lied (a common guess, but not what John says here) (does not match John’s wording in this verse)", "It replaces Jesus with the Prophet", "It shows no Messiah is expected", "It clears false identities so Jesus can be recognized as the Lamb and Son"]'::jsonb, 'It clears false identities so Jesus can be recognized as the Lamb and Son', 'John eliminates wrong categories pointing to Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does the Baptist''s denial sequence (not Christ, Elijah, the Prophet) accomplish narratively?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 4, 'What is the significance of "we have seen his glory" in connection with the Exodus?', '["It denies the Old Testament (a common guess, but not what John says here) (does not match John’s wording in this verse)", "It refers only to future glory", "Glory language recalls the tabernacle; Jesus is the dwelling of God among us", "It means only angels saw him"]'::jsonb, 'Glory language recalls the tabernacle; Jesus is the dwelling of God among us', 'The Word tabernacled among us as God''s presence once dwelt with Israel.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What is the significance of "we have seen his glory" in connection with the Exodus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 4, 'Why does John stress that the Baptist was not the light (John 1:8)?', '["So no one would confuse the witness with the Messiah, who is the true light", "To criticize the Baptist (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Because light is only a metaphor with no person", "Because the Baptist was sinful"]'::jsonb, 'So no one would confuse the witness with the Messiah, who is the true light', 'He was not the light, but came to bear witness about the light (John 1:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does John stress that the Baptist was not the light (John 1:8)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 4, 'Why might John begin with "In the beginning" echoing Genesis?', '["To introduce John the Baptist first", "To discuss only chronology", "To present Jesus as the agent of creation and of the new creation", "To replace Genesis (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'To present Jesus as the agent of creation and of the new creation', 'Echoing Genesis 1:1 frames Jesus as central to creation and redemption.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why might John begin with "In the beginning" echoing Genesis?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 5, 'Discuss the Greek term logos as John uses it. What primary OT and Hellenistic backgrounds inform it?', '["Only human speech (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Only Greek philosophy with no Jewish input", "A title for Caesar only", "God''s creative word and wisdom; John''s readers would hear both divine agency and personhood"]'::jsonb, 'God''s creative word and wisdom; John''s readers would hear both divine agency and personhood', 'Logos connects to God''s powerful speech in creation and wisdom traditions.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'Discuss the Greek term logos as John uses it. What primary OT and Hellenistic backgrounds inform it?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 5, 'Grace and truth in John 1:14,17 echo the Hebrew pair hesed and emet. Why is this significant?', '["It ties Jesus to the covenant character of God revealed to Moses, showing he fulfills the OT revelation", "It is a Greek philosophical concept only", "It means Jesus replaces the OT entirely", "It refers only to gentile audiences (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'It ties Jesus to the covenant character of God revealed to Moses, showing he fulfills the OT revelation', 'Hesed (steadfast love/grace) and emet (faithfulness/truth) describe YHWH''s character in Exodus 34:6; Jesus embodies the same.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'Grace and truth in John 1:14,17 echo the Hebrew pair hesed and emet. Why is this significant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 5, 'How does John 1:13 guard the doctrine of regeneration?', '["Birth as God''s children is not by human blood, flesh, or will, but by God''s will", "It attributes birth to the synagogue", "It says birth is only physical", "It denies new birth (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'Birth as God''s children is not by human blood, flesh, or will, but by God''s will', 'Spiritual birth is wholly from God (John 1:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does John 1:13 guard the doctrine of regeneration?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 5, 'How does the Lamb of God title in John 1:29 connect to Passover and Isaiah''s suffering servant?', '["It is only a nickname (a common guess, but not what John says here) (does not match John’s wording in this verse)", "It evokes sacrificial atonement and the Lord''s servant who bears sin", "It refers only to a gentle animal", "It cancels Old Testament sacrifice"]'::jsonb, 'It evokes sacrificial atonement and the Lord''s servant who bears sin', 'Lamb imagery carries OT sacrificial and servant strands.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does the Lamb of God title in John 1:29 connect to Passover and Isaiah''s suffering servant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 5, 'How does the structure of John 1:1 ("In the beginning was the Word") deliberately echo Genesis 1:1?', '["Both open with the same phrase, presenting Jesus as the agent of the new creation, parallel to the first creation", "It is a coincidence (a common guess, but not what John says here) (does not match John’s wording in this verse) (a common guess, but not what John says here)", "John is quoting Genesis to show the law is superseded", "It only shows Jesus pre-existed Abraham"]'::jsonb, 'Both open with the same phrase, presenting Jesus as the agent of the new creation, parallel to the first creation', 'John intentionally mirrors Genesis 1:1 to present the ministry of Jesus as a new creation story.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does the structure of John 1:1 ("In the beginning was the Word") deliberately echo Genesis 1:1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 5, 'John 1:18 says "No one has ever seen God; the only God, who is at the Father''s side, he has made him known." How does this verse summarize John''s Prologue?', '["The incarnate Word uniquely reveals the invisible God to humanity", "God is unknowable (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Only John the Baptist has seen God", "This is about OT prophets"]'::jsonb, 'The incarnate Word uniquely reveals the invisible God to humanity', 'The Prologue''s purpose is to show that the eternal Word became flesh precisely to make the unseen God known.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'John 1:18 says "No one has ever seen God; the only God, who is at the Father''s side, he has made him known." How does this verse summarize John''s Prologue?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 5, 'The phrase "the Word was with God" uses the Greek preposition pros. What nuance does this add beyond mere coexistence?', '["Intimate face-to-face relationship, not just spatial proximity", "Physical location in heaven", "Equality of power (a common guess, but not what John says here)", "Temporal sequence"]'::jsonb, 'Intimate face-to-face relationship, not just spatial proximity', 'Pros implies a dynamic, face-to-face relationship, communicating the deep relational intimacy within the Trinity.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'The phrase "the Word was with God" uses the Greek preposition pros. What nuance does this add beyond mere coexistence?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 5, 'What ecclesiological hint appears in Peter being renamed Cephas (rock)?', '["It means Peter replaces Jesus", "It refers to geology only", "It is a joke (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Though developed later, naming anticipates Peter''s foundational role among disciples"]'::jsonb, 'Though developed later, naming anticipates Peter''s foundational role among disciples', 'Jesus renames Simon as part of calling his community (John 1:42).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What ecclesiological hint appears in Peter being renamed Cephas (rock)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 5, 'What is the theological significance of John saying "we have beheld his glory" (v.14) using the first person plural?', '["It grounds the Prologue''s theology in eyewitness testimony, giving historical credibility to the claims", "It refers to the angels (a common guess, but not what John says here) (does not match John’s wording in this verse)", "It means all humanity saw", "It contradicts the claim no one has seen God"]'::jsonb, 'It grounds the Prologue''s theology in eyewitness testimony, giving historical credibility to the claims', 'The "we" signals the apostolic community''s direct experience, tying the lofty Prologue to real historical witness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the theological significance of John saying "we have beheld his glory" (v.14) using the first person plural?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 1, 5, 'What role does eyewitness language ("we have seen") play in John''s epistemology of faith?', '["It means only one apostle saw", "It is purely mythic", "It rejects history (a common guess, but not what John says here) (does not match John’s wording in this verse)", "It ties theological claims to apostolic testimony — faith rests on witnessed revelation"]'::jsonb, 'It ties theological claims to apostolic testimony — faith rests on witnessed revelation', 'The Prologue grounds claims in witness (John 1:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What role does eyewitness language ("we have seen") play in John''s epistemology of faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 1, 'After the resurrection, what did the disciples remember about the temple incident?', '["They remembered Jesus''s words and believed the Scripture", "They were still confused", "They asked Jesus to explain", "They forgot it entirely (a common guess, but not what John says here)"]'::jsonb, 'They remembered Jesus''s words and believed the Scripture', 'John 2:22 says after he was raised they "remembered… and they believed the Scripture."'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'After the resurrection, what did the disciples remember about the temple incident?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 1, 'After the temple cleansing, what sign did the Jews ask Jesus to show to prove his authority?', '["A sign", "His credentials", "A miracle from God", "His lineage"]'::jsonb, 'A sign', '"What sign do you show us for doing these things?" (John 2:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'After the temple cleansing, what sign did the Jews ask Jesus to show to prove his authority?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 1, 'At what event did Jesus perform his first miracle in John 2?', '["A wedding in Cana", "A feast in Jerusalem", "A synagogue in Nazareth", "A gathering in Capernaum"]'::jsonb, 'A wedding in Cana', 'The first sign was at a wedding in Cana of Galilee (John 2:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'At what event did Jesus perform his first miracle in John 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 1, 'How many stone water jars were filled at the wedding in Cana?', '["Six", "Three", "Seven", "Twelve"]'::jsonb, 'Six', '"Now there were six stone water jars there…" (John 2:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'How many stone water jars were filled at the wedding in Cana?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 1, 'What did Jesus do in the temple that shocked everyone?', '["He drove out the money changers and those selling animals", "He healed many people (a common guess, but not what John says here)", "He preached for hours", "He refused to pay the temple tax"]'::jsonb, 'He drove out the money changers and those selling animals', 'Jesus made a whip and drove out those selling animals, and overturned the money changers'' tables (John 2:14–15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus do in the temple that shocked everyone?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 1, 'What did Jesus say about his body in John 2:19?', '["Destroy this temple, and in three days I will raise it up", "My body is the bread of life", "My flesh is given for the world", "I am the living temple (a common guess, but not what John says here)"]'::jsonb, 'Destroy this temple, and in three days I will raise it up', 'John 2:19 records Jesus saying "Destroy this temple, and in three days I will raise it up."'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say about his body in John 2:19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 1, 'What did Jesus turn water into at the wedding?', '["Wine", "Bread", "Oil", "Healing water"]'::jsonb, 'Wine', 'Jesus turned the water into wine (John 2:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus turn water into at the wedding?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 1, 'What did the master of the feast notice about the good wine at Cana?', '["It was saved until last, unlike custom", "It was brought from far away", "It had been blessed by a rabbi", "It appeared from thin air (a common guess, but not what John says here)"]'::jsonb, 'It was saved until last, unlike custom', 'He said "You have kept the good wine until now" (John 2:10), noting the reversal of the usual custom.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the master of the feast notice about the good wine at Cana?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 1, 'What problem arose at the wedding in Cana?', '["They ran out of wine", "The guests stopped coming", "The food was gone", "A storm arose"]'::jsonb, 'They ran out of wine', 'Mary told Jesus "They have no wine" (John 2:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'What problem arose at the wedding in Cana?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 1, 'Who told Jesus at the wedding "They have no wine"?', '["His mother Mary", "A servant", "A disciple", "The master of the feast"]'::jsonb, 'His mother Mary', 'Mary brought the problem to Jesus (John 2:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who told Jesus at the wedding "They have no wine"?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 2, 'After the Passover feast, why didn''t Jesus entrust himself to those who believed in him?', '["He knew all people and did not need their testimony about man", "He was testing their faith (a common guess, but not what John says here)", "He was still teaching them", "The Pharisees were watching"]'::jsonb, 'He knew all people and did not need their testimony about man', '"He knew all people… he himself knew what was in man" (John 2:24–25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'After the Passover feast, why didn''t Jesus entrust himself to those who believed in him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 2, 'How much water did the six stone jars hold in total?', '["120–180 gallons (20–30 each)", "30 gallons total", "A few cups each (a common guess, but not what John says here)", "An unknown amount"]'::jsonb, '120–180 gallons (20–30 each)', 'Each jar held 20–30 gallons; six jars = 120–180 gallons of wine.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'How much water did the six stone jars hold in total?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 2, 'In John 2:21, what temple was Jesus actually talking about?', '["The temple of his body", "The Jerusalem temple", "A heavenly temple (a common guess, but not what John says here)", "A metaphorical temple"]'::jsonb, 'The temple of his body', '"He was speaking about the temple of his body" (John 2:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'In John 2:21, what temple was Jesus actually talking about?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 2, 'What did Jesus say when he responded to his mother at the wedding?', '["Woman, what does this have to do with me? My hour has not yet come.", "Do not worry, I will help.", "Let me pray first. (a common guess, but not what John says here) (does not match John’s wording in this verse)", "This is not the right time or place."]'::jsonb, 'Woman, what does this have to do with me? My hour has not yet come.', 'John 2:4 records Jesus''s initial response to Mary.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say when he responded to his mother at the wedding?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 2, 'What does John call the miracle at Cana?', '["The first of his signs", "A wonder", "A proof (a common guess, but not what John says here)", "A great work"]'::jsonb, 'The first of his signs', '"This, the first of his signs, Jesus did at Cana in Galilee" (John 2:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does John call the miracle at Cana?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 2, 'What was the result of the first sign at Cana on the disciples?', '["They believed in him", "They were afraid (a common guess, but not what John says here)", "They questioned him", "They told no one"]'::jsonb, 'They believed in him', '"His disciples believed in him" (John 2:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was the result of the first sign at Cana on the disciples?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 2, 'When was the Passover feast that Jesus attended in John 2?', '["At the start of his ministry (first Passover in John)", "At the end of his ministry", "After the resurrection", "Before his baptism (a common guess, but not what John says here)"]'::jsonb, 'At the start of his ministry (first Passover in John)', 'This Passover in John 2 is the first of three Passovers in John''s Gospel.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'When was the Passover feast that Jesus attended in John 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 2, 'Who told the servants at the wedding "Do whatever he tells you"?', '["Mary", "The master of the feast", "A disciple", "Jesus himself"]'::jsonb, 'Mary', 'Mary told the servants "Do whatever he tells you" (John 2:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'Who told the servants at the wedding "Do whatever he tells you"?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 2, 'Why did the Jews think it was impossible for Jesus to rebuild the temple in three days?', '["It took 46 years to build", "It was God''s house", "The Romans controlled it", "The priests would not allow it"]'::jsonb, 'It took 46 years to build', '"It has taken forty-six years to build this temple" (John 2:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why did the Jews think it was impossible for Jesus to rebuild the temple in three days?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 2, 'Why was Jesus angry at the temple sellers and money changers?', '["They had turned his Father''s house into a house of trade", "They were cheating people (a common guess, but not what John says here)", "They were working on the Sabbath", "They refused to pay taxes"]'::jsonb, 'They had turned his Father''s house into a house of trade', '"Stop making my Father''s house a house of trade" (John 2:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why was Jesus angry at the temple sellers and money changers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 3, 'How does the abundance of wine at Cana (120–180 gallons) serve as a sign pointing to Jesus''s identity?', '["It demonstrates the lavish provision of the messianic age prophesied in Amos 9:13–14", "It was just a practical solution (a common guess, but not what John says here) (does not match John’s wording in this verse)", "It showed Jesus was a good guest", "It was meant to embarrass the host"]'::jsonb, 'It demonstrates the lavish provision of the messianic age prophesied in Amos 9:13–14', 'OT prophets linked wine abundance with the coming kingdom; Jesus''s sign signals the arrival of the new age.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does the abundance of wine at Cana (120–180 gallons) serve as a sign pointing to Jesus''s identity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 3, 'How does the temple cleansing relate to Jesus'' claim about raising the temple in three days?', '["It means Herod''s building project", "His body is the true temple; his resurrection will prove his authority over the old system", "It denies resurrection (a common guess, but not what John says here) (does not match John’s wording in this verse)", "It is about destroying Jerusalem only"]'::jsonb, 'His body is the true temple; his resurrection will prove his authority over the old system', 'Jesus spoke of the temple of his body (John 2:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does the temple cleansing relate to Jesus'' claim about raising the temple in three days?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 3, 'How is Mary portrayed when she tells Jesus, "They have no wine"?', '["As commanding Jesus (a common guess, but not what John says here) (does not match John’s wording in this verse)", "As opposing the wedding", "As unaware of Jesus'' identity", "As bringing a need to Jesus, while his \"hour\" remains his Father''s timing"]'::jsonb, 'As bringing a need to Jesus, while his "hour" remains his Father''s timing', 'Mary presents the need; Jesus responds on his own terms (John 2:3–4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'How is Mary portrayed when she tells Jesus, "They have no wine"?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 3, 'Many believed in Jesus at the Passover feast in Jerusalem "when they saw the signs he was doing." Why did Jesus NOT trust himself to them?', '["Their belief was based only on signs, not a deeper understanding", "They were Pharisees (a common guess, but not what John says here)", "He was testing them", "He had not yet taught enough"]'::jsonb, 'Their belief was based only on signs, not a deeper understanding', 'John distinguishes between true saving faith and a superficial belief based merely on miracles (cf. John 6:14–15, 26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Many believed in Jesus at the Passover feast in Jerusalem "when they saw the signs he was doing." Why did Jesus NOT trust himself to them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 3, 'What connection does the disciples'' later remembrance (John 2:22) show about John''s Gospel?', '["The resurrection gives them interpretive perspective to understand Jesus''s earlier words", "They had poor memories (a common guess, but not what John says here) (does not match John’s wording in this verse)", "John wrote this before the resurrection", "Jesus explained it to them later"]'::jsonb, 'The resurrection gives them interpretive perspective to understand Jesus''s earlier words', 'Post-resurrection understanding is a key theme in John; the Spirit of truth leads them into all truth (John 16:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What connection does the disciples'' later remembrance (John 2:22) show about John''s Gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 3, 'What does John mean that Jesus "manifested his glory" at Cana (John 2:11)?', '["The miracle revealed Jesus'' divine identity and power to his disciples", "It was only a party trick (a common guess, but not what John says here)", "John denies signs reveal anything", "Glory means only human fame"]'::jsonb, 'The miracle revealed Jesus'' divine identity and power to his disciples', 'The first sign manifested his glory so disciples believed (John 2:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does John mean that Jesus "manifested his glory" at Cana (John 2:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 3, 'What does the master of the feast not knowing where the wine came from illustrate?', '["Disciples were ignorant", "The master was dishonest", "Jesus'' work can be unrecognized by authorities while disciples know the source", "Wine is irrelevant (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'Jesus'' work can be unrecognized by authorities while disciples know the source', 'The servants knew; the master did not — selective knowledge in the story (John 2:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the master of the feast not knowing where the wine came from illustrate?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 3, 'What does the stone water jars being used for "Jewish rites of purification" add to the meaning of Jesus''s miracle?', '["Jesus transforms the old purification system into the new wine of the gospel", "It is just a practical detail (a common guess, but not what John says here) (does not match John’s wording in this verse)", "The jars were the only containers available", "It shows Jesus respected Jewish law"]'::jsonb, 'Jesus transforms the old purification system into the new wine of the gospel', 'The replacement of purification water with wine signals that Jesus brings a new and better covenant.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the stone water jars being used for "Jewish rites of purification" add to the meaning of Jesus''s miracle?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 3, 'What is the theological significance of the "hour" Jesus mentions in John 2:4?', '["It refers to his coming death and glorification, a theme throughout John", "It just means he is busy (a common guess, but not what John says here) (does not match John’s wording in this verse)", "It refers to the Sabbath", "It means the wedding feast was over"]'::jsonb, 'It refers to his coming death and glorification, a theme throughout John', 'In John, "the hour" consistently refers to the passion and glorification of Jesus (cf. 7:30; 12:23; 17:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the theological significance of the "hour" Jesus mentions in John 2:4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 3, 'Why does John say Jesus did not entrust himself to those who believed because he knew all people?', '["He distrusted everyone equally", "He did not know hearts (a common guess, but not what John says here)", "He wanted fewer followers", "True faith must be deeper than signs — Jesus discerns genuine trust"]'::jsonb, 'True faith must be deeper than signs — Jesus discerns genuine trust', 'He knew what was in man — superficial faith is not enough (John 2:24–25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does John say Jesus did not entrust himself to those who believed because he knew all people?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 4, 'How does John 2 connect Jesus'' zeal for his Father''s house to Psalm 69?', '["The disciples invented the connection", "Psalm 69 is unrelated (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Zeal for God''s house consumes him — Scripture is fulfilled in his cleansing action", "Jesus misquoted Scripture"]'::jsonb, 'Zeal for God''s house consumes him — Scripture is fulfilled in his cleansing action', 'His disciples remembered Scripture after resurrection (John 2:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does John 2 connect Jesus'' zeal for his Father''s house to Psalm 69?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 4, 'How does John''s placement of the temple cleansing (early in Jesus''s ministry) differ from the Synoptic Gospels?', '["The Synoptics place it at the end; this may be a different event or John has a theological rather than strict chronological arrangement", "John and the Synoptics are contradictory (a common guess, but not what John says here) (does not match John’s wording in this verse) (a common guess, but not what John says here)", "The Synoptics never mention the temple cleansing", "Both place it at Passover before the crucifixion"]'::jsonb, 'The Synoptics place it at the end; this may be a different event or John has a theological rather than strict chronological arrangement', 'This is a classic synoptic problem; scholars debate whether there were two cleansings or John rearranged events thematically.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does John''s placement of the temple cleansing (early in Jesus''s ministry) differ from the Synoptic Gospels?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 4, 'How does the master of the feast not knowing where the wine came from function in the Cana story?', '["It proves the master was dishonest", "It means the miracle was fake (a common guess, but not what John says here) (does not match John’s wording in this verse)", "It shows only Jesus drank the wine", "It contrasts human ignorance with the servants'' knowledge — disciples see the source of the sign"]'::jsonb, 'It contrasts human ignorance with the servants'' knowledge — disciples see the source of the sign', 'The servants who had drawn the water knew; the master did not (John 2:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the master of the feast not knowing where the wine came from function in the Cana story?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 4, 'How does the sign at Cana function as a "sign" in Johannine theology?', '["Signs are ends in themselves", "Signs replace preaching", "It points beyond itself to Jesus'' identity and evokes faith", "John rejects signs (a common guess, but not what John says here)"]'::jsonb, 'It points beyond itself to Jesus'' identity and evokes faith', 'This, the first of his signs, manifested his glory (John 2:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the sign at Cana function as a "sign" in Johannine theology?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 4, 'How does the wedding at Cana and the temple cleansing together function as an opening statement in John?', '["Together they present Jesus as the one who transforms old institutions (purification, temple) and brings the new wine of the messianic age", "They are unrelated stories (a common guess, but not what John says here) (does not match John’s wording in this verse) (a common guess, but not what John says here)", "They both took place in Jerusalem", "They both show Jesus''s power over nature"]'::jsonb, 'Together they present Jesus as the one who transforms old institutions (purification, temple) and brings the new wine of the messianic age', 'These opening signs bracket the first week of Jesus''s ministry as a programmatic statement about new covenant transformation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the wedding at Cana and the temple cleansing together function as an opening statement in John?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 4, 'The disciples connected the temple saying to Psalm 69:9. What does this retrospective interpretation suggest?', '["OT Scripture shaped how the disciples understood and narrated Jesus''s actions", "They were confused at the time (a common guess, but not what John says here) (does not match John’s wording in this verse)", "This was added later without connection to events", "The disciples had memorized all the Psalms"]'::jsonb, 'OT Scripture shaped how the disciples understood and narrated Jesus''s actions', 'John frequently shows the disciples understanding events through OT fulfillment after the resurrection.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'The disciples connected the temple saying to Psalm 69:9. What does this retrospective interpretation suggest?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 4, 'What does "destroy this temple" reveal about Jewish misunderstanding of Jesus'' mission?', '["They took him literally about Herod''s building, missing his bodily resurrection", "They cared only about money", "They understood perfectly (a common guess, but not what John says here) (does not match John’s wording in this verse)", "They wanted to help build"]'::jsonb, 'They took him literally about Herod''s building, missing his bodily resurrection', 'They spoke of Herod''s temple; Jesus meant his body (John 2:20–21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does "destroy this temple" reveal about Jewish misunderstanding of Jesus'' mission?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 4, 'What theological pattern appears in Jesus'' first sign being at a wedding?', '["Marriage is the main topic of John", "Jesus opposed weddings", "Signs are random (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Messianic joy and new covenant blessing — wine and feast imagery of the kingdom"]'::jsonb, 'Messianic joy and new covenant blessing — wine and feast imagery of the kingdom', 'Cana begins a series of signs revealing who Jesus is.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'What theological pattern appears in Jesus'' first sign being at a wedding?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 4, 'Why does John mention the disciples later remembered Jesus'' words?', '["It means disciples forgot everything", "Memory is unimportant in John", "Only enemies remembered (a common guess, but not what John says here) (does not match John’s wording in this verse)", "It shows progressive understanding — resurrection clarifies his words"]'::jsonb, 'It shows progressive understanding — resurrection clarifies his words', 'After he was raised, they remembered (John 2:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does John mention the disciples later remembered Jesus'' words?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 4, 'Zeal for God''s house will consume me (John 2:17) is a quote from which Psalm?', '["Psalm 69", "Psalm 22", "Psalm 118", "Psalm 2"]'::jsonb, 'Psalm 69', 'John 2:17 quotes Psalm 69:9, connecting Jesus''s action to the suffering servant''s zeal.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Zeal for God''s house will consume me (John 2:17) is a quote from which Psalm?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 5, 'How does John 2 prepare the reader for recurring conflict over Jesus'' identity in later chapters?', '["Only Romans conflict with Jesus", "Conflict disappears after ch. 2", "Questions of authority, temple, and signs surface early and deepen", "The chapter is isolated (a common guess, but not what John says here)"]'::jsonb, 'Questions of authority, temple, and signs surface early and deepen', 'The Jews ask for a sign; tension over the temple begins (John 2:18–20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does John 2 prepare the reader for recurring conflict over Jesus'' identity in later chapters?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 5, 'How does John 2:11 connect belief and signs?', '["Signs replace faith (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Only crowds believe", "Belief is unrelated to signs", "The disciples believed because the sign manifested Jesus'' glory — faith tied to revelation"]'::jsonb, 'The disciples believed because the sign manifested Jesus'' glory — faith tied to revelation', 'His disciples believed in him (John 2:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does John 2:11 connect belief and signs?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 5, 'How might the abundance of wine (120–180 gallons) function symbolically?', '["It means little wine was needed", "It signals extravagant grace — the kingdom''s joy exceeds expectations", "It is a math error (a common guess, but not what John says here) (does not match John’s wording in this verse)", "It encourages drunkenness"]'::jsonb, 'It signals extravagant grace — the kingdom''s joy exceeds expectations', 'Extravagant quantity fits messianic banquet imagery.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How might the abundance of wine (120–180 gallons) function symbolically?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 5, 'If Jesus''s body is the true temple (2:21), what are the implications for post-resurrection worship according to John''s theology?', '["Access to God is now through the risen Christ, not a physical building; worship is in spirit and truth (cf. 4:21–24)", "Physical temples are still necessary", "This only applies to Jewish Christians", "The resurrection ended all worship (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'Access to God is now through the risen Christ, not a physical building; worship is in spirit and truth (cf. 4:21–24)', 'The replacement of the temple by Jesus''s body points forward to worship "in spirit and truth" (John 4:23–24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'If Jesus''s body is the true temple (2:21), what are the implications for post-resurrection worship according to John''s theology?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 5, 'In what sense is the temple cleansing a public act unlike the private Cana sign?', '["It pleased the chief priests", "It confronts the religious establishment and claims authority over sacred space", "It avoided Jerusalem", "It was secret (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'It confronts the religious establishment and claims authority over sacred space', 'Jesus drove out sellers publicly in the temple (John 2:14–15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'In what sense is the temple cleansing a public act unlike the private Cana sign?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 5, 'John 2:11 says the sign "manifested his glory." How does this connect the Cana miracle to the Prologue (John 1:14)?', '["The Prologue says we beheld his glory; the signs are the narrative demonstration of that glory", "It is a literary accident (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Glory here means fame, not divine glory", "This is only about Old Testament glory"]'::jsonb, 'The Prologue says we beheld his glory; the signs are the narrative demonstration of that glory', 'John 1:14 announces the divine glory; chapters 2–12 ("Book of Signs") show that glory through the seven signs.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'John 2:11 says the sign "manifested his glory." How does this connect the Cana miracle to the Prologue (John 1:14)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 5, 'What christological implication arises from Jesus knowing what was in man?', '["Divine omniscience — Jesus searches hearts", "Only angels know hearts", "Knowledge is impossible", "Jesus was guessing (a common guess, but not what John says here)"]'::jsonb, 'Divine omniscience — Jesus searches hearts', 'He needed no one to bear witness about man, for he himself knew (John 2:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What christological implication arises from Jesus knowing what was in man?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 5, 'What does Jesus'' cleansing of the temple foreshadow about his relationship to sacred space?', '["He rejected the temple forever", "He was angry at animals (a common guess, but not what John says here) (does not match John’s wording in this verse)", "He only wanted more money", "His authority over true worship — the temple points to his body and messianic presence"]'::jsonb, 'His authority over true worship — the temple points to his body and messianic presence', 'Jesus drives out commerce as claim to divine authority over God''s house (John 2:14–17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Jesus'' cleansing of the temple foreshadow about his relationship to sacred space?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 5, 'What textual links connect the six stone jars for Jewish rites of purification to Johannine themes?', '["They tie Jesus'' sign to cultic washings he transforms into messianic abundance", "They are decorative detail only", "They prove Judaism is abolished in one verse", "They refer to pagan rites (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'They tie Jesus'' sign to cultic washings he transforms into messianic abundance', 'The jars were for the Jewish rites of purification (John 2:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What textual links connect the six stone jars for Jewish rites of purification to Johannine themes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 2, 5, 'Why is "they believed the Scripture and the word that Jesus had spoken" (2:22) theologically significant for John''s view of revelation?', '["It places Scripture and Jesus''s words on the same level of divine authority", "It suggests Scripture is above Jesus", "It means they only trusted Moses (a common guess, but not what John says here)", "It was just an emotional response"]'::jsonb, 'It places Scripture and Jesus''s words on the same level of divine authority', 'John''s Gospel regularly equates Jesus''s words with Scripture, presenting both as vehicles of divine truth.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is "they believed the Scripture and the word that Jesus had spoken" (2:22) theologically significant for John''s view of revelation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 1, 'In John 3, what did John the Baptist say about Jesus compared to himself?', '["He must increase, but I must decrease", "He is greater in rank only", "We are equal messengers", "I will follow him (a common guess, but not what John says here)"]'::jsonb, 'He must increase, but I must decrease', '"He must increase, but I must decrease" (John 3:30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'In John 3, what did John the Baptist say about Jesus compared to himself?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 1, 'What Old Testament event did Jesus use as a picture of himself being "lifted up"?', '["Moses lifting up the serpent in the wilderness", "Elijah going up to heaven", "Jacob''s ladder (a common guess, but not what John says here)", "Isaac on the altar"]'::jsonb, 'Moses lifting up the serpent in the wilderness', '"As Moses lifted up the serpent in the wilderness, so must the Son of Man be lifted up" (John 3:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'What Old Testament event did Jesus use as a picture of himself being "lifted up"?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 1, 'What did Jesus say a person must do to see the kingdom of God?', '["Be born again (born from above)", "Keep the commandments", "Be baptized by John", "Sell everything (a common guess, but not what John says here)"]'::jsonb, 'Be born again (born from above)', '"Unless one is born again he cannot see the kingdom of God" (John 3:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say a person must do to see the kingdom of God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 1, 'What did Jesus say about those who believe in the Son in John 3:36?', '["They have eternal life", "They will be blessed", "They will see God (a common guess, but not what John says here)", "They will never sin"]'::jsonb, 'They have eternal life', '"Whoever believes in the Son has eternal life" (John 3:36).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say about those who believe in the Son in John 3:36?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 1, 'What does John 3:16 say God gave for the world?', '["His only Son", "The Holy Spirit", "The Law", "The Scriptures"]'::jsonb, 'His only Son', '"He gave his only Son."'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does John 3:16 say God gave for the world?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 1, 'What is John 3:16 about?', '["God''s love for the world and salvation through believing in Jesus", "The creation of the world", "The coming judgment (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Jesus''s command to love one another"]'::jsonb, 'God''s love for the world and salvation through believing in Jesus', '"For God so loved the world, that he gave his only Son, that whoever believes in him should not perish but have eternal life."'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'What is John 3:16 about?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 1, 'What must a person be born of to enter the kingdom of God, according to John 3:5?', '["Water and the Spirit", "Faith and works", "Repentance and baptism", "Obedience and prayer"]'::jsonb, 'Water and the Spirit', '"Unless one is born of water and the Spirit, he cannot enter the kingdom of God" (John 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'What must a person be born of to enter the kingdom of God, according to John 3:5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 1, 'What title did Nicodemus use when he addressed Jesus?', '["Rabbi (Teacher)", "Lord (a common guess, but not what John says here)", "Master", "Prophet"]'::jsonb, 'Rabbi (Teacher)', '"Rabbi, we know that you are a teacher come from God" (John 3:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'What title did Nicodemus use when he addressed Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 1, 'What was Nicodemus''s role among the Jews?', '["A ruler and Pharisee", "A tax collector (a common guess, but not what John says here)", "A Levite priest", "A Roman official"]'::jsonb, 'A ruler and Pharisee', 'Nicodemus was "a ruler of the Jews" and a Pharisee (John 3:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'What was Nicodemus''s role among the Jews?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 1, 'Who came to Jesus by night in John 3?', '["Nicodemus", "Joseph of Arimathea", "The Rich Young Ruler", "Zacchaeus"]'::jsonb, 'Nicodemus', 'Nicodemus, a Pharisee and ruler of the Jews, came to Jesus at night (John 3:1–2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who came to Jesus by night in John 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 2, 'According to John 3:33, what does receiving Jesus''s testimony testify?', '["That God is true", "That Jesus is Messiah", "That eternal life exists", "That sin is forgiven"]'::jsonb, 'That God is true', '"Whoever receives his testimony sets his seal to this, that God is true" (John 3:33).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to John 3:33, what does receiving Jesus''s testimony testify?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 2, 'In John 3, what did John the Baptist say about himself being the bridegroom?', '["He was the friend of the bridegroom, not the bridegroom himself", "He was the best man (a common guess, but not what John says here)", "He was the one who prepared the bride", "He refused the title"]'::jsonb, 'He was the friend of the bridegroom, not the bridegroom himself', '"The friend of the bridegroom… rejoices greatly at the bridegroom''s voice" (John 3:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'In John 3, what did John the Baptist say about himself being the bridegroom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 2, 'In John 3:36, what is the fate of one who does not obey the Son?', '["The wrath of God remains on him", "He is given a second chance", "He is ignored (a common guess, but not what John says here)", "He returns to death"]'::jsonb, 'The wrath of God remains on him', '"Whoever does not obey the Son shall not see life, but the wrath of God remains on him" (John 3:36).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'In John 3:36, what is the fate of one who does not obey the Son?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 2, 'Jesus called Nicodemus "the teacher of Israel." Why was Nicodemus surprised by Jesus''s teaching?', '["He did not understand spiritual birth despite being a religious teacher", "He was too old to learn (a common guess, but not what John says here) (does not match John’s wording in this verse)", "He had never read the Scriptures", "He thought Jesus was a fraud"]'::jsonb, 'He did not understand spiritual birth despite being a religious teacher', 'Jesus said "Are you the teacher of Israel and yet you do not understand these things?" (John 3:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'Jesus called Nicodemus "the teacher of Israel." Why was Nicodemus surprised by Jesus''s teaching?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 2, 'Jesus described being born of the Spirit as being like what?', '["The wind—you hear it but don''t know where it comes from or goes", "A fire that purifies", "A river of living water", "A dove descending (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'The wind—you hear it but don''t know where it comes from or goes', '"The wind blows where it wishes… so it is with everyone who is born of the Spirit" (John 3:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'Jesus described being born of the Spirit as being like what?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 2, 'What does John 3:17 say was God''s purpose in sending his Son into the world?', '["Not to condemn, but to save the world", "To judge all nations", "To fulfill the law (a common guess, but not what John says here)", "To replace the Old Testament"]'::jsonb, 'Not to condemn, but to save the world', '"God did not send his Son into the world to condemn the world, but in order that the world might be saved through him" (John 3:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does John 3:17 say was God''s purpose in sending his Son into the world?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 2, 'What does John 3:18 say about one who believes in Jesus?', '["He is not condemned", "He is forgiven of all past sins", "He gains eternal happiness", "He becomes a child of God"]'::jsonb, 'He is not condemned', '"Whoever believes in him is not condemned" (John 3:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does John 3:18 say about one who believes in Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 2, 'What does John 3:19 say is the reason for condemnation?', '["Light has come into the world, but people loved darkness rather than light", "People broke the law (a common guess, but not what John says here) (does not match John’s wording in this verse)", "People rejected the prophets", "People were born sinful"]'::jsonb, 'Light has come into the world, but people loved darkness rather than light', '"This is the judgment: the light has come into the world, and people loved the darkness rather than the light" (John 3:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does John 3:19 say is the reason for condemnation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 2, 'What does John 3:34 say about the Spirit given to Jesus?', '["God gives the Spirit without measure", "The Spirit was given in fullness only at Pentecost", "Only prophets receive the Spirit", "The Spirit was limited by law"]'::jsonb, 'God gives the Spirit without measure', '"He whom God has sent utters the words of God, for he gives the Spirit without measure" (John 3:34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does John 3:34 say about the Spirit given to Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 2, 'What was Nicodemus''s confused response when Jesus said he must be born again?', '["Can a man enter his mother''s womb a second time?", "How can a spirit enter a new body?", "What does ''again'' mean? (a common guess, but not what John says here)", "Is this a spiritual teaching?"]'::jsonb, 'Can a man enter his mother''s womb a second time?', '"Can a man enter his mother''s womb a second time and be born?" (John 3:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was Nicodemus''s confused response when Jesus said he must be born again?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 3, 'How does John 3:14-15 tie the crucifixion to the bronze serpent in Numbers 21?', '["Both involve being lifted up to bring life to those who look/believe; sin''s judgment is borne so others may live", "It is just a casual comparison (a common guess, but not what John says here) (does not match John’s wording in this verse)", "The serpent was a symbol of Satan", "Jesus quoted it to confuse Nicodemus"]'::jsonb, 'Both involve being lifted up to bring life to those who look/believe; sin''s judgment is borne so others may live', 'In Numbers 21 the serpent bore the curse so Israelites who looked lived; Jesus bore sin''s curse so believers live.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does John 3:14-15 tie the crucifixion to the bronze serpent in Numbers 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 3, 'How does John 3:16 function as a summary of John''s Gospel?', '["It encapsulates the themes of God''s love, the gift of the Son, belief, and eternal life that run through the whole Gospel", "It is an isolated verse with no connection to the rest", "It is a quotation from the Old Testament", "It only applies to Jewish readers (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'It encapsulates the themes of God''s love, the gift of the Son, belief, and eternal life that run through the whole Gospel', 'Scholars identify John 3:16 as the Gospel''s thesis statement: love → gift → faith → life.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does John 3:16 function as a summary of John''s Gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 3, 'How does the wind imagery in John 3:8 describe the Spirit''s work?', '["Wind proves there is no Spirit", "Wind is evil (a common guess, but not what John says here) (does not match John’s wording in this verse)", "The Spirit is only weather", "The Spirit moves mysteriously like wind — you hear it but cannot control its origin"]'::jsonb, 'The Spirit moves mysteriously like wind — you hear it but cannot control its origin', 'So it is with everyone born of the Spirit (John 3:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does the wind imagery in John 3:8 describe the Spirit''s work?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 3, 'What does "born of water and Spirit" (John 3:5) likely emphasize together?', '["Water cancels Spirit", "Spirit cancels water", "Cleansing and new life from God — not mere physical birth or ritual alone", "Only physical birth (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'Cleansing and new life from God — not mere physical birth or ritual alone', 'Jesus speaks of entry into God''s kingdom by God''s initiative.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does "born of water and Spirit" (John 3:5) likely emphasize together?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 3, 'What does John 3:19–21 teach about why people reject the light?', '["God forces them to hate light (a common guess, but not what John says here)", "Everyone loves light automatically", "They love darkness because their deeds are evil — moral responsibility", "Light is too bright physically"]'::jsonb, 'They love darkness because their deeds are evil — moral responsibility', 'People hate the light lest their works be exposed (John 3:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does John 3:19–21 teach about why people reject the light?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 3, 'What does it mean that Nicodemus addressed Jesus as "Rabbi" and knew he was a teacher come from God?', '["He fully understood the Trinity", "He recognized Jesus'' authority but had not yet grasped spiritual rebirth", "He denied Jesus was a teacher", "He was mocking Jesus (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'He recognized Jesus'' authority but had not yet grasped spiritual rebirth', 'Nicodemus begins with partial recognition (John 3:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does it mean that Nicodemus addressed Jesus as "Rabbi" and knew he was a teacher come from God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 3, 'What is the meaning of "born from above" (anothen) and why is it significant that Nicodemus misunderstood it?', '["Anothen means both ''again'' and ''from above''; Nicodemus took the physical meaning while Jesus meant divine origin", "It only means ''again'' in Aramaic", "Nicodemus understood perfectly (a common guess, but not what John says here) (does not match John’s wording in this verse)", "It is a translation issue with no theological weight"]'::jsonb, 'Anothen means both ''again'' and ''from above''; Nicodemus took the physical meaning while Jesus meant divine origin', 'The Greek double meaning drives the dialogue; Jesus means a birth from God, not a second physical birth.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the meaning of "born from above" (anothen) and why is it significant that Nicodemus misunderstood it?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 3, 'What role does John the Baptist play in John 3:22–30 after Nicodemus?', '["He competes with Jesus for crowds", "He denies Jesus (a common guess, but not what John says here) (does not match John’s wording in this verse)", "He models pointing away from himself to Jesus — \"He must increase, I must decrease\"", "He leaves the narrative forever"]'::jsonb, 'He models pointing away from himself to Jesus — "He must increase, I must decrease"', 'The Baptist rejoices as the bridegroom''s friend (John 3:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What role does John the Baptist play in John 3:22–30 after Nicodemus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 3, 'Why did Nicodemus come to Jesus at night, and what might this detail symbolize in John''s Gospel?', '["Night symbolizes spiritual darkness/uncertainty; Nicodemus is moving from darkness toward the light", "It was just more convenient", "Night means he was afraid of crowds only", "It has no symbolic meaning (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'Night symbolizes spiritual darkness/uncertainty; Nicodemus is moving from darkness toward the light', 'John uses light/darkness as a major theme (1:5; 8:12; 9:4); Nicodemus at night fits the pattern of one not yet in the light.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why did Nicodemus come to Jesus at night, and what might this detail symbolize in John''s Gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 3, 'Why does John the Baptist''s joy at Jesus''s growing ministry (3:29–30) mark spiritual maturity?', '["It shows he found his identity in being a witness, not in his own prominence; true joy in another''s success", "He was just being polite (a common guess, but not what John says here) (does not match John’s wording in this verse)", "He was disappointed but hiding it", "He was preparing to retire"]'::jsonb, 'It shows he found his identity in being a witness, not in his own prominence; true joy in another''s success', '"He must increase, but I must decrease" expresses complete self-giving to the mission, not self-promotion.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does John the Baptist''s joy at Jesus''s growing ministry (3:29–30) mark spiritual maturity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 4, 'How do John 3:16 and John 3:36 together present the two sides of the gospel?', '["Belief brings eternal life (positive); unbelief leaves God''s wrath (negative) — both grace and judgment are real", "They are contradictory", "3:16 is for Jews and 3:36 is for gentiles", "3:36 cancels 3:16 (a common guess, but not what John says here) (does not match John’s wording in this verse) (a common guess, but not what John says here)"]'::jsonb, 'Belief brings eternal life (positive); unbelief leaves God''s wrath (negative) — both grace and judgment are real', 'John presents the gospel as a two-edged reality: the offer of life and the reality of judgment.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do John 3:16 and John 3:36 together present the two sides of the gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 4, 'How does John 3:13 support Jesus'' unique authority to speak of heavenly things?', '["Moses ascended higher than Jesus", "Angels taught Nicodemus (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Only the Son of Man descended from heaven; thus he alone reveals heaven", "No one needs heavenly revelation"]'::jsonb, 'Only the Son of Man descended from heaven; thus he alone reveals heaven', 'No one has ascended into heaven except he who descended (John 3:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does John 3:13 support Jesus'' unique authority to speak of heavenly things?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 4, 'How does John 3:31–36 climax the chapter''s testimony theme?', '["The one from heaven is above all; to reject the Son rejects the Father''s word", "John the Baptist is above Jesus", "Testimony does not matter", "Heaven is irrelevant (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'The one from heaven is above all; to reject the Son rejects the Father''s word', 'He who comes from heaven is above all (John 3:31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does John 3:31–36 climax the chapter''s testimony theme?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 4, 'How does John 3:5–8 combine water, Spirit, and wind imagery?', '["Wind replaces Spirit (a common guess, but not what John says here) (does not match John’s wording in this verse)", "They stress new birth from above — invisible yet real, like wind you cannot control", "Water cancels Spirit", "They contradict each other"]'::jsonb, 'They stress new birth from above — invisible yet real, like wind you cannot control', 'The Spirit blows where it wishes — like wind (John 3:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does John 3:5–8 combine water, Spirit, and wind imagery?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 4, 'How does the bronze serpent typology (John 3:14–15) avoid suggesting salvation by works?', '["The cross is optional", "Looking in faith to the lifted-up Son is parallel to Israel looking at the serpent — faith, not merit", "Moses saved by magic (a common guess, but not what John says here) (does not match John’s wording in this verse)", "The serpent means works salvation"]'::jsonb, 'Looking in faith to the lifted-up Son is parallel to Israel looking at the serpent — faith, not merit', 'As Moses lifted up the serpent, so must the Son of Man be lifted up (John 3:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the bronze serpent typology (John 3:14–15) avoid suggesting salvation by works?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 4, 'John 3:13 says "No one has ascended into heaven except he who descended from heaven." How does this challenge Jewish ideas of access to God?', '["It claims that only the incarnate Son has the authority to reveal heavenly things, since he alone has been there", "It only refers to angels (a common guess, but not what John says here) (does not match John’s wording in this verse)", "It means humans cannot pray to God", "It contradicts Moses''s ascent to Sinai"]'::jsonb, 'It claims that only the incarnate Son has the authority to reveal heavenly things, since he alone has been there', 'The claim is exclusive: the Son alone bridges heaven and earth and can speak authoritatively of heavenly realities.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'John 3:13 says "No one has ascended into heaven except he who descended from heaven." How does this challenge Jewish ideas of access to God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 4, 'John 3:5 says born of "water and Spirit." What are the main interpretations of "water" here?', '["Physical birth (amniotic water), baptism, or cleansing/renewal — all point to the need for divine renewal", "Water only means baptism (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Water means the Jordan River", "Water refers to the Old Testament law"]'::jsonb, 'Physical birth (amniotic water), baptism, or cleansing/renewal — all point to the need for divine renewal', 'Scholars debate: some see water as baptism, others as physical birth, others as OT cleansing imagery (Ezek. 36:25–27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'John 3:5 says born of "water and Spirit." What are the main interpretations of "water" here?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 4, 'What does "condemn" mean in John 3:17–18 if Jesus came not to condemn the world?', '["Condemnation is arbitrary (a common guess, but not what John says here) (does not match John’s wording in this verse)", "The world needs no Savior", "The world is already under judgment; belief or unbelief determines one''s relation to that reality", "Jesus never speaks of judgment"]'::jsonb, 'The world is already under judgment; belief or unbelief determines one''s relation to that reality', 'Whoever does not believe is condemned already (John 3:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does "condemn" mean in John 3:17–18 if Jesus came not to condemn the world?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 4, 'What echoes of Ezekiel 36:25–27 appear in Jesus''s conversation with Nicodemus?', '["God promised to sprinkle clean water and put a new spirit within Israel; Jesus speaks of water and Spirit birth", "None; it is purely from the Psalms (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Only the Spirit part connects to Ezekiel", "Ezekiel spoke of a new temple, not birth"]'::jsonb, 'God promised to sprinkle clean water and put a new spirit within Israel; Jesus speaks of water and Spirit birth', 'Ezek. 36:25–27 is the OT backdrop: God cleanses with water and gives his Spirit — exactly what Jesus describes.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'What echoes of Ezekiel 36:25–27 appear in Jesus''s conversation with Nicodemus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 4, 'What is the relationship between belief and eternal life in John 3:15–16?', '["Belief is optional (a common guess, but not what John says here)", "Eternal life is unrelated to the Son", "Works earn life without faith", "Believing in the Son is the God-given means to eternal life"]'::jsonb, 'Believing in the Son is the God-given means to eternal life', 'Whoever believes in him should have eternal life (John 3:15–16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'What is the relationship between belief and eternal life in John 3:15–16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 5, 'How does John 3:16 fit within John''s broader Christology where the Father sends the Son?', '["The mission of the Son is grounded in the Father''s love; the sending pattern (3:17; 5:24; 6:44; 17:3) defines Jesus''s identity as the sent one", "The Father and Son are separate beings acting independently", "Sending implies the Son is inferior (a common guess, but not what John says here) (does not match John’s wording in this verse) (a common guess, but not what John says here)", "This sending language is found only in John 3"]'::jsonb, 'The mission of the Son is grounded in the Father''s love; the sending pattern (3:17; 5:24; 6:44; 17:3) defines Jesus''s identity as the sent one', '"Sending" Christology is central to John: the Father-Son relationship of love drives the entire incarnation and redemptive mission.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does John 3:16 fit within John''s broader Christology where the Father sends the Son?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 5, 'How does John''s use of "eternal life" in chapter 3 differ from mere endless existence?', '["John never defines life (a common guess, but not what John says here) (does not match John’s wording in this verse)", "It is the same as Hades", "It is life in relationship with God through the Son — quality and communion, not only duration", "It means only living a long time"]'::jsonb, 'It is life in relationship with God through the Son — quality and communion, not only duration', 'Eternal life is knowing the only true God and Jesus Christ (cf. John 17:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does John''s use of "eternal life" in chapter 3 differ from mere endless existence?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 5, 'How does Nicodemus''s arc across John''s Gospel (ch. 3, 7, 19) illustrate the Gospel''s theme of moving from darkness to light?', '["He begins in secret nighttime inquiry, defends Jesus mildly in ch. 7, and boldly buries Jesus in ch. 19 — growing in public identification", "He never changes (a common guess, but not what John says here) (does not match John’s wording in this verse) (a common guess, but not what John says here)", "He abandons Jesus by ch. 19", "He becomes a disciple immediately in ch. 3"]'::jsonb, 'He begins in secret nighttime inquiry, defends Jesus mildly in ch. 7, and boldly buries Jesus in ch. 19 — growing in public identification', 'Nicodemus''s three appearances trace a journey from cautious secrecy to costly public loyalty — a movement toward light.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Nicodemus''s arc across John''s Gospel (ch. 3, 7, 19) illustrate the Gospel''s theme of moving from darkness to light?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 5, 'How does the Baptist''s "from above" vs. "of the earth" contrast (John 3:31) structure Johannine Christology?', '["Jesus'' origin determines his authority; earthly speakers are limited", "Origin does not matter", "Jesus is only earthly (a common guess, but not what John says here) (does not match John’s wording in this verse)", "John the Baptist is from heaven"]'::jsonb, 'Jesus'' origin determines his authority; earthly speakers are limited', 'He who is of the earth is earthly (John 3:31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does the Baptist''s "from above" vs. "of the earth" contrast (John 3:31) structure Johannine Christology?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 5, 'John 3:19 says people "loved darkness rather than light." How does this relate to John''s doctrine of human moral responsibility?', '["It establishes that condemnation is not arbitrary but based on a willful moral choice to reject revealed light", "It means God predestines some to darkness", "It only describes a few wicked people (a common guess, but not what John says here) (does not match John’s wording in this verse)", "It is a statement about cultural darkness"]'::jsonb, 'It establishes that condemnation is not arbitrary but based on a willful moral choice to reject revealed light', 'John insists judgment is self-incurred: people choose darkness; they are not randomly condemned. This upholds both sovereignty and responsibility.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'John 3:19 says people "loved darkness rather than light." How does this relate to John''s doctrine of human moral responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 5, 'What does "monogenes" (only Son/only begotten) in John 3:16 convey about the Son''s relationship to the Father?', '["Unique, one-of-a-kind divine Son — not merely a created being, but the one uniquely sharing the Father''s nature", "Simply that Jesus was God''s first creation", "That Jesus had no siblings (a common guess, but not what John says here) (does not match John’s wording in this verse)", "A title of affection without ontological weight"]'::jsonb, 'Unique, one-of-a-kind divine Son — not merely a created being, but the one uniquely sharing the Father''s nature', 'Monogenes (from monos + genos) means uniquely begotten/one of a kind, affirming Jesus''s unique divine Sonship.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does "monogenes" (only Son/only begotten) in John 3:16 convey about the Son''s relationship to the Father?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 5, 'What does John 3:35–36 add about the relationship between the Father and the Son?', '["The Father has given all things into the Son''s hand — supreme authority", "The Father and Son disagree", "The Son has no authority (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Authority belongs to Moses"]'::jsonb, 'The Father has given all things into the Son''s hand — supreme authority', 'The Father loves the Son and has given all things into his hand (John 3:35).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does John 3:35–36 add about the relationship between the Father and the Son?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 5, 'What ethical implication follows from receiving the Father''s testimony about the Son (John 3:33–36)?', '["Disobeying the Son rejects God''s own witness and forfeits life", "Ethics are unrelated (a common guess, but not what John says here)", "Testimony is optional", "Obedience saves without faith"]'::jsonb, 'Disobeying the Son rejects God''s own witness and forfeits life', 'Whoever does not obey the Son shall not see life (John 3:36).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What ethical implication follows from receiving the Father''s testimony about the Son (John 3:33–36)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 5, 'What nuance of krisis (judgment) in John 3:19 as "this is the judgment" should interpreters weigh?', '["Light has no ethical demand", "There is no present moral dimension", "Judgment is only future (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Judgment is exposed in the moral response to light — self-judgment by love of darkness"]'::jsonb, 'Judgment is exposed in the moral response to light — self-judgment by love of darkness', 'The light has come, and people loved darkness (John 3:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What nuance of krisis (judgment) in John 3:19 as "this is the judgment" should interpreters weigh?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 3, 5, 'What trinitarian hints appear in the Nicodemus discourse regarding Spirit, Son, and Father?', '["The Spirit gives new birth; the Son must be lifted up; the Father sends the Son out of love", "The Spirit is absent", "Trinity is denied (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Only the Father appears"]'::jsonb, 'The Spirit gives new birth; the Son must be lifted up; the Father sends the Son out of love', 'Father, Son, and Spirit cooperate in salvation (John 3:5–17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What trinitarian hints appear in the Nicodemus discourse regarding Spirit, Son, and Father?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 1, 'How many husbands did Jesus say the woman had had?', '["Five", "One", "Three", "Seven"]'::jsonb, 'Five', '"For you have had five husbands" (John 4:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'How many husbands did Jesus say the woman had had?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 1, 'Near what landmark did Jesus sit down, tired from his journey?', '["The pool of Bethesda", "The Mount of Olives", "The temple treasury", "Jacob''s well"]'::jsonb, 'Jacob''s well', 'Jacob''s well was there (John 4:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'Near what landmark did Jesus sit down, tired from his journey?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 1, 'The official''s son was healed in Capernaum at what hour, according to his servants?', '["The sixth hour", "At sunset (a common guess, but not what John says here)", "The seventh hour", "The third hour"]'::jsonb, 'The seventh hour', 'The fever left him at the seventh hour (John 4:52–53).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'The official''s son was healed in Capernaum at what hour, according to his servants?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 1, 'Through what region did Jesus travel when going from Judea toward Galilee in John 4?', '["The Decapolis", "Idumea", "Perea", "Samaria"]'::jsonb, 'Samaria', 'Jesus had to go through Samaria (John 4:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'Through what region did Jesus travel when going from Judea toward Galilee in John 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 1, 'What Samaritan town did Jesus come to in John 4?', '["Capernaum", "Bethany", "Jericho", "Sychar"]'::jsonb, 'Sychar', 'He came to a town of Samaria called Sychar (John 4:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'What Samaritan town did Jesus come to in John 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 1, 'What did Jesus ask the Samaritan woman for when they met?', '["Bring your husband here first", "Give me a drink", "Show me the city", "Tell me your name"]'::jsonb, 'Give me a drink', 'Jesus said to her, "Give me a drink" (John 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus ask the Samaritan woman for when they met?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 1, 'What did Jesus offer that would become in the one who receives it "a spring of water welling up to eternal life"?', '["Living water", "A new law", "The kingdom", "The Spirit alone, with no image of water"]'::jsonb, 'Living water', 'Jesus speaks of living water (John 4:10–14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus offer that would become in the one who receives it "a spring of water welling up to eternal life"?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 1, 'What did Jesus say about the man the woman was then living with?', '["He was her lawful husband", "He was a priest", "He was not her husband", "John does not say"]'::jsonb, 'He was not her husband', '"The one you now have is not your husband" (John 4:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say about the man the woman was then living with?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 1, 'What did Jesus say to the woman when she spoke of the Messiah coming?', '["I who speak to you am he", "No one can know yet", "You must wait longer", "The Messiah will be from Jerusalem"]'::jsonb, 'I who speak to you am he', 'Jesus said to her, "I who speak to you am he" (John 4:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say to the woman when she spoke of the Messiah coming?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 1, 'What did the Samaritans from Sychar urge Jesus to do after they believed?', '["Stay with them", "Leave at once", "Go to Jerusalem", "Baptize them in the Jordan"]'::jsonb, 'Stay with them', 'They asked him to stay with them, and he stayed two days (John 4:40).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the Samaritans from Sychar urge Jesus to do after they believed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 2, 'How did the royal official first approach Jesus in Cana?', '["He asked Jesus to come down before his child died", "He demanded a sign first (a common guess, but not what John says here)", "He sent a servant secretly", "He refused to speak to Jesus"]'::jsonb, 'He asked Jesus to come down before his child died', 'He begged Jesus to come down to Capernaum (John 4:47).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'How did the royal official first approach Jesus in Cana?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 2, 'If the woman knew the gift of God and who was asking, what would Jesus have given her?', '["Gold", "A written certificate of divorce", "Living water", "A position in the synagogue"]'::jsonb, 'Living water', 'He would have given her living water (John 4:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'If the woman knew the gift of God and who was asking, what would Jesus have given her?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 2, 'John calls the healing of the official''s son the second sign. When did Jesus do it?', '["Before the wedding at Cana (a common guess, but not what John says here)", "During the Passover in Jerusalem", "On the Sabbath in Capernaum", "After he came from Judea to Galilee"]'::jsonb, 'After he came from Judea to Galilee', 'This was the second sign Jesus did when he had come from Judea to Galilee (John 4:54).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'John calls the healing of the official''s son the second sign. When did Jesus do it?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 2, 'What did Jesus tell his disciples his food was?', '["The Passover lamb (a common guess, but not what John says here)", "To do the will of him who sent him and finish his work", "Bread and fish they would buy", "Fasting until evening"]'::jsonb, 'To do the will of him who sent him and finish his work', 'My food is to do the will of him who sent me (John 4:34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus tell his disciples his food was?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 2, 'What did Jesus tell the official after the official pleaded again?', '["Bring your wife first", "Your faith is too weak", "Go; your son will live", "Wait three days (a common guess, but not what John says here)"]'::jsonb, 'Go; your son will live', 'Jesus said, "Go; your son will live" (John 4:50).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus tell the official after the official pleaded again?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 2, 'What did many Samaritans believe first — before hearing Jesus themselves?', '["The Pharisees'' report", "Only the disciples'' preaching", "A sign in the sky", "The woman''s word about Jesus"]'::jsonb, 'The woman''s word about Jesus', 'They believed because of the woman''s testimony (John 4:39).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did many Samaritans believe first — before hearing Jesus themselves?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 2, 'What did the Samaritan woman note about Jews and Samaritans regarding water?', '["Jews never drink water (a common guess, but not what John says here)", "Jews have no dealings with Samaritans", "Only priests may draw water", "Samaritans refuse cups"]'::jsonb, 'Jews have no dealings with Samaritans', 'She said Jews have no dealings with Samaritans (John 4:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the Samaritan woman note about Jews and Samaritans regarding water?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 2, 'When the official found out the hour the boy recovered, what did he do?', '["He believed, and his whole household", "He doubted (a common guess, but not what John says here)", "He reported Jesus to the priests", "He kept it secret"]'::jsonb, 'He believed, and his whole household', 'The man believed the word that Jesus spoke to him (John 4:53).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'When the official found out the hour the boy recovered, what did he do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 2, 'Where did the disciples go while Jesus talked with the woman?', '["To pray on a mountain", "Into the town to buy food", "To Jerusalem for the feast", "To the Jordan to baptize"]'::jsonb, 'Into the town to buy food', 'The disciples had gone away into the city to buy food (John 4:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'Where did the disciples go while Jesus talked with the woman?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 2, 'Why did Jesus leave Judea and head toward Galilee, according to John 4:1–3?', '["A famine struck Judea (a common guess, but not what John says here)", "The Pharisees heard Jesus was making more disciples and baptizing", "The Romans expelled him", "John the Baptist sent him away"]'::jsonb, 'The Pharisees heard Jesus was making more disciples and baptizing', 'Jesus left because Pharisees heard he was gaining more disciples than John (John 4:1–3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why did Jesus leave Judea and head toward Galilee, according to John 4:1–3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 3, 'How does the Samaritan woman''s witness function in John 4?', '["She is silenced by the disciples", "Her role is only negative example", "She becomes an evangelist to her town, drawing many to Jesus", "She denies Jesus afterward (a common guess, but not what John says here)"]'::jsonb, 'She becomes an evangelist to her town, drawing many to Jesus', 'Many Samaritans believed because of her word (John 4:39).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does the Samaritan woman''s witness function in John 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 3, 'In John 4:10, what is the "gift of God" Jesus refers to?', '["Land in Canaan", "The salvation and Spirit symbolized by living water — God''s gracious offer", "The temple tax exemption", "A royal title (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'The salvation and Spirit symbolized by living water — God''s gracious offer', 'The context ties the gift to the living water Jesus gives.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'In John 4:10, what is the "gift of God" Jesus refers to?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 3, 'What contrast does John set up between Nicodemus (John 3) and the Samaritan woman?', '["Nicodemus is more sinful", "Both reject Jesus (a common guess, but not what John says here) (does not match John’s wording in this verse)", "John prefers male inquirers", "Respected male teacher at night vs. marginalized woman at midday — both encounter Jesus"]'::jsonb, 'Respected male teacher at night vs. marginalized woman at midday — both encounter Jesus', 'Contrasting social status and setting highlights who receives revelation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What contrast does John set up between Nicodemus (John 3) and the Samaritan woman?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 3, 'What does Jesus mean that worship will be "in spirit and truth" (John 4:23–24)?', '["Worship requires a physical temple", "Spirit refers only to the wind (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Worship is only private emotion", "True worship is not tied to one mountain but is spiritual and sincere, matching God''s nature"]'::jsonb, 'True worship is not tied to one mountain but is spiritual and sincere, matching God''s nature', 'God is spirit, and his worshipers must worship in spirit and truth.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Jesus mean that worship will be "in spirit and truth" (John 4:23–24)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 3, 'What does Jesus reveal about the woman''s past that shows his knowledge?', '["Her secret sins in Samaria''s temple", "Her income (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Her marital history — five husbands and current man not her husband", "Her children''s names"]'::jsonb, 'Her marital history — five husbands and current man not her husband', 'Jesus speaks of her husbands though she had not told him (John 4:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Jesus reveal about the woman''s past that shows his knowledge?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 3, 'What does the "harvest" language in John 4:35–38 imply about mission?', '["Only apostles may evangelize (a common guess, but not what John says here)", "The fields are ready; others labored and disciples enter their work", "Farming is the main metaphor for salvation", "Harvest means the final judgment only"]'::jsonb, 'The fields are ready; others labored and disciples enter their work', 'Jesus says the fields are white for harvest — urgency in gospel labor.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the "harvest" language in John 4:35–38 imply about mission?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 3, 'What does the official''s faith in Jesus'' word without seeing the miracle first illustrate?', '["Miracles alone create faith (a common guess, but not what John says here) (does not match John’s wording in this verse)", "The official never believed", "Faith resting on Jesus'' word — the healing confirms what he already trusted", "Faith without evidence is wrong"]'::jsonb, 'Faith resting on Jesus'' word — the healing confirms what he already trusted', 'The man believed the word Jesus spoke before he confirmed the hour (John 4:50–53).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the official''s faith in Jesus'' word without seeing the miracle first illustrate?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 3, 'What theme connects the living water discourse and the son''s healing?', '["Water and sickness are unrelated in John", "Only Gentiles get signs", "Signs always fail (a common guess, but not what John says here)", "Jesus'' word gives life — spiritually and physically"]'::jsonb, 'Jesus'' word gives life — spiritually and physically', 'Both stories show life coming through Jesus'' word.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What theme connects the living water discourse and the son''s healing?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 3, 'Why is the woman''s progressive recognition of Jesus (from Jew to prophet to Messiah) significant?', '["John thinks titles do not matter", "It shows deepening understanding as revelation unfolds — a model of coming to faith", "She never changes her mind (a common guess, but not what John says here) (does not match John’s wording in this verse)", "It shows she was confused the whole time"]'::jsonb, 'It shows deepening understanding as revelation unfolds — a model of coming to faith', 'Her titles for Jesus escalate as the conversation deepens.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the woman''s progressive recognition of Jesus (from Jew to prophet to Messiah) significant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 3, 'Why might John include the detail that disciples were amazed Jesus spoke with a woman?', '["It means the woman was a teacher", "It shows the disciples approved immediately", "It is only historical trivia (a common guess, but not what John says here) (does not match John’s wording in this verse)", "It shows cultural taboo and Jesus''s willingness to dignify the marginalized"]'::jsonb, 'It shows cultural taboo and Jesus''s willingness to dignify the marginalized', 'They marveled that he was talking with a woman (John 4:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why might John include the detail that disciples were amazed Jesus spoke with a woman?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 4, 'Compare the faith of the Samaritan townspeople with the official in Capernaum.', '["Both reject Jesus (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Only the official has faith", "Both respond to Jesus'' word with belief — communal and household faith", "Samaritans never hear Jesus"]'::jsonb, 'Both respond to Jesus'' word with belief — communal and household faith', 'Samaritans believe Jesus'' word; the official''s whole household believes (John 4:39–53).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Compare the faith of the Samaritan townspeople with the official in Capernaum.'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 4, 'How does Jesus'' knowledge of the woman''s life function theologically in John?', '["It proves only prophets know the past", "It displays divine insight, preparing for fuller revelation of his identity", "It shames her without purpose", "It shows Jesus guessed (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'It displays divine insight, preparing for fuller revelation of his identity', 'Prophetic knowledge points to who Jesus is.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Jesus'' knowledge of the woman''s life function theologically in John?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 4, 'How does John 4:24 ("God is spirit") inform Jesus'' claim about true worship?', '["God has a physical body like humans", "Spirit denies the body (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Worship is optional for believers", "Worship must match God''s spiritual being, not merely external place or form"]'::jsonb, 'Worship must match God''s spiritual being, not merely external place or form', 'Because God is spirit, worship must be in spirit and truth.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does John 4:24 ("God is spirit") inform Jesus'' claim about true worship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 4, 'How does the "fields are white for harvest" saying relate to John''s view of Jesus'' hour?', '["Urgency — the time of salvation fruitfulness is already present in Jesus'' ministry", "Jesus refuses disciples'' help", "Agriculture replaces theology", "Harvest means delay (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'Urgency — the time of salvation fruitfulness is already present in Jesus'' ministry', 'Jesus urges eyes for the ready harvest (John 4:35).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the "fields are white for harvest" saying relate to John''s view of Jesus'' hour?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 4, 'How does the woman''s question about Mount Gerizim vs. Jerusalem advance John''s theology?', '["It lets Jesus declare a new era of Spirit-and-truth worship beyond localized shrines", "It proves Gerizim is correct", "It is only political (a common guess, but not what John says here) (does not match John’s wording in this verse)", "It denies the Old Testament"]'::jsonb, 'It lets Jesus declare a new era of Spirit-and-truth worship beyond localized shrines', 'Jesus transcends the old debate by redefining worship around God''s nature.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the woman''s question about Mount Gerizim vs. Jerusalem advance John''s theology?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 4, 'In what sense is Jesus'' thirst at the well both human and rhetorical?', '["He was not really thirsty", "Thirst proves he sinned (a common guess, but not what John says here) (does not match John’s wording in this verse)", "He is truly human (asks for water) yet offers what only he can give (living water)", "Rhetoric replaces history"]'::jsonb, 'He is truly human (asks for water) yet offers what only he can give (living water)', 'Real thirst opens the dialogue that reveals his deeper offer.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'In what sense is Jesus'' thirst at the well both human and rhetorical?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 4, 'What Old Testament backdrop enriches Jesus'' offer of "living water"?', '["Jeremiah''s living waters, Ezekiel''s river — eschatological hope of renewal", "The bronze serpent only", "Only Greek philosophy (a common guess, but not what John says here) (does not match John’s wording in this verse)", "No Old Testament connection"]'::jsonb, 'Jeremiah''s living waters, Ezekiel''s river — eschatological hope of renewal', 'John''s readers would hear OT echoes of water and new covenant renewal.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'What Old Testament backdrop enriches Jesus'' offer of "living water"?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 4, 'What did the Samaritan woman leave behind when she went into town to tell others about Jesus?', '["Her cloak", "Her scroll of the law", "Her money bag", "Her water jar"]'::jsonb, 'Her water jar', 'The woman left her water jar and went away into town (John 4:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'What did the Samaritan woman leave behind when she went into town to tell others about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 4, 'What does John communicate by placing this chapter between Nicodemus and Bethesda?', '["John ignores geography", "Samaria is filler (a common guess, but not what John says here) (does not match John’s wording in this verse)", "A sequence of widening revelation: rabbi, woman, then sick man — Jesus as Savior of all kinds", "Random travel narrative"]'::jsonb, 'A sequence of widening revelation: rabbi, woman, then sick man — Jesus as Savior of all kinds', 'Literary placement shows different audiences encountering Christ.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does John communicate by placing this chapter between Nicodemus and Bethesda?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 4, 'Why is the Samaritan mission significant in John''s narrative of Jesus?', '["It shows salvation is not limited to Judean expectations; Gentile-adjacent Samaritans respond in faith", "It cancels Jewish mission", "It proves Samaritans are Israel", "It replaces Galilee (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'It shows salvation is not limited to Judean expectations; Gentile-adjacent Samaritans respond in faith', 'Many Samaritans believe — a widening circle of witness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is the Samaritan mission significant in John''s narrative of Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 5, 'How does John 4 prepare for the bread-of-life discourse in John 6?', '["Water and bread are unrelated symbols", "They contradict each other", "Chapter 4 ignores belief (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Both chapters present Jesus as the source of life believers must receive by faith"]'::jsonb, 'Both chapters present Jesus as the source of life believers must receive by faith', 'Living water anticipates Jesus as life-giver like the bread from heaven.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does John 4 prepare for the bread-of-life discourse in John 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 5, 'How does the Samaritan woman''s five husbands function beyond mere scandal?', '["It only condemns her permanently", "It proves polygamy is blessed (a common guess, but not what John says here)", "John counts husbands literally with no meaning", "It illustrates spiritual thirst and misplaced hopes that Jesus addresses"]'::jsonb, 'It illustrates spiritual thirst and misplaced hopes that Jesus addresses', 'The detail exposes need that Jesus meets with living water.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does the Samaritan woman''s five husbands function beyond mere scandal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 5, 'How does the two-day stay with Samaritans foreshadow later Gentile inclusion in Acts?', '["Jesus'' welcome among Samaritans anticipates the church''s cross-cultural expansion", "It ends Jewish mission (a common guess, but not what John says here) (does not match John’s wording in this verse)", "It forbids preaching to Gentiles", "Samaritans are not Gentiles"]'::jsonb, 'Jesus'' welcome among Samaritans anticipates the church''s cross-cultural expansion', 'Jewish Messiah dwelling with Samaritans hints at broader salvation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does the two-day stay with Samaritans foreshadow later Gentile inclusion in Acts?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 5, 'In Johannine terms, how does "the Father seeks worshipers" (John 4:23) relate to election and mission?', '["God is passive (a common guess, but not what John says here) (does not match John’s wording in this verse)", "God actively draws people to true worship — mission participates in the Father''s seeking", "Seeking refers only to animals", "Worshipers are automatic"]'::jsonb, 'God actively draws people to true worship — mission participates in the Father''s seeking', 'The Father seeks true worshipers in spirit and truth.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'In Johannine terms, how does "the Father seeks worshipers" (John 4:23) relate to election and mission?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 5, 'Scholars often connect John 4''s living water to what prophetic hope?', '["Solomon''s proverbs exclusively", "Only Daniel''s beasts (a common guess, but not what John says here)", "The law of Moses alone", "Ezekiel 36–37 and Joel 2 — Spirit poured out, new covenant life"]'::jsonb, 'Ezekiel 36–37 and Joel 2 — Spirit poured out, new covenant life', 'Living water fits OT expectation of eschatological renewal.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'Scholars often connect John 4''s living water to what prophetic hope?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 5, 'What christological claim is implicit when Jesus says worship must be "in truth"?', '["Truth is subjective only", "Truth opposes love (a common guess, but not what John says here) (does not match John’s wording in this verse)", "He is the truth — worship is oriented to the Father through the revealing Son", "Truth is a place in Samaria"]'::jsonb, 'He is the truth — worship is oriented to the Father through the revealing Son', 'Truth language in John centers on Jesus (14:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What christological claim is implicit when Jesus says worship must be "in truth"?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 5, 'What did the Samaritans say about Jesus after hearing him themselves (John 4:42)?', '["They knew he was the Roman emperor", "They knew he was Elijah returned (a common guess, but not what John says here)", "They knew he was truly the Savior of the world", "They knew he was only a Jewish prophet"]'::jsonb, 'They knew he was truly the Savior of the world', 'We know that this is indeed the Savior of the world (John 4:42).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did the Samaritans say about Jesus after hearing him themselves (John 4:42)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 5, 'What does the healing-at-distance of the official''s son contribute to John''s sign theology?', '["Distance cancels miracles", "Signs are tricks (a common guess, but not what John says here) (does not match John’s wording in this verse)", "It proves Jesus feared Capernaum", "It shows Jesus'' word is effective apart from presence — authority over space and death"]'::jsonb, 'It shows Jesus'' word is effective apart from presence — authority over space and death', 'The boy is healed without Jesus being in Capernaum (John 4:50–53).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does the healing-at-distance of the official''s son contribute to John''s sign theology?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 5, 'What missional pattern appears in John 4:38 (others labored, you enter)?', '["Only one generation may preach", "Disciples replace Jesus completely", "Labor means paid work only (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Continuity of gospel labor across witnesses — John the Baptist, Jesus, disciples"]'::jsonb, 'Continuity of gospel labor across witnesses — John the Baptist, Jesus, disciples', 'Jesus honors preparatory witness and present harvest.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What missional pattern appears in John 4:38 (others labored, you enter)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 4, 5, 'Why might John stress Jesus was "wearied" from the journey (John 4:6)?', '["It implies Jesus sinned by tiredness", "It denies his divinity (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Weariness is metaphor only with no reality", "It affirms true incarnation — the Son shares our weakness while giving life"]'::jsonb, 'It affirms true incarnation — the Son shares our weakness while giving life', 'True humanity is foundational for John''s high Christology.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why might John stress Jesus was "wearied" from the journey (John 4:6)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 1, 'Afterward Jesus found him in the temple and warned him — what else did he say?', '["Go, sell everything", "Return to Bethesda (a common guess, but not what John says here)", "Sin no more, that nothing worse may happen to you", "Bring your offering tomorrow"]'::jsonb, 'Sin no more, that nothing worse may happen to you', 'Jesus found him in the temple… "See, you are well! Sin no more…" (John 5:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'Afterward Jesus found him in the temple and warned him — what else did he say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 1, 'Beside which pool in Jerusalem did a multitude of the sick lie?', '["The pool of Hebron (a common guess, but not what John says here)", "The pool of Siloam", "The pool of Bethesda", "The pool of Gibeon"]'::jsonb, 'The pool of Bethesda', 'In Jerusalem by the Sheep Gate there is a pool called Bethesda (John 5:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'Beside which pool in Jerusalem did a multitude of the sick lie?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 1, 'How long had the man lying there been ill, according to Jesus?', '["Forty days (a common guess, but not what John says here)", "Thirty-eight years", "Twelve years", "Seven years"]'::jsonb, 'Thirty-eight years', 'The sick man had been there thirty-eight years (John 5:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'How long had the man lying there been ill, according to Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 1, 'How many porches did the pool of Bethesda have?', '["Seven", "Three", "Twelve", "Five"]'::jsonb, 'Five', 'In these lay a multitude… around the pool — five colonnades (John 5:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'How many porches did the pool of Bethesda have?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 1, 'On what day did the Jews object that the man was carrying his mat?', '["A Roman feast day", "The Day of Atonement", "The Passover", "The Sabbath"]'::jsonb, 'The Sabbath', 'This was why the Jews were persecuting Jesus, because he was doing things on the Sabbath (John 5:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'On what day did the Jews object that the man was carrying his mat?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 1, 'What did Jesus ask the sick man?', '["Have you kept the whole law?", "Do you want to be healed?", "Will you follow me to Galilee?", "Who sinned against you?"]'::jsonb, 'Do you want to be healed?', 'When Jesus saw him… he said to him, "Do you want to be healed?" (John 5:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus ask the sick man?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 1, 'What did Jesus call God that made the Jews seek all the more to kill him?', '["His own Father", "A distant judge", "His commander", "The God of Rome"]'::jsonb, 'His own Father', 'He was even calling God his own Father, making himself equal with God (John 5:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus call God that made the Jews seek all the more to kill him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 1, 'What did Jesus tell the man to pick up after he was healed?', '["His mat", "His money", "A stone from the temple", "His scroll"]'::jsonb, 'His mat', 'Jesus said to him… "Pick up your mat, and walk" (John 5:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus tell the man to pick up after he was healed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 1, 'What does the Son do regarding the dead, according to John 5:21?', '["Judges only the living", "Sends angels only", "Leaves them in silence", "Raises them up"]'::jsonb, 'Raises them up', 'As the Father raises the dead… so the Son gives life to whom he will (John 5:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does the Son do regarding the dead, according to John 5:21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 1, 'What excuse did the healed man give for not knowing who healed him?', '["He was asleep", "He feared the priests", "The crowd was large and Jesus had withdrawn", "He was blind (a common guess, but not what John says here)"]'::jsonb, 'The crowd was large and Jesus had withdrawn', 'The man went away and told the Jews it was Jesus who had healed him (John 5:15); earlier he did not know (John 5:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'What excuse did the healed man give for not knowing who healed him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 2, 'Besides John, what other witness does Jesus appeal to?', '["The temple treasury", "Herod''s court (a common guess, but not what John says here)", "The works the Father gave him to complete", "The Roman senate"]'::jsonb, 'The works the Father gave him to complete', 'The works that the Father has given me to carry out… bear witness about me (John 5:36).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'Besides John, what other witness does Jesus appeal to?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 2, 'If people believed Moses''s writings, whom would they believe?', '["The high priest", "Jesus", "John the Baptist only", "Caesar"]'::jsonb, 'Jesus', 'If you believed Moses, you would believe me; for he wrote of me (John 5:46).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'If people believed Moses''s writings, whom would they believe?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 2, 'What does Jesus say people have never heard or seen?', '["The law of Moses (a common guess, but not what John says here)", "The Passover lamb", "The pool of Bethesda", "The Father''s voice or form"]'::jsonb, 'The Father''s voice or form', 'You have neither heard his voice nor seen his form (John 5:37).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Jesus say people have never heard or seen?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 2, 'What does Jesus say the Father has committed to the Son?', '["All judgment", "Only healing", "The Sanhedrin''s vote", "Temple finances"]'::jsonb, 'All judgment', 'The Father… has given all judgment to the Son (John 5:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Jesus say the Father has committed to the Son?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 2, 'What does Jesus say the Father has life in himself and has granted the Son?', '["To have life in himself", "To command armies", "To abolish the Sabbath", "To inherit land (a common guess, but not what John says here)"]'::jsonb, 'To have life in himself', 'As the Father has life in himself, so he has granted the Son also to have life in himself (John 5:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Jesus say the Father has life in himself and has granted the Son?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 2, 'What does Jesus say the Father who sent him has done?', '["Left him without the Spirit", "Borne witness about him", "Hidden his identity", "Denied him publicly"]'::jsonb, 'Borne witness about him', 'The Father who sent me has himself borne witness about me (John 5:37).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Jesus say the Father who sent him has done?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 2, 'What kind of testimony does Jesus say John gave?', '["Symbolic testimony only", "False testimony", "Silent testimony", "True testimony"]'::jsonb, 'True testimony', 'He was a burning and shining lamp, and you were willing to rejoice for a while in his light (John 5:35).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'What kind of testimony does Jesus say John gave?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 2, 'Who does Jesus say accuses the people, the one in whom they hope?', '["Moses", "Abraham", "David", "Elijah"]'::jsonb, 'Moses', 'There is one who accuses you: Moses, on whom you have set your hope (John 5:45).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'Who does Jesus say accuses the people, the one in whom they hope?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 2, 'Who will hear the voice of the Son of God, according to John 5:25?', '["Only priests", "The dead", "Only angels", "Only the Pharisees"]'::jsonb, 'The dead', 'An hour is coming… when the dead will hear the voice of the Son of God (John 5:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'Who will hear the voice of the Son of God, according to John 5:25?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 2, 'Why does Jesus say his judgment is just?', '["The crowds approve (a common guess, but not what John says here)", "He ignores evidence", "Pilate assists him", "He seeks not his own will but the will of him who sent him"]'::jsonb, 'He seeks not his own will but the will of him who sent him', 'I seek not my own will but the will of him who sent me (John 5:30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why does Jesus say his judgment is just?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 3, 'The Father has given the Son authority to execute judgment because he is whom?', '["The Son of Man", "The high priest''s assistant", "A Roman citizen", "A Levite"]'::jsonb, 'The Son of Man', 'He is the Son of Man (John 5:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'The Father has given the Son authority to execute judgment because he is whom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 3, 'The man by Bethesda had no one to do what when the water was stirred?', '["Put him into the pool", "Read the law to him", "Carry his mat beforehand", "Bring him food"]'::jsonb, 'Put him into the pool', 'I have no one to put me into the pool when the water is stirred up (John 5:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'The man by Bethesda had no one to do what when the water was stirred?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 3, 'What defense does Jesus give for working on the Sabbath?', '["My Father is working until now, and I am working", "Emergencies excuse everyone", "The Sabbath is abolished", "Rome permits it (a common guess, but not what John says here)"]'::jsonb, 'My Father is working until now, and I am working', 'My Father is working until now, and I am working (John 5:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What defense does Jesus give for working on the Sabbath?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 3, 'What did the Jews tell the man he was not allowed to do on the Sabbath?', '["Enter the temple", "Speak Jesus'' name", "Pray", "Carry his mat"]'::jsonb, 'Carry his mat', 'It is the Sabbath, and it is not lawful for you to take up your bed (John 5:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did the Jews tell the man he was not allowed to do on the Sabbath?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 3, 'What did the healed man say Jesus told him?', '["Bring two doves", "Stay in bed another week", "Wash in Siloam (a common guess, but not what John says here)", "Take up your bed and walk"]'::jsonb, 'Take up your bed and walk', 'The man who healed me… said, "Take up your bed, and walk" (John 5:11–12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did the healed man say Jesus told him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 3, 'What does Jesus say he does not accept from people?', '["Prayers (a common guess, but not what John says here)", "Children", "Glory from man", "Offerings"]'::jsonb, 'Glory from man', 'I do not receive glory from people (John 5:41).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Jesus say he does not accept from people?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 3, 'What does Jesus say people search the Scriptures for?', '["Eternal life", "Temple blueprints", "Genealogies only", "Political power"]'::jsonb, 'Eternal life', 'You search the Scriptures because you think that in them you have eternal life (John 5:39).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Jesus say people search the Scriptures for?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 3, 'What does Jesus say the Scriptures do?', '["Replace faith", "Contradict Moses", "End at Malachi with no hope", "Bear witness about him"]'::jsonb, 'Bear witness about him', 'They bear witness about me (John 5:39).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Jesus say the Scriptures do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 3, 'What hour does Jesus say is coming and now is?', '["When Moses returns", "When the dead will hear the voice of the Son of God", "When Rome falls (a common guess, but not what John says here)", "When the temple triples in size"]'::jsonb, 'When the dead will hear the voice of the Son of God', 'An hour is coming and is now here, when the dead will hear the voice of the Son of God (John 5:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What hour does Jesus say is coming and now is?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 3, 'Why did the Jews persecute Jesus, according to John 5:16?', '["He avoided Jerusalem", "He refused to baptize", "He denied Moses (a common guess, but not what John says here)", "He was doing these things on the Sabbath"]'::jsonb, 'He was doing these things on the Sabbath', 'This was why the Jews were persecuting Jesus, because he was doing these things on the Sabbath.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why did the Jews persecute Jesus, according to John 5:16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 4, 'How does Jesus'' use of "Son of Man" in judgment (John 5:27) echo Danielic themes?', '["Son of Man means only human", "The Son of Man receives kingdom and authority — here, authority to judge", "It refers to Ezekiel only", "It denies Daniel (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'The Son of Man receives kingdom and authority — here, authority to judge', 'Daniel''s Son of Man is evoked in judicial authority.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Jesus'' use of "Son of Man" in judgment (John 5:27) echo Danielic themes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 4, 'How does John 5 prepare for later trials before the Sanhedrin and Pilate?', '["No witnesses appear later", "Chapter 5 ignores law (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Pilate is absent from John", "Themes of testimony, judgment, and Jesus'' unity with the Father recur at the Passion"]'::jsonb, 'Themes of testimony, judgment, and Jesus'' unity with the Father recur at the Passion', 'Legal language in John 5 foreshadows the trial narratives.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does John 5 prepare for later trials before the Sanhedrin and Pilate?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 4, 'How does John 5:24 describe the believer''s present state?', '["Judged every Sabbath (a common guess, but not what John says here)", "Uncertain until works are counted", "Still condemned until heaven", "Passed from death to life — will not come into judgment"]'::jsonb, 'Passed from death to life — will not come into judgment', 'Whoever hears my word and believes… has passed from death to life (John 5:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does John 5:24 describe the believer''s present state?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 4, 'How does the healing at Bethesda function as a "sign" in context?', '["It provokes controversy about Sabbath and Jesus'' identity as life-giver", "It ends all conflict (a common guess, but not what John says here) (does not match John’s wording in this verse)", "It is ignored by John", "It proves only medical skill"]'::jsonb, 'It provokes controversy about Sabbath and Jesus'' identity as life-giver', 'The miracle launches the discourse on Jesus'' authority (John 5:1–18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the healing at Bethesda function as a "sign" in context?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 4, 'Theologically, why is Jesus'' claim to be Son with divine prerogatives central to John 5?', '["It is a minor title (a common guess, but not what John says here) (does not match John’s wording in this verse)", "It reveals his unity with the Father in works, life-giving, and judgment", "It refers only to adoption like kings", "It denies monotheism entirely"]'::jsonb, 'It reveals his unity with the Father in works, life-giving, and judgment', 'The chapter unpacks Son-Father unity in mission and authority.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Theologically, why is Jesus'' claim to be Son with divine prerogatives central to John 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 4, 'What does Jesus say would prove people love God?', '["If they built larger synagogues", "If they received the one God sent", "If they defeated Rome (a common guess, but not what John says here)", "If they memorized genealogies"]'::jsonb, 'If they received the one God sent', 'If you received me, you would receive him who sent me (cf. John 5:43).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Jesus say would prove people love God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 4, 'What does the discourse on witnesses contribute to Johannine legal imagery?', '["Testimony is impossible", "Jesus meets standards of testimony through multiple converging witnesses", "Only one witness is allowed", "Courts are irrelevant (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'Jesus meets standards of testimony through multiple converging witnesses', 'John, works, Father, and Scripture testify (John 5:31–47).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does the discourse on witnesses contribute to Johannine legal imagery?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 4, 'What is ironic about the Jews'' confidence in Moses while rejecting Jesus?', '["Irony is absent (a common guess, but not what John says here)", "Moses opposed Jesus", "Moses never wrote Scripture", "Moses wrote of Jesus — their hope undermines their unbelief"]'::jsonb, 'Moses wrote of Jesus — their hope undermines their unbelief', 'If you believed Moses, you would believe me (John 5:46).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'What is ironic about the Jews'' confidence in Moses while rejecting Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 4, 'What role does "honor" play in John 5:23?', '["The Son needs no honor (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Honor is only cultural", "Honor applies only to angels", "Honoring the Son honors the Father; dishonoring the Son dishonors the Father"]'::jsonb, 'Honoring the Son honors the Father; dishonoring the Son dishonors the Father', 'All may honor the Son just as they honor the Father (John 5:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'What role does "honor" play in John 5:23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 4, 'Why might John stress that Jesus found the man in the temple after healing?', '["Jesus needed directions", "The temple was the only dry place", "It links physical restoration to spiritual warning — sin still matters", "The man was a priest (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'It links physical restoration to spiritual warning — sin still matters', 'Jesus speaks of holiness after healing (John 5:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why might John stress that Jesus found the man in the temple after healing?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 5, 'How does John 5:29''s resurrection to life vs. judgment cohere with John''s overall eschatology?', '["Resurrection is metaphor with no future", "Judgment is canceled", "Present spiritual resurrection and future bodily resurrection both appear in John''s thought", "Only past matters (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'Present spiritual resurrection and future bodily resurrection both appear in John''s thought', 'Hour is coming when all in tombs will hear his voice (John 5:28–29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does John 5:29''s resurrection to life vs. judgment cohere with John''s overall eschatology?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 5, 'How does John 5:44 expose the barrier to faith?', '["Seeking too little honor", "Loving Rome''s glory (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Avoiding the synagogue", "Seeking glory from one another while not seeking the glory from God"]'::jsonb, 'Seeking glory from one another while not seeking the glory from God', 'How can you believe, when you receive glory from one another? (John 5:44).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does John 5:44 expose the barrier to faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 5, 'How does the Father''s witness (John 5:37) relate to later voice from heaven in John?', '["It anticipates the Father''s audible testimony to the Son at Jesus'' baptism and glory", "The Father never speaks", "Only the Son speaks (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Thunder is unrelated"]'::jsonb, 'It anticipates the Father''s audible testimony to the Son at Jesus'' baptism and glory', 'The Father bears witness to the Son in the Gospel narrative.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does the Father''s witness (John 5:37) relate to later voice from heaven in John?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 5, 'How might John 5''s debate on Sabbath relate to Jesus as Lord of the Sabbath?', '["Sabbath applies only to farmers", "Jesus breaks God''s law (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Sabbath is abolished without trace", "The Son''s work aligns with the Father''s ongoing work — rest in God, not mere cessation"]'::jsonb, 'The Son''s work aligns with the Father''s ongoing work — rest in God, not mere cessation', 'My Father is working until now, and I am working (John 5:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'How might John 5''s debate on Sabbath relate to Jesus as Lord of the Sabbath?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 5, 'Scholars connect Bethesda''s stirred water with what background?', '["Pagan oracles only (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Popular hope for angelic/agency healing — Jesus replaces the pool''s promise with his word", "Roman plumbing codes", "Siloam''s architecture"]'::jsonb, 'Popular hope for angelic/agency healing — Jesus replaces the pool''s promise with his word', 'The stirring of the water sets up Jesus as true healer (John 5:4 textual note in some MSS).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'Scholars connect Bethesda''s stirred water with what background?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 5, 'What christological peak does John 5:18 reach in the Jews'' reaction?', '["They think he is only a prophet", "They ignore him (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Making himself equal with God — John''s readers see the charge clearly stated", "They agree with him"]'::jsonb, 'Making himself equal with God — John''s readers see the charge clearly stated', 'He was… calling God his own Father, making himself equal with God (John 5:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What christological peak does John 5:18 reach in the Jews'' reaction?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 5, 'What does Jesus ask at the end of his argument about Moses''s writings?', '["Who wrote Genesis? (a common guess, but not what John says here) (does not match John’s wording in this verse)", "If you do not believe his writings, how will you believe my words?", "Why do you read at all?", "Will you study Greek?"]'::jsonb, 'If you do not believe his writings, how will you believe my words?', 'If you do not believe his writings, how will you believe my words? (John 5:47).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Jesus ask at the end of his argument about Moses''s writings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 5, 'What does Jesus imply by saying people do not have the word of God abiding in them?', '["They memorize too much (a common guess, but not what John says here) (does not match John’s wording in this verse)", "God''s word is only oral", "The word is only for Gentiles", "They reject the one whom God sent — Scripture''s witness fails in them"]'::jsonb, 'They reject the one whom God sent — Scripture''s witness fails in them', 'If you do not believe his writings, how will you believe my words? (John 5:47).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Jesus imply by saying people do not have the word of God abiding in them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 5, 'What does the unity of will between Father and Son in John 5:19–20 teach about trinitarian relations?', '["The Son does nothing of himself but what he sees the Father doing — mutual indwelling mission", "The Son acts alone", "Two separate gods (a common guess, but not what John says here) (does not match John’s wording in this verse)", "The Father is unaware"]'::jsonb, 'The Son does nothing of himself but what he sees the Father doing — mutual indwelling mission', 'The Son can do nothing of his own accord (John 5:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does the unity of will between Father and Son in John 5:19–20 teach about trinitarian relations?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 5, 5, 'What ethical issue does the healed man''s blame of "no man" (John 5:7) subtly raise?', '["Human helplessness apart from Christ''s initiative — grace must come to us", "Self-help is all we need", "Blame is always sinful (a common guess, but not what John says here) (does not match John’s wording in this verse)", "The pool is unnecessary"]'::jsonb, 'Human helplessness apart from Christ''s initiative — grace must come to us', 'The man''s helplessness parallels spiritual need for Christ''s word.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What ethical issue does the healed man''s blame of "no man" (John 5:7) subtly raise?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 1, 'About how many men ate besides women and children?', '["About twelve", "About three thousand", "About seven thousand", "About five thousand"]'::jsonb, 'About five thousand', 'There were about five thousand men (John 6:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'About how many men ate besides women and children?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 1, 'How many barley loaves did the lad have?', '["Seven", "Twelve", "Five", "Two"]'::jsonb, 'Five', 'There is a lad here who has five barley loaves and two fish (John 6:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'How many barley loaves did the lad have?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 1, 'How many baskets of fragments were collected?', '["Five", "Seven", "Two (a common guess, but not what John says here)", "Twelve"]'::jsonb, 'Twelve', 'So they gathered them up and filled twelve baskets (John 6:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'How many baskets of fragments were collected?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 1, 'What did Jesus say to the disciples when they were afraid?', '["It is I; do not be afraid", "Be quiet (a common guess, but not what John says here)", "Swim to shore", "I am a ghost"]'::jsonb, 'It is I; do not be afraid', 'It is I; do not be afraid (John 6:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say to the disciples when they were afraid?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 1, 'What did Jesus tell the disciples to make the people do?', '["Sit down", "Return home", "Wash in the sea", "Stand in lines"]'::jsonb, 'Sit down', 'Jesus said, "Have the people sit down" (John 6:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus tell the disciples to make the people do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 1, 'What did the people say when they saw the sign?', '["That Moses returned (a common guess, but not what John says here)", "That the temple must move", "That he should be king of Rome", "That Jesus is the Prophet who is to come"]'::jsonb, 'That Jesus is the Prophet who is to come', 'This is indeed the Prophet who is to come into the world (John 6:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the people say when they saw the sign?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 1, 'What feast was at hand when Jesus crossed the sea?', '["Dedication", "The Passover", "Tabernacles", "Pentecost (a common guess, but not what John says here)"]'::jsonb, 'The Passover', 'The Passover… was at hand (John 6:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'What feast was at hand when Jesus crossed the sea?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 1, 'What time did Jesus come to the disciples walking on the sea?', '["Mid-morning", "Noon (a common guess, but not what John says here)", "Evening / fourth watch of the night", "Dawn"]'::jsonb, 'Evening / fourth watch of the night', 'They saw Jesus walking on the sea… (John 6:16–19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'What time did Jesus come to the disciples walking on the sea?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 1, 'Where did the boat land?', '["Tiberias (a common guess, but not what John says here)", "Bethsaida", "Capernaum", "Jerusalem"]'::jsonb, 'Capernaum', 'They reached the land toward which they were going (John 6:21); crowd seeks him in Capernaum (John 6:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'Where did the boat land?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 1, 'Why did Jesus withdraw to the mountain alone?', '["Because they wanted to make him king by force", "Because he was ill (a common guess, but not what John says here)", "Because the disciples left", "Because night fell"]'::jsonb, 'Because they wanted to make him king by force', 'Perceiving… they were about to come and take him by force… he withdrew (John 6:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'Why did Jesus withdraw to the mountain alone?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 2, 'What did Jesus say was the true bread from heaven?', '["The temple shewbread", "Manna only (a common guess, but not what John says here)", "The Passover lamb only", "Himself — the bread of God coming down"]'::jsonb, 'Himself — the bread of God coming down', 'For the bread of God is he who comes down from heaven (John 6:33).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say was the true bread from heaven?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 2, 'What did Jesus say whoever believes in him will never do?', '["Never thirst", "Never sin", "Never die physically", "Never speak"]'::jsonb, 'Never thirst', 'Whoever believes in me shall never thirst (John 6:35).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say whoever believes in him will never do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 2, 'What did Jesus say whoever comes to him will never do?', '["Never read (a common guess, but not what John says here)", "Never hunger", "Never pray", "Never sleep"]'::jsonb, 'Never hunger', 'Whoever comes to me shall not hunger (John 6:35).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say whoever comes to him will never do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 2, 'What did many disciples say was a hard saying?', '["Who can listen to it?", "Who can copy it?", "Who can pay for it?", "Who can see it? (a common guess, but not what John says here)"]'::jsonb, 'Who can listen to it?', 'This is a hard saying; who can listen to it? (John 6:60).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did many disciples say was a hard saying?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 2, 'What did the crowd ask Jesus about works?', '["Where is Moses? (a common guess, but not what John says here)", "What must we do, to be doing the works of God?", "How much do we pay?", "Who is your rabbi?"]'::jsonb, 'What must we do, to be doing the works of God?', 'They said… "What must we do, to be doing the works of God?" (John 6:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the crowd ask Jesus about works?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 2, 'What does Jesus say must be drawn for someone to come to him?', '["Drawn by miracles", "Drawn by priests", "Drawn by fear (a common guess, but not what John says here)", "Drawn by the Father"]'::jsonb, 'Drawn by the Father', 'No one can come to me unless the Father who sent me draws him (John 6:44).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Jesus say must be drawn for someone to come to him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 2, 'What does Jesus say one must do to have eternal life?', '["Keep every jot of law alone", "Build synagogues (a common guess, but not what John says here)", "Baptize five times", "Eat his flesh and drink his blood"]'::jsonb, 'Eat his flesh and drink his blood', 'Unless you eat the flesh of the Son of Man… you have no life in you (John 6:53).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Jesus say one must do to have eternal life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 2, 'What is the work of God, according to Jesus?', '["Offer doves daily (a common guess, but not what John says here)", "Believe in him whom he has sent", "Circumcise your sons", "Memorize the Mishnah"]'::jsonb, 'Believe in him whom he has sent', 'This is the work of God, that you believe in him whom he has sent (John 6:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'What is the work of God, according to Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 2, 'What sign did the people compare to Moses?', '["The tabernacle wood", "Bread from heaven / manna", "The golden calf", "The Red Sea (a common guess, but not what John says here)"]'::jsonb, 'Bread from heaven / manna', 'Our fathers ate the manna in the wilderness (John 6:31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'What sign did the people compare to Moses?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 2, 'Why did the Jews murmur at Jesus?', '["Because he taxed them (a common guess, but not what John says here)", "Because he denied Moses", "Because he said he came down from heaven", "Because he healed on Sabbath"]'::jsonb, 'Because he said he came down from heaven', 'Is not this Jesus… how does he now say… I have come down from heaven? (John 6:41–42).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why did the Jews murmur at Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 3, 'What did Andrew point out besides the lad''s food?', '["That barley was unclean", "That it was not enough for so many", "That the lad was rich (a common guess, but not what John says here)", "That fish were forbidden"]'::jsonb, 'That it was not enough for so many', 'What are these for so many? (John 6:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did Andrew point out besides the lad''s food?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 3, 'What did Jesus cross to sit on the mountain?', '["The Mediterranean", "The Jordan (a common guess, but not what John says here)", "The Dead Sea", "The Sea of Galilee"]'::jsonb, 'The Sea of Galilee', 'Jesus went over the Sea of Galilee… (John 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did Jesus cross to sit on the mountain?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 3, 'What did Jesus mean by bread that perishes vs. enduring food?', '["Only kosher rules", "Food that endures to eternal life which the Son gives", "Only water (a common guess, but not what John says here)", "Only vegetables"]'::jsonb, 'Food that endures to eternal life which the Son gives', 'Do not work for the food that perishes, but for the food that endures to eternal life (John 6:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did Jesus mean by bread that perishes vs. enduring food?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 3, 'What did Jesus say Moses did not give?', '["The true bread from heaven", "The law (a common guess, but not what John says here)", "Circumcision", "The Passover"]'::jsonb, 'The true bread from heaven', 'It was not Moses who gave you the bread from heaven (John 6:32).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did Jesus say Moses did not give?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 3, 'What did Jesus tell the disciples to gather up?', '["Money", "Fragments", "Fish only", "New disciples"]'::jsonb, 'Fragments', 'Gather up the leftover fragments (John 6:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did Jesus tell the disciples to gather up?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 3, 'What did Simon Peter say Jesus had?', '["Words too simple", "Words for angels only", "Words of judgment only", "Words of eternal life"]'::jsonb, 'Words of eternal life', 'You have the words of eternal life (John 6:68).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did Simon Peter say Jesus had?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 3, 'What kind of boats came from Tiberias?', '["Royal barges", "Cargo ships", "Small boats", "Warships"]'::jsonb, 'Small boats', 'Boats from Tiberias came near the place (John 6:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What kind of boats came from Tiberias?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 3, 'When Jesus saw the crowd, what did he ask Philip?', '["Where are we to buy bread?", "Where is the boat?", "Where is the temple?", "Where is Lazarus? (a common guess, but not what John says here)"]'::jsonb, 'Where are we to buy bread?', 'Where are we to buy bread, so that these people may eat? (John 6:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'When Jesus saw the crowd, what did he ask Philip?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 3, 'Who did Jesus say was a devil?', '["Peter", "Philip", "Thomas", "Judas"]'::jsonb, 'Judas', 'Did I not choose you twelve? Yet one of you is a devil (John 6:70).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who did Jesus say was a devil?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 3, 'Whom did Peter say Jesus was?', '["The Roman prefect", "A new Moses only", "John the Baptist returned", "The Holy One of God"]'::jsonb, 'The Holy One of God', 'We have believed… you are the Holy One of God (John 6:69).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'Whom did Peter say Jesus was?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 4, 'How does John 6 present both gift and human response?', '["Only human will", "Only priests mediate", "Only fate (a common guess, but not what John says here) (does not match John’s wording in this verse)", "The Father draws and one must eat/believe — divine initiative and faith"]'::jsonb, 'The Father draws and one must eat/believe — divine initiative and faith', 'No one comes unless drawn… whoever believes has life (John 6:44, 47).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does John 6 present both gift and human response?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 4, 'How does walking on water function narratively after the feeding?', '["It is unrelated (a common guess, but not what John says here)", "It reveals Jesus'' divine identity and mastery over chaos", "It frightens only animals", "It shows he could not swim"]'::jsonb, 'It reveals Jesus'' divine identity and mastery over chaos', 'I am; do not be afraid (John 6:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does walking on water function narratively after the feeding?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 4, 'Theologically, how does the bread discourse connect to Passover context?', '["Bread means only politics", "Manna was better (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Jesus replaces manna as the true provision from heaven for eternal life", "Passover is irrelevant"]'::jsonb, 'Jesus replaces manna as the true provision from heaven for eternal life', 'Jesus is the true bread come down from heaven (John 6:32–33).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'Theologically, how does the bread discourse connect to Passover context?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 4, 'What analogy does Jesus use for eating his flesh and drinking his blood?', '["Synagogue seating", "Temple taxes (a common guess, but not what John says here)", "Priestly garments", "Abiding in him as he abides in the believer"]'::jsonb, 'Abiding in him as he abides in the believer', 'Whoever feeds on my flesh and drinks my blood abides in me, and I in him (John 6:56).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'What analogy does Jesus use for eating his flesh and drinking his blood?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 4, 'What did Jesus ask the Twelve?', '["Will you betray me tonight?", "Will you deny me? (a common guess, but not what John says here)", "Will you fund the mission?", "Do you want to go away as well?"]'::jsonb, 'Do you want to go away as well?', 'Jesus said to the twelve, "Do you want to go away as well?" (John 6:67).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'What did Jesus ask the Twelve?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 4, 'What did Jesus know about those who did not believe?', '["Only their ages", "That Judas would betray him", "Nothing (a common guess, but not what John says here)", "Only their names"]'::jsonb, 'That Judas would betray him', 'Jesus knew from the beginning… who would betray him (John 6:64).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'What did Jesus know about those who did not believe?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 4, 'What does Jesus say believers already have in John 6:47?', '["Eternal life", "Immunity from suffering", "Wealth", "A throne"]'::jsonb, 'Eternal life', 'Truly… whoever believes has eternal life (John 6:47).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Jesus say believers already have in John 6:47?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 4, 'What does murmuring in John 6 echo from Israel''s wilderness story?', '["Obedience", "Silence (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Praise for Moses", "Grumbling like Israel at manna — resistance to God''s provision"]'::jsonb, 'Grumbling like Israel at manna — resistance to God''s provision', 'Your fathers ate manna and died (John 6:49).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does murmuring in John 6 echo from Israel''s wilderness story?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 4, 'What does the crowd''s desire to make Jesus king contrast with his mission?', '["They reject kingship", "They want political messiah; he withdraws — kingdom is not forced", "They ignore signs", "They want Rome (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'They want political messiah; he withdraws — kingdom is not forced', 'They wanted to make him king… he withdrew (John 6:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does the crowd''s desire to make Jesus king contrast with his mission?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 4, 'Why did many disciples turn back and no longer walk with Jesus?', '["They found better teachers", "They were healed (a common guess, but not what John says here)", "They could not accept his teaching", "They feared Pilate"]'::jsonb, 'They could not accept his teaching', 'After this many of his disciples turned back (John 6:66).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did many disciples turn back and no longer walk with Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 5, 'How does "drawn by the Father" (John 6:44) relate to human responsibility?', '["Drawing is only geography", "Humans have zero role", "God forces belief (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Divine drawing enables coming; unbelief still judged — mystery of grace and response"]'::jsonb, 'Divine drawing enables coming; unbelief still judged — mystery of grace and response', 'No one can come… unless drawn (John 6:44).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does "drawn by the Father" (John 6:44) relate to human responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 5, 'How does John 6 prepare for the Last Supper and crucifixion in later chapters?', '["Language of flesh given and blood anticipates the cross and meal themes", "It ignores Passover (a common guess, but not what John says here) (does not match John’s wording in this verse)", "It only feeds crowds", "It removes sacrifice ideas"]'::jsonb, 'Language of flesh given and blood anticipates the cross and meal themes', 'The discourse shapes how readers hear later chapters.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does John 6 prepare for the Last Supper and crucifixion in later chapters?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 5, 'How does John 6:39 describe the Father''s will regarding those given to Jesus?', '["That works earn keeping", "That Jesus should lose nothing but raise it up on the last day", "That angels save all (a common guess, but not what John says here)", "That some may be lost randomly"]'::jsonb, 'That Jesus should lose nothing but raise it up on the last day', 'This is the will of him who sent me… I should lose nothing (John 6:39).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does John 6:39 describe the Father''s will regarding those given to Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 5, 'How does John 6:70 identify the betrayer?', '["Judas is innocent (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Peter is the devil", "Jesus calls Judas a devil — spiritual alignment, not mere politics", "Devil means only stress"]'::jsonb, 'Jesus calls Judas a devil — spiritual alignment, not mere politics', 'One of you is a devil (John 6:70).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does John 6:70 identify the betrayer?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 5, 'How does Peter''s confession function after the defection of many disciples?', '["It ends the chapter without meaning", "It shows Peter is perfect", "It replaces Jesus'' words (a common guess, but not what John says here)", "It highlights election and loyalty in contrast to unbelief"]'::jsonb, 'It highlights election and loyalty in contrast to unbelief', 'Lord, to whom shall we go? (John 6:68).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Peter''s confession function after the defection of many disciples?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 5, 'Scholarly discussion: how do Catholic, Protestant, and symbolic readings differ on John 6:53?', '["John rejects the Lord''s Supper", "Only John Calvin wrote on it (a common guess, but not what John says here) (does not match John’s wording in this verse)", "All agree it is only metaphor with no sacrament", "Debates turn on Eucharistic presence vs. symbolic union vs. faith language"]'::jsonb, 'Debates turn on Eucharistic presence vs. symbolic union vs. faith language', 'Historic interpretations vary on how literally to take flesh and blood.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'Scholarly discussion: how do Catholic, Protestant, and symbolic readings differ on John 6:53?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 5, 'What does Jesus claim about ascension in John 6:62?', '["He will never leave earth", "What if you see the Son of Man ascending where he was before?", "Only Elijah ascends (a common guess, but not what John says here)", "Ascension is impossible"]'::jsonb, 'What if you see the Son of Man ascending where he was before?', 'What if you see the Son of Man ascending to where he was before? (John 6:62).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Jesus claim about ascension in John 6:62?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 5, 'What does Jesus say about the bread he gives for the life of the world?', '["Temple shewbread", "His flesh", "Roman grain", "Money"]'::jsonb, 'His flesh', 'The bread that I will give for the life of the world is my flesh (John 6:51).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Jesus say about the bread he gives for the life of the world?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 5, 'What does Jesus say about the manna-eating fathers?', '["They wrote John''s Gospel", "They died", "They became angels", "They entered Canaan sinlessly"]'::jsonb, 'They died', 'Your fathers ate the manna in the wilderness, and they died (John 6:49).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Jesus say about the manna-eating fathers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 6, 5, 'What narrative effect does ending chapter 6 with Judas create?', '["Foreshadows passion conflict while the bread discourse lingers in memory", "Ends signs (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Closes all hope", "Removes tension"]'::jsonb, 'Foreshadows passion conflict while the bread discourse lingers in memory', 'Judas closes the chapter (John 6:71).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What narrative effect does ending chapter 6 with Judas create?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 1, 'How did the Jews marvel at Jesus'' learning?', '["How does he sail? (a common guess, but not what John says here)", "How does he heal?", "How does he pay taxes?", "How does this man know letters when he has never studied?"]'::jsonb, 'How does this man know letters when he has never studied?', 'How is it that this man has learning when he has never studied? (John 7:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'How did the Jews marvel at Jesus'' learning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 1, 'What did Jesus cry out about anyone thirsting?', '["Let him come to me and drink", "Let him fast forever", "Let him buy wine (a common guess, but not what John says here)", "Let him avoid the temple"]'::jsonb, 'Let him come to me and drink', 'If anyone thirsts, let him come to me and drink (John 7:37).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus cry out about anyone thirsting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 1, 'What did Jesus say about his time / the world''s time?', '["My time has not yet come; your time is always here", "Only the priests have time", "My time is your time (a common guess, but not what John says here)", "Time does not matter"]'::jsonb, 'My time has not yet come; your time is always here', 'My time has not yet come, but your time is always here (John 7:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say about his time / the world''s time?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 1, 'What did others say?', '["He is Moses (a common guess, but not what John says here)", "He is leading the people astray", "He is the Christ openly", "He is Elijah"]'::jsonb, 'He is leading the people astray', 'Others… he is leading the people astray (John 7:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did others say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 1, 'What did some say when they heard Jesus?', '["He is silent (a common guess, but not what John says here)", "He is a good man", "He is a deceiver", "He is a priest"]'::jsonb, 'He is a good man', 'Some said… he is a good man (John 7:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did some say when they heard Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 1, 'What feast did Jesus later go up to publicly?', '["Feast of Booths / Tabernacles", "Weeks (a common guess, but not what John says here)", "Purim", "Passover"]'::jsonb, 'Feast of Booths / Tabernacles', 'The Feast of Booths was at hand (John 7:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'What feast did Jesus later go up to publicly?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 1, 'Where did Jesus teach mid-feast?', '["In Samaria", "On the Mount of Olives only", "In the temple", "In Capernaum only"]'::jsonb, 'In the temple', 'Jesus went up into the temple and began teaching (John 7:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'Where did Jesus teach mid-feast?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 1, 'Whose brothers told Jesus to show himself to the world?', '["Mary and Martha", "The disciples", "Nicodemus", "His brothers"]'::jsonb, 'His brothers', 'His brothers said… show yourself to the world (John 7:3–4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'Whose brothers told Jesus to show himself to the world?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 1, 'Whose glory did Jesus seek?', '["His own fame", "Pilate''s (a common guess, but not what John says here)", "The crowds'' applause", "The Father''s who sent him"]'::jsonb, 'The Father''s who sent him', 'If anyone''s will is to do God''s will… (John 7:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'Whose glory did Jesus seek?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 1, 'Why was there division about Jesus?', '["Because of weather", "Because of boats", "Because of food (a common guess, but not what John says here)", "Because of fear of the authorities"]'::jsonb, 'Because of fear of the authorities', 'For fear of the Jews… (John 7:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'Why was there division about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 2, 'What did Jesus say people judged by?', '["Roman edicts", "The law alone", "Appearances", "The weather"]'::jsonb, 'Appearances', 'Do not judge by appearances, but judge with right judgment (John 7:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say people judged by?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 2, 'What did John say Jesus meant by living water?', '["Wine (a common guess, but not what John says here)", "Manna", "Rain only", "The Spirit"]'::jsonb, 'The Spirit', 'This he said about the Spirit (John 7:39).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did John say Jesus meant by living water?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 2, 'What did Moses give that Jesus used in argument about healing?', '["The tithe", "Circumcision", "The veil", "The ark (a common guess, but not what John says here)"]'::jsonb, 'Circumcision', 'If on the Sabbath a man receives circumcision… (John 7:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Moses give that Jesus used in argument about healing?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 2, 'What did some say the Christ would be born from?', '["Galilee only", "David''s seed, Bethlehem", "Rome (a common guess, but not what John says here)", "Egypt only"]'::jsonb, 'David''s seed, Bethlehem', 'Has not the Scripture said… from Bethlehem? (John 7:42).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did some say the Christ would be born from?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 2, 'What prophet did the crowd think no one would come from?', '["Tyre (a common guess, but not what John says here)", "Galilee", "Babylon", "Egypt"]'::jsonb, 'Galilee', 'Search and see that no prophet arises from Galilee (John 7:52).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'What prophet did the crowd think no one would come from?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 2, 'What would flow from the heart of believers, according to Jesus?', '["Rivers of living water", "Ink for scrolls", "Oil only", "Gold (a common guess, but not what John says here)"]'::jsonb, 'Rivers of living water', 'Out of his heart will flow rivers of living water (John 7:38).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'What would flow from the heart of believers, according to Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 2, 'Who defended Jesus to the officers?', '["Joseph of Arimathea", "Nicodemus", "Annas", "Gamaliel"]'::jsonb, 'Nicodemus', 'Nicodemus… said to them… (John 7:50).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'Who defended Jesus to the officers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 2, 'Who wanted Jesus to go to Judea so disciples could see his works?', '["Pilate", "The Samaritans", "Pharisees", "His brothers"]'::jsonb, 'His brothers', 'Leave here and go to Judea… (John 7:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'Who wanted Jesus to go to Judea so disciples could see his works?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 2, 'Why did Jesus not go openly at first?', '["He feared boats", "He was sick (a common guess, but not what John says here)", "His hour had not yet come", "He avoided Passover"]'::jsonb, 'His hour had not yet come', 'His brothers… Jesus said… My time has not yet come (John 7:6–8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why did Jesus not go openly at first?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 2, 'Why was the Spirit not yet given?', '["Pentecost had passed", "Jesus was not yet glorified", "Disciples refused (a common guess, but not what John says here)", "The temple was closed"]'::jsonb, 'Jesus was not yet glorified', 'For as yet the Spirit had not been given, because Jesus was not yet glorified (John 7:39).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why was the Spirit not yet given?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 3, 'How does John 7 heighten messianic secrecy and public teaching tension?', '["No conflict (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Jesus teaches openly yet his hour and origin are disputed", "Everyone understands", "Jesus is silent"]'::jsonb, 'Jesus teaches openly yet his hour and origin are disputed', 'Division runs through the chapter.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does John 7 heighten messianic secrecy and public teaching tension?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 3, 'How does the crowd''s ignorance of Jesus'' birthplace function ironically?', '["Scripture says Messiah is from Bethlehem — irony for readers who know Jesus'' birth", "Birthplace is unknown to all", "Bethlehem is irrelevant (a common guess, but not what John says here) (does not match John’s wording in this verse)", "John contradicts Matthew"]'::jsonb, 'Scripture says Messiah is from Bethlehem — irony for readers who know Jesus'' birth', 'Has not the Scripture said… Bethlehem? (John 7:42).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does the crowd''s ignorance of Jesus'' birthplace function ironically?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 3, 'In John 7, what does Jesus say about knowing where he is from?', '["You know me and where I come from — yet I have not come of my own accord", "You know nothing (a common guess, but not what John says here) (does not match John’s wording in this verse)", "He denies incarnation", "He hides hometown"]'::jsonb, 'You know me and where I come from — yet I have not come of my own accord', 'You know me, and you know where I come from (John 7:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'In John 7, what does Jesus say about knowing where he is from?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 3, 'Theologically, what does "living water" at the feast evoke?', '["Only baptism quantity", "Only physical thirst", "Festal expectation of eschatological Spirit outpouring", "Only rain rituals (a common guess, but not what John says here)"]'::jsonb, 'Festal expectation of eschatological Spirit outpouring', 'Rivers of living water (John 7:38–39).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'Theologically, what does "living water" at the feast evoke?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 3, 'What crowd division existed on whether Jesus was the Christ?', '["All agreed (a common guess, but not what John says here) (does not match John’s wording in this verse)", "No one cared", "Only women debated", "Some said when Christ comes no one will know origin — others knew his origin"]'::jsonb, 'Some said when Christ comes no one will know origin — others knew his origin', 'Is the Christ to come from Galilee? (John 7:41).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What crowd division existed on whether Jesus was the Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 3, 'What did Jesus say about Moses and accusation?', '["Moses opposed Jesus", "Moses is irrelevant", "Moses accuses you — if you believed Moses you would believe Jesus", "Moses never wrote (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'Moses accuses you — if you believed Moses you would believe Jesus', 'Do not think that I will accuse you to the Father. There is one who accuses you: Moses (cf. John 5:45).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did Jesus say about Moses and accusation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 3, 'What did the Pharisees ask the officers?', '["Did you arrest him?", "Will you testify?", "Where is he? (a common guess, but not what John says here)", "Are you deceived too?"]'::jsonb, 'Are you deceived too?', 'Are you deceived too? (John 7:47).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did the Pharisees ask the officers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 3, 'What did the officers say when they returned without Jesus?', '["He threatened us", "He paid us (a common guess, but not what John says here)", "We never found him", "No one ever spoke like this man"]'::jsonb, 'No one ever spoke like this man', 'No one ever spoke like this man (John 7:46).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did the officers say when they returned without Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 3, 'What does Nicodemus''s appeal to law suggest about his growth?', '["He leaves the story", "He condemns Jesus (a common guess, but not what John says here)", "He fully follows Jesus publicly", "He risks reputation by partial defense of fairness"]'::jsonb, 'He risks reputation by partial defense of fairness', 'Does our law judge a man without first giving him a hearing? (John 7:51).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Nicodemus''s appeal to law suggest about his growth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 3, 'What theme links not yet / time in John 7 with John''s hour theology?', '["Jesus'' hour for glorification controls when he fully manifests", "Time is meaningless (a common guess, but not what John says here)", "Hour is only for disciples", "Jesus acts randomly"]'::jsonb, 'Jesus'' hour for glorification controls when he fully manifests', 'My hour has not yet come (John 7:8, 30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What theme links not yet / time in John 7 with John''s hour theology?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 4, 'How does Jesus'' learning without rabbinic study claim authority?', '["He copies Philo (a common guess, but not what John says here)", "His teaching comes from the one who sent him", "He read many scrolls secretly", "He denies Scripture"]'::jsonb, 'His teaching comes from the one who sent him', 'My teaching is not mine, but his who sent me (John 7:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Jesus'' learning without rabbinic study claim authority?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 4, 'How does John 7 prepare for 8''s light and truth themes?', '["Temple is irrelevant", "Feast ends John", "No connection (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Feast setting and temple teaching bridge to \"I am the light\""]'::jsonb, 'Feast setting and temple teaching bridge to "I am the light"', 'Continues Jerusalem festival block.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does John 7 prepare for 8''s light and truth themes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 4, 'How does fear of the Jews shape characters'' public speech in John 7?', '["Everyone speaks boldly", "Only Jesus fears", "No fear exists (a common guess, but not what John says here)", "Secret faith vs open — Nicodemus begins to speak"]'::jsonb, 'Secret faith vs open — Nicodemus begins to speak', 'For fear of the Jews… (John 7:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does fear of the Jews shape characters'' public speech in John 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 4, 'Scholarly note: what is debated about John 7:53–8:11?', '["Many scholars see the pericope adulterae as later in textual history", "John wrote it certainly", "All MSS omit it (a common guess, but not what John says here) (does not match John’s wording in this verse)", "It is in all first-century papyri"]'::jsonb, 'Many scholars see the pericope adulterae as later in textual history', 'Textual criticism notes variation in placement and presence.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'Scholarly note: what is debated about John 7:53–8:11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 4, 'What did some in the crowd believe about Messiah''s origin?', '["He must be Roman (a common guess, but not what John says here)", "They would not know where he comes from", "He must be Egyptian", "He must be Samaritan"]'::jsonb, 'They would not know where he comes from', 'When the Christ appears, no one will know where he comes from (John 7:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'What did some in the crowd believe about Messiah''s origin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 4, 'What division among officers and Pharisees does John highlight?', '["Indifference", "Unity (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Officers impressed; leaders hardened — authority vs. truth", "Only crowds divided"]'::jsonb, 'Officers impressed; leaders hardened — authority vs. truth', 'Have any authorities believed? (John 7:48).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'What division among officers and Pharisees does John highlight?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 4, 'What does "seeking glory" vs seeking Father''s glory contrast in 7:18?', '["Glory is bad (a common guess, but not what John says here)", "Father seeks human glory", "Jesus seeks fame", "Self-seeking teachers vs truth — applies to Jesus'' claims"]'::jsonb, 'Self-seeking teachers vs truth — applies to Jesus'' claims', 'The one who seeks the glory of him who sent him is true (John 7:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does "seeking glory" vs seeking Father''s glory contrast in 7:18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 4, 'What does Jesus say about circumcision on the Sabbath?', '["Moses gave it — you circumcise on Sabbath — why anger at whole man healed?", "Sabbath forbids all acts", "Healing is evil (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Circumcision is wrong"]'::jsonb, 'Moses gave it — you circumcise on Sabbath — why anger at whole man healed?', 'If a man receives circumcision on the Sabbath… (John 7:22–23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Jesus say about circumcision on the Sabbath?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 4, 'What test did Jesus propose about willing God''s will?', '["Whether one is from Galilee", "Whether one is rich (a common guess, but not what John says here)", "Whether one is circumcised", "Whether one knows whether teaching is from God"]'::jsonb, 'Whether one knows whether teaching is from God', 'If anyone''s will is to do God''s will, he will know (John 7:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'What test did Jesus propose about willing God''s will?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 4, 'Why did they try to arrest Jesus yet could not?', '["Because Romans stopped them", "Because disciples fought (a common guess, but not what John says here)", "Because his hour had not yet come", "Because he hid in a well"]'::jsonb, 'Because his hour had not yet come', 'So they tried to arrest him, but no one laid hands on him… his hour had not yet come (John 7:30, 44).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did they try to arrest Jesus yet could not?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 5, 'How does Jesus'' public cry on the last day of the feast create drama?', '["He avoids crowds", "He leaves early", "He whispers (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Invitation at climactic festival moment — offer of Spirit"]'::jsonb, 'Invitation at climactic festival moment — offer of Spirit', 'On the last day of the feast… Jesus stood up and cried out (John 7:37).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Jesus'' public cry on the last day of the feast create drama?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 5, 'How does Jesus'' teaching on Moses and Moses'' accusers connect John 7 to John 5?', '["No connection (a common guess, but not what John says here)", "Mosaic witness to Jesus remains a through-line", "Only John 5 matters", "Moses is canceled"]'::jsonb, 'Mosaic witness to Jesus remains a through-line', 'Moses wrote of Jesus (John 5:46).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Jesus'' teaching on Moses and Moses'' accusers connect John 7 to John 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 5, 'How does the chapter end regarding arrest and belief?', '["Everyone believes", "Jesus is arrested", "Story ends (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Tension remains — some believe, authorities oppose — plot advances"]'::jsonb, 'Tension remains — some believe, authorities oppose — plot advances', 'Each went to his own house (John 7:53).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does the chapter end regarding arrest and belief?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 5, 'What christological title surfaces in the crowd''s messianic debate?', '["Emperor (a common guess, but not what John says here)", "Legion commander", "High priest only", "Christ / Messiah"]'::jsonb, 'Christ / Messiah', 'Can it be that the authorities really know… the Christ? (John 7:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What christological title surfaces in the crowd''s messianic debate?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 5, 'What did Jesus say about where the one who seeks God''s glory is?', '["True", "Confused", "Silent", "Angry"]'::jsonb, 'True', 'The one who seeks the glory of him who sent him is true, and in him there is no falsehood (John 7:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus say about where the one who seeks God''s glory is?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 5, 'What did some people say when they heard Jesus might be the Christ?', '["But we know where this man comes from", "He must be from Rome", "We know nothing (a common guess, but not what John says here)", "He must be from Egypt"]'::jsonb, 'But we know where this man comes from', 'But we know where this man comes from, and when the Christ appears, no one will know where he comes from (John 7:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did some people say when they heard Jesus might be the Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 5, 'What does "out of his heart" (Greek koilia, belly) suggest in 7:38?', '["Only digestion", "Only sacrifice", "Inner life transformed by the Spirit — fruitful mission", "Only anatomy (a common guess, but not what John says here)"]'::jsonb, 'Inner life transformed by the Spirit — fruitful mission', 'Out of his heart will flow rivers of living water (John 7:38).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does "out of his heart" (Greek koilia, belly) suggest in 7:38?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 5, 'What geographic tension runs through "Galilee" slur in 7:41,52?', '["Galilee is praised only", "Provincial prejudice vs. scriptural expectation — tests hearers", "Only Judeans matter (a common guess, but not what John says here)", "Geography is neutral"]'::jsonb, 'Provincial prejudice vs. scriptural expectation — tests hearers', 'Prophet… from Galilee? (John 7:52).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What geographic tension runs through "Galilee" slur in 7:41,52?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 5, 'Why did Jesus say the crowd did not keep the law?', '["Because they sought to kill him", "Because they studied", "Because they tithed (a common guess, but not what John says here)", "Because they fasted"]'::jsonb, 'Because they sought to kill him', 'Has not Moses given you the law? Yet none of you keeps the law. Why do you seek to kill me? (John 7:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why did Jesus say the crowd did not keep the law?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 7, 5, 'Why is the Spirit''s future given tied to Jesus'' glorification?', '["Spirit comes before cross", "Glory is unrelated (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Spirit ignores Jesus", "Pentecost flows from ascension/exaltation — Johannine pneumatology"]'::jsonb, 'Pentecost flows from ascension/exaltation — Johannine pneumatology', 'The Spirit had not yet been given, because Jesus was not yet glorified (John 7:39).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the Spirit''s future given tied to Jesus'' glorification?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 1, 'If the Son sets you free, how free are you?', '["Free on Sabbath only", "Somewhat free", "Free indeed", "Free in secret"]'::jsonb, 'Free indeed', 'If the Son sets you free, you will be free indeed (John 8:36).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'If the Son sets you free, how free are you?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 1, 'What did Jesus call himself?', '["The door only", "The light of the world", "The bread of life again", "The good shepherd"]'::jsonb, 'The light of the world', 'I am the light of the world (John 8:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus call himself?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 1, 'What did Jesus say a slave does not remain in the house forever?', '["The slave buys the house", "The house collapses", "The son remains forever", "The Romans decide"]'::jsonb, 'The son remains forever', 'The slave does not remain in the house forever; the son remains forever (John 8:35).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say a slave does not remain in the house forever?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 1, 'What did Jesus say before Abraham was?', '["I was in Babylon", "I am", "I was a prophet", "I was planned"]'::jsonb, 'I am', 'Before Abraham was, I am (John 8:58).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say before Abraham was?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 1, 'What did Jesus say the devil was from the beginning?', '["A priest", "A murderer", "A king of Judea", "A shepherd"]'::jsonb, 'A murderer', 'He was a murderer from the beginning (John 8:44).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say the devil was from the beginning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 1, 'What did Jesus say the truth would do for disciples?', '["Remove the law", "Set them free", "Give them thrones", "Make them rich"]'::jsonb, 'Set them free', 'You will know the truth, and the truth will set you free (John 8:32).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say the truth would do for disciples?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 1, 'What did Jesus say there is no truth in?', '["The law", "The devil", "The temple", "The Passover"]'::jsonb, 'The devil', 'When he lies, he speaks out of his own character, for he is a liar and the father of lies (John 8:44).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say there is no truth in?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 1, 'What did Jesus say whoever follows him will not walk in?', '["Samaria", "Poverty", "Darkness", "The temple courts only"]'::jsonb, 'Darkness', 'Whoever follows me will not walk in darkness (John 8:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say whoever follows him will not walk in?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 1, 'Who did Jesus say were slaves to sin?', '["Everyone who practices sin", "Only women (a common guess, but not what John says here)", "Only Romans", "Only tax collectors"]'::jsonb, 'Everyone who practices sin', 'Everyone who practices sin is a slave to sin (John 8:34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who did Jesus say were slaves to sin?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 1, 'Whose children did Jesus say the Jews were acting like?', '["Moses'' only", "The devil''s", "Abraham''s faithfully", "God''s without fault"]'::jsonb, 'The devil''s', 'You are of your father the devil (John 8:44).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'Whose children did Jesus say the Jews were acting like?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 2, 'Early in John 8, who brought a woman caught in adultery?', '["Roman soldiers", "Her family (a common guess, but not what John says here)", "Scribes and Pharisees", "The disciples"]'::jsonb, 'Scribes and Pharisees', 'The scribes and the Pharisees brought a woman… (John 8:3, textual note).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'Early in John 8, who brought a woman caught in adultery?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 2, 'What did Jesus ask the woman finally?', '["Where are they? Has no one condemned you?", "Who is your father?", "What is your income?", "Will you marry me? (a common guess, but not what John says here)"]'::jsonb, 'Where are they? Has no one condemned you?', 'Woman, where are they? Has no one condemned you? (John 8:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus ask the woman finally?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 2, 'What did Jesus do when they tried to stone him?', '["Hid himself and went out of the temple", "Preached louder", "Fought back (a common guess, but not what John says here)", "Called Rome"]'::jsonb, 'Hid himself and went out of the temple', 'Jesus hid himself and went out of the temple (John 8:59).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus do when they tried to stone him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 2, 'What did Jesus say he judged?', '["He judged no one", "He judged her immediately", "He judged Rome", "He judged the Pharisees only"]'::jsonb, 'He judged no one', 'Neither do I condemn you (John 8:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say he judged?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 2, 'What did Jesus say whoever was without sin should do?', '["Bless her (a common guess, but not what John says here)", "Pay her fine", "Cast the first stone", "Arrest her"]'::jsonb, 'Cast the first stone', 'Let him who is without sin among you be the first to throw a stone at her (John 8:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say whoever was without sin should do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 2, 'What did Jesus say would die in sins if people did not believe?', '["They would die in their sins", "They would become priests", "They would become rich", "They would see angels (a common guess, but not what John says here)"]'::jsonb, 'They would die in their sins', 'I told you that you would die in your sins (John 8:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say would die in sins if people did not believe?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 2, 'What did Jesus tell her to do?', '["Leave the city", "Go marry again", "Offer a sacrifice", "Sin no more"]'::jsonb, 'Sin no more', 'Go, and from now on sin no more (John 8:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus tell her to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 2, 'What did Jesus write on the ground?', '["A divorce certificate", "John does not say what he wrote", "The ten commandments", "Her name only (a common guess, but not what John says here)"]'::jsonb, 'John does not say what he wrote', 'Jesus bent down and wrote with his finger on the ground (John 8:6,8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus write on the ground?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 2, 'What did the Jews pick up to throw at Jesus?', '["Stones", "Sticks", "Money bags", "Scrolls"]'::jsonb, 'Stones', 'They picked up stones to throw at him (John 8:59).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the Jews pick up to throw at Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 2, 'What happened to the accusers from oldest to youngest?', '["They praised Jesus", "They went out", "They stoned her", "They called the Romans"]'::jsonb, 'They went out', 'They went away one by one (John 8:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'What happened to the accusers from oldest to youngest?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 3, 'How does "I am" before Abraham function christologically?', '["Means only teacher", "Echoes divine name — pre-existence and deity", "Means only age (a common guess, but not what John says here)", "Denies eternity"]'::jsonb, 'Echoes divine name — pre-existence and deity', 'Before Abraham was, I am (John 8:58).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does "I am" before Abraham function christologically?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 3, 'How does the attempted stoning relate to claims of blasphemy?', '["Stoning is for theft only", "They agree with him", "No reaction (a common guess, but not what John says here)", "They understand a divine claim even as they reject it"]'::jsonb, 'They understand a divine claim even as they reject it', 'They picked up stones… (John 8:59).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does the attempted stoning relate to claims of blasphemy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 3, 'How does the slavery/freedom discourse address Jewish identity claims?', '["Ethnicity saves automatically", "True children of Abraham receive Jesus'' word; slavery to sin is the issue", "Abraham is irrelevant (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Freedom is political only"]'::jsonb, 'True children of Abraham receive Jesus'' word; slavery to sin is the issue', 'If you were Abraham''s children, you would be doing what Abraham did (John 8:39).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does the slavery/freedom discourse address Jewish identity claims?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 3, 'How old did the Jews say Jesus was?', '["Twelve (a common guess, but not what John says here)", "Not yet fifty years", "Thirty only", "A hundred"]'::jsonb, 'Not yet fifty years', 'You are not yet fifty years old (John 8:57).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'How old did the Jews say Jesus was?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 3, 'Theologically, how does light/darkness in John 8 cohere with John 1?', '["Prologue is unrelated", "Light is new in ch. 8", "Jesus as light continues the Prologue''s conflict with darkness", "Darkness wins (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'Jesus as light continues the Prologue''s conflict with darkness', 'I am the light of the world (John 8:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'Theologically, how does light/darkness in John 8 cohere with John 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 3, 'What did Jesus say Abraham rejoiced to see?', '["The Exodus", "Rome''s peace", "The temple rebuilt", "Jesus'' day"]'::jsonb, 'Jesus'' day', 'Abraham rejoiced that he would see my day (John 8:56).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did Jesus say Abraham rejoiced to see?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 3, 'What did Jesus say about his words?', '["What I have seen with my Father I proclaim", "What I invent myself", "What Pharisees approve", "What crowds fund (a common guess, but not what John says here)"]'::jsonb, 'What I have seen with my Father I proclaim', 'I speak of what I have seen with my Father (John 8:38).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did Jesus say about his words?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 3, 'What does Jesus claim about seeing Abraham?', '["Abraham was mistaken (a common guess, but not what John says here)", "Abraham saw Jesus'' day and rejoiced", "Abraham rejected Jesus", "Abraham never met Jesus"]'::jsonb, 'Abraham saw Jesus'' day and rejoiced', 'Your father Abraham rejoiced that he would see my day (John 8:56).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Jesus claim about seeing Abraham?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 3, 'Where did Jesus say he was from?', '["From Rome", "From Egypt", "From Nazareth only", "From above"]'::jsonb, 'From above', 'You are from below; I am from above (John 8:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'Where did Jesus say he was from?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 3, 'Whom did Jesus say people must believe he is to avoid dying in sins?', '["Moses", "The temple", "I am he", "Caesar"]'::jsonb, 'I am he', 'Unless you believe that I am he you will die in your sins (John 8:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'Whom did Jesus say people must believe he is to avoid dying in sins?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 4, 'How does Abraham seed language function in the dispute?', '["Physical descent is not enough — moral alignment with God''s word defines children", "Women cannot be children of Abraham", "Only DNA matters (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Only priests count"]'::jsonb, 'Physical descent is not enough — moral alignment with God''s word defines children', 'If you were Abraham''s children, you would be doing what Abraham did (John 8:39).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Abraham seed language function in the dispute?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 4, 'How does Jesus contrast his speech with the devil''s?', '["Jesus speaks truth from the Father; devil lies", "Both lie (a common guess, but not what John says here)", "Both speak randomly", "Truth cannot be known"]'::jsonb, 'Jesus speaks truth from the Father; devil lies', 'Because I tell the truth, you do not believe me (John 8:45).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Jesus contrast his speech with the devil''s?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 4, 'How does John 8 advance the plot toward exclusion from temple and passion?', '["Conflict decreases (a common guess, but not what John says here)", "Jesus leaves Judea forever", "Authorities convert", "Growing lethal opposition after divine claims"]'::jsonb, 'Growing lethal opposition after divine claims', 'They picked up stones (John 8:59).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does John 8 advance the plot toward exclusion from temple and passion?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 4, 'How does truth setting free relate to sonship in John 8:31–36?', '["Truth is optional (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Abiding in Jesus'' word leads to knowledge and freedom from sin''s slavery", "Sonship is only ethnic", "Freedom is financial"]'::jsonb, 'Abiding in Jesus'' word leads to knowledge and freedom from sin''s slavery', 'If you abide in my word… you will know the truth (John 8:31–32).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does truth setting free relate to sonship in John 8:31–36?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 4, 'Scholarly caution: how should preachers treat John 7:53–8:11?', '["Assert it is certainly Johannine", "Ignore all scholarship (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Note textual variant status; core themes still preached from surrounding chapters", "Remove John 8 entirely"]'::jsonb, 'Note textual variant status; core themes still preached from surrounding chapters', 'Responsible handling notes manuscript diversity.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'Scholarly caution: how should preachers treat John 7:53–8:11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 4, 'What does Jesus say about honor in John 8:49?', '["He honors his Father", "He avoids honor", "He seeks crowds'' honor", "He dishonors Moses"]'::jsonb, 'He honors his Father', 'I honor my Father (John 8:49).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Jesus say about honor in John 8:49?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 4, 'What does Jesus say about who hears God''s words?', '["Whoever is of God hears the words of God", "Only Romans", "No one (a common guess, but not what John says here)", "Only priests"]'::jsonb, 'Whoever is of God hears the words of God', 'Whoever is of God hears the words of God (John 8:47).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Jesus say about who hears God''s words?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 4, 'What does the adultery scene (where present) show about judgment and mercy?', '["It is only about law (a common guess, but not what John says here)", "It rejects forgiveness", "Jesus redirects scrutiny from the woman alone to all sinners", "It approves adultery"]'::jsonb, 'Jesus redirects scrutiny from the woman alone to all sinners', 'Let him who is without sin… (John 8:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does the adultery scene (where present) show about judgment and mercy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 4, 'What motive does Jesus attribute to the devil in John 8:44?', '["Murderous deception from the beginning", "Zeal for truth", "Weakness (a common guess, but not what John says here)", "Love of Israel"]'::jsonb, 'Murderous deception from the beginning', 'He… does not stand in the truth, because there is no truth in him (John 8:44).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'What motive does Jesus attribute to the devil in John 8:44?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 4, 'Why does Jesus say they cannot bear his word in John 8:43?', '["They are deaf (a common guess, but not what John says here)", "They are too young", "They are poor", "They are of their father the devil"]'::jsonb, 'They are of their father the devil', 'You are of your father the devil (John 8:44).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Jesus say they cannot bear his word in John 8:43?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 5, 'How does Jesus'' hidden departure mirror other escape narratives?', '["Divine control of timing — hour not yet", "Fear alone", "Magic (a common guess, but not what John says here)", "Coincidence"]'::jsonb, 'Divine control of timing — hour not yet', 'Jesus hid himself and went out (John 8:59).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Jesus'' hidden departure mirror other escape narratives?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 5, 'How does John 8''s debate prepare for John 9''s light and blindness?', '["No thematic link (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Chapter 9 ignores light", "Continues seeing/not seeing theme into the sign of healing blindness", "Only miracles matter"]'::jsonb, 'Continues seeing/not seeing theme into the sign of healing blindness', 'Leads into man born blind narrative.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does John 8''s debate prepare for John 9''s light and blindness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 5, 'How does belief "I am he" in 8:24 connect to Yahweh-language?', '["Implicit divine identity claims run through \"I am\" sayings", "Denies OT (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Only human identity", "Only angel"]'::jsonb, 'Implicit divine identity claims run through "I am" sayings', 'Unless you believe that I am he… (John 8:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does belief "I am he" in 8:24 connect to Yahweh-language?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 5, 'How does remaining in the word (8:31) relate to discipleship in John?', '["Disciples never grow", "Word is optional (a common guess, but not what John says here)", "Only apostles abide", "True disciples abide and experience truth and freedom"]'::jsonb, 'True disciples abide and experience truth and freedom', 'If you abide in my word, you are truly my disciples (John 8:31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does remaining in the word (8:31) relate to discipleship in John?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 5, 'What did Jesus say would happen if he glorified himself?', '["His glory would be nothing", "He would escape the cross", "He would be king (a common guess, but not what John says here)", "He would be rich"]'::jsonb, 'His glory would be nothing', 'If I glorify myself, my glory is nothing (John 8:54).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus say would happen if he glorified himself?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 5, 'What does "two will become one" echo avoidance in adultery debate context?', '["Marriage unity background in moral discussion — points to God''s design", "Only priests marry", "Denies marriage", "Only Roman law (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'Marriage unity background in moral discussion — points to God''s design', 'Adultery breaks covenant one-flesh union.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does "two will become one" echo avoidance in adultery debate context?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 5, 'What does Jesus imply about his judges in John 8:15–16?', '["They judge by appearances; Jesus judges with the Father righteously", "Father does not judge", "Jesus never judges (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Judging is always wrong"]'::jsonb, 'They judge by appearances; Jesus judges with the Father righteously', 'You judge according to the flesh; I judge no one (John 8:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Jesus imply about his judges in John 8:15–16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 5, 'What does the woman caught narrative contribute to forgiveness theology?', '["Law only (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Condemnation without mercy", "Jesus does not condemn yet calls to holiness — grace and command", "Cheap grace without change"]'::jsonb, 'Jesus does not condemn yet calls to holiness — grace and command', 'Neither do I condemn you… sin no more (John 8:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does the woman caught narrative contribute to forgiveness theology?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 5, 'What intertestamental expectation might "light of the world" evoke?', '["Isaiah''s servant/light to nations — messianic light", "Only candlelight", "No OT (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Only Greek philosophy"]'::jsonb, 'Isaiah''s servant/light to nations — messianic light', 'Light of the world (John 8:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What intertestamental expectation might "light of the world" evoke?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 8, 5, 'Whom did Jesus say judges no one unjustly with him?', '["The high priest", "The Father", "Moses", "Pilate"]'::jsonb, 'The Father', 'Even if I do judge, my judgment is true… I am not alone in it, but I and the Father who sent me (John 8:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'Whom did Jesus say judges no one unjustly with him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 1, 'On what day did the neighbors debate his healing?', '["The Sabbath", "Passover", "The Day of Atonement", "Tabernacles"]'::jsonb, 'The Sabbath', 'Now it was a Sabbath day when Jesus made the mud and opened his eyes (John 9:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'On what day did the neighbors debate his healing?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 1, 'What did Jesus make with his saliva?', '["Mud", "Bread", "Wine", "Oil"]'::jsonb, 'Mud', 'He spat on the ground and made mud with the saliva (John 9:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus make with his saliva?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 1, 'What did Jesus say about the man''s blindness?', '["That punishment was final", "That God''s works might be displayed", "That sin did not matter (a common guess, but not what John says here)", "That he would never see"]'::jsonb, 'That God''s works might be displayed', 'It was not that this man sinned… but that the works of God might be displayed (John 9:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say about the man''s blindness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 1, 'What did the Jews do to his parents?', '["Asked how he received sight", "Made them priests", "Sent them to Rome", "Stoned them (a common guess, but not what John says here)"]'::jsonb, 'Asked how he received sight', 'They asked them, "Is this your son, who you say was born blind?" (John 9:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the Jews do to his parents?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 1, 'What did the healed man call Jesus when questioned?', '["An angel", "A priest", "A king of Rome", "A prophet"]'::jsonb, 'A prophet', 'He is a prophet (John 9:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the healed man call Jesus when questioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 1, 'What division occurred among the Pharisees?', '["Whether Rome should rule", "Whether Moses existed (a common guess, but not what John says here)", "Whether fish were clean", "Whether Jesus was a sinner"]'::jsonb, 'Whether Jesus was a sinner', 'There was a division among them (John 9:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'What division occurred among the Pharisees?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 1, 'What does Siloam mean?', '["Peace", "Sent", "Judge", "Light"]'::jsonb, 'Sent', 'Which means Sent (John 9:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does Siloam mean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 1, 'Where did Jesus tell him to wash?', '["Bethesda", "The pool of Siloam", "Gibeon (a common guess, but not what John says here)", "The Jordan"]'::jsonb, 'The pool of Siloam', 'Go, wash in the pool of Siloam (John 9:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'Where did Jesus tell him to wash?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 1, 'Why did some Pharisees say Jesus was not from God?', '["Because he was from Galilee", "Because he did not keep the Sabbath", "Because he avoided the temple", "Because he was young (a common guess, but not what John says here)"]'::jsonb, 'Because he did not keep the Sabbath', 'This man is not from God, for he does not keep the Sabbath (John 9:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'Why did some Pharisees say Jesus was not from God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 1, 'Why did the disciples ask whether sin caused the man''s blindness?', '["To link suffering to someone''s sin", "To test Moses (a common guess, but not what John says here)", "To offer medicine", "To find his parents"]'::jsonb, 'To link suffering to someone''s sin', 'Rabbi, who sinned, this man or his parents, that he was born blind? (John 9:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'Why did the disciples ask whether sin caused the man''s blindness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 2, 'For judgment Jesus came into the world, that who might see?', '["The Romans", "The rich", "The priests", "The blind"]'::jsonb, 'The blind', 'For judgment I came into this world, that those who do not see may see (John 9:39).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'For judgment Jesus came into the world, that who might see?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 2, 'What did Jesus ask him when he found him after being cast out?', '["Will you be a priest?", "Will you pay tithe? (a common guess, but not what John says here)", "Do you believe in the Son of Man?", "Will you leave Galilee?"]'::jsonb, 'Do you believe in the Son of Man?', 'Jesus… found him and said, "Do you believe in the Son of Man?" (John 9:35).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus ask him when he found him after being cast out?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 2, 'What did Jesus say guilt remained on if they claimed to see?', '["Their houses", "Their sin", "Their families", "Their poverty"]'::jsonb, 'Their sin', 'If you were blind, you would have no guilt; but now that you say, ''We see,'' your guilt remains (John 9:41).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say guilt remained on if they claimed to see?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 2, 'What did Jesus say some who see would become?', '["Kings", "Angels", "Rich", "Blind"]'::jsonb, 'Blind', 'That those who see may become blind (John 9:39).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say some who see would become?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 2, 'What did some Pharisees ask?', '["Are we also blind?", "Are we also deaf?", "Are we also Romans?", "Are we also poor?"]'::jsonb, 'Are we also blind?', 'Some of the Pharisees… said, "Are we also blind?" (John 9:40).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did some Pharisees ask?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 2, 'What did the man say about Jesus opening his eyes?', '["I refuse to say", "He is a fraud (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Whether he is a sinner I do not know; one thing I know: I was blind, now I see", "I know nothing"]'::jsonb, 'Whether he is a sinner I do not know; one thing I know: I was blind, now I see', 'Whether he is a sinner I do not know. One thing I know, that though I was blind, now I see (John 9:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the man say about Jesus opening his eyes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 2, 'What did the neighbors debate — is this the man who used to sit and beg?', '["Whether he was a priest", "Whether he was Roman", "Whether he was the same man", "Whether he was rich (a common guess, but not what John says here)"]'::jsonb, 'Whether he was the same man', 'Is this not the man who used to sit and beg? (John 9:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the neighbors debate — is this the man who used to sit and beg?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 2, 'What had the Jews agreed about confessing Jesus?', '["Leave Judea", "Pay a fine (a common guess, but not what John says here)", "Put out of the synagogue", "Fast weekly"]'::jsonb, 'Put out of the synagogue', 'For the Jews had already agreed… if anyone should confess Jesus to be Christ, he was to be put out of the synagogue (John 9:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'What had the Jews agreed about confessing Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 2, 'Whom did the man worship?', '["The temple", "Moses", "Angels only", "Jesus"]'::jsonb, 'Jesus', 'He said, "Lord, I believe," and he worshiped him (John 9:38).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'Whom did the man worship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 2, 'Why were parents afraid to speak freely?', '["For fear of storms", "For fear of boats (a common guess, but not what John says here)", "For fear of the Jews", "For fear of poverty"]'::jsonb, 'For fear of the Jews', 'His parents said these things because they feared the Jews (John 9:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why were parents afraid to speak freely?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 3, 'How does John 9 connect to John 8''s light theme?', '["Only physical (a common guess, but not what John says here)", "Continues seeing/blindness as moral and spiritual reality", "Ignores light", "Contradicts chapter 8"]'::jsonb, 'Continues seeing/blindness as moral and spiritual reality', 'I am the light of the world (John 9:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does John 9 connect to John 8''s light theme?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 3, 'How does the man born blind function as a foil to the seeing Pharisees?', '["Both are blind", "Pharisees are humble", "Both see (a common guess, but not what John says here)", "He gains sight and insight while they remain blind"]'::jsonb, 'He gains sight and insight while they remain blind', 'Are we also blind? (John 9:40–41).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does the man born blind function as a foil to the seeing Pharisees?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 3, 'How does the parents'' fear of the synagogue relate to community pressure?', '["Only Romans feared", "Everyone was bold (a common guess, but not what John says here)", "Faith in Jesus carried social cost — exclusion", "Synagogue was unimportant"]'::jsonb, 'Faith in Jesus carried social cost — exclusion', 'His parents… feared the Jews (John 9:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does the parents'' fear of the synagogue relate to community pressure?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 3, 'How does worship in 9:38 advance John''s Christology?', '["Jesus receives worship fitting for God", "Worship is refused (a common guess, but not what John says here)", "Only Father is worshiped in John", "Worship is idolatry"]'::jsonb, 'Jesus receives worship fitting for God', 'He worshiped him (John 9:38).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does worship in 9:38 advance John''s Christology?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 3, 'Scholarly note: what is debated about sin and blindness in 9:3?', '["John denies providence", "Sin never matters (a common guess, but not what John says here)", "Not all suffering is punitive — display of God''s works", "All suffering is always punishment"]'::jsonb, 'Not all suffering is punitive — display of God''s works', 'Neither this man sinned nor his parents (John 9:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'Scholarly note: what is debated about sin and blindness in 9:3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 3, 'Theologically, how does physical sight/healing function as a sign in John 9?', '["It reveals Jesus as light of the world and exposes spiritual blindness", "It denies faith (a common guess, but not what John says here) (does not match John’s wording in this verse)", "It is only medical", "It ends the Gospel"]'::jsonb, 'It reveals Jesus as light of the world and exposes spiritual blindness', 'I am the light of the world (John 9:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'Theologically, how does physical sight/healing function as a sign in John 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 3, 'What does "wash" evoke beyond physical act?', '["Only hygiene", "Roman baths (a common guess, but not what John says here)", "Cleansing and obedience to Jesus'' word — baptism echoes", "Only pool rules"]'::jsonb, 'Cleansing and obedience to Jesus'' word — baptism echoes', 'He went and washed and came back seeing (John 9:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does "wash" evoke beyond physical act?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 3, 'What does being cast out foreshadow for the community of believers?', '["Cost of confessing Christ — later expulsions in John''s context", "Nothing", "Joy only", "Wealth (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'Cost of confessing Christ — later expulsions in John''s context', 'They cast him out (John 9:34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does being cast out foreshadow for the community of believers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 3, 'What does the beggar''s boldness before leaders contrast with?', '["Women''s silence", "Jesus'' silence", "Roman courage (a common guess, but not what John says here)", "Parents'' timidity — courage of new sight"]'::jsonb, 'Parents'' timidity — courage of new sight', 'The man defends Jesus before authorities (John 9:24–34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the beggar''s boldness before leaders contrast with?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 3, 'What irony appears in Pharisees claiming Moses discipleship?', '["They follow Jesus", "They reject one greater than Moses while appealing to Moses", "They ignore Moses", "They love Jesus (a common guess, but not what John says here)"]'::jsonb, 'They reject one greater than Moses while appealing to Moses', 'We know that God has spoken to Moses (John 9:28–29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What irony appears in Pharisees claiming Moses discipleship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 4, 'How does John 9 prepare for the good shepherd discourse?', '["No connection (a common guess, but not what John says here)", "Sheep/shepherd imagery follows in ch. 10", "Shepherd is absent", "Only wolves matter"]'::jsonb, 'Sheep/shepherd imagery follows in ch. 10', 'Leads into John 10.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does John 9 prepare for the good shepherd discourse?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 4, 'How does John 9''s sign relate to signs in John overall?', '["Seventh sign sequence builds toward Lazarus — life from darkness", "John hates signs", "Signs stop at 9 (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Signs are anti-faith"]'::jsonb, 'Seventh sign sequence builds toward Lazarus — life from darkness', 'Sign reveals God''s works (John 9:3–4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does John 9''s sign relate to signs in John overall?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 4, 'How does Siloam''s name (Sent) fit mission theology?', '["Sent means only postal", "Jesus is the sent one; washing in sent water fits", "Name is random (a common guess, but not what John says here)", "Siloam is pagan"]'::jsonb, 'Jesus is the sent one; washing in sent water fits', 'Which means Sent (John 9:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Siloam''s name (Sent) fit mission theology?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 4, 'How does guilt remain on those who claim to see?', '["Self-righteousness blocks grace — culpable blindness", "No guilt possible (a common guess, but not what John says here)", "Guilt is only for Gentiles", "Seeing removes guilt"]'::jsonb, 'Self-righteousness blocks grace — culpable blindness', 'Your guilt remains (John 9:41).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does guilt remain on those who claim to see?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 4, 'How does the healed man''s progression in titles mirror understanding?', '["Titles never change", "He only says \"man\"", "He denies Jesus (a common guess, but not what John says here)", "From prophet to worshiping Lord — deepening faith"]'::jsonb, 'From prophet to worshiping Lord — deepening faith', 'He is a prophet… Lord, I believe (John 9:17–38).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the healed man''s progression in titles mirror understanding?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 4, 'What connection exists between mud and creation imagery?', '["God formed man from ground — Jesus as new creation act", "Only spit matters", "Genesis is rejected", "Mud is random (a common guess, but not what John says here)"]'::jsonb, 'God formed man from ground — Jesus as new creation act', 'He spat on the ground and made mud (John 9:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'What connection exists between mud and creation imagery?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 4, 'What does Jesus say about doing God''s works while day lasts?', '["We must work the works of him who sent me", "We must avoid work (a common guess, but not what John says here)", "We must wait for night", "We must rest always"]'::jsonb, 'We must work the works of him who sent me', 'We must work the works of him who sent me while it is day (John 9:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Jesus say about doing God''s works while day lasts?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 4, 'What does the chapter teach about partial knowledge?', '["From \"I don''t know\" to worship — progressive revelation", "Knowledge is impossible", "First impression is final", "Leaders know best (a common guess, but not what John says here)"]'::jsonb, 'From "I don''t know" to worship — progressive revelation', 'Whether he is a sinner I do not know… (John 9:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does the chapter teach about partial knowledge?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 4, 'What night language appears in John 9:4?', '["Night is coming when no one can work", "Night is only for sleep", "Night is best for work", "Night is irrelevant (a common guess, but not what John says here)"]'::jsonb, 'Night is coming when no one can work', 'Night is coming, when no one can work (John 9:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'What night language appears in John 9:4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 4, 'What rhetorical effect does repeated interrogation have?', '["Shows fairness only", "Shows leaders'' hardness and the man''s growing courage", "Shows boredom (a common guess, but not what John says here)", "Shows Roman law"]'::jsonb, 'Shows leaders'' hardness and the man''s growing courage', 'They reviled him (John 9:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'What rhetorical effect does repeated interrogation have?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 5, 'How does Jesus find the man after exclusion?', '["Pastoral care for the outcast — Jesus seeks the rejected", "Man finds Jesus alone", "Angels mediate (a common guess, but not what John says here)", "Jesus ignores him"]'::jsonb, 'Pastoral care for the outcast — Jesus seeks the rejected', 'Jesus heard that they had cast him out, and found him (John 9:35).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Jesus find the man after exclusion?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 5, 'How does John 9 balance divine sovereignty and human response?', '["Only works", "Only fate (a common guess, but not what John says here)", "God''s works displayed and man must wash/believe", "No human role"]'::jsonb, 'God''s works displayed and man must wash/believe', 'Go, wash… Do you believe? (John 9:7, 35).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does John 9 balance divine sovereignty and human response?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 5, 'How does the blind man''s wit in dialogue serve John''s polemic?', '["Shows Pharisees are right", "Shows Romans win (a common guess, but not what John says here)", "Shows education saves", "Exposes leaders'' inconsistency without seminary training"]'::jsonb, 'Exposes leaders'' inconsistency without seminary training', 'You would not listen… why do you want to hear it again? (John 9:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does the blind man''s wit in dialogue serve John''s polemic?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 5, 'How does the chapter answer the disciples'' opening question?', '["Suffering is meaningless (a common guess, but not what John says here)", "Not sin''s cause but God''s glory in mercy — reframes suffering", "Blindness is only metaphor", "Sin is always the parent''s fault"]'::jsonb, 'Not sin''s cause but God''s glory in mercy — reframes suffering', 'That the works of God might be displayed (John 9:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does the chapter answer the disciples'' opening question?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 5, 'What christological step is "Son of Man" in 9:35?', '["Moves from healer to Messianic identity — Danielic title", "Only human title", "Denies messiahship", "Roman title (a common guess, but not what John says here)"]'::jsonb, 'Moves from healer to Messianic identity — Danielic title', 'Do you believe in the Son of Man? (John 9:35).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What christological step is "Son of Man" in 9:35?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 5, 'What did the Pharisees say about the man born blind?', '["You are our teacher", "You should be a priest", "You are innocent (a common guess, but not what John says here)", "You were steeped in sin at birth; how dare you lecture us!"]'::jsonb, 'You were steeped in sin at birth; how dare you lecture us!', 'You were steeped in sin at birth; how dare you lecture us! (John 9:34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did the Pharisees say about the man born blind?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 5, 'What did the healed man ask the Pharisees about wanting to become disciples?', '["Where is Siloam?", "Do you want to become his disciples too?", "Will you pay me?", "Who is Moses? (a common guess, but not what John says here)"]'::jsonb, 'Do you want to become his disciples too?', 'You want to become his disciples, too? (John 9:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did the healed man ask the Pharisees about wanting to become disciples?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 5, 'What does being "put out" linguistically connect to later?', '["Only wealth loss", "No later use (a common guess, but not what John says here)", "Apostasy trials — same vocabulary as community exclusion", "Only physical exile"]'::jsonb, 'Apostasy trials — same vocabulary as community exclusion', 'Put out of the synagogue (John 9:22, 34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does being "put out" linguistically connect to later?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 5, 'What eschatological hint is in seeing judgment?', '["No judgment in John (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Judgment is only Roman", "Everyone sees equally", "Ultimate separation of sight and blindness — final accountability"]'::jsonb, 'Ultimate separation of sight and blindness — final accountability', 'For judgment I came (John 9:39).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What eschatological hint is in seeing judgment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 9, 5, 'What pastoral lesson comes from the man''s simple testimony?', '["Experience of grace can be defended simply — \"I was blind, now I see\"", "Testimony is sin", "Complex theology only", "Silence is best (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'Experience of grace can be defended simply — "I was blind, now I see"', 'One thing I know (John 9:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What pastoral lesson comes from the man''s simple testimony?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 1, 'What does Jesus say he has that are not of this fold?', '["Other sheep", "Other doors", "Other wolves", "Other thieves"]'::jsonb, 'Other sheep', 'I have other sheep that are not of this fold (John 10:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does Jesus say he has that are not of this fold?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 1, 'What does Jesus say he is in John 10:7?', '["The wall (a common guess, but not what John says here)", "The whip", "The coin", "The door of the sheep"]'::jsonb, 'The door of the sheep', 'I am the door of the sheep (John 10:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does Jesus say he is in John 10:7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 1, 'What does Jesus say thieves and robbers come to do?', '["Steal and kill and destroy", "Heal sheep (a common guess, but not what John says here)", "Build the fold", "Teach the law"]'::jsonb, 'Steal and kill and destroy', 'The thief comes only to steal and kill and destroy (John 10:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does Jesus say thieves and robbers come to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 1, 'What does the good shepherd come to give?', '["Abundant life", "Wealth", "A crown only", "Roman citizenship"]'::jsonb, 'Abundant life', 'I came that they may have life and have it abundantly (John 10:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does the good shepherd come to give?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 1, 'What does the good shepherd do for the sheep?', '["Hide from wolves", "Sell them (a common guess, but not what John says here)", "Flee always", "Lay down his life"]'::jsonb, 'Lay down his life', 'The good shepherd lays down his life for the sheep (John 10:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does the good shepherd do for the sheep?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 1, 'What does the hired hand do when he sees the wolf?', '["Flees", "Calls Rome", "Prays", "Fights"]'::jsonb, 'Flees', 'He flees… and the wolf snatches them (John 10:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does the hired hand do when he sees the wolf?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 1, 'What does the shepherd call his own sheep?', '["By lot", "By number only", "By color only", "By name"]'::jsonb, 'By name', 'He calls his own sheep by name (John 10:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does the shepherd call his own sheep?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 1, 'What figure opens John 10?', '["Vineyard (a common guess, but not what John says here)", "Sheepfold / sheep", "Fishing boat", "Temple treasury"]'::jsonb, 'Sheepfold / sheep', 'Truly… he who does not enter… by the door… (John 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'What figure opens John 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 1, 'What will the sheep do?', '["Become one flock with one shepherd", "Abandon the shepherd", "Fight each other", "Join wolves (a common guess, but not what John says here)"]'::jsonb, 'Become one flock with one shepherd', 'There will be one flock, one shepherd (John 10:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'What will the sheep do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 1, 'Who is the shepherd of the sheep?', '["The one who enters by the door", "The wolf (a common guess, but not what John says here)", "The buyer", "The Roman soldier"]'::jsonb, 'The one who enters by the door', 'The sheep hear his voice, and he calls his own sheep by name (John 10:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the shepherd of the sheep?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 2, 'What did Jesus appeal to from his Father?', '["Good works shown them", "Moses'' rod", "Roman law (a common guess, but not what John says here)", "Temple gold"]'::jsonb, 'Good works shown them', 'If I am not doing the works of my Father, do not believe me (John 10:37).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus appeal to from his Father?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 2, 'What did Jesus say he and the Father are?', '["Two unrelated gods", "Enemies", "Partners in business only", "One"]'::jsonb, 'One', 'I and the Father are one (John 10:30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say he and the Father are?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 2, 'What did the Jews ask Jesus?', '["Who is your mother?", "When will Rome fall?", "How long will you keep us in suspense? If you are the Christ, tell us plainly", "When is Passover? (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'How long will you keep us in suspense? If you are the Christ, tell us plainly', 'How long will you keep us in suspense? If you are the Christ, tell us plainly (John 10:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the Jews ask Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 2, 'What did the Jews pick up again?', '["Scrolls", "Money", "Sticks", "Stones"]'::jsonb, 'Stones', 'The Jews picked up stones again to stone him (John 10:31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the Jews pick up again?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 2, 'What does Jesus give his sheep?', '["Eternal life", "Land in Rome", "Money (a common guess, but not what John says here)", "A sword only"]'::jsonb, 'Eternal life', 'I give them eternal life, and they will never perish (John 10:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Jesus give his sheep?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 2, 'What works did Jesus say his sheep do regarding his voice?', '["Ignore him", "Betray him", "Follow him", "Judge him (a common guess, but not what John says here)"]'::jsonb, 'Follow him', 'My sheep hear my voice, and I know them, and they follow me (John 10:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'What works did Jesus say his sheep do regarding his voice?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 2, 'When was the feast of dedication in John?', '["Autumn (a common guess, but not what John says here)", "Spring", "Summer", "Winter"]'::jsonb, 'Winter', 'At that time the Feast of Dedication took place at Jerusalem. It was winter (John 10:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'When was the feast of dedication in John?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 2, 'Where was Jesus walking in Solomon''s Colonnade?', '["On the sea (a common guess, but not what John says here)", "In the Jordan", "In Nazareth", "In the temple"]'::jsonb, 'In the temple', 'Jesus was walking in the temple, in the colonnade of Solomon (John 10:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'Where was Jesus walking in Solomon''s Colonnade?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 2, 'Who can snatch Jesus'' sheep from his hand?', '["Angels", "Sin", "Wolves always", "No one"]'::jsonb, 'No one', 'No one will snatch them out of my hand (John 10:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'Who can snatch Jesus'' sheep from his hand?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 2, 'Whose hand is greater — Father or Son?', '["Son has no sheep (a common guess, but not what John says here)", "Father is weaker", "Greater than all; Father and Son are one in keeping", "Hands are metaphor only"]'::jsonb, 'Greater than all; Father and Son are one in keeping', 'No one is able to snatch them out of the Father''s hand (John 10:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'Whose hand is greater — Father or Son?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 3, 'How does John 10:30 trigger charges?', '["Sounds like peace", "Ignored by all (a common guess, but not what John says here)", "Oneness with Father sounds like blasphemy to opponents", "Only disciples hear"]'::jsonb, 'Oneness with Father sounds like blasphemy to opponents', 'We are stoning you… because you… make yourself God (John 10:33).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does John 10:30 trigger charges?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 3, 'How does hireling contrast protect the church?', '["Leaders who abandon in danger vs. Christ''s constancy", "Shepherds are unnecessary", "Wolves are good (a common guess, but not what John says here)", "Hirelings are best"]'::jsonb, 'Leaders who abandon in danger vs. Christ''s constancy', 'He flees… because he is a hired hand (John 10:12–13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does hireling contrast protect the church?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 3, 'How does laying down life connect to crucifixion prolepsis?', '["Foreshadows voluntary substitutionary death", "Foreshadows running away", "Only metaphor with no death", "Denies cross (a common guess, but not what John says here)"]'::jsonb, 'Foreshadows voluntary substitutionary death', 'I lay down my life… I lay it down of my own accord (John 10:17–18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does laying down life connect to crucifixion prolepsis?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 3, 'Theologically, what does shepherd imagery draw from?', '["No Old Testament (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Only Greek myths", "Ezekiel 34 and Psalm 23 — God as shepherd replacing bad shepherds", "Only Roman farming"]'::jsonb, 'Ezekiel 34 and Psalm 23 — God as shepherd replacing bad shepherds', 'I am the good shepherd (John 10:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'Theologically, what does shepherd imagery draw from?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 3, 'What defense does Jesus use from Psalm 82?', '["He quotes Homer (a common guess, but not what John says here)", "Psalms are invalid", "He denies Scripture", "Gods language for judges — his claim is lesser yet true"]'::jsonb, 'Gods language for judges — his claim is lesser yet true', 'If he called them gods… can you say… you are blaspheming? (John 10:34–36).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What defense does Jesus use from Psalm 82?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 3, 'What did John testify about Jesus at that place?', '["That Jesus was a fraud", "That baptism ended (a common guess, but not what John says here)", "That Rome was chosen", "That everything John said about this man was true"]'::jsonb, 'That everything John said about this man was true', 'John did no sign, but everything that John said about this man was true (John 10:41).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did John testify about Jesus at that place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 3, 'What does Jesus say the Father set him apart and sent him into the world as?', '["Angry", "Rich", "Silent", "Holy"]'::jsonb, 'Holy', 'Whom the Father consecrated and sent into the world (John 10:36).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Jesus say the Father set him apart and sent him into the world as?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 3, 'What does the door image emphasize?', '["Exclusive access to salvation through Christ", "Doors are irrelevant", "Law is the door", "Many doors (a common guess, but not what John says here)"]'::jsonb, 'Exclusive access to salvation through Christ', 'I am the door. If anyone enters by me, he will be saved (John 10:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the door image emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 3, 'What does unity of flock suggest about Gentile mission?', '["Flocks must fight", "Only Jews saved (a common guess, but not what John says here)", "One shepherd gathers sheep beyond Israel", "Sheep stay in one country"]'::jsonb, 'One shepherd gathers sheep beyond Israel', 'Other sheep… there will be one flock (John 10:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does unity of flock suggest about Gentile mission?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 3, 'Where did many believe beyond the Jordan?', '["In Rome (a common guess, but not what John says here)", "Where John had been baptizing at first", "In Egypt", "In Tyre"]'::jsonb, 'Where John had been baptizing at first', 'Many came to him… where John had been baptizing at first (John 10:40).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'Where did many believe beyond the Jordan?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 4, 'How does 10:16 relate to John''s global vision?', '["Gentiles excluded", "Unity of Jew and Gentile in Christ — one flock", "Two flocks fight (a common guess, but not what John says here)", "Nationalism forever"]'::jsonb, 'Unity of Jew and Gentile in Christ — one flock', 'Other sheep… one flock (John 10:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 10:16 relate to John''s global vision?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 4, 'How does Jesus escape in 10:39?', '["Across the Jordan — withdrawal until hour", "By fighting", "To Rome (a common guess, but not what John says here)", "He does not escape"]'::jsonb, 'Across the Jordan — withdrawal until hour', 'He went away again across the Jordan (John 10:40).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Jesus escape in 10:39?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 4, 'How does eternal security language read in Reformed vs Arminian debate?', '["No debate exists (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Debated whether \"snatch\" teaches perseverance vs. warning elsewhere", "All agree instantly", "John teaches easy-believism without fruit"]'::jsonb, 'Debated whether "snatch" teaches perseverance vs. warning elsewhere', 'No one will snatch them out of my hand (John 10:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does eternal security language read in Reformed vs Arminian debate?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 4, 'How does the chapter answer "Are you the Christ?"', '["Jesus says no (a common guess, but not what John says here)", "Jesus denies Messiahship", "Jesus is silent", "Works and sheep testify — plain yet rejected"]'::jsonb, 'Works and sheep testify — plain yet rejected', 'The works… in my Father''s name bear witness about me (John 10:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the chapter answer "Are you the Christ?"'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 4, 'How does voluntary laying down life fit John''s agency language?', '["Romans force without purpose", "No command (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Jesus actively chooses death per Father''s command — not mere passivity", "Jesus is passive only"]'::jsonb, 'Jesus actively chooses death per Father''s command — not mere passivity', 'I have authority to lay it down, and I have authority to take it up again (John 10:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does voluntary laying down life fit John''s agency language?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 4, 'What christological title cluster appears in chapter 10?', '["Good shepherd, door, one with Father", "King only (a common guess, but not what John says here)", "Prophet only", "Angel only"]'::jsonb, 'Good shepherd, door, one with Father', 'I am the good shepherd (John 10:11, 14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'What christological title cluster appears in chapter 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 4, 'What does knowing sheep by name imply?', '["Sheep are numbered only", "Personal relationship — not anonymous mass", "Only OT priests know names", "Names are secret (a common guess, but not what John says here)"]'::jsonb, 'Personal relationship — not anonymous mass', 'He calls his own sheep by name (John 10:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does knowing sheep by name imply?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 4, 'What feast setting links chapters 9–10?', '["Pentecost", "Hanukkah — light and dedication themes", "Passover only", "No feast (a common guess, but not what John says here)"]'::jsonb, 'Hanukkah — light and dedication themes', 'Feast of Dedication… winter (John 10:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'What feast setting links chapters 9–10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 4, 'What pastoral application comes from voice recognition?', '["Only scholars hear", "All voices equal (a common guess, but not what John says here)", "Hearing is impossible", "Sheep discern Christ''s word amid many voices"]'::jsonb, 'Sheep discern Christ''s word amid many voices', 'The sheep follow him, for they know his voice (John 10:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'What pastoral application comes from voice recognition?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 4, 'What wolf imagery contributes?', '["No danger exists", "External persecution and internal abandonment contrasted with good shepherd", "Wolves are pets (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Only internal sin"]'::jsonb, 'External persecution and internal abandonment contrasted with good shepherd', 'The wolf snatches them and scatters them (John 10:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'What wolf imagery contributes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 5, 'How does abundant life differ from mere existence?', '["Only health", "Only wealth", "Only fame (a common guess, but not what John says here)", "Quality of eternal communion — not only longevity"]'::jsonb, 'Quality of eternal communion — not only longevity', 'Life… abundantly (John 10:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does abundant life differ from mere existence?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 5, 'How does belief across the Jordan contrast Jerusalem hostility?', '["Baptism site is irrelevant", "Receiving region responds where prophet ministry began", "Jordan is cursed", "Everyone hates (a common guess, but not what John says here)"]'::jsonb, 'Receiving region responds where prophet ministry began', 'Many believed in him there (John 10:42).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does belief across the Jordan contrast Jerusalem hostility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 5, 'How does stone-throwing motif connect John 8–10?', '["Repeated rejection after divine claims", "Only once (a common guess, but not what John says here)", "Only disciples throw", "Stones are friendly"]'::jsonb, 'Repeated rejection after divine claims', 'The Jews picked up stones again (John 10:31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does stone-throwing motif connect John 8–10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 5, 'What Trinitarian hint is in sheep in Father''s and Son''s hands?', '["Hands are fiction", "Only one person (a common guess, but not what John says here)", "Mutual divine grip — security in Father-Son unity", "Father and Son compete"]'::jsonb, 'Mutual divine grip — security in Father-Son unity', 'No one snatches from my hand… Father''s hand (John 10:28–29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What Trinitarian hint is in sheep in Father''s and Son''s hands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 5, 'What did Jesus say thieves do instead of entering by the door?', '["Climb in by another way", "Repair the wall", "Pay the shepherd", "Knock politely (a common guess, but not what John says here)"]'::jsonb, 'Climb in by another way', 'He who does not enter the sheepfold by the door but climbs in by another way (John 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus say thieves do instead of entering by the door?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 5, 'What does "stranger''s voice" sheep flee from?', '["They never flee (a common guess, but not what John says here)", "Only food matters", "They love strangers", "False teachers — discernment"]'::jsonb, 'False teachers — discernment', 'A stranger they will not follow, but they will flee from him (John 10:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does "stranger''s voice" sheep flee from?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 5, 'What does Jesus say happens to the sheep who follow him?', '["They will lose their way", "They will never perish", "They will become wolves", "They will deny him"]'::jsonb, 'They will never perish', 'I give them eternal life, and they will never perish (John 10:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Jesus say happens to the sheep who follow him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 5, 'What feast is named in John 10:22?', '["Feast of Dedication", "Pentecost", "Tabernacles", "Passover (a common guess, but not what John says here)"]'::jsonb, 'Feast of Dedication', 'The Feast of Dedication took place at Jerusalem. It was winter (John 10:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What feast is named in John 10:22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 5, 'What link exists between baptism witness and Jesus?', '["John competes (a common guess, but not what John says here)", "Baptism replaces Jesus", "John''s witness points to Jesus — continuity", "John is greater"]'::jsonb, 'John''s witness points to Jesus — continuity', 'John… bore witness to the truth (John 5:33).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What link exists between baptism witness and Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 10, 5, 'Who is the shepherd of the sheep according to the doorkeeper?', '["The Roman guard", "The buyer", "The one who enters by the door", "The wolf (a common guess, but not what John says here)"]'::jsonb, 'The one who enters by the door', 'The sheep hear his voice… he calls his own sheep (John 10:2–3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who is the shepherd of the sheep according to the doorkeeper?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 1, 'How did Jesus respond when he saw Mary weeping?', '["He left immediately", "He was deeply moved in spirit and troubled", "He rebuked her", "He laughed (a common guess, but not what John says here)"]'::jsonb, 'He was deeply moved in spirit and troubled', 'He was deeply moved in his spirit and greatly troubled (John 11:33).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'How did Jesus respond when he saw Mary weeping?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 1, 'How long did Jesus stay where he was when he heard Lazarus was sick?', '["One hour", "Two days", "Seven days", "Forty days"]'::jsonb, 'Two days', 'So he stayed two days longer in the place where he was (John 11:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'How long did Jesus stay where he was when he heard Lazarus was sick?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 1, 'What did Jesus say about Lazarus'' illness?', '["It is hopeless", "It is for God''s glory", "It is punishment only", "It is fake (a common guess, but not what John says here)"]'::jsonb, 'It is for God''s glory', 'This illness does not lead to death. It is for the glory of God (John 11:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say about Lazarus'' illness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 1, 'What did Jesus say about walking in the day?', '["He does not stumble because he sees the light of this world", "He always stumbles", "He avoids work (a common guess, but not what John says here)", "He needs a lamp"]'::jsonb, 'He does not stumble because he sees the light of this world', 'If anyone walks in the day, he does not stumble (John 11:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say about walking in the day?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 1, 'What did Jesus tell Martha her brother would do?', '["Return as an angel", "Live in memory only", "Rise again", "Remain dead forever"]'::jsonb, 'Rise again', 'Your brother will rise again (John 11:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus tell Martha her brother would do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 1, 'What did Martha confess Jesus to be?', '["A prophet only", "A priest only (a common guess, but not what John says here)", "The Christ, the Son of God", "A teacher only"]'::jsonb, 'The Christ, the Son of God', 'I believe that you are the Christ, the Son of God (John 11:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Martha confess Jesus to be?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 1, 'What did Martha say when she met Jesus?', '["Lord, teach us to fish", "Lord, go away (a common guess, but not what John says here)", "Lord, if you had been here, my brother would not have died", "Lord, we need money"]'::jsonb, 'Lord, if you had been here, my brother would not have died', 'Lord, if you had been here, my brother would not have died (John 11:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Martha say when she met Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 1, 'What did Mary do when she came to Jesus?', '["Fell at his feet", "Argued with Martha", "Called the Romans", "Ran away"]'::jsonb, 'Fell at his feet', 'She fell at his feet, saying to him, "Lord, if you had been here…" (John 11:32).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Mary do when she came to Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 1, 'Who was sick in Bethany?', '["Lazarus", "Barabbas", "Zacchaeus", "Nicodemus"]'::jsonb, 'Lazarus', 'Now a certain man was ill, Lazarus of Bethany (John 11:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who was sick in Bethany?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 1, 'Whose brother was Lazarus?', '["Mary and Martha", "James and John", "Peter and Andrew", "Joseph and Simon"]'::jsonb, 'Mary and Martha', 'Mary was the one who anointed the Lord… her brother Lazarus was ill (John 11:1–2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'Whose brother was Lazarus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 2, 'From that day on what did they plan to do?', '["Put Jesus to death", "Send him to Greece", "Make him high priest", "Crown him"]'::jsonb, 'Put Jesus to death', 'So from that day on they made plans to put him to death (John 11:53).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'From that day on what did they plan to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 2, 'What did Caiaphas prophesy unknowingly?', '["That Rome would convert (a common guess, but not what John says here) (does not match John’s wording in this verse)", "That Jesus would die for the nation — and gather children of God scattered abroad", "That all would reject Jesus", "That the temple would never fall"]'::jsonb, 'That Jesus would die for the nation — and gather children of God scattered abroad', 'Jesus would die for the nation, and not for the nation only, but also to gather into one the children of God (John 11:51–52).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Caiaphas prophesy unknowingly?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 2, 'What did Caiaphas say was expedient?', '["That the temple should close", "That Rome should rule (a common guess, but not what John says here)", "That one man should die for the people", "That disciples should fight"]'::jsonb, 'That one man should die for the people', 'It is better for you that one man should die for the people (John 11:50).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Caiaphas say was expedient?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 2, 'What did Jesus cry with a loud voice?', '["Peace, be still", "Eli, Eli (a common guess, but not what John says here)", "Lazarus, come out", "Father, forgive"]'::jsonb, 'Lazarus, come out', 'He cried out with a loud voice, "Lazarus, come out" (John 11:43).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus cry with a loud voice?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 2, 'What did Jesus do at the tomb?', '["Built a monument", "Shouted angrily", "Refused to look", "Wept"]'::jsonb, 'Wept', 'Jesus wept (John 11:35).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus do at the tomb?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 2, 'What did Jesus say to remove from the stone?', '["The body", "The stone", "The mourners", "The disciples"]'::jsonb, 'The stone', 'Take away the stone (John 11:39).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say to remove from the stone?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 2, 'What did Martha warn about?', '["That Lazarus was alive (a common guess, but not what John says here)", "That there would be an odor — four days dead", "That the tomb was empty", "That Romans would come"]'::jsonb, 'That there would be an odor — four days dead', 'Lord, by this time there will be an odor for he has been dead four days (John 11:39).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Martha warn about?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 2, 'What did the chief priests plan to do to Lazarus?', '["Put him to death", "Honor him (a common guess, but not what John says here)", "Send him to Rome", "Make him king"]'::jsonb, 'Put him to death', 'The chief priests plotted to put Lazarus to death as well (John 12:10–11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the chief priests plan to do to Lazarus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 2, 'Who did Lazarus come out bound with?', '["Chains", "Gold (a common guess, but not what John says here)", "Hand and foot with linen strips", "Roman ropes"]'::jsonb, 'Hand and foot with linen strips', 'The man who had died came out, his hands and feet bound with linen strips (John 11:44).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'Who did Lazarus come out bound with?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 2, 'Why did Jesus no longer walk openly among the Jews?', '["Because he was tired (a common guess, but not what John says here)", "Because he feared Lazarus", "Because they sought to kill him", "Because he hated Jerusalem"]'::jsonb, 'Because they sought to kill him', 'Jesus therefore no longer walked openly among the Jews (John 11:54).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why did Jesus no longer walk openly among the Jews?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 3, 'How does Caiaphas''s prophecy read ironically?', '["Prophecy is impossible", "Enemy speaks truth — substitutionary atonement for nation", "High priests never speak", "Caiaphas is righteous (a common guess, but not what John says here)"]'::jsonb, 'Enemy speaks truth — substitutionary atonement for nation', 'He prophesied that Jesus would die for the nation (John 11:51).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Caiaphas''s prophecy read ironically?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 3, 'How does Lazarus sign relate to Jesus'' own resurrection?', '["Preview of Christ''s victory over death — plot to kill both", "Signs end here (a common guess, but not what John says here)", "Lazarus is irrelevant", "Contradicts Easter"]'::jsonb, 'Preview of Christ''s victory over death — plot to kill both', 'They planned to put Lazarus to death (John 12:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Lazarus sign relate to Jesus'' own resurrection?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 3, 'How does Thomas'' "Let us go, that we may die with him" function?', '["Thomas refuses (a common guess, but not what John says here)", "Courage and misunderstanding — loyalty amid danger", "Thomas is absent", "Thomas betrays"]'::jsonb, 'Courage and misunderstanding — loyalty amid danger', 'Let us also go, that we may die with him (John 11:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Thomas'' "Let us go, that we may die with him" function?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 3, 'How does unbinding Lazarus picture discipleship?', '["Binding is permanent", "Lazarus stays bound (a common guess, but not what John says here)", "Community irrelevant", "Loose him, let him go — community role after Jesus calls"]'::jsonb, 'Loose him, let him go — community role after Jesus calls', 'Unbind him, and let him go (John 11:44).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does unbinding Lazarus picture discipleship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 3, 'How is Jesus'' weeping compatible with knowing he would raise Lazarus?', '["He pretended", "He wept for himself", "Compassion with human grief — empathy is real", "He doubted (a common guess, but not what John says here)"]'::jsonb, 'Compassion with human grief — empathy is real', 'Jesus wept (John 11:35).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'How is Jesus'' weeping compatible with knowing he would raise Lazarus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 3, 'Theologically, why delay two days?', '["Travel was impossible", "Disciples refused", "God''s glory displayed in resurrection, not mere healing", "Jesus was lazy (a common guess, but not what John says here)"]'::jsonb, 'God''s glory displayed in resurrection, not mere healing', 'Loved… yet… he stayed two days (John 11:5–6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'Theologically, why delay two days?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 3, 'What does "gather children of God scattered" hint?', '["Only Judea (a common guess, but not what John says here)", "Gentile inclusion — one new people", "No mission", "Scattering is good"]'::jsonb, 'Gentile inclusion — one new people', 'Gather into one the children of God who are scattered abroad (John 11:52).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does "gather children of God scattered" hint?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 3, 'What does resurrection now vs last day mean in Martha''s dialogue?', '["Only future matters", "Jesus is the resurrection — present power and future hope", "Resurrection is myth", "Only past matters (a common guess, but not what John says here)"]'::jsonb, 'Jesus is the resurrection — present power and future hope', 'I am the resurrection and the life (John 11:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does resurrection now vs last day mean in Martha''s dialogue?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 3, 'What does stinking corpse detail contribute?', '["Four days is symbolic only", "Real death — miracle is not resuscitation theater", "Lazarus was not dead", "Odor is metaphor (a common guess, but not what John says here)"]'::jsonb, 'Real death — miracle is not resuscitation theater', 'There will be an odor (John 11:39).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does stinking corpse detail contribute?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 3, 'What does the plot against Lazarus show about hardness?', '["Miracles always convince", "Lazarus is safe (a common guess, but not what John says here)", "Rejecting sign leads to murder — moral blindness", "Leaders convert"]'::jsonb, 'Rejecting sign leads to murder — moral blindness', 'Plot to kill Lazarus (John 12:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the plot against Lazarus show about hardness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 4, 'How does 11:48 show misunderstanding of messianic hope?', '["Messiah as national liberator feared by Rome — wrong lens", "Messiah is only priest", "No fear exists (a common guess, but not what John says here)", "Rome is friend"]'::jsonb, 'Messiah as national liberator feared by Rome — wrong lens', 'The Romans will come and take away both our place and our nation (John 11:48).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 11:48 show misunderstanding of messianic hope?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 4, 'How does Bethany location matter?', '["Far from witnesses", "Only symbolic", "Unknown town (a common guess, but not what John says here)", "Near Jerusalem — public sign before Passover crowd"]'::jsonb, 'Near Jerusalem — public sign before Passover crowd', 'Bethany was near Jerusalem (John 11:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Bethany location matter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 4, 'How does belief "though he die, yet shall he live" work?', '["Only metaphor (a common guess, but not what John says here)", "No future life", "Reincarnation", "Participation in Christ''s resurrection life"]'::jsonb, 'Participation in Christ''s resurrection life', 'Whoever believes in me, though he die, yet shall he live (John 11:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does belief "though he die, yet shall he live" work?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 4, 'How does crowd''s reaction split?', '["All believe (a common guess, but not what John says here)", "Many believe; some report Pharisees — mixed response", "None notice", "Only women believe"]'::jsonb, 'Many believe; some report Pharisees — mixed response', 'Many… believed in him (John 11:45).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does crowd''s reaction split?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 4, 'Scholarly debate: historicity of Lazarus?', '["John is pure fiction", "Arguments for core event vs. symbolic reading — majority take narrative seriously", "No debate (a common guess, but not what John says here) (does not match John’s wording in this verse)", "All scholars deny"]'::jsonb, 'Arguments for core event vs. symbolic reading — majority take narrative seriously', 'Scholarship varies on details, not always on genre.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'Scholarly debate: historicity of Lazarus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 4, 'What Sanhedrin fear drives plot?', '["Indifference (a common guess, but not what John says here)", "If they let him go on, Romans will come — political fear", "Spiritual zeal only", "Love of God only"]'::jsonb, 'If they let him go on, Romans will come — political fear', 'If we let him go on like this, everyone will believe in him, and the Romans will come (John 11:48).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'What Sanhedrin fear drives plot?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 4, 'What christological climax is "I am the resurrection and the life"?', '["Life is abstract (a common guess, but not what John says here)", "Resurrection is only doctrine", "Jesus is source of resurrection life — present eschatology", "Jesus is only teacher"]'::jsonb, 'Jesus is source of resurrection life — present eschatology', 'I am the resurrection and the life (John 11:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'What christological climax is "I am the resurrection and the life"?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 4, 'What does Jesus'' thanks to Father before tomb show?', '["Prayerful dependence — public thanks for heard prayer", "Pride (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Doubt", "Silence to Father"]'::jsonb, 'Prayerful dependence — public thanks for heard prayer', 'Father, I thank you that you have heard me (John 11:41).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Jesus'' thanks to Father before tomb show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 4, 'What does Mary''s anointing forward reference add?', '["Only decoration", "Only Judas (a common guess, but not what John says here)", "Connects to burial anointing in chapter 12", "Disconnects chapters"]'::jsonb, 'Connects to burial anointing in chapter 12', 'This Mary… anointed the Lord with ointment (John 11:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Mary''s anointing forward reference add?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 4, 'What pastoral word is in Jesus'' grief at tomb?', '["Grief is sin (a common guess, but not what John says here)", "Jesus ignores mourners", "Tears are weakness only", "Jesus enters our sorrow — not stoic distance"]'::jsonb, 'Jesus enters our sorrow — not stoic distance', 'Jesus wept (John 11:35).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'What pastoral word is in Jesus'' grief at tomb?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 5, 'How does Jesus being deeply moved challenge Greek impassibility debates?', '["Anger only (a common guess, but not what John says here)", "Divine compassion — emotion in incarnation", "Troubled means sin", "God cannot feel"]'::jsonb, 'Divine compassion — emotion in incarnation', 'Deeply moved in his spirit (John 11:33).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Jesus being deeply moved challenge Greek impassibility debates?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 5, 'How does Martha''s service contrast Mary''s sitting in Luke vs John focus?', '["John highlights confession and dialogue — different emphasis", "Contradicts Luke (a common guess, but not what John says here)", "Martha is absent", "Mary never speaks"]'::jsonb, 'John highlights confession and dialogue — different emphasis', 'Martha served… Mary sat (cf. Luke 10) — John highlights faith confession (John 11:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Martha''s service contrast Mary''s sitting in Luke vs John focus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 5, 'How does crowd witness to raising affect plot?', '["Sign becomes last straw for authorities — accelerates passion", "Authorities rejoice", "No one hears (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Sign is private"]'::jsonb, 'Sign becomes last straw for authorities — accelerates passion', 'Many… saw what he did, believed in him (John 11:45).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does crowd witness to raising affect plot?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 5, 'How many days had Lazarus been in the tomb when Jesus arrived?', '["One day", "Seven days", "Four days", "Forty days"]'::jsonb, 'Four days', 'Lazarus has been in the tomb four days (John 11:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'How many days had Lazarus been in the tomb when Jesus arrived?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 5, 'What did Jesus say to take away from Lazarus'' face?', '["His money", "The cloth", "The stone only", "His sisters"]'::jsonb, 'The cloth', 'The dead man came out, his hands and feet bound… Jesus said to them, "Unbind him, and let him go" (John 11:44).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus say to take away from Lazarus'' face?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 5, 'What did Jesus say to the Father before calling Lazarus out?', '["That Martha was wrong", "That he doubted (a common guess, but not what John says here) (does not match John’s wording in this verse)", "That he always heard him, for the sake of the crowd standing by", "That Lazarus was unworthy"]'::jsonb, 'That he always heard him, for the sake of the crowd standing by', 'I knew that you always hear me, but I said this on account of the people standing around (John 11:42).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus say to the Father before calling Lazarus out?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 5, 'What did many Jews who came to Mary conclude about Jesus?', '["That Jesus was a fraud (a common guess, but not what John says here)", "That Lazarus was alive already", "That if he had been there, Lazarus would not have died", "That Rome should judge"]'::jsonb, 'That if he had been there, Lazarus would not have died', 'Could not he who opened the eyes of the blind man also have kept this man from dying? (John 11:37).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did many Jews who came to Mary conclude about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 5, 'What does "Come out" evoke?', '["Military command only", "Random shout", "Creation word — new creation life", "Magic spell (a common guess, but not what John says here)"]'::jsonb, 'Creation word — new creation life', 'Lazarus, come out (John 11:43).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does "Come out" evoke?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 5, 'What hope is for "everyone who lives and believes in me shall never die"?', '["No physical death ever", "Immortality of soul only Greek", "Spiritual death defeated — eternal life quality", "Death wins (a common guess, but not what John says here)"]'::jsonb, 'Spiritual death defeated — eternal life quality', 'Everyone who lives and believes in me shall never die (John 11:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What hope is for "everyone who lives and believes in me shall never die"?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 11, 5, 'What narrative function does Lazarus have before Passion week?', '["Final sign provoking decision — life confrontation", "Breaks tension", "Unrelated to cross", "Filler only (a common guess, but not what John says here)"]'::jsonb, 'Final sign provoking decision — life confrontation', 'They plotted to put him to death (John 11:53).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What narrative function does Lazarus have before Passion week?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 1, 'What did Jesus find?', '["A young donkey", "A war horse", "A chariot", "A camel (a common guess, but not what John says here)"]'::jsonb, 'A young donkey', 'Jesus found a young donkey and sat on it (John 12:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus find?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 1, 'What did Jesus say Mary bought the ointment for?', '["The day of my burial", "Her own vanity", "A Roman tax (a common guess, but not what John says here)", "A wedding feast"]'::jsonb, 'The day of my burial', 'Leave her alone, so that she may keep it for the day of my burial (John 12:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say Mary bought the ointment for?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 1, 'What did Jesus say a grain of wheat must do?', '["Grow taller (a common guess, but not what John says here)", "Feed birds only", "Stay in the barn", "Die to bear much fruit"]'::jsonb, 'Die to bear much fruit', 'Unless a grain of wheat falls into the earth and dies, it remains alone (John 12:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say a grain of wheat must do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 1, 'What did Jesus'' disciples not understand at first?', '["That Lazarus was dead (a common guess, but not what John says here)", "That Passover was near", "That Judas would betray", "That these things were written about him"]'::jsonb, 'That these things were written about him', 'His disciples did not understand these things at first (John 12:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus'' disciples not understand at first?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 1, 'What did the crowd cry on Palm Sunday?', '["Blessed be Caesar", "Crucify him (a common guess, but not what John says here)", "Away with Rome", "Hosanna! Blessed is he who comes in the name of the Lord"]'::jsonb, 'Hosanna! Blessed is he who comes in the name of the Lord', 'Hosanna! Blessed is he who comes in the name of the Lord, even the King of Israel! (John 12:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the crowd cry on Palm Sunday?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 1, 'What did the great crowd come to see?', '["Lazarus", "Herod", "The temple", "Pilate"]'::jsonb, 'Lazarus', 'The crowd came… because they heard that Jesus had raised Lazarus (John 12:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the great crowd come to see?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 1, 'Who anointed Jesus'' feet?', '["Mary", "Judas", "Martha", "Lazarus"]'::jsonb, 'Mary', 'Mary therefore took a pound of expensive ointment… and anointed the feet of Jesus (John 12:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who anointed Jesus'' feet?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 1, 'Who asked to see Jesus?', '["Roman senators", "Egyptian priests", "Pharisees only", "Some Greeks"]'::jsonb, 'Some Greeks', 'Now among those who went up to worship at the feast were some Greeks (John 12:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who asked to see Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 1, 'Who complained about the ointment?', '["Thomas", "Judas Iscariot", "Peter (a common guess, but not what John says here)", "Pharisees"]'::jsonb, 'Judas Iscariot', 'But Judas Iscariot… said, "Why was this ointment not sold…?" (John 12:4–5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who complained about the ointment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 1, 'Whose house did Jesus visit six days before Passover?', '["Zacchaeus", "Simon the Pharisee", "Nicodemus", "Lazarus"]'::jsonb, 'Lazarus', 'Six days before the Passover, Jesus therefore came to Bethany, where Lazarus was (John 12:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'Whose house did Jesus visit six days before Passover?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 2, 'How many days before Passover was the supper?', '["Forty", "One", "Six", "Three"]'::jsonb, 'Six', 'Six days before the Passover, Jesus came to Bethany (John 12:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'How many days before Passover was the supper?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 2, 'What could Jesus not do because the hour had not yet come?', '["Teach", "Nothing — the Father gave him authority over timing in Johannine sense", "Love (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Heal"]'::jsonb, 'Nothing — the Father gave him authority over timing in Johannine sense', 'Jesus answered them, "The hour has come for the Son of Man to be glorified" (John 12:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'What could Jesus not do because the hour had not yet come?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 2, 'What did Isaiah say about belief?', '["No one heard (a common guess, but not what John says here)", "Who has believed what he heard from us?", "Belief is automatic", "Everyone believes"]'::jsonb, 'Who has believed what he heard from us?', 'Isaiah said these things because he saw his glory and spoke of him (John 12:41).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Isaiah say about belief?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 2, 'What did Jesus say he would draw when lifted up?', '["All people to himself", "Only Jews (a common guess, but not what John says here)", "Only angels", "Only soldiers"]'::jsonb, 'All people to himself', 'I, when I am lifted up from the earth, will draw all people to myself (John 12:32).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say he would draw when lifted up?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 2, 'What did Jesus say his soul was?', '["Troubled", "Peaceful only", "Ignorant", "Sinful"]'::jsonb, 'Troubled', 'Now is my soul troubled. And what shall I say? (John 12:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say his soul was?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 2, 'What did Jesus say now is the judgment of this world?', '["Now the ruler of this world will be cast out", "Now Rome falls (a common guess, but not what John says here)", "Now peace comes", "Now the temple ends"]'::jsonb, 'Now the ruler of this world will be cast out', 'Now is the judgment of this world; now will the ruler of this world be cast out (John 12:31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say now is the judgment of this world?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 2, 'What did Jesus say people loved instead of light?', '["Truth", "Darkness", "Scripture", "Parents"]'::jsonb, 'Darkness', 'People loved the darkness rather than the light (John 12:43).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say people loved instead of light?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 2, 'What did Mary wipe Jesus'' feet with?', '["Her hair", "Leaves", "Sand", "A towel only"]'::jsonb, 'Her hair', 'She wiped his feet with her hair (John 12:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Mary wipe Jesus'' feet with?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 2, 'What did a voice from heaven say?', '["Stay in Galilee", "Fear the Romans", "I have glorified it, and I will glorify it again", "You are wrong (a common guess, but not what John says here)"]'::jsonb, 'I have glorified it, and I will glorify it again', 'I have glorified it, and I will glorify it again (John 12:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did a voice from heaven say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 2, 'What did the crowd say the voice was?', '["A demon (a common guess, but not what John says here)", "Thunder or an angel", "A trumpet from Rome", "Silence"]'::jsonb, 'Thunder or an angel', 'The crowd… said that it had thundered. Others said, "An angel has spoken to him" (John 12:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the crowd say the voice was?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 3, 'How do Greeks seeking Jesus symbolize mission?', '["Gentiles drawn — \"hour\" for all nations", "Only Jews matter", "Greeks reject (a common guess, but not what John says here)", "Greeks are villains"]'::jsonb, 'Gentiles drawn — "hour" for all nations', 'We wish to see Jesus (John 12:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'How do Greeks seeking Jesus symbolize mission?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 3, 'How does triumphal entry quote Zechariah?', '["Military king on horse", "King humble on donkey — messianic claim", "No prophecy (a common guess, but not what John says here)", "Only human king"]'::jsonb, 'King humble on donkey — messianic claim', 'Fear not, daughter of Zion; behold, your king is coming, sitting on a donkey''s colt (John 12:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does triumphal entry quote Zechariah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 3, 'How does unbelief fulfill Isaiah 53 / 6?', '["Isaiah is wrong", "Hardening — God''s word still judges", "Everyone believes", "Prophecy fails (a common guess, but not what John says here)"]'::jsonb, 'Hardening — God''s word still judges', 'Isaiah said these things because he saw his glory (John 12:41).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does unbelief fulfill Isaiah 53 / 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 3, 'How does voice from heaven function?', '["Father''s approval of cross — glorification theme", "Random weather (a common guess, but not what John says here)", "Jesus'' imagination", "Crowd hallucination"]'::jsonb, 'Father''s approval of cross — glorification theme', 'I have glorified it, and I will glorify it again (John 12:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does voice from heaven function?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 3, 'Theologically, what does anointing for burial anticipate?', '["Only hygiene", "Only party (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Passion and royal anointing — messianic king going to death", "Only Judas'' anger"]'::jsonb, 'Passion and royal anointing — messianic king going to death', 'Kept for the day of my burial (John 12:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'Theologically, what does anointing for burial anticipate?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 3, 'What does "lifted up" mean?', '["Only resurrection", "Only ascension", "Crucifixion exaltation — drawing all peoples", "Only teaching (a common guess, but not what John says here)"]'::jsonb, 'Crucifixion exaltation — drawing all peoples', 'When I am lifted up from the earth (John 12:32).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does "lifted up" mean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 3, 'What does Jesus'' troubled soul humanize?', '["Real struggle before cross — not cold stoicism", "Sin in Jesus (a common guess, but not what John says here)", "Doubt of Father", "Fear of crowds"]'::jsonb, 'Real struggle before cross — not cold stoicism', 'Now is my soul troubled (John 12:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Jesus'' troubled soul humanize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 3, 'What does grain of wheat dying teach about discipleship?', '["Life through death — pattern of Jesus and followers", "Avoid suffering (a common guess, but not what John says here)", "Death ends fruit", "Only farmers matter"]'::jsonb, 'Life through death — pattern of Jesus and followers', 'Unless it dies, it remains alone (John 12:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does grain of wheat dying teach about discipleship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 3, 'What fear did rulers have?', '["Being put out of the synagogue", "Fish shortage", "Storms (a common guess, but not what John says here)", "Roman taxes only"]'::jsonb, 'Being put out of the synagogue', 'They loved the glory that comes from man more than the glory that comes from God (John 12:43).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What fear did rulers have?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 3, 'What ruler is cast out?', '["Pilate", "Satan — defeat through cross", "Herod (a common guess, but not what John says here)", "Moses"]'::jsonb, 'Satan — defeat through cross', 'The ruler of this world will be cast out (John 12:31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What ruler is cast out?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 4, 'How does Isaiah 53 quotation serve?', '["Isaiah irrelevant", "Proves no one sinned", "Cancels prophecy (a common guess, but not what John says here)", "Unbelief was foretold — God''s plan includes rejection"]'::jsonb, 'Unbelief was foretold — God''s plan includes rejection', 'Who has believed our report? (John 12:38).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Isaiah 53 quotation serve?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 4, 'How does Jesus'' answer about hating life in 12:25 relate to discipleship?', '["Self-denial follows cruciform pattern", "Hate is literal for all", "Only monks (a common guess, but not what John says here)", "Life is worthless"]'::jsonb, 'Self-denial follows cruciform pattern', 'Whoever loves his life loses it (John 12:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Jesus'' answer about hating life in 12:25 relate to discipleship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 4, 'How does Lazarus'' presence provoke chief priests?', '["Sign credibility threatens leadership — plot thickens", "They love Lazarus", "Lazarus is hidden", "No reaction (a common guess, but not what John says here)"]'::jsonb, 'Sign credibility threatens leadership — plot thickens', 'The chief priests made plans to put Lazarus to death (John 12:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Lazarus'' presence provoke chief priests?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 4, 'How does belief of crowd contrast authorities?', '["Everyone agrees (a common guess, but not what John says here)", "Populace welcomes; leaders reject — passion setup", "Crowd is absent", "Authorities believe all"]'::jsonb, 'Populace welcomes; leaders reject — passion setup', 'The Pharisees said… Look, the world has gone after him (John 12:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does belief of crowd contrast authorities?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 4, 'How does crowd misunderstanding of voice mirror spiritual dullness?', '["Everyone understood", "Thunder vs angel — missing divine speech", "Only disciples confused", "Voice is clear (a common guess, but not what John says here)"]'::jsonb, 'Thunder vs angel — missing divine speech', 'It had thundered… an angel (John 12:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does crowd misunderstanding of voice mirror spiritual dullness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 4, 'Scholarly view: historicity of entry?', '["Only John happened", "Core event widely accepted; details harmonized across Gospels", "All deny entry (a common guess, but not what John says here) (does not match John’s wording in this verse)", "No scholarship"]'::jsonb, 'Core event widely accepted; details harmonized across Gospels', 'Majority accept some historical kernel.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'Scholarly view: historicity of entry?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 4, 'What does "the hour" theme climax toward?', '["Glorification through death — John''s turning point", "End of Gospel (a common guess, but not what John says here)", "Only miracles", "Only teaching"]'::jsonb, 'Glorification through death — John''s turning point', 'The hour has come for the Son of Man to be glorified (John 12:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does "the hour" theme climax toward?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 4, 'What does Mary''s costly worship model?', '["Extravagant love — Judas'' cheapness contrasts", "Hypocrisy (a common guess, but not what John says here)", "Waste of money always", "Public show only"]'::jsonb, 'Extravagant love — Judas'' cheapness contrasts', 'Anointed… house was filled with the fragrance (John 12:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Mary''s costly worship model?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 4, 'What does fragrance filling house suggest?', '["Worship impact — gospel spreads scent", "Judas likes it", "Only smell (a common guess, but not what John says here)", "House decay"]'::jsonb, 'Worship impact — gospel spreads scent', 'The house was filled with the fragrance of the perfume (John 12:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does fragrance filling house suggest?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 4, 'What does light/darkness summary in 12:35–36 echo?', '["Contradicts John 1", "Johannine ethical urgency — walk while light is here", "Only future light", "New theme (a common guess, but not what John says here)"]'::jsonb, 'Johannine ethical urgency — walk while light is here', 'Walk while you have the light (John 12:35).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does light/darkness summary in 12:35–36 echo?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 5, 'How does "world has gone after him" ironically true?', '["World hates Jesus", "Gentile seekers and crowd — leaders panic", "Phrase is false", "No one follows (a common guess, but not what John says here)"]'::jsonb, 'Gentile seekers and crowd — leaders panic', 'The world has gone after him (John 12:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does "world has gone after him" ironically true?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 5, 'How does 12:32 universalize mission?', '["Drawing is forced", "All peoples drawn — not ethnic limit", "No one comes", "Only Israel (a common guess, but not what John says here)"]'::jsonb, 'All peoples drawn — not ethnic limit', 'I will draw all people to myself (John 12:32).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 12:32 universalize mission?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 5, 'How does 12:48 connect word and judgment?', '["No future judgment", "Judgment is only works", "Words do nothing (a common guess, but not what John says here)", "Jesus'' words judge at last day — proclamation is serious"]'::jsonb, 'Jesus'' words judge at last day — proclamation is serious', 'The word that I have spoken will judge him on the last day (John 12:48).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 12:48 connect word and judgment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 5, 'How does Mary''s act relate to later burial anointing stories?', '["Thematic continuity — king prepared for tomb", "John invents (a common guess, but not what John says here)", "Only one anointing in history", "Contradicts other Gospels"]'::jsonb, 'Thematic continuity — king prepared for tomb', 'Kept for burial (John 12:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Mary''s act relate to later burial anointing stories?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 5, 'What christological reading of Isaiah does John give?', '["Isaiah saw Jesus'' glory — NT christological interpretation", "Isaiah saw only a king (a common guess, but not what John says here)", "Isaiah is not about Jesus", "Glory is only Shekinah box"]'::jsonb, 'Isaiah saw Jesus'' glory — NT christological interpretation', 'Isaiah… saw his glory and spoke of him (John 12:41).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What christological reading of Isaiah does John give?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 5, 'What did Jesus say would happen to those who reject him and do not receive his sayings?', '["The word that he has spoken will judge them on the last day", "They will be ignored forever", "They automatically receive life", "Only angels judge (a common guess, but not what John says here)"]'::jsonb, 'The word that he has spoken will judge them on the last day', 'The word that I have spoken will judge him on the last day (John 12:48).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus say would happen to those who reject him and do not receive his sayings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 5, 'What did Jesus tell the disciples about the light?', '["To walk while they have the light, before darkness overtakes them", "To ignore light (a common guess, but not what John says here) (does not match John’s wording in this verse)", "To hide in darkness", "To wait for night"]'::jsonb, 'To walk while they have the light, before darkness overtakes them', 'Walk while you have the light, lest darkness overtake you (John 12:35).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus tell the disciples about the light?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 5, 'What does Jesus leaving and hiding add?', '["Failure (a common guess, but not what John says here)", "End of ministry", "Withdrawal until hour — sovereign timing", "Fear alone"]'::jsonb, 'Withdrawal until hour — sovereign timing', 'Jesus departed and hid himself from them (John 12:36).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Jesus leaving and hiding add?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 5, 'What does anointing six days before Passover timing suggest?', '["Only Bethany time", "Contradicts Synoptics without harmonization", "Deliberate preparation week — passion nears", "Random date (a common guess, but not what John says here)"]'::jsonb, 'Deliberate preparation week — passion nears', 'Six days before Passover (John 12:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does anointing six days before Passover timing suggest?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 12, 5, 'What does crowd''s palm branches signify?', '["Funeral only", "Roman tribute", "Farm tools (a common guess, but not what John says here)", "Kingship — festal welcome"]'::jsonb, 'Kingship — festal welcome', 'Took branches of palm trees and went out to meet him (John 12:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does crowd''s palm branches signify?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 1, 'Before what feast did Jesus love his own to the end?', '["Dedication", "The Feast of the Passover", "Tabernacles", "Weeks (a common guess, but not what John says here)"]'::jsonb, 'The Feast of the Passover', 'Before the Feast of the Passover, Jesus knowing that his hour had come… (John 13:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'Before what feast did Jesus love his own to the end?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 1, 'What did Jesus do during supper?', '["Rose and laid aside garments and washed disciples'' feet", "Blessed bread only", "Left immediately (a common guess, but not what John says here)", "Preached for three hours"]'::jsonb, 'Rose and laid aside garments and washed disciples'' feet', 'Jesus… rose from supper… began to wash the disciples'' feet (John 13:2–5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus do during supper?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 1, 'What did Jesus give Judas?', '["A scroll", "A morsel of bread", "A cup", "A bag of silver visible"]'::jsonb, 'A morsel of bread', 'Dipping the morsel, he gave it to Judas (John 13:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus give Judas?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 1, 'What did Jesus say if Peter did not allow washing?', '["He would be richer", "He would be a priest", "He would be first (a common guess, but not what John says here)", "He would have no share with him"]'::jsonb, 'He would have no share with him', 'If I do not wash you, you have no share with me (John 13:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say if Peter did not allow washing?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 1, 'What did Jesus say the one who ate bread with him would do?', '["Lift his heel against him", "Deny him three times only", "Sell him (a common guess, but not what John says here)", "Leave early"]'::jsonb, 'Lift his heel against him', 'He who ate my bread has lifted his heel against me (John 13:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say the one who ate bread with him would do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 1, 'What did Jesus say to Judas?', '["Give money to the poor", "Repent now (a common guess, but not what John says here)", "What you are going to do, do quickly", "Stay longer"]'::jsonb, 'What you are going to do, do quickly', 'What you are going to do, do quickly (John 13:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say to Judas?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 1, 'What did Peter first say when Jesus came to wash his feet?', '["I am unworthy", "You shall never wash my feet", "Wash my head (a common guess, but not what John says here)", "Use more water"]'::jsonb, 'You shall never wash my feet', 'You shall never wash my feet (John 13:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Peter first say when Jesus came to wash his feet?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 1, 'What did Peter then ask Jesus to wash?', '["Nothing (a common guess, but not what John says here)", "Only his sandals", "His head and hands also", "The floor"]'::jsonb, 'His head and hands also', 'Lord, not my feet only but also my hands and my head (John 13:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Peter then ask Jesus to wash?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 1, 'What entered Judas when he took the morsel?', '["Peace", "Joy (a common guess, but not what John says here)", "Fear", "Satan"]'::jsonb, 'Satan', 'After the morsel, then Satan entered into him (John 13:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'What entered Judas when he took the morsel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 1, 'Who did the disciples question about whom Jesus meant?', '["The beloved disciple next to Jesus", "Judas (a common guess, but not what John says here)", "Peter only", "Thomas"]'::jsonb, 'The beloved disciple next to Jesus', 'One of his disciples… leaning back against Jesus… (John 13:23–25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who did the disciples question about whom Jesus meant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 2, 'How does Psalm 41 quotation apply to Judas?', '["Betrayal by familiar friend — Scripture fulfilled", "David wrote only of Saul", "Judas is innocent (a common guess, but not what John says here)", "Psalm is unrelated"]'::jsonb, 'Betrayal by familiar friend — Scripture fulfilled', 'Even my close friend… has lifted his heel against me (John 13:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does Psalm 41 quotation apply to Judas?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 2, 'How does morsel sequence identify betrayer?', '["Judas is honored only", "No betrayer exists (a common guess, but not what John says here)", "Honor at table turned to treachery — dramatic irony", "Random meal detail"]'::jsonb, 'Honor at table turned to treachery — dramatic irony', 'It is he to whom I will give this morsel of bread (John 13:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does morsel sequence identify betrayer?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 2, 'How would people know disciples are Jesus''?', '["If they avoid sinners", "If they have love for one another", "If they speak Greek (a common guess, but not what John says here)", "If they wear a uniform"]'::jsonb, 'If they have love for one another', 'By this all people will know that you are my disciples, if you have love for one another (John 13:35).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'How would people know disciples are Jesus''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 2, 'Theologically, what does foot washing symbolize?', '["Only ordination", "Only hygiene", "Only Judas (a common guess, but not what John says here)", "Humble service and cleansing — pattern of Christ''s love"]'::jsonb, 'Humble service and cleansing — pattern of Christ''s love', 'If I then, your Lord and Teacher, have washed your feet (John 13:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'Theologically, what does foot washing symbolize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 2, 'What did Jesus predict Peter would do?', '["Betray him (a common guess, but not what John says here)", "Become high priest", "Deny him three times", "Die before Jesus"]'::jsonb, 'Deny him three times', 'Will you lay down your life for me? … you will deny me three times (John 13:38).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus predict Peter would do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 2, 'What does Peter''s refusal then excess show?', '["He understands servanthood", "Pride then enthusiasm — misunderstanding greatness", "No emotion (a common guess, but not what John says here)", "Perfect faith"]'::jsonb, 'Pride then enthusiasm — misunderstanding greatness', 'You shall never wash my feet… wash my head (John 13:8–9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Peter''s refusal then excess show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 2, 'What does love to the end (telos) hint?', '["Love is partial", "Love failed", "Love complete to the cross — fidelity in hour", "Love ended (a common guess, but not what John says here)"]'::jsonb, 'Love complete to the cross — fidelity in hour', 'Having loved his own who were in the world, he loved them to the end (John 13:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does love to the end (telos) hint?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 2, 'What new commandment did Jesus give?', '["Fast twice weekly", "Circumcise converts", "Love one another as he loved them", "Pay double tithe (a common guess, but not what John says here)"]'::jsonb, 'Love one another as he loved them', 'A new commandment I give to you, that you love one another (John 13:34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'What new commandment did Jesus give?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 2, 'Where did Jesus say he was going?', '["Where disciples could not come then", "To Egypt", "To Rome (a common guess, but not what John says here)", "To the temple only"]'::jsonb, 'Where disciples could not come then', 'Where I am going you cannot come (John 13:33).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'Where did Jesus say he was going?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 2, 'Whom did Jesus say the Father had given all things into whose hands?', '["Pilate", "Moses (a common guess, but not what John says here)", "Caiaphas", "The Son of Man"]'::jsonb, 'The Son of Man', 'Jesus, knowing that the Father had given all things into his hands (John 13:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'Whom did Jesus say the Father had given all things into whose hands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 3, 'How does "you cannot come" prepare Farewell Discourse?', '["Jesus'' departure to Father — disciples must stay", "Only Judas goes (a common guess, but not what John says here)", "No heaven for disciples", "Jesus excludes disciples forever"]'::jsonb, 'Jesus'' departure to Father — disciples must stay', 'Where I am going you cannot come (John 13:33).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does "you cannot come" prepare Farewell Discourse?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 3, 'How does Jesus knowing his hour frame chapter?', '["Hour is wrong", "Jesus is uncertain", "Sovereign love toward cross — not surprised", "No plan (a common guess, but not what John says here)"]'::jsonb, 'Sovereign love toward cross — not surprised', 'Jesus knowing that his hour had come (John 13:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Jesus knowing his hour frame chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 3, 'How does Satan entering Judas after morsel portray?', '["Judas has no blame (a common guess, but not what John says here)", "Satan is a metaphor only", "Jesus forces Judas", "Moral responsibility and demonic agency — mystery of evil"]'::jsonb, 'Moral responsibility and demonic agency — mystery of evil', 'Satan entered into him (John 13:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Satan entering Judas after morsel portray?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 3, 'How does beloved disciple''s posture show intimacy?', '["Only symbolic (a common guess, but not what John says here)", "Close to Jesus'' breast — trusted witness", "Enemy position", "Far from Jesus"]'::jsonb, 'Close to Jesus'' breast — trusted witness', 'Leaning back against Jesus'' breast (John 13:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does beloved disciple''s posture show intimacy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 3, 'How does mutual love prove discipleship?', '["Visible community witness — apologetic of love", "Love is invisible (a common guess, but not what John says here)", "Only creeds prove", "Only miracles prove"]'::jsonb, 'Visible community witness — apologetic of love', 'By this all people will know… (John 13:35).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does mutual love prove discipleship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 3, 'What does laying aside garments prefigure?', '["Warmth only (a common guess, but not what John says here)", "Fashion only", "Stripping for cross — servant humility", "No cross link"]'::jsonb, 'Stripping for cross — servant humility', 'Laid aside his outer garments (John 13:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does laying aside garments prefigure?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 3, 'What does new commandment "new" emphasize?', '["New covenant love modeled on Jesus'' impending sacrifice", "Love is optional (a common guess, but not what John says here)", "Only for apostles", "Old hate command"]'::jsonb, 'New covenant love modeled on Jesus'' impending sacrifice', 'A new commandment… as I have loved you (John 13:34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does new commandment "new" emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 3, 'What ethic does foot washing give leaders?', '["Servant pattern — greatness is service", "Wash only feet literally forever", "Only slaves wash (a common guess, but not what John says here)", "Leaders rule by fear"]'::jsonb, 'Servant pattern — greatness is service', 'If I then, your Lord and Teacher, have washed your feet (John 13:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What ethic does foot washing give leaders?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 3, 'What night is this?', '["Night of betrayal — Passover meal context", "No timing (a common guess, but not what John says here)", "Random dinner", "Sabbath lunch"]'::jsonb, 'Night of betrayal — Passover meal context', 'Night when he would depart out of this world (John 13:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What night is this?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 3, 'What tension exists in Judas leaving?', '["Judas stayed (a common guess, but not what John says here)", "No one noticed", "Everyone knew betrayal", "Some thought Judas bought feast needs — irony"]'::jsonb, 'Some thought Judas bought feast needs — irony', 'Some thought… Judas had the money bag (John 13:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What tension exists in Judas leaving?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 4, 'How does Peter''s boast contrast coming denial?', '["Overconfidence — grace needed", "Only Judas denies", "Denial is impossible", "Peter is correct (a common guess, but not what John says here)"]'::jsonb, 'Overconfidence — grace needed', 'I will lay down my life for you (John 13:37).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Peter''s boast contrast coming denial?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 4, 'How does Satan''s role fit Johannine dualism?', '["Only political", "No conflict (a common guess, but not what John says here)", "Satan is good", "Light vs darkness — cosmic conflict behind betrayal"]'::jsonb, 'Light vs darkness — cosmic conflict behind betrayal', 'Night… Judas… devil (John 13:2, 27, 30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Satan''s role fit Johannine dualism?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 4, 'How does chapter end on denial prediction?', '["Peter is rejected forever", "No restoration", "Foreshadows passion failure and restoration theme", "Ends hope (a common guess, but not what John says here)"]'::jsonb, 'Foreshadows passion failure and restoration theme', 'You will deny me three times (John 13:38).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does chapter end on denial prediction?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 4, 'How does foot washing answer disciples'' rivalry?', '["Power is goal (a common guess, but not what John says here)", "Rivalry is good", "James and John absent", "True greatness serves — rebukes power grabs"]'::jsonb, 'True greatness serves — rebukes power grabs', 'If I your Lord wash… (John 13:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does foot washing answer disciples'' rivalry?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 4, 'How does love command connect to cross next chapters?', '["Love as Jesus'' life laid down — standard", "Love is law only", "Cross unrelated (a common guess, but not what John says here)", "Love stops at command"]'::jsonb, 'Love as Jesus'' life laid down — standard', 'As I have loved you (John 13:34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does love command connect to cross next chapters?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 4, 'Scholarly view: Last Supper timing in John vs Synoptics?', '["Harmonizations proposed — theological emphasis on Passover lamb", "John is wrong (a common guess, but not what John says here) (does not match John’s wording in this verse)", "No scholarship", "All agree easily"]'::jsonb, 'Harmonizations proposed — theological emphasis on Passover lamb', 'Debated; John stresses Passover context differently.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'Scholarly view: Last Supper timing in John vs Synoptics?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 4, 'What does "having loved his own" emphasize?', '["Particular love for disciples — covenant community", "Love is generic", "Only universal with no church", "Only enemies (a common guess, but not what John says here)"]'::jsonb, 'Particular love for disciples — covenant community', 'He loved his own who were in the world (John 13:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does "having loved his own" emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 4, 'What does Jesus know about betrayer?', '["Identity — sovereign awareness", "Guesses (a common guess, but not what John says here)", "Nothing", "Only after act"]'::jsonb, 'Identity — sovereign awareness', 'Jesus was troubled in spirit… "Truly… one of you will betray me" (John 13:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Jesus know about betrayer?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 4, 'What does washing feet relate to later Spirit/church?', '["Ritual only forever", "Cleansing and mutual care in body of Christ", "Cancelled by Paul (a common guess, but not what John says here)", "Only first century"]'::jsonb, 'Cleansing and mutual care in body of Christ', 'You ought to wash one another''s feet (John 13:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does washing feet relate to later Spirit/church?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 4, 'What liturgical echoes might foot washing carry?', '["Priestly washings — Jesus as servant high priest", "Pagan baths only", "No OT echoes (a common guess, but not what John says here)", "Only Roman customs"]'::jsonb, 'Priestly washings — Jesus as servant high priest', 'He poured water into a basin (John 13:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'What liturgical echoes might foot washing carry?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 5, 'How does "share with me" language work?', '["Covenant fellowship — cleansing and communion", "Financial share", "No theology", "Land share (a common guess, but not what John says here)"]'::jsonb, 'Covenant fellowship — cleansing and communion', 'You have no share with me (John 13:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does "share with me" language work?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 5, 'How does morsel honor Judas ironically?', '["No irony (a common guess, but not what John says here)", "Guest of honor becomes betrayer — pathos", "Judas is praised by all", "Morsel is poison"]'::jsonb, 'Guest of honor becomes betrayer — pathos', 'It is he to whom I will give this morsel (John 13:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does morsel honor Judas ironically?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 5, 'How does new commandment fulfill old?', '["Love neighbor canceled", "Only new with no continuity", "Leviticus love neighbor fulfilled in Christ-shaped love", "Cancels Old Testament (a common guess, but not what John says here)"]'::jsonb, 'Leviticus love neighbor fulfilled in Christ-shaped love', 'Love one another as I have loved you (John 13:34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does new commandment fulfill old?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 5, 'What did Jesus know from the beginning about the Twelve?', '["Nothing (a common guess, but not what John says here)", "Only Peter''s denial", "Only Judas'' name", "Who would betray him"]'::jsonb, 'Who would betray him', 'He knew who would betray him (John 13:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus know from the beginning about the Twelve?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 5, 'What did Jesus say disciples were if they knew these things?', '["Only teachers", "Cursed if they hear", "Neutral (a common guess, but not what John says here)", "Blessed if they do them"]'::jsonb, 'Blessed if they do them', 'If you know these things, blessed are you if you do them (John 13:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus say disciples were if they knew these things?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 5, 'What did Jesus tell disciples they could not do now?', '["Read Scripture", "Eat (a common guess, but not what John says here)", "Follow him where he was going", "Pray"]'::jsonb, 'Follow him where he was going', 'Where I am going you cannot follow me now (John 13:36).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus tell disciples they could not do now?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 5, 'What does quick departure of Judas imply?', '["No departure (a common guess, but not what John says here)", "Jesus chases", "Judas repents", "Door closed on mercy for that path — narrative speed"]'::jsonb, 'Door closed on mercy for that path — narrative speed', 'Having received the morsel, he immediately went out, and it was night (John 13:30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does quick departure of Judas imply?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 5, 'What does troubled spirit show?', '["Jesus'' emotional depth before betrayal — true humanity", "Coldness", "Sin (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Surprise"]'::jsonb, 'Jesus'' emotional depth before betrayal — true humanity', 'He was troubled in spirit (John 13:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does troubled spirit show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 5, 'What link to Eucharist traditions?', '["No link ever (a common guess, but not what John says here)", "Only baptism", "Bread handed — later church ties to Lord''s Supper themes", "John denies supper"]'::jsonb, 'Bread handed — later church ties to Lord''s Supper themes', 'He dipped the morsel (John 13:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What link to Eucharist traditions?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 13, 5, 'What pastoral use does foot washing have?', '["Only apostles'' feet matter", "Models humility in Christian community — not optional pride", "Washing saves souls alone", "Humility is weakness (a common guess, but not what John says here)"]'::jsonb, 'Models humility in Christian community — not optional pride', 'You also ought to wash one another''s feet (John 13:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What pastoral use does foot washing have?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 1, 'What did Jesus promise to ask the Father to give?', '["Money", "Another Helper", "A kingdom in Rome", "A new Moses"]'::jsonb, 'Another Helper', 'I will ask the Father, and he will give you another Helper (John 14:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus promise to ask the Father to give?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 1, 'What did Jesus say about coming to the Father?', '["No one comes to the Father except through him", "Only Moses brings people", "Only priests (a common guess, but not what John says here)", "Many ways equally"]'::jsonb, 'No one comes to the Father except through him', 'No one comes to the Father except through me (John 14:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say about coming to the Father?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 1, 'What did Jesus say about his words and works?', '["Only words matter", "Believe because of the works", "Works are evil", "Ignore works (a common guess, but not what John says here)"]'::jsonb, 'Believe because of the works', 'Believe me… or else believe on account of the works themselves (John 14:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say about his words and works?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 1, 'What did Jesus say about seeing him?', '["Only angels see (a common guess, but not what John says here)", "Only after death", "Whoever has seen him has seen the Father", "No one can see him"]'::jsonb, 'Whoever has seen him has seen the Father', 'Whoever has seen me has seen the Father (John 14:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say about seeing him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 1, 'What did Jesus say about the Father''s house?', '["Only angels dwell", "Many rooms; he goes to prepare a place", "One small room (a common guess, but not what John says here)", "No place for disciples"]'::jsonb, 'Many rooms; he goes to prepare a place', 'In my Father''s house are many rooms… I go to prepare a place for you (John 14:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say about the Father''s house?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 1, 'What did Jesus say he was?', '["The king only", "The way, and the truth, and the life", "The law only (a common guess, but not what John says here)", "The temple only"]'::jsonb, 'The way, and the truth, and the life', 'I am the way, and the truth, and the life (John 14:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say he was?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 1, 'What did Jesus say he would do after preparing a place?', '["Come again and take them to himself", "Forget them (a common guess, but not what John says here)", "Stay away forever", "Send angels only"]'::jsonb, 'Come again and take them to himself', 'I will come again and will take you to myself (John 14:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say he would do after preparing a place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 1, 'What did Philip ask Jesus to show?', '["Rome", "The Father", "Angels only", "Herod"]'::jsonb, 'The Father', 'Lord, show us the Father, and it is enough for us (John 14:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Philip ask Jesus to show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 1, 'What is the Helper called?', '["The Spirit of truth", "The spirit of sleep", "The spirit of fear (a common guess, but not what John says here)", "The spirit of Rome"]'::jsonb, 'The Spirit of truth', 'The Spirit of truth (John 14:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'What is the Helper called?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 1, 'Who cannot receive the Spirit?', '["The world", "Disciples", "Angels", "The Father"]'::jsonb, 'The world', 'The world cannot receive him (John 14:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who cannot receive the Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 2, 'What did Jesus leave with disciples?', '["Money bags", "Swords", "Fear (a common guess, but not what John says here)", "Peace — not as the world gives"]'::jsonb, 'Peace — not as the world gives', 'Peace I leave with you; my peace I give to you (John 14:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus leave with disciples?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 2, 'What did Jesus say about being in the Father and Father in him?', '["Mutual indwelling — unity of mission and being", "Only metaphor with no reality", "Only human (a common guess, but not what John says here)", "Separation"]'::jsonb, 'Mutual indwelling — unity of mission and being', 'Believe me that I am in the Father and the Father is in me (John 14:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say about being in the Father and Father in him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 2, 'What did Jesus say about whatever asked in his name?', '["He will do it — prayer in Jesus'' name", "Only material gifts", "Only for apostles", "Nothing happens (a common guess, but not what John says here)"]'::jsonb, 'He will do it — prayer in Jesus'' name', 'Whatever you ask in my name, this I will do (John 14:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say about whatever asked in his name?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 2, 'What did Jesus say he who loves him will keep?', '["His commandments", "Only dietary rules", "Roman law", "Only Sabbath"]'::jsonb, 'His commandments', 'If you love me, you will keep my commandments (John 14:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say he who loves him will keep?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 2, 'What did Jesus say the Helper would teach?', '["All things and remind them of Jesus'' words", "Greek philosophy", "Nothing (a common guess, but not what John says here)", "Roman law"]'::jsonb, 'All things and remind them of Jesus'' words', 'The Helper… will teach you all things and bring to your remembrance all that I have said (John 14:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say the Helper would teach?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 2, 'What did Jesus say the ruler of this world had?', '["Ownership (a common guess, but not what John says here)", "No claim on him", "Full claim", "Victory forever"]'::jsonb, 'No claim on him', 'The ruler of this world is coming. He has no claim on me (John 14:30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say the ruler of this world had?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 2, 'What did Jesus tell disciples not to let their hearts be?', '["Proud (a common guess, but not what John says here)", "Troubled or afraid", "Silent", "Happy"]'::jsonb, 'Troubled or afraid', 'Let not your hearts be troubled (John 14:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus tell disciples not to let their hearts be?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 2, 'What greater works would believers do?', '["Wealth (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Political power", "Greater miracles always physically", "Because Jesus goes to the Father — Spirit-empowered mission"]'::jsonb, 'Because Jesus goes to the Father — Spirit-empowered mission', 'Greater works than these will he do, because I am going to the Father (John 14:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'What greater works would believers do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 2, 'What would the Father do for those who love Jesus?', '["Send the Helper", "Ignore them", "Remove trials", "Give wealth only"]'::jsonb, 'Send the Helper', 'My Father will love him, and we will come to him (John 14:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'What would the Father do for those who love Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 2, 'Why would the Father be glorified in the Son?', '["Because believers ask in Jesus'' name — answered prayer shows Son''s mediation", "Glory is money", "Father needs fame", "No mediation (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'Because believers ask in Jesus'' name — answered prayer shows Son''s mediation', 'I will do it, that the Father may be glorified in the Son (John 14:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why would the Father be glorified in the Son?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 3, 'How does Jesus'' going to Father enable Spirit?', '["No ascension (a common guess, but not what John says here)", "Ascension sends Spirit — Johannine Pentecost linkage", "Spirit comes before cross", "Spirit ignores Jesus"]'::jsonb, 'Ascension sends Spirit — Johannine Pentecost linkage', 'The Helper… whom the Father will send in my name (John 14:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Jesus'' going to Father enable Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 3, 'How does Spirit comfort absent Jesus?', '["Disciples alone (a common guess, but not what John says here)", "Spirit is impersonal only", "Spirit replaces Jesus with no continuity", "Paraclete continues Jesus'' presence and teaching"]'::jsonb, 'Paraclete continues Jesus'' presence and teaching', 'I will not leave you as orphans; I will come to you (John 14:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Spirit comfort absent Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 3, 'How does keeping commandments relate to love?', '["Law saves without faith", "Only feelings matter (a common guess, but not what John says here)", "Love proves itself in obedience — not mere emotion", "Love needs no obedience"]'::jsonb, 'Love proves itself in obedience — not mere emotion', 'If you love me, you will keep my commandments (John 14:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does keeping commandments relate to love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 3, 'How does troubled heart command fit imminent cross?', '["Comfort before crisis — eschatological hope", "Trouble is sin", "Denies crisis (a common guess, but not what John says here)", "Only stoicism"]'::jsonb, 'Comfort before crisis — eschatological hope', 'Let not your hearts be troubled (John 14:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does troubled heart command fit imminent cross?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 3, 'How is Jesus the way?', '["One path among many", "Way is only morals", "Buddha also (a common guess, but not what John says here)", "Exclusive mediator — access to Father only through Son"]'::jsonb, 'Exclusive mediator — access to Father only through Son', 'No one comes to the Father except through me (John 14:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'How is Jesus the way?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 3, 'Theologically, what is "many rooms"?', '["Assurance of space for every believer — hospitality of God", "Only apostles (a common guess, but not what John says here)", "Literal hotel", "Symbolic with no hope"]'::jsonb, 'Assurance of space for every believer — hospitality of God', 'I go to prepare a place for you (John 14:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'Theologically, what is "many rooms"?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 3, 'What does "another" Helper imply?', '["Jesus is first advocate — Spirit continues his work", "Two unrelated helpers", "Only human helpers", "Jesus failed (a common guess, but not what John says here)"]'::jsonb, 'Jesus is first advocate — Spirit continues his work', 'Another Helper (John 14:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does "another" Helper imply?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 3, 'What does Father and Son make dwelling with believer imply?', '["Only metaphor", "Only future (a common guess, but not what John says here)", "Trinitarian fellowship — God with us", "Only apostles"]'::jsonb, 'Trinitarian fellowship — God with us', 'We will come to him and make our home with him (John 14:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Father and Son make dwelling with believer imply?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 3, 'What does mutual indwelling of Father and Son mean for Christology?', '["Modalism only", "Two gods (a common guess, but not what John says here)", "Revelation of Father in Son — oneness in mission", "No relationship"]'::jsonb, 'Revelation of Father in Son — oneness in mission', 'Believe me that I am in the Father and the Father is in me (John 14:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does mutual indwelling of Father and Son mean for Christology?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 3, 'What does peace not as world mean?', '["Wealth (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Worldly ease", "Military victory", "Kingdom peace — not absence of trouble but presence of Christ"]'::jsonb, 'Kingdom peace — not absence of trouble but presence of Christ', 'Not as the world gives do I give to you (John 14:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does peace not as world mean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 4, 'How does Philip''s request reveal misunderstanding?', '["Sees Father as separate visually — Jesus corrects revelation", "Father is visible body", "Philip understands fully", "No correction (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'Sees Father as separate visually — Jesus corrects revelation', 'Show us the Father (John 14:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Philip''s request reveal misunderstanding?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 4, 'How does love and obedience relate to Pentecost?', '["Spirit comes to those who love and obey — readiness", "Spirit ignores obedience", "Only bishops (a common guess, but not what John says here)", "Only emotion"]'::jsonb, 'Spirit comes to those who love and obey — readiness', 'The Spirit… remains with you (John 14:16–17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does love and obedience relate to Pentecost?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 4, 'How does ruler of this world have no claim?', '["Sinless Son — death is voluntary, not Satan''s victory", "Dualism denied (a common guess, but not what John says here)", "Satan owns Jesus", "No spiritual warfare"]'::jsonb, 'Sinless Son — death is voluntary, not Satan''s victory', 'He has no claim on me (John 14:30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does ruler of this world have no claim?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 4, 'How does works apologetic function?', '["Only book knowledge", "Evidence for faith — signs and words cohere", "Faith without evidence", "Works irrelevant (a common guess, but not what John says here)"]'::jsonb, 'Evidence for faith — signs and words cohere', 'Believe… on account of the works (John 14:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does works apologetic function?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 4, 'Scholarly debate: monotheism and "I am in Father"?', '["John is polytheist", "All agree polytheism", "Debates on how John''s high Christology fits Jewish monotheism", "No debate (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'Debates on how John''s high Christology fits Jewish monotheism', 'Complexified trinitarian readings.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'Scholarly debate: monotheism and "I am in Father"?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 4, 'What christological claim is seeing Father in Son?', '["Arianism (a common guess, but not what John says here)", "Only human teacher", "High Christology — revelation of invisible God", "Father is visible"]'::jsonb, 'High Christology — revelation of invisible God', 'Whoever has seen me has seen the Father (John 14:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'What christological claim is seeing Father in Son?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 4, 'What does asking in Jesus'' name mean?', '["Prayer aligned with Jesus'' character and mission — not magic formula", "Only Lord''s Prayer", "Anything selfish", "Name is charm (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'Prayer aligned with Jesus'' character and mission — not magic formula', 'Whatever you ask in my name (John 14:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does asking in Jesus'' name mean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 4, 'What does orphan language evoke?', '["No adoption", "Only OT (a common guess, but not what John says here)", "Israel''s hope — God as Father not leaving", "Literal orphans only"]'::jsonb, 'Israel''s hope — God as Father not leaving', 'I will not leave you as orphans (John 14:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does orphan language evoke?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 4, 'What does preparing a place imply about Jesus'' work?', '["Place is myth", "Heavenly ministry as forerunner — Hebrews theme echo", "No heaven (a common guess, but not what John says here)", "Only earthly"]'::jsonb, 'Heavenly ministry as forerunner — Hebrews theme echo', 'I go to prepare a place for you (John 14:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does preparing a place imply about Jesus'' work?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 4, 'What does teaching and reminding role of Spirit mean for Scripture?', '["Illumination — Spirit authenticates apostolic word", "Scripture alone without Spirit", "Only rabbis (a common guess, but not what John says here)", "Spirit contradicts Scripture"]'::jsonb, 'Illumination — Spirit authenticates apostolic word', 'Will remind you of all I said (John 14:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does teaching and reminding role of Spirit mean for Scripture?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 5, 'How does believing in Jesus relate to believing in Father?', '["Believe one only", "Contradictory (a common guess, but not what John says here)", "Mutual belief — to know Jesus is to know Father", "Father is unknown"]'::jsonb, 'Mutual belief — to know Jesus is to know Father', 'From now on you do know him and have seen him (John 14:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does believing in Jesus relate to believing in Father?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 5, 'How does chapter ground sacramental ecclesiology debates?', '["Denies church (a common guess, but not what John says here)", "Only invisible", "Dwelling and Spirit themes inform church as temple", "Only buildings"]'::jsonb, 'Dwelling and Spirit themes inform church as temple', 'We will make our home with him (John 14:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does chapter ground sacramental ecclesiology debates?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 5, 'How does peace gift prepare for 16:33?', '["Tribulation denied", "World is friend (a common guess, but not what John says here)", "In me you may have peace — world tribulation", "Peace means no cross"]'::jsonb, 'In me you may have peace — world tribulation', 'My peace I give to you (John 14:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does peace gift prepare for 16:33?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 5, 'On that day what would disciples know?', '["Only geography", "Only future prophecy", "That Jesus is in the Father, they in Jesus, and Jesus in them", "Nothing (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'That Jesus is in the Father, they in Jesus, and Jesus in them', 'On that day you will know that I am in my Father, and you in me, and I in you (John 14:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'On that day what would disciples know?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 5, 'What did Jesus say he would not leave disciples as?', '["Orphans", "Pharisees", "Kings", "Slaves to Rome"]'::jsonb, 'Orphans', 'I will not leave you as orphans; I will come to you (John 14:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus say he would not leave disciples as?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 5, 'What did Jesus say the world would not give to the Helper?', '["Money (a common guess, but not what John says here)", "A throne", "Scripture", "See it or know it"]'::jsonb, 'See it or know it', 'The world cannot receive him, because it neither sees him nor knows him (John 14:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus say the world would not give to the Helper?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 5, 'What did Jesus say would happen because he lives?', '["They would live also", "They would remain orphans", "They would rule Rome", "They would die"]'::jsonb, 'They would live also', 'Because I live, you also will live (John 14:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus say would happen because he lives?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 5, 'What does "little while" foreshadow?', '["No return (a common guess, but not what John says here)", "Only three hours", "Permanent loss", "Separation then reunion — resurrection joy"]'::jsonb, 'Separation then reunion — resurrection joy', 'A little while longer… you will seek me (John 14:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does "little while" foreshadow?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 5, 'What does Jesus going away for Helper''s coming teach about order?', '["No ascension (a common guess, but not what John says here)", "Spirit ignores order", "Helper first", "Cross and ascension precede Pentecost — salvation history"]'::jsonb, 'Cross and ascension precede Pentecost — salvation history', 'I will ask the Father, and he will give you another Helper (John 14:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Jesus going away for Helper''s coming teach about order?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 14, 5, 'What ethical weight in "If you loved me, you would rejoice"?', '["Love rejoices at Jesus'' return to Father — selfless joy", "Only fear (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Rejoices at loss", "Hates Father"]'::jsonb, 'Love rejoices at Jesus'' return to Father — selfless joy', 'If you loved me, you would have rejoiced (John 14:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'What ethical weight in "If you loved me, you would rejoice"?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 1, 'How did Jesus say they should keep his commandments?', '["Never (a common guess, but not what John says here)", "As he kept his Father''s commandments", "Only if easy", "Randomly"]'::jsonb, 'As he kept his Father''s commandments', 'As I have kept my Father''s commandments and abide in his love (John 15:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'How did Jesus say they should keep his commandments?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 1, 'What can disciples do apart from Jesus?', '["Nothing", "Heal alone", "Judge the world", "Everything small"]'::jsonb, 'Nothing', 'Apart from me you can do nothing (John 15:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'What can disciples do apart from Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 1, 'What did Jesus command them to abide in?', '["Roman law", "Temple money", "Fear", "His love"]'::jsonb, 'His love', 'Abide in my love (John 15:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus command them to abide in?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 1, 'What did Jesus say disciples were if they abided in him and his words?', '["Unclean forever", "Clean because of the word spoken", "Only ritually", "Self-cleaned (a common guess, but not what John says here)"]'::jsonb, 'Clean because of the word spoken', 'Already you are clean because of the word that I have spoken to you (John 15:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say disciples were if they abided in him and his words?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 1, 'What does the Father do to every branch that bears fruit?', '["Paints it (a common guess, but not what John says here)", "Cuts it off immediately", "Leaves it wild", "Prunes it, that it may bear more fruit"]'::jsonb, 'Prunes it, that it may bear more fruit', 'Every branch that does bear fruit he prunes, that it may bear more fruit (John 15:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does the Father do to every branch that bears fruit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 1, 'What happens to branches that do not abide?', '["They become vines", "They are saved", "They flourish (a common guess, but not what John says here)", "They wither, are gathered, burned"]'::jsonb, 'They wither, are gathered, burned', 'If anyone does not abide in me… thrown into the fire (John 15:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'What happens to branches that do not abide?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 1, 'What happens to every branch in Jesus that does not bear fruit?', '["The Father takes it away", "It grows forever", "It becomes the trunk", "It is praised (a common guess, but not what John says here)"]'::jsonb, 'The Father takes it away', 'Every branch in me that does not bear fruit he takes away (John 15:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'What happens to every branch in Jesus that does not bear fruit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 1, 'What is Jesus called in John 15:1?', '["The true light", "The true bread", "The true door", "The true vine"]'::jsonb, 'The true vine', 'I am the true vine (John 15:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'What is Jesus called in John 15:1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 1, 'What must disciples do to bear fruit?', '["Avoid suffering", "Travel widely", "Abide in Jesus", "Memorize only"]'::jsonb, 'Abide in Jesus', 'Whoever abides in me and I in him, he it is that bears much fruit (John 15:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'What must disciples do to bear fruit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 1, 'Who is the vinedresser?', '["Peter", "His Father", "Moses", "A Roman soldier"]'::jsonb, 'His Father', 'My Father is the vinedresser (John 15:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the vinedresser?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 2, 'What did Jesus call disciples if they did what he commanded?', '["Friends", "Strangers", "Judges", "Servants only forever"]'::jsonb, 'Friends', 'You are my friends if you do what I command you (John 15:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus call disciples if they did what he commanded?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 2, 'What did Jesus say he chose them for?', '["That they should be rich", "That they should flee (a common guess, but not what John says here)", "That they should go and bear fruit", "That they should hide"]'::jsonb, 'That they should go and bear fruit', 'You did not choose me, but I chose you… that you should go and bear fruit (John 15:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say he chose them for?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 2, 'What did Jesus say he spoke to them?', '["Only laws (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Only parables", "These things that his joy might be in them and their joy full", "Only threats"]'::jsonb, 'These things that his joy might be in them and their joy full', 'These things I have spoken to you, that my joy may be in you, and that your joy may be full (John 15:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say he spoke to them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 2, 'What did Jesus say the servant is not greater than?', '["His money", "His city (a common guess, but not what John says here)", "His master", "His house"]'::jsonb, 'His master', 'A servant is not greater than his master (John 15:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say the servant is not greater than?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 2, 'What did Jesus say the world would do because it hated him?', '["Hate them too", "Honor them", "Ignore them", "Love them (a common guess, but not what John says here)"]'::jsonb, 'Hate them too', 'If the world hates you, know that it has hated me before it hated you (John 15:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say the world would do because it hated him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 2, 'What did Jesus say they would do to disciples for his name''s sake?', '["Persecute them", "Pay them (a common guess, but not what John says here)", "Crown them", "Ignore them"]'::jsonb, 'Persecute them', 'They will persecute you (John 15:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say they would do to disciples for his name''s sake?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 2, 'What is the greatest love?', '["To give money (a common guess, but not what John says here)", "To debate enemies", "To build synagogues", "To lay down one''s life for friends"]'::jsonb, 'To lay down one''s life for friends', 'Greater love has no one than this, that someone lay down his life for his friends (John 15:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'What is the greatest love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 2, 'What must disciples also do?', '["Fight with swords", "Stay silent", "Deny Jesus", "Bear witness"]'::jsonb, 'Bear witness', 'You also will bear witness (John 15:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'What must disciples also do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 2, 'What would the Helper testify?', '["About Moses only", "About Rome", "About Jesus", "About angels"]'::jsonb, 'About Jesus', 'The Spirit of truth… will bear witness about me (John 15:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'What would the Helper testify?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 2, 'Why would the world persecute them?', '["Because they are Greek", "Because they sin more (a common guess, but not what John says here)", "Because they are not of the world", "Because they are Jews"]'::jsonb, 'Because they are not of the world', 'If you were of the world, the world would love you as its own (John 15:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why would the world persecute them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 3, 'How does Spirit and church witness relate?', '["Witness is only past", "Spirit replaces church", "Spirit empowers apostolic witness to Jesus", "Only book (a common guess, but not what John says here)"]'::jsonb, 'Spirit empowers apostolic witness to Jesus', 'You will bear witness (John 15:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Spirit and church witness relate?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 3, 'How does abiding prayer "whatever you ask" fit Johannine themes?', '["Prayer in Jesus'' name abiding in him", "Health wealth only", "No conditions (a common guess, but not what John says here)", "Magic formula"]'::jsonb, 'Prayer in Jesus'' name abiding in him', 'I chose you… whatever you ask the Father in my name, he may give it to you (John 15:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does abiding prayer "whatever you ask" fit Johannine themes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 3, 'How does friendship with Christ differ from servanthood?', '["Friends need no obedience", "Servants know more", "Friends know the Master''s plans — revelation", "No difference (a common guess, but not what John says here)"]'::jsonb, 'Friends know the Master''s plans — revelation', 'I have called you friends, for all that I have heard from my Father I have made known to you (John 15:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does friendship with Christ differ from servanthood?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 3, 'How does pruning relate to suffering?', '["Punishment without hope", "Only wicked pruned (a common guess, but not what John says here)", "Discipline for fruitfulness — Father''s care", "Pain is meaningless"]'::jsonb, 'Discipline for fruitfulness — Father''s care', 'He prunes… that it may bear more fruit (John 15:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does pruning relate to suffering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 3, 'Theologically, what does vine imagery draw from?', '["No Old Testament (a common guess, but not what John says here)", "Greek myths only", "Roman farming only", "Isaiah 5 / Psalm 80 — Israel as vine; Jesus is true Israel"]'::jsonb, 'Isaiah 5 / Psalm 80 — Israel as vine; Jesus is true Israel', 'I am the true vine (John 15:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'Theologically, what does vine imagery draw from?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 3, 'What cosmic conflict underlies world hatred?', '["Light vs darkness — disciples identified with Jesus", "Only economic", "No conflict (a common guess, but not what John says here)", "Only political"]'::jsonb, 'Light vs darkness — disciples identified with Jesus', 'If they persecuted me, they will also persecute you (John 15:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'What cosmic conflict underlies world hatred?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 3, 'What does "without me you can do nothing" contribute to grace theology?', '["Works salvation", "Monastic isolation", "Human autonomy (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Dependence on Christ for spiritual fruit — not self-sufficiency"]'::jsonb, 'Dependence on Christ for spiritual fruit — not self-sufficiency', 'Apart from me you can do nothing (John 15:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does "without me you can do nothing" contribute to grace theology?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 3, 'What does chosenness in 15:16 guard against?', '["Pride — election is for fruit and prayer answered", "No mission (a common guess, but not what John says here)", "Boasting in self", "Universalism only"]'::jsonb, 'Pride — election is for fruit and prayer answered', 'You did not choose me, but I chose you (John 15:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does chosenness in 15:16 guard against?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 3, 'What does fruit mean in context?', '["Wealth (a common guess, but not what John says here)", "Buildings", "Obedient life and mission — not only converts", "Only grapes"]'::jsonb, 'Obedient life and mission — not only converts', 'Bear fruit… so prove to be my disciples (John 15:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does fruit mean in context?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 3, 'What does world''s guilt in hating Jesus mean?', '["Hate is virtue (a common guess, but not what John says here)", "World is innocent", "Only Jews guilty", "Rejecting Jesus rejects Father who sent him — no excuse"]'::jsonb, 'Rejecting Jesus rejects Father who sent him — no excuse', 'They hated me without a cause (John 15:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does world''s guilt in hating Jesus mean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 4, 'How does "I am the vine" continue "I am" sayings?', '["Seventh major image — covenant life source", "No theology (a common guess, but not what John says here)", "Breaks pattern", "Only metaphor"]'::jsonb, 'Seventh major image — covenant life source', 'I am the true vine (John 15:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does "I am the vine" continue "I am" sayings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 4, 'How does joy theme connect to cross coming?', '["No joy in Upper Room", "Joy denied (a common guess, but not what John says here)", "Joy in fellowship before tribulation — Spirit joy", "Only after resurrection in John"]'::jsonb, 'Joy in fellowship before tribulation — Spirit joy', 'That my joy may be in you (John 15:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does joy theme connect to cross coming?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 4, 'How does love commandment from 13 recur?', '["Love each other — abiding enables love", "Love canceled", "New topic (a common guess, but not what John says here)", "Only insiders"]'::jsonb, 'Love each other — abiding enables love', 'This is my commandment, that you love one another (John 15:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does love commandment from 13 recur?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 4, 'How does mutual abiding work?', '["Only metaphor with no reality", "Only later mystics", "Jesus in disciple, disciple in Jesus — mystical union language", "One-way only (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'Jesus in disciple, disciple in Jesus — mystical union language', 'Abide in me, and I in you (John 15:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does mutual abiding work?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 4, 'How does world hatred prepare for persecution in Acts?', '["Only success (a common guess, but not what John says here)", "No connection", "Acts denies persecution", "Early church faces same hostility Jesus predicted"]'::jsonb, 'Early church faces same hostility Jesus predicted', 'They will put you out of the synagogues (John 16:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does world hatred prepare for persecution in Acts?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 4, 'Scholarly link: Psalm 35 / 69 quotation?', '["Only Psalm 23", "Misapplied (a common guess, but not what John says here)", "Righteous sufferer motif applied to Jesus", "Random quote"]'::jsonb, 'Righteous sufferer motif applied to Jesus', 'The word that is written in their Law must be fulfilled (John 15:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'Scholarly link: Psalm 35 / 69 quotation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 4, 'What does "clean" word link to?', '["Only circumcision", "Only priests (a common guess, but not what John says here)", "Physical bath", "Already pruned by word — preparation for fruit"]'::jsonb, 'Already pruned by word — preparation for fruit', 'You are already clean because of the word (John 15:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does "clean" word link to?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 4, 'What does two witnesses (Spirit and disciples) evoke?', '["Contradiction", "Only Revelation 11", "Only angels (a common guess, but not what John says here)", "Legal requirement — credible testimony"]'::jsonb, 'Legal requirement — credible testimony', 'You will bear witness (John 15:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does two witnesses (Spirit and disciples) evoke?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 4, 'What ethical fruit proves discipleship?', '["Miracles only", "Wealth (a common guess, but not what John says here)", "Love and obedience — fruit visible", "Titles"]'::jsonb, 'Love and obedience — fruit visible', 'By this my Father is glorified, that you bear much fruit and so prove to be my disciples (John 15:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'What ethical fruit proves discipleship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 4, 'What pastoral use for fruitless seasons?', '["Works harder alone", "Deny election (a common guess, but not what John says here)", "Abide — wait on pruning, not despair", "Cut off immediately"]'::jsonb, 'Abide — wait on pruning, not despair', 'Every branch… that does bear fruit he prunes (John 15:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'What pastoral use for fruitless seasons?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 5, 'How does 15:22 relate to guilt?', '["No judgment (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Removes guilt", "Ignorance saves", "Jesus'' word and works remove excuse — greater accountability"]'::jsonb, 'Jesus'' word and works remove excuse — greater accountability', 'If I had not come and spoken to them, they would not have been guilty of sin (John 15:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 15:22 relate to guilt?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 5, 'How does branch in fire warn?', '["Final judgment for unfruitful profession", "Works save (a common guess, but not what John says here)", "Fire is only metaphor with no end", "Universalism"]'::jsonb, 'Final judgment for unfruitful profession', 'Thrown into the fire (John 15:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does branch in fire warn?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 5, 'How does hatred "without a cause" defend Jesus'' innocence?', '["No prophecy (a common guess, but not what John says here)", "Jesus deserved hate", "Cause is money", "Fulfills Scripture — righteous sufferer"]'::jsonb, 'Fulfills Scripture — righteous sufferer', 'They hated me without a cause (John 15:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does hatred "without a cause" defend Jesus'' innocence?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 5, 'What comforter promise bridges to 16?', '["Spirit canceled", "No bridge (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Jesus stays", "Spirit will come when Jesus goes — next chapter details"]'::jsonb, 'Spirit will come when Jesus goes — next chapter details', 'When the Helper comes, whom I will send to you from the Father (John 15:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What comforter promise bridges to 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 5, 'What did Jesus say they hated without a cause?', '["The temple", "The Sabbath", "Moses", "Himself"]'::jsonb, 'Himself', 'They hated me without a cause (John 15:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus say they hated without a cause?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 5, 'What did Jesus say would happen if he had not come and spoken to them?', '["They would not be guilty of sin — now they have no excuse", "Sin would not exist (a common guess, but not what John says here)", "They would be guiltier without him", "They would be innocent"]'::jsonb, 'They would not be guilty of sin — now they have no excuse', 'If I had not come and spoken to them, they would not have been guilty of sin (John 15:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus say would happen if he had not come and spoken to them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 5, 'What does "they have seen and hated" add?', '["Hate is innocent", "Rejection despite revelation — culpable unbelief", "They never saw (a common guess, but not what John says here)", "Seeing saves automatically"]'::jsonb, 'Rejection despite revelation — culpable unbelief', 'They have seen and hated both me and my Father (John 15:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does "they have seen and hated" add?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 5, 'What does slave vs friend knowledge mean for revelation?', '["Slaves know more (a common guess, but not what John says here)", "Knowledge is sin", "Progressive disclosure — friends know Master''s business", "Only apostles are friends"]'::jsonb, 'Progressive disclosure — friends know Master''s business', 'I have called you friends… I have made known to you (John 15:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does slave vs friend knowledge mean for revelation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 5, 'What missional thrust in chosen and sent?', '["Stay in Upper Room", "Only Jews sent (a common guess, but not what John says here)", "Church sent as Jesus was sent", "Sending is metaphor"]'::jsonb, 'Church sent as Jesus was sent', 'As the Father has sent me, even so I am sending you (John 20:21 cf. mission).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What missional thrust in chosen and sent?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 15, 5, 'What trinitarian note in Father glorified by fruit?', '["Father needs ego", "No Spirit (a common guess, but not what John says here)", "God''s glory in disciples'' fruitfulness — Spirit''s work", "Glory is human only"]'::jsonb, 'God''s glory in disciples'' fruitfulness — Spirit''s work', 'My Father is glorified (John 15:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What trinitarian note in Father glorified by fruit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 1, 'Concerning judgment, because what ruler was judged?', '["The ruler of this world", "Pilate", "Herod (a common guess, but not what John says here)", "Caesar"]'::jsonb, 'The ruler of this world', 'Concerning judgment, because the ruler of this world is judged (John 16:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'Concerning judgment, because what ruler was judged?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 1, 'Concerning righteousness, because Jesus went where?', '["To the Father", "To Egypt", "To the temple only", "To Rome"]'::jsonb, 'To the Father', 'Concerning righteousness, because I go to the Father, and you will see me no longer (John 16:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'Concerning righteousness, because Jesus went where?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 1, 'Concerning sin, why would the Spirit convict?', '["Because they eat meat (a common guess, but not what John says here)", "Because they do not believe in Jesus", "Because they are poor", "Because they are Gentiles"]'::jsonb, 'Because they do not believe in Jesus', 'Concerning sin, because they do not believe in me (John 16:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'Concerning sin, why would the Spirit convict?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 1, 'What did Jesus say disciples would ask in his name on that day?', '["Nothing — Father loves them because they loved Jesus", "For thrones", "For revenge", "For gold (a common guess, but not what John says here)"]'::jsonb, 'Nothing — Father loves them because they loved Jesus', 'In that day you will ask nothing of me… the Father himself loves you (John 16:26–27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say disciples would ask in his name on that day?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 1, 'What did Jesus say the Helper would do to the world?', '["Build cities", "Flatter the world", "Ignore sin (a common guess, but not what John says here)", "Convict concerning sin, righteousness, and judgment"]'::jsonb, 'Convict concerning sin, righteousness, and judgment', 'He will convict the world concerning sin and righteousness and judgment (John 16:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say the Helper would do to the world?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 1, 'What did Jesus say the Spirit would do for disciples?', '["Write new Scripture alone", "Give wealth", "Ignore Old Testament", "Guide into all truth"]'::jsonb, 'Guide into all truth', 'When the Spirit of truth comes, he will guide you into all the truth (John 16:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say the Spirit would do for disciples?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 1, 'What did Jesus say their sorrow would turn into?', '["Joy", "Wealth", "Fame", "Revenge"]'::jsonb, 'Joy', 'Your sorrow will turn into joy (John 16:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say their sorrow would turn into?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 1, 'What did Jesus say would make disciples sorrowful?', '["His going away", "Roman taxes", "His miracles stopping", "Their poverty"]'::jsonb, 'His going away', 'Because I have said these things to you, sorrow has filled your heart (John 16:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say would make disciples sorrowful?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 1, 'What illustration did Jesus use about childbirth?', '["A farmer''s field", "A ship''s sail", "A king''s war (a common guess, but not what John says here)", "A woman has pain then joy when child is born"]'::jsonb, 'A woman has pain then joy when child is born', 'When a woman is giving birth… but when she has delivered the baby… joy (John 16:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'What illustration did Jesus use about childbirth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 1, 'What would the Spirit declare?', '["Gossip (a common guess, but not what John says here)", "Things to come", "Roman politics", "Nothing"]'::jsonb, 'Things to come', 'He will declare to you the things that are to come (John 16:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'What would the Spirit declare?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 2, 'What did Jesus say about speaking figuratively?', '["Only parables forever", "Never plain speech", "A time coming when he would tell plainly about the Father", "Only to angels (a common guess, but not what John says here)"]'::jsonb, 'A time coming when he would tell plainly about the Father', 'The hour is coming when I will no longer speak to you in figures of speech (John 16:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say about speaking figuratively?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 2, 'What did Jesus say about their scattering?', '["They would leave him alone — yet Father with him", "They would betray openly", "They would all die (a common guess, but not what John says here)", "They would never return"]'::jsonb, 'They would leave him alone — yet Father with him', 'You will leave me alone (John 16:32).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say about their scattering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 2, 'What did Jesus say disciples would have in him?', '["Confusion", "Swords", "Fear", "Peace"]'::jsonb, 'Peace', 'I have said these things to you, that in me you may have peace (John 16:33).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say disciples would have in him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 2, 'What did Jesus say they would have in the world?', '["Only health", "Tribulation", "Only honor", "Only rest (a common guess, but not what John says here)"]'::jsonb, 'Tribulation', 'In the world you will have tribulation (John 16:33).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say they would have in the world?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 2, 'What did Jesus say to take heart for?', '["Money (a common guess, but not what John says here)", "Their strength", "He has overcome the world", "Rome''s fall"]'::jsonb, 'He has overcome the world', 'Take heart; I have overcome the world (John 16:33).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say to take heart for?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 2, 'What did Jesus say would scatter disciples?', '["Angels", "Fish (a common guess, but not what John says here)", "Each to his own home", "Soldiers only"]'::jsonb, 'Each to his own home', 'You will leave me alone… you will be scattered, each to his own (John 16:32).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say would scatter disciples?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 2, 'What did disciples say made Jesus'' speech clearer?', '["Only Greek", "Angels helped", "Nothing (a common guess, but not what John says here)", "Figures — then plain speech promise"]'::jsonb, 'Figures — then plain speech promise', 'Ah, now you are speaking plainly and not using figurative speech (John 16:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did disciples say made Jesus'' speech clearer?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 2, 'What hour was coming when disciples would not see Jesus?', '["Only after millennium", "Forever gone", "Brief time — then see him again", "Never see (a common guess, but not what John says here)"]'::jsonb, 'Brief time — then see him again', 'A little while, and you will see me no longer; and again a little while, and you will see me (John 16:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'What hour was coming when disciples would not see Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 2, 'What question did disciples ask each other about "little while"?', '["Who will betray", "What he meant by a little while", "Where is bread (a common guess, but not what John says here)", "When is Passover"]'::jsonb, 'What he meant by a little while', 'What does he mean by a little while? (John 16:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'What question did disciples ask each other about "little while"?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 2, 'Who did Jesus say would be with him?', '["No one", "Judas (a common guess, but not what John says here)", "Pilate", "The Father"]'::jsonb, 'The Father', 'Yet I am not alone, for the Father is with me (John 16:32).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'Who did Jesus say would be with him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 3, 'How does "figures of speech" vs plain point to Johannine communication?', '["Progressive understanding — post-resurrection clarity", "Jesus is unclear forever", "Parables only (a common guess, but not what John says here)", "Only insiders get plain"]'::jsonb, 'Progressive understanding — post-resurrection clarity', 'I will no longer speak… in figures (John 16:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does "figures of speech" vs plain point to Johannine communication?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 3, 'How does Spirit guide into truth relate to later writings?', '["Spirit contradicts Jesus", "Contradicts Scripture", "Apostolic doctrine under Spirit inspiration — Scripture", "Only oral (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'Apostolic doctrine under Spirit inspiration — Scripture', 'Guide you into all the truth (John 16:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Spirit guide into truth relate to later writings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 3, 'How does sorrow-to-joy apply to resurrection?', '["Grief at cross becomes joy at seeing risen Lord", "Only for Mary (a common guess, but not what John says here)", "Only metaphor", "Joy never comes"]'::jsonb, 'Grief at cross becomes joy at seeing risen Lord', 'Your sorrow will turn into joy (John 16:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does sorrow-to-joy apply to resurrection?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 3, 'How does tribulation promise help persecuted church?', '["Tribulation is failure", "Realistic expectation — Christ''s peace amid trouble", "No suffering (a common guess, but not what John says here)", "Prosperity gospel"]'::jsonb, 'Realistic expectation — Christ''s peace amid trouble', 'In the world you will have tribulation (John 16:33).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does tribulation promise help persecuted church?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 3, 'Scholarly debate: 16:25-30 and realized eschatology?', '["Debates on when \"plain\" speech arrives — resurrection community", "All agree (a common guess, but not what John says here) (does not match John’s wording in this verse)", "No debate", "John denies future"]'::jsonb, 'Debates on when "plain" speech arrives — resurrection community', 'You will ask me nothing (John 16:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'Scholarly debate: 16:25-30 and realized eschatology?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 3, 'Theologically, what is Spirit''s convicting work?', '["Only punishment", "Exposing sin, Christ''s righteousness, Satan''s defeat — prevenient grace", "Only comfort (a common guess, but not what John says here) (does not match John’s wording in this verse)", "World ignores"]'::jsonb, 'Exposing sin, Christ''s righteousness, Satan''s defeat — prevenient grace', 'He will convict the world (John 16:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'Theologically, what is Spirit''s convicting work?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 3, 'What does "ask nothing of me" in 16:26 mean?', '["No prayer ever (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Debated — direct access to Father in Jesus'' name — new covenant prayer", "Angels mediate", "Only Jesus prays"]'::jsonb, 'Debated — direct access to Father in Jesus'' name — new covenant prayer', 'You will ask me nothing (John 16:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does "ask nothing of me" in 16:26 mean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 3, 'What does Father loving disciples directly show?', '["Only Son loved (a common guess, but not what John says here)", "Father hates disciples", "Intimacy in new covenant — not only through rabbi", "Love is generic"]'::jsonb, 'Intimacy in new covenant — not only through rabbi', 'The Father himself loves you (John 16:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Father loving disciples directly show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 3, 'What does overcoming the world mean?', '["Wealth (a common guess, but not what John says here)", "Military conquest", "Escape body", "Victory through cross — faith conquers world system"]'::jsonb, 'Victory through cross — faith conquers world system', 'I have overcome the world (John 16:33).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does overcoming the world mean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 3, 'What does scattered disciples fulfill?', '["Nothing (a common guess, but not what John says here)", "Victory", "Sheep scattered — Zechariah 13:7 echo", "Unity only"]'::jsonb, 'Sheep scattered — Zechariah 13:7 echo', 'Strike the shepherd, and the sheep will be scattered (Matt 26:31 / John context).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does scattered disciples fulfill?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 4, 'How does 16:2 synagogue exclusion prepare?', '["Never happens (a common guess, but not what John says here)", "Community cost — apostolic experience", "Synagogue loves Christians", "Only metaphor"]'::jsonb, 'Community cost — apostolic experience', 'Whoever kills you will think he is offering service to God (John 16:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 16:2 synagogue exclusion prepare?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 4, 'How does Spirit glorify Jesus?', '["Only Father glory", "Ignores Jesus (a common guess, but not what John says here)", "Takes what is Jesus'' and declares — trinitarian mission", "Glorifies self"]'::jsonb, 'Takes what is Jesus'' and declares — trinitarian mission', 'He will glorify me, for he will take what is mine and declare it to you (John 16:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Spirit glorify Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 4, 'How does Spirit take from Christ and declare?', '["Christ hides truth (a common guess, but not what John says here)", "Trinitarian procession — revelation chain", "Spirit independent", "Only human preaching"]'::jsonb, 'Trinitarian procession — revelation chain', 'He will take what is mine and declare it to you (John 16:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Spirit take from Christ and declare?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 4, 'How does peace differ from world''s?', '["Same as Rome''s Pax", "Only inner (a common guess, but not what John says here)", "Christ''s peace — reconciliation with God", "Absence of thought"]'::jsonb, 'Christ''s peace — reconciliation with God', 'My peace I give to you (John 16:33).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does peace differ from world''s?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 4, 'How is ruler of world judged?', '["No defeat (a common guess, but not what John says here)", "Cross — defeat of Satan''s claim", "Rome judged", "Only in Revelation"]'::jsonb, 'Cross — defeat of Satan''s claim', 'The ruler of this world is judged (John 16:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'How is ruler of world judged?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 4, 'What courage from "I have overcome"?', '["No devil (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Overcome means rich", "Only future", "Satan, world, death defeated in Christ — believers share victory"]'::jsonb, 'Satan, world, death defeated in Christ — believers share victory', 'Take heart; I have overcome the world (John 16:33).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'What courage from "I have overcome"?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 4, 'What does little while sorrow/joy teach about eschatology?', '["Already/not yet — resurrection joy in seed form", "Only future millennium", "No future (a common guess, but not what John says here)", "Joy is only metaphor"]'::jsonb, 'Already/not yet — resurrection joy in seed form', 'Your sorrow will turn into joy (John 16:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does little while sorrow/joy teach about eschatology?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 4, 'What does not believing Jesus as sin mean?', '["Supreme sin — rejection of revelation", "Belief optional", "Small sin (a common guess, but not what John says here)", "Sin is only actions"]'::jsonb, 'Supreme sin — rejection of revelation', 'Concerning sin, because they do not believe in me (John 16:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does not believing Jesus as sin mean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 4, 'What does things to come include?', '["Only AD 70", "Only end times map", "Pentecost onward — church age revelation", "Nothing (a common guess, but not what John says here)"]'::jsonb, 'Pentecost onward — church age revelation', 'He will declare… things that are to come (John 16:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does things to come include?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 4, 'What pastoral word for confused disciples?', '["Only scholars (a common guess, but not what John says here)", "Silence is best", "Leave them confused", "Jesus knows their questions — Spirit will teach"]'::jsonb, 'Jesus knows their questions — Spirit will teach', 'Do you now believe? (John 16:31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'What pastoral word for confused disciples?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 5, 'How does "you have overcome me" misread avoided?', '["Disciples alone win", "No overcoming", "World wins (a common guess, but not what John says here)", "Jesus overcomes world — not disciples alone"]'::jsonb, 'Jesus overcomes world — not disciples alone', 'I have overcome the world (John 16:33).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does "you have overcome me" misread avoided?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 5, 'How does 16:33 climax Farewell Discourse?', '["No climax (a common guess, but not what John says here)", "Only fear", "Discourse fails", "Peace and victory summary before Gethsemane"]'::jsonb, 'Peace and victory summary before Gethsemane', 'In me you may have peace (John 16:33).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 16:33 climax Farewell Discourse?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 5, 'How does joy no one take complete resurrection joy?', '["Only earthly (a common guess, but not what John says here)", "Eschatological security — gift of Christ", "Joy is mood only", "Joy can be stolen"]'::jsonb, 'Eschatological security — gift of Christ', 'Your joy no one will take from you (John 16:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does joy no one take complete resurrection joy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 5, 'How does scattered alone theme prepare for cross?', '["Desertion — yet Father with Son", "Disciples stay", "No loneliness (a common guess, but not what John says here)", "Judas only leaves"]'::jsonb, 'Desertion — yet Father with Son', 'You will leave me alone (John 16:32).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does scattered alone theme prepare for cross?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 5, 'What did Jesus say the Spirit would not speak on his own authority?', '["Nothing (a common guess, but not what John says here)", "His own inventions", "Roman law", "Whatever he hears — he will speak of what is to come"]'::jsonb, 'Whatever he hears — he will speak of what is to come', 'He will not speak on his own authority, but whatever he hears he will speak (John 16:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus say the Spirit would not speak on his own authority?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 5, 'What did Jesus say would make disciples sorrowful about his going?', '["They would hate the Father", "They would lose money (a common guess, but not what John says here)", "They would not see him — then see him again", "They would miss miracles only"]'::jsonb, 'They would not see him — then see him again', 'A little while, and you will not see me, and again a little while, and you will see me (John 16:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus say would make disciples sorrowful about his going?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 5, 'What does believing after plain speech (16:29-30) show?', '["Angels taught (a common guess, but not what John says here)", "No faith needed", "Still dependent on Jesus — not full understanding", "Perfect knowledge"]'::jsonb, 'Still dependent on Jesus — not full understanding', 'Now we know that you know all things (John 16:30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does believing after plain speech (16:29-30) show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 5, 'What ethical warning in 16:1?', '["Only for Jews (a common guess, but not what John says here) (does not match John’s wording in this verse)", "No stumbling possible", "Stumbling is good", "Jesus spoke to keep them from stumbling — persecution shock"]'::jsonb, 'Jesus spoke to keep them from stumbling — persecution shock', 'I have said all these things to you to keep you from falling away (John 16:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What ethical warning in 16:1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 5, 'What link between prayer in 16:23-24 and fruit in 15?', '["Ask in Jesus'' name — fruit and prayer connected", "No connection (a common guess, but not what John says here)", "Only apostles", "Prayer replaces fruit"]'::jsonb, 'Ask in Jesus'' name — fruit and prayer connected', 'Whatever you ask the Father in my name, he may give it to you (John 16:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What link between prayer in 16:23-24 and fruit in 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 16, 5, 'What pneumatology: Spirit proceeds from Father?', '["Spirit is not personal", "Only created (a common guess, but not what John says here)", "Sent in Son''s name — mission trinity", "Only from Son"]'::jsonb, 'Sent in Son''s name — mission trinity', 'I will send him to you from the Father (John 16:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What pneumatology: Spirit proceeds from Father?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 1, 'For whom did Jesus pray?', '["Only angels (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Only Romans", "Only Pharisees", "Those the Father gave him — not for the world in same way"]'::jsonb, 'Those the Father gave him — not for the world in same way', 'I am praying for them. I am not praying for the world but for those whom you have given me (John 17:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'For whom did Jesus pray?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 1, 'What did Jesus ask the Father to give him?', '["Silver (a common guess, but not what John says here)", "More disciples only", "Glory — that the Son may glorify the Father", "A throne in Rome"]'::jsonb, 'Glory — that the Son may glorify the Father', 'Glorify your Son that the Son may glorify you (John 17:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus ask the Father to give him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 1, 'What did Jesus ask — that they may be one?', '["As strangers are one", "As Father and Son are one", "As competitors are one", "As soldiers are one (a common guess, but not what John says here)"]'::jsonb, 'As Father and Son are one', 'That they may all be one, just as you, Father, are in me, and I in you (John 17:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus ask — that they may be one?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 1, 'What did Jesus not ask the Father to take them out of?', '["Trials", "Temptation", "Suffering", "The world"]'::jsonb, 'The world', 'I do not ask that you take them out of the world (John 17:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus not ask the Father to take them out of?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 1, 'What did Jesus say he gave them?', '["The words the Father gave him", "Wealth (a common guess, but not what John says here)", "A kingdom on earth", "Weapons"]'::jsonb, 'The words the Father gave him', 'I have given them your word (John 17:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say he gave them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 1, 'What did Jesus say he had finished?', '["The work given him to do", "Building the temple", "Defeating Rome (a common guess, but not what John says here)", "Writing Scripture"]'::jsonb, 'The work given him to do', 'I glorified you on earth, having accomplished the work that you gave me to do (John 17:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say he had finished?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 1, 'What did Jesus say he had manifested?', '["Temple blueprints", "The Father''s name to the people given him", "His own private religion", "Roman law (a common guess, but not what John says here)"]'::jsonb, 'The Father''s name to the people given him', 'I have manifested your name to the people whom you gave me out of the world (John 17:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say he had manifested?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 1, 'What did Jesus say the world hated them because of?', '["Their poverty", "Not belonging to the world", "Their boats", "Their race (a common guess, but not what John says here)"]'::jsonb, 'Not belonging to the world', 'I have given them your word, and the world has hated them because they are not of the world (John 17:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say the world hated them because of?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 1, 'What did Jesus say was eternal life?', '["Knowing the only true God and Jesus Christ whom he sent", "Living forever only biologically", "Keeping law perfectly", "Being Jewish (a common guess, but not what John says here)"]'::jsonb, 'Knowing the only true God and Jesus Christ whom he sent', 'This is eternal life, that they know you, the only true God, and Jesus Christ whom you have sent (John 17:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say was eternal life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 1, 'What hour had come?', '["For Passover only", "For the Son of Man to be glorified", "For temple cleansing", "For Rome to fall (a common guess, but not what John says here)"]'::jsonb, 'For the Son of Man to be glorified', 'Father, the hour has come; glorify your Son (John 17:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 1
    AND q.prompt = 'What hour had come?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 2, 'How does not taking out of world relate to mission?', '["In but not of — salt and light in culture", "Worldly conformity", "Only desert monks", "Monastic escape (a common guess, but not what John says here)"]'::jsonb, 'In but not of — salt and light in culture', 'Not… take them out of the world (John 17:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does not taking out of world relate to mission?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 2, 'How does unity theme function ecumenically?', '["Trinitarian pattern for church unity — not mere organization", "Uniformity only", "Only invisible (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Unity impossible"]'::jsonb, 'Trinitarian pattern for church unity — not mere organization', 'That they may be one as we are one (John 17:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does unity theme function ecumenically?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 2, 'Theologically, what is high priestly prayer?', '["No effect (a common guess, but not what John says here)", "Only for angels", "Only poetry", "Intercession before cross — covenant solidarity"]'::jsonb, 'Intercession before cross — covenant solidarity', 'Father… (John 17:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'Theologically, what is high priestly prayer?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 2, 'What did Jesus ask the Father to keep them from?', '["Marriage", "Scripture", "The evil one", "Work (a common guess, but not what John says here)"]'::jsonb, 'The evil one', 'Keep them from the evil one (John 17:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus ask the Father to keep them from?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 2, 'What did Jesus desire for those who believe through their word?', '["That war ends (a common guess, but not what John says here)", "That Rome converts", "That temple rebuilds", "That the world may believe"]'::jsonb, 'That the world may believe', 'That the world may believe that you have sent me (John 17:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus desire for those who believe through their word?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 2, 'What did Jesus make known?', '["Secrets of Rome", "Future stock markets", "The Father''s name — and will continue", "Angel names (a common guess, but not what John says here)"]'::jsonb, 'The Father''s name — and will continue', 'I made known to them your name, and I will continue to make it known (John 17:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus make known?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 2, 'What did Jesus say he sanctified himself for?', '["That they may be rich", "That Rome may fall (a common guess, but not what John says here)", "That they also may be sanctified in truth", "That priests may rule"]'::jsonb, 'That they also may be sanctified in truth', 'And for their sake I consecrate myself, that they also may be sanctified in truth (John 17:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say he sanctified himself for?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 2, 'What does "knowing" God in eternal life mean?', '["Visions only", "Academic trivia", "Covenant relationship — not mere facts", "Works only (a common guess, but not what John says here)"]'::jsonb, 'Covenant relationship — not mere facts', 'That they know you, the only true God (John 17:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does "knowing" God in eternal life mean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 2, 'What does protection from evil one promise?', '["No suffering", "Health guarantee", "Spiritual warfare — guarded in mission", "Wealth (a common guess, but not what John says here)"]'::jsonb, 'Spiritual warfare — guarded in mission', 'Keep them from the evil one (John 17:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does protection from evil one promise?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 2, 'What glory did Jesus ask to see?', '["The glory he had with the Father before the world existed", "Temple gold (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Earthly fame", "Military medals"]'::jsonb, 'The glory he had with the Father before the world existed', 'Father, I desire that they also… may be with me where I am, to see my glory that you have given me because you loved me before the foundation of the world (John 17:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 2
    AND q.prompt = 'What glory did Jesus ask to see?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 3, 'How does "name" revelation work?', '["Father''s character revealed in Son — covenant name", "Only title \"God\"", "Secret password", "Name is magic (a common guess, but not what John says here)"]'::jsonb, 'Father''s character revealed in Son — covenant name', 'I have manifested your name (John 17:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does "name" revelation work?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 3, 'How does 17:18 sending parallel Jesus'' mission?', '["As Father sent Son, Son sends disciples", "Disciples send Jesus", "No mission (a common guess, but not what John says here)", "Only angels sent"]'::jsonb, 'As Father sent Son, Son sends disciples', 'As you sent me into the world, so I have sent them into the world (John 17:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does 17:18 sending parallel Jesus'' mission?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 3, 'How does glory before world foundation show pre-existence?', '["Glory is only human", "No Trinity (a common guess, but not what John says here)", "Christ shared Father''s glory — eternal Son", "Jesus began at Bethlehem only"]'::jsonb, 'Christ shared Father''s glory — eternal Son', 'You loved me before the foundation of the world (John 17:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does glory before world foundation show pre-existence?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 3, 'How does prayer for future believers include us?', '["Only first century", "Excludes moderns (a common guess, but not what John says here)", "Those who believe through apostolic word — church age", "Only twelve apostles"]'::jsonb, 'Those who believe through apostolic word — church age', 'I do not ask for these only, but also for those who will believe in me through their word (John 17:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does prayer for future believers include us?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 3, 'How does world believe through church''s unity?', '["Apologetic — love and oneness witness", "Only miracles convert", "Unity irrelevant (a common guess, but not what John says here)", "Force conversion"]'::jsonb, 'Apologetic — love and oneness witness', 'That the world may believe (John 17:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does world believe through church''s unity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 3, 'Scholarly debate: John 17 and second temple prayer patterns?', '["Similarities to synagogue prayers — Jewish roots of Christian prayer", "No Jewish roots", "Copied from Mithras", "No debate (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'Similarities to synagogue prayers — Jewish roots of Christian prayer', 'Scholars note Jewish prayer forms.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'Scholarly debate: John 17 and second temple prayer patterns?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 3, 'What does Jesus'' report card "I glorified you" mean?', '["Incomplete life", "Only future glory", "Obedient incarnate life — mission accomplished", "Boasting (a common guess, but not what John says here)"]'::jsonb, 'Obedient incarnate life — mission accomplished', 'I glorified you on earth (John 17:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Jesus'' report card "I glorified you" mean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 3, 'What does love with which Father loved Son before world imply?', '["Eternal generation — love within Trinity", "Love begins at Bethlehem", "Father did not love Son", "Only human affection (a common guess, but not what John says here)"]'::jsonb, 'Eternal generation — love within Trinity', 'You loved me before the foundation of the world (John 17:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does love with which Father loved Son before world imply?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 3, 'What does mutual indwelling of believers in God show?', '["Pantheism (a common guess, but not what John says here)", "Participation in divine life — profound union", "Only apostles", "Only metaphor"]'::jsonb, 'Participation in divine life — profound union', 'That they may all be one… I in them and you in me (John 17:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does mutual indwelling of believers in God show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 3, 'What does sanctify in truth mean?', '["Set apart by God''s word — holiness", "Truth is optional", "Only priests (a common guess, but not what John says here)", "Physical washing only"]'::jsonb, 'Set apart by God''s word — holiness', 'Sanctify them in the truth; your word is truth (John 17:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does sanctify in truth mean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 4, 'How does 17:5 glorification request fit narrative?', '["Only resurrection", "Glory without cross", "Looks to cross as glorification — hour come", "Only ascension (a common guess, but not what John says here)"]'::jsonb, 'Looks to cross as glorification — hour come', 'Glorify me… with the glory that I had with you before the world existed (John 17:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 17:5 glorification request fit narrative?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 4, 'How does Jesus'' prayer end on note of love?', '["Love denied", "Father''s love in Christ indwelling believers — mutual love", "Only fear (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Ends cold"]'::jsonb, 'Father''s love in Christ indwelling believers — mutual love', 'That the love with which you have loved me may be in them, and I in them (John 17:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Jesus'' prayer end on note of love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 4, 'How does none lost except son of destruction read?', '["No election (a common guess, but not what John says here)", "God lost sheep randomly", "Judas'' apostasy — Scripture fulfillment", "Judas innocent"]'::jsonb, 'Judas'' apostasy — Scripture fulfillment', 'None of them is lost but the son of destruction (John 17:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does none lost except son of destruction read?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 4, 'How does oneness protect from discord?', '["Trinitarian love model — not authoritarian clone", "Only invisible unity", "Forced agreement (a common guess, but not what John says here)", "Diversity denied"]'::jsonb, 'Trinitarian love model — not authoritarian clone', 'That they may become perfectly one (John 17:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does oneness protect from discord?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 4, 'How does prayer shape Johannine ecclesiology?', '["Church is nation", "No community (a common guess, but not what John says here)", "Church invisible only", "Church as loved, sent, unified, protected community"]'::jsonb, 'Church as loved, sent, unified, protected community', 'Holy Father, keep them in your name (John 17:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does prayer shape Johannine ecclesiology?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 4, 'What does glory given to disciples (17:22) mean?', '["Sharing in Christ''s glory — adoption honor", "Wealth transfer (a common guess, but not what John says here)", "Physical light only", "Angels'' glory stolen"]'::jsonb, 'Sharing in Christ''s glory — adoption honor', 'The glory that you have given me I have given to them (John 17:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does glory given to disciples (17:22) mean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 4, 'What does joy fulfilled in themselves (17:13) mean?', '["Temporary emotion", "Wealth joy (a common guess, but not what John says here)", "Sharing Jesus'' own joy — eschatological gift", "Only laughter"]'::jsonb, 'Sharing Jesus'' own joy — eschatological gift', 'That they may have my joy fulfilled in themselves (John 17:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does joy fulfilled in themselves (17:13) mean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 4, 'What does kept in Father''s name mean?', '["Name as charm (a common guess, but not what John says here)", "Salvation by label only", "Only human guards", "Security — divine preservation"]'::jsonb, 'Security — divine preservation', 'While I was with them, I kept them in your name (John 17:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does kept in Father''s name mean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 4, 'What does truth as sanctifier contrast?', '["Only philosophy", "Truth unknowable", "Relativism (a common guess, but not what John says here)", "Pilate''s \"what is truth\" — Jesus'' word sanctifies"]'::jsonb, 'Pilate''s "what is truth" — Jesus'' word sanctifies', 'Your word is truth (John 17:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does truth as sanctifier contrast?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 4, 'What does world knowing Father sent Jesus depend on?', '["Temple rituals", "Military power", "Wealth (a common guess, but not what John says here)", "Unity of disciples — missional apologetic"]'::jsonb, 'Unity of disciples — missional apologetic', 'That the world may know that you sent me (John 17:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does world knowing Father sent Jesus depend on?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 5, 'How does 17:26 love abiding close Gospel''s love theme?', '["Love ends (a common guess, but not what John says here)", "Love commandment fulfilled in divine indwelling", "Law without love", "Only human love"]'::jsonb, 'Love commandment fulfilled in divine indwelling', 'That the love… may be in them (John 17:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 17:26 love abiding close Gospel''s love theme?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 5, 'How does Jesus'' prayer before cross model Christian prayer?', '["Prayer useless (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Trinitarian, scriptural, missional — Jesus prays as he taught", "No Father address", "Only spontaneous"]'::jsonb, 'Trinitarian, scriptural, missional — Jesus prays as he taught', 'Father… (John 17:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Jesus'' prayer before cross model Christian prayer?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 5, 'How does mutual seeing glory fulfill hope?', '["Beatific vision theme — future with Christ", "No heaven (a common guess, but not what John says here)", "Only apostles see", "Only metaphor"]'::jsonb, 'Beatific vision theme — future with Christ', 'That they may see my glory (John 17:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does mutual seeing glory fulfill hope?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 5, 'What did Jesus pray the Father would give believers in Jesus'' glory?', '["The same glory — that they may be one", "Wealth (a common guess, but not what John says here)", "Nothing", "A throne in Rome"]'::jsonb, 'The same glory — that they may be one', 'The glory that you have given me I have given to them (John 17:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus pray the Father would give believers in Jesus'' glory?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 5, 'What did Jesus pray the Father would give them that they may be one?', '["Long life", "Glory", "Freedom from Rome", "Riches"]'::jsonb, 'Glory', 'The glory that you have given me I have given to them (John 17:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus pray the Father would give them that they may be one?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 5, 'What did Jesus say he had given to the Father?', '["Only criticism", "Glory on earth", "Silent obedience", "Only money"]'::jsonb, 'Glory on earth', 'I glorified you on earth, having accomplished the work that you gave me to do (John 17:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus say he had given to the Father?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 5, 'What did Jesus say he had given to those the Father gave him?', '["A sword (a common guess, but not what John says here)", "Roman citizenship", "The words the Father gave him", "His own private opinions"]'::jsonb, 'The words the Father gave him', 'I have given them your word (John 17:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus say he had given to those the Father gave him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 5, 'What does "I in them" contribute to union with Christ?', '["Mystical union — ethical transformation", "Physical fusion", "Only future", "Only legal (a common guess, but not what John says here)"]'::jsonb, 'Mystical union — ethical transformation', 'I in them and you in me (John 17:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does "I in them" contribute to union with Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 5, 'What missional edge in world believing?', '["World never believes", "Only Israel (a common guess, but not what John says here)", "Universalism automatic", "Eschatological hope — gospel success"]'::jsonb, 'Eschatological hope — gospel success', 'That the world may believe (John 17:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'What missional edge in world believing?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 17, 5, 'What pastoral comfort in kept from evil?', '["Health promise (a common guess, but not what John says here)", "Assurance amid persecution — not removal from world", "Christians never suffer", "No evil exists"]'::jsonb, 'Assurance amid persecution — not removal from world', 'Keep them from the evil one (John 17:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 17
    AND q.difficulty_stage = 5
    AND q.prompt = 'What pastoral comfort in kept from evil?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 1, 'What did Jesus say when they said they sought Jesus?', '["Ask Pilate", "I am not he", "Run away", "I am he"]'::jsonb, 'I am he', 'Jesus said to them, "I am he" (John 18:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say when they said they sought Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 1, 'What did Jesus tell Peter about the cup?', '["Fight harder", "Shall I not drink the cup the Father has given me?", "Run (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Hide"]'::jsonb, 'Shall I not drink the cup the Father has given me?', 'Put your sword into its sheath; shall I not drink the cup…? (John 18:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus tell Peter about the cup?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 1, 'What did Peter do to the high priest''s servant?', '["Healed him first", "Paid him (a common guess, but not what John says here)", "Cut off his right ear", "Kissed him"]'::jsonb, 'Cut off his right ear', 'Simon Peter… struck the high priest''s servant and cut off his right ear (John 18:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Peter do to the high priest''s servant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 1, 'What happened when Jesus said "I am"?', '["They left (a common guess, but not what John says here)", "They rejoiced", "They healed", "They drew back and fell to the ground"]'::jsonb, 'They drew back and fell to the ground', 'When he said to them, "I am he," they drew back and fell to the ground (John 18:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'What happened when Jesus said "I am"?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 1, 'What was the servant''s name?', '["Annas (a common guess, but not what John says here)", "Caesar", "Herod", "Malchus"]'::jsonb, 'Malchus', 'The servant''s name was Malchus (John 18:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'What was the servant''s name?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 1, 'Where did Jesus go across the Kidron?', '["The temple", "Caesarea", "The sea", "A garden"]'::jsonb, 'A garden', 'Jesus went out… across the brook Kidron, where there was a garden (John 18:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'Where did Jesus go across the Kidron?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 1, 'Who followed Jesus into the courtyard?', '["Judas only", "All twelve", "Peter and another disciple", "No one (a common guess, but not what John says here)"]'::jsonb, 'Peter and another disciple', 'Simon Peter was following Jesus, and so was another disciple (John 15:15–16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who followed Jesus into the courtyard?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 1, 'Who was high priest that year?', '["Herod (a common guess, but not what John says here)", "Pilate", "Caiaphas", "Annas"]'::jsonb, 'Caiaphas', 'Caiaphas was the high priest that year (John 18:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who was high priest that year?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 1, 'Whom did Jesus meet in the garden?', '["Judas with soldiers", "Only angels", "Pilate (a common guess, but not what John says here)", "Only disciples"]'::jsonb, 'Judas with soldiers', 'Judas, who betrayed him, knew the place… Jesus met them (John 18:2–5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'Whom did Jesus meet in the garden?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 1, 'Whom did they lead Jesus to first?', '["Herod only", "Annas", "Caiaphas only", "Pilate directly"]'::jsonb, 'Annas', 'First they led him to Annas (John 18:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 1
    AND q.prompt = 'Whom did they lead Jesus to first?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 2, 'How does "I am" in arrest show power?', '["Name is magic word", "Jesus is weak", "Divine name — officers fall", "No power (a common guess, but not what John says here)"]'::jsonb, 'Divine name — officers fall', 'They drew back and fell (John 18:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does "I am" in arrest show power?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 2, 'How many times did Peter deny before the rooster crowed?', '["Never", "Three times", "Seven times", "Once (a common guess, but not what John says here)"]'::jsonb, 'Three times', 'Again Peter denied it, and at once a rooster crowed (John 18:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'How many times did Peter deny before the rooster crowed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 2, 'Theologically, what does garden evoke?', '["No theology (a common guess, but not what John says here)", "Only agriculture", "Eden reversal — new Adam obedient to death", "Random park"]'::jsonb, 'Eden reversal — new Adam obedient to death', 'Garden… Kidron (John 18:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'Theologically, what does garden evoke?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 2, 'What did Jesus say his kingdom was not?', '["Of David (a common guess, but not what John says here)", "Of this world", "Of heaven", "Of angels"]'::jsonb, 'Of this world', 'My kingdom is not of this world (John 18:36).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say his kingdom was not?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 2, 'What did Jesus say his servants would do if his kingdom were of this world?', '["Fight", "Pay taxes", "Flee", "Hide"]'::jsonb, 'Fight', 'If my kingdom were of this world, my servants would have been fighting (John 18:36).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say his servants would do if his kingdom were of this world?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 2, 'What did Pilate ask Jesus?', '["Are you the King of the Jews?", "Are you a priest? (a common guess, but not what John says here)", "Are you a fisherman?", "Are you from Egypt?"]'::jsonb, 'Are you the King of the Jews?', 'Are you the King of the Jews? (John 18:33).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Pilate ask Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 2, 'What did Pilate say about truth?', '["Truth is money", "Truth is clear", "I love truth (a common guess, but not what John says here)", "What is truth?"]'::jsonb, 'What is truth?', 'What is truth? (John 18:38).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Pilate say about truth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 2, 'What did the servant girl ask Peter?', '["Where is Jesus? (a common guess, but not what John says here)", "You also are not one of this man''s disciples, are you?", "Who is your king?", "Will you buy bread?"]'::jsonb, 'You also are not one of this man''s disciples, are you?', 'You also are not one of this man''s disciples, are you? (John 18:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the servant girl ask Peter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 2, 'What was Barabbas?', '["A priest", "A fisherman", "A robber", "A scribe"]'::jsonb, 'A robber', 'Now Barabbas was a robber (John 18:40).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was Barabbas?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 2, 'Whom did the crowd ask to release instead of Jesus?', '["Barabbas", "Pilate", "Peter (a common guess, but not what John says here)", "Herod"]'::jsonb, 'Barabbas', 'Release for you the King of the Jews… Barabbas (John 18:39–40).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 2
    AND q.prompt = 'Whom did the crowd ask to release instead of Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 3, 'How does Annas/Caiaphas sequence reflect history?', '["Annas still power behind — Johannine detail", "Contradiction", "Only one high priest", "No history (a common guess, but not what John says here)"]'::jsonb, 'Annas still power behind — Johannine detail', 'First to Annas (John 18:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Annas/Caiaphas sequence reflect history?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 3, 'How does Jesus witness to kingdom before Pilate?', '["Jesus silent always", "Pilate converts (a common guess, but not what John says here)", "Only Jews matter", "Testimony to gentile authority — universal scope"]'::jsonb, 'Testimony to gentile authority — universal scope', 'You say that I am a king (John 18:37).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Jesus witness to kingdom before Pilate?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 3, 'How does another disciple with Peter show?', '["Legend (a common guess, but not what John says here)", "Two deny", "Beloved disciple access — eyewitness", "Only Peter matters"]'::jsonb, 'Beloved disciple access — eyewitness', 'Another disciple… was known to the high priest (John 18:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does another disciple with Peter show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 3, 'How does kingdom not of world answer Pilate?', '["Only future (a common guess, but not what John says here)", "Spiritual reign — not military coup", "Jesus wants Rome", "Kingdom is Rome"]'::jsonb, 'Spiritual reign — not military coup', 'My kingdom is not from the world (John 18:36).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does kingdom not of world answer Pilate?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 3, 'Scholarly view: historicity of trial?', '["Core events widely accepted; details harmonized across Gospels", "All fiction", "No study (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Only John true"]'::jsonb, 'Core events widely accepted; details harmonized across Gospels', 'Scholars debate sequence.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'Scholarly view: historicity of trial?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 3, 'What does Peter''s denial fulfill?', '["Jesus'' prediction — weakness and restoration theme", "Nothing (a common guess, but not what John says here)", "No restoration", "Peter is devil"]'::jsonb, 'Jesus'' prediction — weakness and restoration theme', 'You will deny me three times (John 13:38).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Peter''s denial fulfill?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 3, 'What does Pilate''s truth question show?', '["Faith (a common guess, but not what John says here)", "Love of truth", "Cynicism or despair — contrast Jesus as truth", "Perfect philosophy"]'::jsonb, 'Cynicism or despair — contrast Jesus as truth', 'What is truth? (John 18:38).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Pilate''s truth question show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 3, 'What does charcoal fire echo?', '["John 21 restoration — same setting motif", "Only cold", "Random (a common guess, but not what John says here)", "No chapter 21"]'::jsonb, 'John 21 restoration — same setting motif', 'They were standing… warming themselves around a charcoal fire (John 18:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does charcoal fire echo?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 3, 'What does sword rebuke teach?', '["Peter is praised", "Pacifism only", "Violence not Messianic means — cup from Father", "War is good (a common guess, but not what John says here)"]'::jsonb, 'Violence not Messianic means — cup from Father', 'Put your sword into its sheath (John 18:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does sword rebuke teach?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 3, 'Why choose Barabbas?', '["Random (a common guess, but not what John says here)", "Crowd prefers insurrectionist — ironic choice", "Pilate loves Barabbas", "Barabbas is innocent"]'::jsonb, 'Crowd prefers insurrectionist — ironic choice', 'Release… Barabbas (John 18:40).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why choose Barabbas?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 4, 'How does Jesus'' answer to king question define mission?', '["Kingdom is army (a common guess, but not what John says here)", "Jesus denies kingship", "Kingdom is truth — Pilate faces claim", "Only spiritual later"]'::jsonb, 'Kingdom is truth — Pilate faces claim', 'You say that I am a king (John 18:37).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Jesus'' answer to king question define mission?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 4, 'How does Peter''s warming by fire show cowardice?', '["Fire is irrelevant", "Only cold (a common guess, but not what John says here)", "Peter is brave", "Proximity to trial while denying — dramatic irony"]'::jsonb, 'Proximity to trial while denying — dramatic irony', 'Peter was standing… warming himself (John 18:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Peter''s warming by fire show cowardice?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 4, 'How does crowd''s "We have no king but Caesar" betray?', '["National apostasy — rejecting messianic hope", "Caesar is Messiah", "Faithful statement", "Only sarcasm (a common guess, but not what John says here)"]'::jsonb, 'National apostasy — rejecting messianic hope', 'We have no king but Caesar (John 19:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does crowd''s "We have no king but Caesar" betray?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 4, 'How does rooster crow fulfill?', '["No prophecy (a common guess, but not what John says here)", "Evening only", "Random bird", "Jesus'' word precise — morning signal"]'::jsonb, 'Jesus'' word precise — morning signal', 'The rooster crowed (John 18:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does rooster crow fulfill?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 4, 'How does world in Pilate scene contrast Jesus'' kingdom?', '["Same realm", "Rome''s power vs. truth — clash of realms", "No clash (a common guess, but not what John says here)", "Only spiritual"]'::jsonb, 'Rome''s power vs. truth — clash of realms', 'Behold your King! (John 19:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does world in Pilate scene contrast Jesus'' kingdom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 4, 'What apologetic value in Pilate finding no guilt?', '["Pilate is right always", "Only Jewish guilt", "Innocence declared — yet condemned", "No innocence (a common guess, but not what John says here)"]'::jsonb, 'Innocence declared — yet condemned', 'I find no guilt in him (John 18:38).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'What apologetic value in Pilate finding no guilt?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 4, 'What does binding Jesus show?', '["Shepherd struck, sheep scattered — passion prophecy", "Orderly arrest", "Jesus fights", "No binding (a common guess, but not what John says here)"]'::jsonb, 'Shepherd struck, sheep scattered — passion prophecy', 'They bound him (John 18:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does binding Jesus show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 4, 'What does born to bear witness to truth mean?', '["Messiah witnesses to God''s kingdom — Pilate''s realm", "No witness (a common guess, but not what John says here)", "Only apostles", "Only subjective truth"]'::jsonb, 'Messiah witnesses to God''s kingdom — Pilate''s realm', 'For this purpose I was born… to bear witness to the truth (John 18:37).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does born to bear witness to truth mean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 4, 'What does lead to Annas first suggest about trial?', '["Roman law (a common guess, but not what John says here)", "Only Pilate", "Preliminary hearing — Jewish leadership intrigue", "No hearing"]'::jsonb, 'Preliminary hearing — Jewish leadership intrigue', 'Led him to Annas first (John 18:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does lead to Annas first suggest about trial?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 4, 'What does maid and others questioning Peter show?', '["Peter silent (a common guess, but not what John says here)", "Escalating pressure — three denials", "One question only", "Only one person"]'::jsonb, 'Escalating pressure — three denials', 'They said to him… (John 18:25–27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does maid and others questioning Peter show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 5, 'How does Judas know the place?', '["No meetings", "Jesus hid (a common guess, but not what John says here)", "He followed randomly", "Intimate disciple — betrayal of friendship"]'::jsonb, 'Intimate disciple — betrayal of friendship', 'Judas, who betrayed him, knew the place (John 18:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Judas know the place?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 5, 'How does Malchus'' ear healing in Synoptics relate?', '["John contradicts", "Jesus heals violence he condemned — mercy", "Peter praised", "No healing (a common guess, but not what John says here)"]'::jsonb, 'Jesus heals violence he condemned — mercy', 'Malchus'' ear (cf. Luke 22:51).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Malchus'' ear healing in Synoptics relate?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 5, 'What did Pilate ask Jesus — are you the King of the Jews?', '["Jesus asked if Pilate spoke on his own or others told him", "Jesus called angels (a common guess, but not what John says here)", "Jesus refused to speak", "Jesus denied kingship"]'::jsonb, 'Jesus asked if Pilate spoke on his own or others told him', 'Do you say this of your own accord, or did others say it to you about me? (John 18:34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Pilate ask Jesus — are you the King of the Jews?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 5, 'What did one of the officers do when Jesus answered the high priest?', '["Arrested Caiaphas", "Struck Jesus — is that how you answer?", "Praised Jesus", "Left (a common guess, but not what John says here)"]'::jsonb, 'Struck Jesus — is that how you answer?', 'One of the officers standing by struck Jesus… (John 18:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did one of the officers do when Jesus answered the high priest?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 5, 'What did the high priest ask Jesus about his disciples and teaching?', '["Jesus refused to answer", "Jesus answered openly — he spoke in synagogues and temple", "Jesus denied teaching (a common guess, but not what John says here)", "Jesus denied disciples"]'::jsonb, 'Jesus answered openly — he spoke in synagogues and temple', 'I have spoken openly to the world… I always taught in synagogues and in the temple (John 18:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did the high priest ask Jesus about his disciples and teaching?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 5, 'What does Jesus protect disciples in arrest?', '["No care", "Random (a common guess, but not what John says here)", "Disciples arrested too", "Let these men go — shepherd cares for sheep"]'::jsonb, 'Let these men go — shepherd cares for sheep', 'If you seek me, let these men go (John 18:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Jesus protect disciples in arrest?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 5, 'What does Peter follow at distance show?', '["Perfect courage", "Never follows", "Brave yet failing — mixed courage", "No fear (a common guess, but not what John says here)"]'::jsonb, 'Brave yet failing — mixed courage', 'Simon Peter was following Jesus (John 18:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Peter follow at distance show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 5, 'What does band of soldiers imply?', '["Only disciples", "Only Jews (a common guess, but not what John says here)", "Roman involvement — serious arrest", "Small group"]'::jsonb, 'Roman involvement — serious arrest', 'A band of soldiers and some officers from the chief priests (John 18:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does band of soldiers imply?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 5, 'What does release at Passover custom show?', '["Barabbas is lamb", "No irony (a common guess, but not what John says here)", "Irony — true Passover Lamb not released", "Custom is fiction"]'::jsonb, 'Irony — true Passover Lamb not released', 'Release one prisoner (John 18:39).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does release at Passover custom show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 18, 5, 'What lantern/torch detail add?', '["Night search — irony of light seeking Light", "Daytime (a common guess, but not what John says here)", "Only practical", "No irony"]'::jsonb, 'Night search — irony of light seeking Light', 'Judas… went there with lanterns and torches (John 18:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 18
    AND q.difficulty_stage = 5
    AND q.prompt = 'What lantern/torch detail add?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 1, 'In how many languages was the inscription?', '["Three — Hebrew, Latin, Greek", "Four", "Two (a common guess, but not what John says here)", "One"]'::jsonb, 'Three — Hebrew, Latin, Greek', 'Written in Hebrew, in Latin, and in Greek (John 19:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'In how many languages was the inscription?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 1, 'What color robe did they put on Jesus?', '["Red (a common guess, but not what John says here)", "White", "Blue", "Purple"]'::jsonb, 'Purple', 'They arrayed him in a purple robe (John 19:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'What color robe did they put on Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 1, 'What did Pilate have soldiers do to Jesus?', '["Send him to Herod", "Release him", "Crown him king in sincerity", "Scourge him"]'::jsonb, 'Scourge him', 'Pilate took Jesus and flogged him (John 19:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Pilate have soldiers do to Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 1, 'What did Pilate say to the crowd?', '["Behold your King!", "Free him (a common guess, but not what John says here)", "He is innocent", "Crucify him now"]'::jsonb, 'Behold your King!', 'Behold your King! (John 19:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Pilate say to the crowd?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 1, 'What did Pilate write on the inscription?', '["This is a robber", "Jesus of Nazareth, the King of the Jews", "King of Rome (a common guess, but not what John says here)", "Innocent man"]'::jsonb, 'Jesus of Nazareth, the King of the Jews', 'Jesus of Nazareth, the King of the Jews (John 19:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Pilate write on the inscription?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 1, 'What did soldiers weave for Jesus'' head?', '["A silk hat (a common guess, but not what John says here)", "A laurel of olive", "A crown of thorns", "A gold crown"]'::jsonb, 'A crown of thorns', 'They twisted together a crown of thorns and put it on his head (John 19:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did soldiers weave for Jesus'' head?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 1, 'What did the chief priests say?', '["We have no king but Caesar", "We love Jesus (a common guess, but not what John says here)", "We follow Moses only", "We need a sign"]'::jsonb, 'We have no king but Caesar', 'We have no king but Caesar (John 19:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the chief priests say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 1, 'What did the soldiers do with Jesus'' garments?', '["Sell them to priests", "Cast lots", "Burn them", "Return to Mary"]'::jsonb, 'Cast lots', 'They cast lots to see whose each should be (John 19:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the soldiers do with Jesus'' garments?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 1, 'Where was Jesus crucified?', '["Jericho", "Olivet (a common guess, but not what John says here)", "The Place of a Skull, called Golgotha in Hebrew", "Nazareth"]'::jsonb, 'The Place of a Skull, called Golgotha in Hebrew', 'They took Jesus… to the place called The Place of a Skull, which in Aramaic is called Golgotha (John 19:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'Where was Jesus crucified?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 1, 'Who carried Jesus'' cross?', '["Peter (a common guess, but not what John says here)", "Jesus went out bearing his own cross", "Soldiers only", "Simon of Cyrene only in John"]'::jsonb, 'Jesus went out bearing his own cross', 'He went out, bearing his own cross (John 19:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who carried Jesus'' cross?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 2, 'To whom did Jesus entrust his mother?', '["James (a common guess, but not what John says here)", "Peter", "Joseph", "The beloved disciple"]'::jsonb, 'The beloved disciple', 'Behold your mother! (John 19:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'To whom did Jesus entrust his mother?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 2, 'What Scripture did dividing garments fulfill?', '["They divided my garments among them", "My God, my God", "I am the vine (a common guess, but not what John says here)", "He was led like a lamb"]'::jsonb, 'They divided my garments among them', 'They divided my garments among them, and for my clothing they cast lots (John 19:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'What Scripture did dividing garments fulfill?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 2, 'What came out of Jesus'' side?', '["Blood and water", "Only blood", "Oil (a common guess, but not what John says here)", "Only water"]'::jsonb, 'Blood and water', 'At once there came out blood and water (John 19:34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'What came out of Jesus'' side?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 2, 'What did Jesus say he thirsted for?', '["Power (a common guess, but not what John says here)", "Only physical thirst", "Wine only", "To fulfill Scripture"]'::jsonb, 'To fulfill Scripture', 'I thirst (John 19:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say he thirsted for?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 2, 'What did Jesus say to his mother?', '["Woman, behold, your son!", "It is finished", "Why have you forsaken me?", "I thirst"]'::jsonb, 'Woman, behold, your son!', 'Woman, behold, your son! (John 19:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say to his mother?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 2, 'What did Jesus say when he had received the sour wine?', '["Father, forgive", "Into your hands", "Why forsaken", "It is finished"]'::jsonb, 'It is finished', 'When Jesus had received the sour wine, he said, "It is finished" (John 19:30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say when he had received the sour wine?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 2, 'What did a soldier pierce Jesus'' side with?', '["A spear", "A nail", "A sword", "An arrow"]'::jsonb, 'A spear', 'One of the soldiers pierced his side with a spear (John 19:34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did a soldier pierce Jesus'' side with?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 2, 'What did they put on hyssop to Jesus'' mouth?', '["Water", "Honey", "Oil (a common guess, but not what John says here)", "Sour wine"]'::jsonb, 'Sour wine', 'They put it on hyssop and brought it to his mouth (John 19:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did they put on hyssop to Jesus'' mouth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 2, 'Who asked Pilate for Jesus'' body?', '["Peter", "Joseph of Arimathea", "Nicodemus first in line", "Mary"]'::jsonb, 'Joseph of Arimathea', 'Joseph of Arimathea… asked Pilate that he might take away the body of Jesus (John 19:38).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'Who asked Pilate for Jesus'' body?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 2, 'Who stood by the cross?', '["Only soldiers", "No one (a common guess, but not what John says here) (does not match John’s wording in this verse)", "His mother, her sister, Mary Magdalene, Mary of Clopas", "Only Pharisees"]'::jsonb, 'His mother, her sister, Mary Magdalene, Mary of Clopas', 'Standing by the cross of Jesus were his mother… (John 19:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 2
    AND q.prompt = 'Who stood by the cross?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 3, 'How does Nicodemus reappear?', '["Denies Jesus", "Still only night", "Never helps (a common guess, but not what John says here)", "Public burial courage — growth from chapter 3"]'::jsonb, 'Public burial courage — growth from chapter 3', 'Nicodemus… brought spices (John 19:39).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Nicodemus reappear?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 3, 'How does inscription as King of Jews function ironically?', '["Pilate believes", "False title (a common guess, but not what John says here)", "True charge — crucified as king", "Only sarcasm with no truth"]'::jsonb, 'True charge — crucified as king', 'The King of the Jews (John 19:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does inscription as King of Jews function ironically?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 3, 'How does woman behold son provide for Mary?', '["Mary abandoned", "Beloved disciple adopts Mary — new family", "Jesus insults Mary", "Only metaphor (a common guess, but not what John says here)"]'::jsonb, 'Beloved disciple adopts Mary — new family', 'Behold your son! (John 19:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does woman behold son provide for Mary?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 3, 'How much spices did Nicodemus bring?', '["Ten pounds", "About seventy-five pounds", "A hundred denarii", "One pound (a common guess, but not what John says here)"]'::jsonb, 'About seventy-five pounds', 'Nicodemus… brought a mixture of myrrh and aloes, about seventy-five pounds in weight (John 19:39).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'How much spices did Nicodemus bring?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 3, 'Theologically, what does crown of thorns signify?', '["Royal honor only", "No meaning (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Curse of creation — thorns from Genesis 3 borne by second Adam", "Roman joke only"]'::jsonb, 'Curse of creation — thorns from Genesis 3 borne by second Adam', 'Crown of thorns (John 19:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'Theologically, what does crown of thorns signify?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 3, 'What does "It is finished" mean?', '["Only physical death", "Only rest (a common guess, but not what John says here)", "Completed atonement — tetelestai", "Failed mission"]'::jsonb, 'Completed atonement — tetelestai', 'It is finished (John 19:30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does "It is finished" mean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 3, 'What does blood and water symbolize?', '["Debated — sacraments, life given, medical witness to real death", "Contradicts resurrection", "No meaning", "Only myth (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'Debated — sacraments, life given, medical witness to real death', 'Blood and water (John 19:34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does blood and water symbolize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 3, 'What does lots for garments fulfill?', '["Psalm 22 — righteous sufferer", "Psalm 23 (a common guess, but not what John says here)", "No prophecy", "Random gambling"]'::jsonb, 'Psalm 22 — righteous sufferer', 'They divided my garments (John 19:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does lots for garments fulfill?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 3, 'What does new tomb show?', '["Random hole (a common guess, but not what John says here)", "No bones mixed — royal burial dignity", "No prophecy", "Criminal dump only"]'::jsonb, 'No bones mixed — royal burial dignity', 'In the garden a new tomb (John 19:41).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does new tomb show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 3, 'What does thirst fulfill?', '["Only physical", "No Scripture (a common guess, but not what John says here)", "Scripture — details of passion planned", "Random discomfort"]'::jsonb, 'Scripture — details of passion planned', 'After this, Jesus, knowing that all was now finished, said (to fulfill the Scripture), "I thirst" (John 19:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does thirst fulfill?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 4, 'How does Joseph of Arimathea secret disciple now public?', '["Only women brave", "Courage after cross — costly discipleship", "Still fully secret", "Denies (a common guess, but not what John says here)"]'::jsonb, 'Courage after cross — costly discipleship', 'Joseph… secretly for fear… asked Pilate (John 19:38).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Joseph of Arimathea secret disciple now public?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 4, 'How does Mary''s presence fulfill sword prophecy?', '["Only Luke (a common guess, but not what John says here)", "Simeon''s prophecy — soul pierced", "Mary absent", "No connection"]'::jsonb, 'Simeon''s prophecy — soul pierced', 'Your own soul a sword will pierce (Luke 2:35 / John 19:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Mary''s presence fulfill sword prophecy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 4, 'How does Passover timing emphasize?', '["Random day (a common guess, but not what John says here)", "Contradicts Synoptics always", "Lamb of God dies at preparation — typology", "No lamb imagery"]'::jsonb, 'Lamb of God dies at preparation — typology', 'It was the day of Preparation (John 19:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Passover timing emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 4, 'How does Scripture fulfillment density function?', '["Passion as word of God enacted — hermeneutic", "No OT (a common guess, but not what John says here)", "Coincidence", "Only Paul"]'::jsonb, 'Passion as word of God enacted — hermeneutic', 'These things occurred so that the Scripture might be fulfilled (John 19:36).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Scripture fulfillment density function?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 4, 'How does blood and water support sacraments tradition?', '["Only Catholic", "Baptism and Eucharist imagery — church fathers", "Only modern (a common guess, but not what John says here)", "Denied by John"]'::jsonb, 'Baptism and Eucharist imagery — church fathers', 'Blood and water (John 19:34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does blood and water support sacraments tradition?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 4, 'Scholarly view: pierced side historicity?', '["Medical arguments for fluid — apologetic for death", "No death (a common guess, but not what John says here)", "No debate", "Only spiritual"]'::jsonb, 'Medical arguments for fluid — apologetic for death', 'Blood and water discussed medically.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'Scholarly view: pierced side historicity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 4, 'What does King of Jews title before Jews mean?', '["Title is wrong", "Irony — rejected king crucified publicly", "Jews accept (a common guess, but not what John says here)", "Only for Romans"]'::jsonb, 'Irony — rejected king crucified publicly', 'Jesus of Nazareth, the King of the Jews (John 19:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does King of Jews title before Jews mean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 4, 'What does bones not broken fulfill?', '["Exodus 12 / Psalm 34 — Passover lamb bones", "Broken bones good", "No prophecy", "Random (a common guess, but not what John says here)"]'::jsonb, 'Exodus 12 / Psalm 34 — Passover lamb bones', 'Not one of his bones will be broken (John 19:36).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does bones not broken fulfill?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 4, 'What does finished accomplish?', '["Only beginning", "Incomplete (a common guess, but not what John says here)", "Atonement complete — priestly language", "Only physical"]'::jsonb, 'Atonement complete — priestly language', 'It is finished (John 19:30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does finished accomplish?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 4, 'What does hyssop evoke?', '["Greek myth (a common guess, but not what John says here)", "Passover lamb blood — Exodus imagery", "Random plant", "Only cleaning"]'::jsonb, 'Passover lamb blood — Exodus imagery', 'They put it on hyssop (John 19:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does hyssop evoke?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 5, 'How does Pilate''s fear show?', '["Tries to release — cowardice yields to crowd", "Loves Jesus", "Bold always", "No fear (a common guess, but not what John says here)"]'::jsonb, 'Tries to release — cowardice yields to crowd', 'From then on Pilate sought to release him (John 19:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Pilate''s fear show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 5, 'How does Scripture not a bone broken cohere?', '["Bones must break", "Contradicts Exodus", "Passover lamb — Jesus as lamb", "Only Paul (a common guess, but not what John says here)"]'::jsonb, 'Passover lamb — Jesus as lamb', 'Not one of his bones will be broken (John 19:36).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Scripture not a bone broken cohere?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 5, 'How does crucifixion as lifting up connect John 3 and 12?', '["No connection (a common guess, but not what John says here)", "Serpent / Son of Man lifted — drawing all", "Denies spiritual", "Only physical"]'::jsonb, 'Serpent / Son of Man lifted — drawing all', 'They crucified him (John 19:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does crucifixion as lifting up connect John 3 and 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 5, 'How does spices honor burial?', '["Royal tons — king treated even in death", "Only criminals", "No honor (a common guess, but not what John says here)", "Cheap burial"]'::jsonb, 'Royal tons — king treated even in death', 'Seventy-five pounds (John 19:39).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does spices honor burial?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 5, 'What did the soldiers do after crucifying Jesus?', '["Burned garments (a common guess, but not what John says here)", "Returned them to Mary", "Divided his garments and cast lots", "Left him clothed"]'::jsonb, 'Divided his garments and cast lots', 'When the soldiers had crucified Jesus, they took his garments and divided them into four parts (John 19:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did the soldiers do after crucifying Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 5, 'What does Behold your King sarcasm become?', '["Pilate believes", "Only joke", "Truth — Christians read as messianic irony", "No truth (a common guess, but not what John says here)"]'::jsonb, 'Truth — Christians read as messianic irony', 'Behold your King! (John 19:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Behold your King sarcasm become?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 5, 'What does Veronica-like silence in John omit?', '["John focuses on Mary and beloved disciple — theological choice", "Contradicts other Gospels", "Only soldiers", "Women absent (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'John focuses on Mary and beloved disciple — theological choice', 'Standing by the cross… his mother (John 19:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Veronica-like silence in John omit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 5, 'What does garden tomb evoke?', '["Only agriculture", "No Eden", "Random (a common guess, but not what John says here)", "Eden — new creation in resurrection hope"]'::jsonb, 'Eden — new creation in resurrection hope', 'In the garden… new tomb (John 19:41).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does garden tomb evoke?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 5, 'What does pierced side fulfill?', '["Zechariah 12:10 — look on pierced one", "Random violence", "Only medical", "No prophecy (a common guess, but not what John says here)"]'::jsonb, 'Zechariah 12:10 — look on pierced one', 'They will look on me whom they have pierced (John 19:37).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does pierced side fulfill?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 19, 5, 'What title did Pilate''s inscription use — King of the Jews?', '["Written in Hebrew, Latin, and Greek", "Only Hebrew", "Only Greek (a common guess, but not what John says here)", "Only Latin"]'::jsonb, 'Written in Hebrew, Latin, and Greek', 'Written in Hebrew, in Latin, and in Greek (John 19:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 19
    AND q.difficulty_stage = 5
    AND q.prompt = 'What title did Pilate''s inscription use — King of the Jews?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 1, 'On what day did Mary Magdalene come to the tomb?', '["Third day only counted differently", "Seventh day", "Passover day", "First day of the week"]'::jsonb, 'First day of the week', 'Now on the first day of the week Mary Magdalene came to the tomb early (John 20:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'On what day did Mary Magdalene come to the tomb?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 1, 'What did Jesus say to Mary?', '["Mary!", "Why weep?", "Touch me not yet", "Go to disciples"]'::jsonb, 'Mary!', 'Jesus said to her, "Mary." She turned and said to him in Aramaic, "Rabboni!" (John 20:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say to Mary?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 1, 'What did Jesus say — do not cling to him?', '["Go away (a common guess, but not what John says here)", "I have not yet ascended to the Father", "I am a ghost", "I hate you"]'::jsonb, 'I have not yet ascended to the Father', 'Do not cling to me, for I have not yet ascended to the Father (John 17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say — do not cling to him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 1, 'What did Jesus tell Mary to say?', '["I will never ascend", "Stay silent (a common guess, but not what John says here)", "I am ascending to my Father and your Father", "Flee to Egypt"]'::jsonb, 'I am ascending to my Father and your Father', 'Go to my brothers and say to them, "I am ascending…" (John 20:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus tell Mary to say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 1, 'What did Peter see in the tomb?', '["Nothing (a common guess, but not what John says here)", "Jesus body", "Linen cloths lying, face cloth folded separately", "Angels eating"]'::jsonb, 'Linen cloths lying, face cloth folded separately', 'He saw the linen cloths lying there, and the face cloth… folded (John 20:6–7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Peter see in the tomb?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 1, 'What did she see about the stone?', '["Jesus waiting (a common guess, but not what John says here)", "Taken away from the tomb", "Angels sitting only", "Sealed tighter"]'::jsonb, 'Taken away from the tomb', 'She saw that the stone had been taken away from the tomb (John 20:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did she see about the stone?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 1, 'What did the other disciple do at the tomb?', '["Called soldiers", "Refused to go", "Outran Peter but waited to enter", "Stayed home (a common guess, but not what John says here)"]'::jsonb, 'Outran Peter but waited to enter', 'The other disciple outran Peter (John 20:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the other disciple do at the tomb?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 1, 'Who sat down in the tomb in angels'' appearance?', '["Four creatures", "Two angels in white", "Soldiers (a common guess, but not what John says here)", "Moses and Elijah"]'::jsonb, 'Two angels in white', 'She saw two angels in white sitting (John 20:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who sat down in the tomb in angels'' appearance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 1, 'Whom did Mary run to tell?', '["Simon Peter and the other disciple", "Only Pharisees", "Her mother (a common guess, but not what John says here)", "Only Romans"]'::jsonb, 'Simon Peter and the other disciple', 'She ran and went to Simon Peter and the other disciple (John 20:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'Whom did Mary run to tell?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 1, 'Whom did Mary think Jesus was?', '["The gardener", "A ghost", "Peter (a common guess, but not what John says here)", "A soldier"]'::jsonb, 'The gardener', 'Supposing him to be the gardener (John 20:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 1
    AND q.prompt = 'Whom did Mary think Jesus was?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 2, 'What did Jesus breathe on them and say?', '["Receive the Holy Spirit", "Receive fear (a common guess, but not what John says here)", "Receive money", "Receive swords"]'::jsonb, 'Receive the Holy Spirit', 'He breathed on them and said to them, "Receive the Holy Spirit" (John 20:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus breathe on them and say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 2, 'What did Jesus say about those who have not seen and believe?', '["Cursed", "Blessed", "Neutral", "Ignorant"]'::jsonb, 'Blessed', 'Blessed are those who have not seen and yet have believed (John 20:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say about those who have not seen and believe?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 2, 'What did Jesus say?', '["Peace be with you", "Go fishing", "Why doubt?", "Touch me (a common guess, but not what John says here)"]'::jsonb, 'Peace be with you', 'Jesus said to them, "Peace be with you" (John 20:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 2, 'What did Jesus show them?', '["Only face", "Only feet", "Coins (a common guess, but not what John says here)", "His hands and side"]'::jsonb, 'His hands and side', 'He showed them his hands and his side (John 20:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus show them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 2, 'What did Jesus tell Thomas to do?', '["Believe blindly", "Never touch", "Put finger here, and see my hands; put out hand, place in side", "Go away (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'Put finger here, and see my hands; put out hand, place in side', 'Put your finger here, and see my hands; and put out your hand, and place it in my side (John 20:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus tell Thomas to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 2, 'What did Thomas answer?', '["My Lord and my God!", "A ghost! (a common guess, but not what John says here)", "Prove it", "Who are you?"]'::jsonb, 'My Lord and my God!', 'Thomas answered him, "My Lord and my God!" (John 20:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Thomas answer?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 2, 'What did Thomas say he needed to see?', '["The temple", "Angels (a common guess, but not what John says here)", "Pilate", "The mark of nails in hands and put finger in side"]'::jsonb, 'The mark of nails in hands and put finger in side', 'Unless I see in his hands the mark of the nails… I will never believe (John 20:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Thomas say he needed to see?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 2, 'What power did Jesus give about forgiveness?', '["If you forgive anyone''s sins, they are forgiven", "No forgiveness (a common guess, but not what John says here)", "Only priests in Rome", "Only angels forgive"]'::jsonb, 'If you forgive anyone''s sins, they are forgiven', 'If you forgive the sins of any, they are forgiven them (John 20:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'What power did Jesus give about forgiveness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 2, 'When were disciples gathered on first day of week?', '["Doors locked for fear of Jews", "Open festival", "By the sea (a common guess, but not what John says here)", "Temple courts"]'::jsonb, 'Doors locked for fear of Jews', 'On the evening of that day… the doors being locked where the disciples were (John 20:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'When were disciples gathered on first day of week?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 2, 'Who was not there when Jesus came?', '["Judas", "Mary (a common guess, but not what John says here)", "Peter", "Thomas"]'::jsonb, 'Thomas', 'Now Thomas… was not with them when Jesus came (John 20:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 2
    AND q.prompt = 'Who was not there when Jesus came?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 3, 'How does Mary mistaking Jesus show?', '["Jesus disguised badly", "No theology", "Mary blind (a common guess, but not what John says here)", "Grief and hope — recognition at name"]'::jsonb, 'Grief and hope — recognition at name', 'She turned and said… Rabboni (John 20:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Mary mistaking Jesus show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 3, 'How does Thomas'' doubt help readers?', '["Honest faith — Jesus meets doubt with wounds", "Only Thomas doubts", "Thomas is villain", "Doubt is blessed (a common guess, but not what John says here)"]'::jsonb, 'Honest faith — Jesus meets doubt with wounds', 'Put your finger here (John 20:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Thomas'' doubt help readers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 3, 'How does peace and Spirit relate to new creation?', '["No Genesis echo", "Spirit only later", "Only Pentecost (a common guess, but not what John says here)", "Easter evening as new creation — breath like Genesis"]'::jsonb, 'Easter evening as new creation — breath like Genesis', 'He breathed on them… Receive the Holy Spirit (John 20:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does peace and Spirit relate to new creation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 3, 'How does race between Peter and beloved disciple show?', '["Only Peter ran", "Contradiction (a common guess, but not what John says here)", "No beloved disciple", "Humor and eyewitness detail — Peter still enters first"]'::jsonb, 'Humor and eyewitness detail — Peter still enters first', 'The other disciple… outran Peter (John 20:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does race between Peter and beloved disciple show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 3, 'Theologically, what does empty tomb prove?', '["Only myth (a common guess, but not what John says here)", "Resurrection body — not merely spiritualized", "No body matters", "Disciples stole always"]'::jsonb, 'Resurrection body — not merely spiritualized', 'The linen cloths lying there (John 20:6–7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'Theologically, what does empty tomb prove?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 3, 'What christological height in Thomas'' confession?', '["Only angel", "Only man (a common guess, but not what John says here)", "My God — highest title", "Only teacher"]'::jsonb, 'My God — highest title', 'My Lord and my God! (John 20:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'What christological height in Thomas'' confession?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 3, 'What does folded face cloth suggest?', '["No meaning", "Thieves care", "Random (a common guess, but not what John says here)", "Orderly resurrection — not grave robbery chaos"]'::jsonb, 'Orderly resurrection — not grave robbery chaos', 'The face cloth… folded in a place by itself (John 20:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does folded face cloth suggest?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 3, 'What does forgiveness authority mean for church?', '["No forgiveness (a common guess, but not what John says here)", "Only God forgives ever", "Office of keys — debated among traditions", "Unlimited human power"]'::jsonb, 'Office of keys — debated among traditions', 'If you forgive… (John 20:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does forgiveness authority mean for church?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 3, 'What does not clinging yet mean?', '["Ascension theology — relationship changes but real", "Gnosticism", "Mary sin (a common guess, but not what John says here)", "No resurrection"]'::jsonb, 'Ascension theology — relationship changes but real', 'Do not cling to me (John 20:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does not clinging yet mean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 3, 'Why did John say these were written?', '["That you may believe Jesus is the Christ, the Son of God, and have life in his name", "Only politics", "For entertainment", "Only history (a common guess, but not what John says here) (does not match John’s wording in this verse)"]'::jsonb, 'That you may believe Jesus is the Christ, the Son of God, and have life in his name', 'These are written so that you may believe that Jesus is the Christ, the Son of God (John 20:31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why did John say these were written?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 4, 'How does Mary as apostle to apostles function?', '["Only men preach", "Women silent", "First witness — women in resurrection mission", "Mary lied (a common guess, but not what John says here)"]'::jsonb, 'First witness — women in resurrection mission', 'Mary Magdalene went and announced… (John 20:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Mary as apostle to apostles function?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 4, 'How does Spirit given before Pentecost relate to Luke-Acts?', '["Harmonization debates — symbolic, anticipatory, or sacramental", "Contradicts Acts", "Only Pentecost (a common guess, but not what John says here) (does not match John’s wording in this verse)", "No Spirit in John"]'::jsonb, 'Harmonization debates — symbolic, anticipatory, or sacramental', 'Receive the Holy Spirit (John 20:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Spirit given before Pentecost relate to Luke-Acts?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 4, 'How does blessed are those not seeing encourage?', '["Only apostles blessed", "Curses moderns (a common guess, but not what John says here)", "Later generations — faith without sight", "Sight required"]'::jsonb, 'Later generations — faith without sight', 'Blessed are those who have not seen and yet have believed (John 20:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does blessed are those not seeing encourage?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 4, 'How does locked doors show risen body?', '["No body (a common guess, but not what John says here)", "Ghost only", "Doors stayed locked forever", "Jesus appears — glorified body properties"]'::jsonb, 'Jesus appears — glorified body properties', 'The doors being locked… Jesus came and stood among them (John 20:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does locked doors show risen body?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 4, 'How does second appearance for Thomas show patience?', '["Thomas excommunicated", "Jesus accommodates doubt — pastoral model", "Doubt condemned always", "Only one chance (a common guess, but not what John says here)"]'::jsonb, 'Jesus accommodates doubt — pastoral model', 'Eight days later… (John 20:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does second appearance for Thomas show patience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 4, 'Scholarly debate: 20:23 and church structure?', '["All agree (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Debates on apostolic unique vs. congregational forgiveness", "Only Catholic", "No forgiveness text"]'::jsonb, 'Debates on apostolic unique vs. congregational forgiveness', 'If you forgive… (John 20:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'Scholarly debate: 20:23 and church structure?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 4, 'What does John''s purpose statement mean for canon?', '["Only signs save (a common guess, but not what John says here)", "Bible incomplete", "Gospel sufficiency for salvation knowledge", "Only tradition saves"]'::jsonb, 'Gospel sufficiency for salvation knowledge', 'That you may believe… and that by believing you may have life (John 20:31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does John''s purpose statement mean for canon?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 4, 'What does ascending to Father mean for theology?', '["Only spirit (a common guess, but not what John says here)", "Session — exaltation continues Christology", "No ascension", "Only descent"]'::jsonb, 'Session — exaltation continues Christology', 'I am ascending to my Father (John 20:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does ascending to Father mean for theology?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 4, 'What does joy of disciples show?', '["Doubt forever", "Resurrection faith — fear to joy", "Only sadness", "No emotion (a common guess, but not what John says here)"]'::jsonb, 'Resurrection faith — fear to joy', 'Then the disciples were glad when they saw the Lord (John 20:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does joy of disciples show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 4, 'What does peace be with you repeat?', '["Only once", "Military peace", "Priestly blessing — new covenant peace", "No peace (a common guess, but not what John says here)"]'::jsonb, 'Priestly blessing — new covenant peace', 'Peace be with you (John 20:19, 21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does peace be with you repeat?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 5, 'How does 20:31 faith-life order work?', '["Life without faith", "Works first (a common guess, but not what John says here)", "Only baptism", "Believing leads to life — not works first"]'::jsonb, 'Believing leads to life — not works first', 'By believing you may have life (John 20:31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 20:31 faith-life order work?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 5, 'How does Peter + beloved at tomb show unity?', '["Only one believer", "Apostolic and witness community — together", "Rivalry only (a common guess, but not what John says here)", "Contradiction"]'::jsonb, 'Apostolic and witness community — together', 'Simon Peter… the other disciple (John 20:2–3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Peter + beloved at tomb show unity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 5, 'How does garden setting recall crucifixion?', '["No link", "Random (a common guess, but not what John says here)", "Same geography — new creation continuity", "Different country"]'::jsonb, 'Same geography — new creation continuity', 'At the tomb… in the garden (John 20:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does garden setting recall crucifixion?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 5, 'How does life in his name summarize Gospel?', '["Only Israel (a common guess, but not what John says here)", "Eternal life gift through faith in Christ — thesis", "Only miracles", "Only ethics"]'::jsonb, 'Eternal life gift through faith in Christ — thesis', 'Life in his name (John 20:31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does life in his name summarize Gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 5, 'How many other signs did Jesus do in the presence of the disciples that are not written in this book?', '["None (a common guess, but not what John says here)", "Exactly twelve", "Exactly seven", "Many — not all recorded"]'::jsonb, 'Many — not all recorded', 'Now Jesus did many other signs in the presence of the disciples… not written in this book (John 20:30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'How many other signs did Jesus do in the presence of the disciples that are not written in this book?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 5, 'What did Jesus say to the disciples when he appeared in the locked room?', '["Peace be with you — as the Father sent me, even so I am sending you", "Hide forever (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Do not preach", "Stay in the room"]'::jsonb, 'Peace be with you — as the Father sent me, even so I am sending you', 'Peace be with you. As the Father has sent me, even so I am sending you (John 20:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus say to the disciples when he appeared in the locked room?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 5, 'What does Jesus send Mary as mean?', '["Silent mission", "Mary forbidden", "Mission — go tell brothers", "Only men sent (a common guess, but not what John says here)"]'::jsonb, 'Mission — go tell brothers', 'Go to my brothers (John 20:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Jesus send Mary as mean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 5, 'What does light darkness of first day evoke?', '["Sabbath only", "No creation (a common guess, but not what John says here)", "Evening only", "Creation week — Christ firstfruits of new creation"]'::jsonb, 'Creation week — Christ firstfruits of new creation', 'First day of the week (John 20:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does light darkness of first day evoke?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 5, 'What does nail prints apologetic defend?', '["Physical resurrection — not mere vision", "No wounds (a common guess, but not what John says here)", "Docetism true", "Vision only"]'::jsonb, 'Physical resurrection — not mere vision', 'See my hands (John 20:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does nail prints apologetic defend?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 20, 5, 'What does weeping outside tomb show?', '["Only Mary weeps", "Love and grief — human emotion of Jesus'' friends", "Sin (a common guess, but not what John says here)", "Weak faith"]'::jsonb, 'Love and grief — human emotion of Jesus'' friends', 'She turned around and saw Jesus standing (John 20:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 20
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does weeping outside tomb show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 1, 'How many fish were caught?', '["153 large fish", "Twelve", "Seven", "Two (a common guess, but not what John says here)"]'::jsonb, '153 large fish', 'So many fish… 153 large ones (John 21:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'How many fish were caught?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 1, 'How many times did Jesus ask Peter if he loved him?', '["Seven", "Once", "Three", "Twelve"]'::jsonb, 'Three', 'He said to him the third time, "Simon… do you love me?" (John 21:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'How many times did Jesus ask Peter if he loved him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 1, 'What did Jesus have on the fire?', '["Nothing", "Lamb only", "Pork (a common guess, but not what John says here)", "Fish and bread"]'::jsonb, 'Fish and bread', 'Jesus came and took the bread and gave it to them, and so with the fish (John 21:9–13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus have on the fire?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 1, 'What did Jesus say would happen when Peter was young?', '["He dressed himself and went where he wished", "He was silent", "He was poor (a common guess, but not what John says here)", "He was carried always"]'::jsonb, 'He dressed himself and went where he wished', 'When you were young, you used to dress yourself and walk wherever you wished (John 21:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say would happen when Peter was young?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 1, 'What did Jesus tell Peter to feed?', '["My lambs / my sheep", "Romans (a common guess, but not what John says here)", "His money", "Fish only"]'::jsonb, 'My lambs / my sheep', 'Feed my lambs… Tend my sheep… Feed my sheep (John 21:15–17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus tell Peter to feed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 1, 'What did Jesus tell them to cast?', '["Net on the right side of the boat", "Net on left", "Hooks only", "Spears (a common guess, but not what John says here)"]'::jsonb, 'Net on the right side of the boat', 'Cast the net on the right side of the boat, and you will find some (John 21:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus tell them to cast?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 1, 'What did they catch?', '["Nothing that night", "Whales", "A full net at night", "One fish"]'::jsonb, 'Nothing that night', 'That night they caught nothing (John 21:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did they catch?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 1, 'Where did Jesus reveal himself again?', '["Sea of Tiberias", "Jordan (a common guess, but not what John says here)", "Mediterranean", "Dead Sea"]'::jsonb, 'Sea of Tiberias', 'After this Jesus revealed himself again to the disciples at the Sea of Tiberias (John 21:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'Where did Jesus reveal himself again?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 1, 'Who stood on the beach in the morning?', '["A soldier", "Jesus", "Moses", "An angel"]'::jsonb, 'Jesus', 'Just as day was breaking, Jesus stood on the shore (John 21:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who stood on the beach in the morning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 1, 'Who went fishing?', '["Romans (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Only women", "Only Peter", "Simon Peter, Thomas, Nathanael, sons of Zebedee, two others"]'::jsonb, 'Simon Peter, Thomas, Nathanael, sons of Zebedee, two others', 'Simon Peter… I am going fishing… (John 21:2–3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who went fishing?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 2, 'How does charcoal fire echo chapter 18?', '["Different fire", "Restoration after denial — second chance", "No echo (a common guess, but not what John says here)", "Only cold"]'::jsonb, 'Restoration after denial — second chance', 'Charcoal fire… (John 21:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does charcoal fire echo chapter 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 2, 'Theologically, what does 153 fish mean?', '["No fish (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Only allegory everyone agrees", "Debated — symbolic fullness, or mundane detail — scholars differ", "Always one meaning"]'::jsonb, 'Debated — symbolic fullness, or mundane detail — scholars differ', 'Scholars debate significance of 153 (John 21:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'Theologically, what does 153 fish mean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 2, 'What did Jesus answer?', '["He is greater than you", "If it is my will that he remain until I come, what is that to you?", "He will betray (a common guess, but not what John says here) (does not match John’s wording in this verse)", "He will die soon"]'::jsonb, 'If it is my will that he remain until I come, what is that to you?', 'If it is my will that he remain until I come, what is that to you? You follow me! (John 21:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus answer?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 2, 'What did Jesus say about when Peter is old?', '["He will never die", "Another will dress him and carry him where he does not wish", "He will be rich (a common guess, but not what John says here)", "He will be king"]'::jsonb, 'Another will dress him and carry him where he does not wish', 'When you are old, you will stretch out your hands, and another will dress you (John 21:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say about when Peter is old?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 2, 'What did Jesus say to Peter about following?', '["Follow me", "Deny me", "Stay fishing", "Go to Rome"]'::jsonb, 'Follow me', 'Jesus said to him, "Follow me" (John 21:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say to Peter about following?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 2, 'What did Peter ask about the beloved disciple?', '["What about this man?", "Who is he? (a common guess, but not what John says here)", "Will he betray?", "Is he rich?"]'::jsonb, 'What about this man?', 'Peter… said to Jesus, "Lord, what about this man?" (John 21:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Peter ask about the beloved disciple?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 2, 'What did that signify?', '["Judas'' fate (a common guess, but not what John says here)", "Paul''s mission", "Peter''s natural death only", "By what kind of death Peter would glorify God"]'::jsonb, 'By what kind of death Peter would glorify God', 'This he said to show by what kind of death he was to glorify God (John 21:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did that signify?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 2, 'What does threefold love question heal?', '["Threefold denial — reconciliation", "Peter rejected (a common guess, but not what John says here)", "Random repetition", "Only rhetorical"]'::jsonb, 'Threefold denial — reconciliation', 'Do you love me?… three times (John 21:15–17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does threefold love question heal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 2, 'What rumor spread about the beloved disciple?', '["That he would not die", "That he was Peter", "That he was Paul (a common guess, but not what John says here)", "That he was Judas"]'::jsonb, 'That he would not die', 'So the saying spread among the brothers that this disciple would not die (John 21:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'What rumor spread about the beloved disciple?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 2, 'Who does the Gospel say wrote these things?', '["Moses", "This disciple who testifies", "Paul (a common guess, but not what John says here)", "Matthew"]'::jsonb, 'This disciple who testifies', 'This is the disciple who is bearing witness about these things, and who has written these things (John 21:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 2
    AND q.prompt = 'Who does the Gospel say wrote these things?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 3, 'How does Peter jump into water show?', '["Hates Jesus", "Cannot swim", "Eagerness to be with Jesus — impulsive love", "Fear (a common guess, but not what John says here)"]'::jsonb, 'Eagerness to be with Jesus — impulsive love', 'Peter… threw himself into the sea (John 21:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Peter jump into water show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 3, 'How does beloved disciple rumor correct?', '["Disciple is angel", "John clarifies Jesus did not say he wouldn''t die", "Contradiction (a common guess, but not what John says here)", "John confirms immortality"]'::jsonb, 'John clarifies Jesus did not say he wouldn''t die', 'Jesus did not say to him that he would not die (John 21:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does beloved disciple rumor correct?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 3, 'How does feed my sheep commission Peter?', '["Pastoral office — shepherd after failure", "Only angels (a common guess, but not what John says here)", "Only Judas feeds", "Peter excluded"]'::jsonb, 'Pastoral office — shepherd after failure', 'Feed my sheep (John 21:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does feed my sheep commission Peter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 3, 'How does fishing miracle echo chapter 6?', '["Only numbers", "Provision theme — risen Lord provides", "Contradicts ch.6", "No link (a common guess, but not what John says here)"]'::jsonb, 'Provision theme — risen Lord provides', 'Full nets again (John 21:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does fishing miracle echo chapter 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 3, 'How does shepherd language continue ch.10?', '["Breaks ch.10 (a common guess, but not what John says here)", "Peter replaces Jesus", "Only Jesus shepherd", "Jesus commissions Peter as under-shepherd"]'::jsonb, 'Jesus commissions Peter as under-shepherd', 'Tend my sheep (John 21:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does shepherd language continue ch.10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 3, 'Scholarly debate: chapter 21 appendix?', '["No debate (a common guess, but not what John says here) (does not match John’s wording in this verse)", "John never wrote", "Debates on unity of Gospel — majority see cohesive epilogue", "All reject ch.21"]'::jsonb, 'Debates on unity of Gospel — majority see cohesive epilogue', 'Scholarship discusses appendix function.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'Scholarly debate: chapter 21 appendix?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 3, 'What does Gospel truth claim in 21:24?', '["Eyewitness verification — we know testimony true", "Only angels", "Anonymous only", "No witness (a common guess, but not what John says here)"]'::jsonb, 'Eyewitness verification — we know testimony true', 'We know that his testimony is true (John 21:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Gospel truth claim in 21:24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 3, 'What does breakfast on beach mean?', '["Communion fellowship — Lord serves disciples", "Passover repeat", "Law meal (a common guess, but not what John says here)", "Only food"]'::jsonb, 'Communion fellowship — Lord serves disciples', 'Come and have breakfast (John 21:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does breakfast on beach mean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 3, 'What does follow me after prophecy mean?', '["Discipleship continues despite martyrdom knowledge", "Only death (a common guess, but not what John says here)", "No following", "Peter refuses"]'::jsonb, 'Discipleship continues despite martyrdom knowledge', 'Follow me (John 21:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does follow me after prophecy mean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 3, 'What does right side of boat symbolize?', '["No meaning", "Debated — favor, or just narrative detail", "All agree (a common guess, but not what John says here)", "Left is blessed"]'::jsonb, 'Debated — favor, or just narrative detail', 'Right side… (John 21:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does right side of boat symbolize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 4, 'How does epilogue close mission?', '["Only Paul continues", "From fishing to shepherding — from business to pastoral care", "Only fishing (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Mission ends"]'::jsonb, 'From fishing to shepherding — from business to pastoral care', 'Feed my sheep (John 21:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does epilogue close mission?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 4, 'How does net not breaking echo?', '["Abundance without loss — church imagery possible", "Contradicts Luke 5", "Net always breaks", "No meaning (a common guess, but not what John says here)"]'::jsonb, 'Abundance without loss — church imagery possible', 'The net was not torn (John 21:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does net not breaking echo?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 4, 'How does seaside setting recall call of fishermen?', '["No OT (a common guess, but not what John says here) (does not match John’s wording in this verse)", "Only Paul", "Random job", "Mark 1 / Luke 5 echo — new beginning after resurrection"]'::jsonb, 'Mark 1 / Luke 5 echo — new beginning after resurrection', 'I am going fishing (John 21:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does seaside setting recall call of fishermen?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 4, 'How does third "Do you love me" with greek words vary?', '["Copyist error only", "No variation (a common guess, but not what John says here)", "Only English issue", "Agapao vs phileo debate — pastoral nuance or translation"]'::jsonb, 'Agapao vs phileo debate — pastoral nuance or translation', 'Scholars debate verb nuances (John 21:15–17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does third "Do you love me" with greek words vary?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 4, 'How does what about this man teach?', '["Peter inferior forever", "Beloved disciple greater always", "Comparing callings is wrong — each follows Jesus", "Competition good (a common guess, but not what John says here)"]'::jsonb, 'Comparing callings is wrong — each follows Jesus', 'What is that to you? You follow me! (John 21:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does what about this man teach?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 4, 'What does 21:25 hyperbole mean?', '["Only myths left", "John failed (a common guess, but not what John says here) (does not match John’s wording in this verse)", "World cannot contain books — gospel selective not exhaustive", "Everything written"]'::jsonb, 'World cannot contain books — gospel selective not exhaustive', 'The world itself could not contain the books (John 21:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does 21:25 hyperbole mean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 4, 'What does Jesus reveal himself third time mean?', '["Echoes earlier appearances — completeness", "Contradicts seven", "No resurrection (a common guess, but not what John says here)", "Only two appearances"]'::jsonb, 'Echoes earlier appearances — completeness', 'This was now the third time that Jesus was revealed to the disciples (John 21:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Jesus reveal himself third time mean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 4, 'What does Lord know all things (21:17) show?', '["Jesus'' omniscience — Peter''s affirmation", "Jesus guesses", "Peter hides", "No deity (a common guess, but not what John says here)"]'::jsonb, 'Jesus'' omniscience — Peter''s affirmation', 'Lord, you know everything (John 21:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Lord know all things (21:17) show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 4, 'What does stretch hands prophecy mean?', '["Peter escapes (a common guess, but not what John says here)", "Peter crucifixion tradition — early church memory", "Only metaphor", "Natural death only"]'::jsonb, 'Peter crucifixion tradition — early church memory', 'By what kind of death… (John 21:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does stretch hands prophecy mean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 4, 'What evangelistic note in epilogue?', '["Restored Peter — failure is not final", "Only Paul matters", "No restoration", "Peter damned (a common guess, but not what John says here)"]'::jsonb, 'Restored Peter — failure is not final', 'Feed my sheep (John 21:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 4
    AND q.prompt = 'What evangelistic note in epilogue?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 5, 'How does Gospel end open-ended?', '["No application", "Ends in fear (a common guess, but not what John says here)", "You follow me — ongoing discipleship", "Story complete closed"]'::jsonb, 'You follow me — ongoing discipleship', 'You follow me! (John 21:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Gospel end open-ended?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 5, 'How does Peter''s death glorify God?', '["Glorify means only praise words", "God needs death (a common guess, but not what John says here)", "Only resurrection", "Martyrdom as witness — Father honored"]'::jsonb, 'Martyrdom as witness — Father honored', 'Glorify God (John 21:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Peter''s death glorify God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 5, 'How does beloved disciple identity function?', '["Witness authority for Gospel — apostolic eyewitness", "Judas wrote", "Anonymous forever", "Paul wrote (a common guess, but not what John says here)"]'::jsonb, 'Witness authority for Gospel — apostolic eyewitness', 'The disciple whom Jesus loved… (John 21:7, 20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does beloved disciple identity function?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 5, 'What christological note in miraculous catch?', '["Risen Lord is same who multiplied bread — continuity", "Different Jesus", "Spirit only", "No body (a common guess, but not what John says here)"]'::jsonb, 'Risen Lord is same who multiplied bread — continuity', 'It is the Lord! (John 21:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'What christological note in miraculous catch?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 5, 'What did Jesus say to the disciples when they were fishing?', '["Leave me", "Go home (a common guess, but not what John says here)", "Why are you lazy?", "Children, do you have any fish?"]'::jsonb, 'Children, do you have any fish?', 'Jesus said to them, "Children, do you have any fish?" They answered him, "No" (John 21:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus say to the disciples when they were fishing?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 5, 'What did the beloved disciple say when Peter said it is the Lord?', '["It is the Lord!", "It is a ghost", "It is Moses (a common guess, but not what John says here)", "It is a soldier"]'::jsonb, 'It is the Lord!', 'That disciple whom Jesus loved… said, "It is the Lord!" (John 21:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did the beloved disciple say when Peter said it is the Lord?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 5, 'What does remain until I come mean?', '["Nothing remains", "Eschatological reserve — some matters unknown", "Immortality promise", "Date setting (a common guess, but not what John says here)"]'::jsonb, 'Eschatological reserve — some matters unknown', 'Until I come (John 21:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does remain until I come mean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 5, 'What does true testimony ending affirm?', '["Only oral", "No truth (a common guess, but not what John says here)", "Gospels false", "Scripture reliability — Spirit-guided witness"]'::jsonb, 'Scripture reliability — Spirit-guided witness', 'We know that his testimony is true (John 21:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does true testimony ending affirm?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 5, 'What pastoral use in Peter''s restoration?', '["No second chances", "Only Peter (a common guess, but not what John says here)", "Denial is unforgivable", "Leaders who fail can be reinstated — grace"]'::jsonb, 'Leaders who fail can be reinstated — grace', 'Simon… do you love me? (John 21:15–17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'What pastoral use in Peter''s restoration?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 43, 21, 5, 'When Jesus served breakfast, what did he take and give?', '["Bread and fish", "Only meat (a common guess, but not what John says here)", "Only bread", "Only wine"]'::jsonb, 'Bread and fish', 'Jesus took the bread and gave it to them, and so with the fish (John 21:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 43
    AND q.chapter = 21
    AND q.difficulty_stage = 5
    AND q.prompt = 'When Jesus served breakfast, what did he take and give?'
);
