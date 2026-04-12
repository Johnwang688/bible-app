-- Re-seed after duplicate-prompt fix (clears partial rows from skipped INSERTs).
DELETE FROM quiz_question_bank WHERE book_number = 41;

-- ============================================================================
-- LOGOS LIGHT — Mark (book 41) quiz questions from quiz-questions/mark.json
-- ============================================================================
-- Idempotent: skips rows that already match (book_number, chapter, difficulty_stage, prompt).
-- ============================================================================

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 1, 1, 'How does Mark begin his Gospel?', '["The beginning of the gospel of Jesus Christ, the Son of God", "In the beginning was the Word", "The book of the genealogy of Jesus Christ", "I, Mark, a servant of Jesus Christ"]'::jsonb, 'The beginning of the gospel of Jesus Christ, the Son of God', 'Mark 1:1 opens "The beginning of the gospel of Jesus Christ, the Son of God."'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'How does Mark begin his Gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 1, 1, 'How long was Jesus in the wilderness being tempted by Satan?', '["40 days", "3 days", "7 days", "1 year"]'::jsonb, '40 days', 'Jesus was in the wilderness 40 days being tempted by Satan (Mark 1:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'How long was Jesus in the wilderness being tempted by Satan?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 1, 1, 'What did Jesus do early in the morning after a busy day of ministry?', '["He went to a desolate place to pray", "He preached to the crowds", "He taught in the synagogue", "He rested with the disciples"]'::jsonb, 'He went to a desolate place to pray', '"And rising very early in the morning… he went out to a desolate place, and there he prayed" (Mark 1:35).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus do early in the morning after a busy day of ministry?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 1, 1, 'What did Jesus say to Simon and Andrew when he called them?', '["Follow me, and I will make you become fishers of men", "Come and see where I live", "Repent, for the kingdom is near", "Leave your boats and follow God"]'::jsonb, 'Follow me, and I will make you become fishers of men', '"Follow me, and I will make you become fishers of men" (Mark 1:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say to Simon and Andrew when he called them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 1, 1, 'What did the voice from heaven say at Jesus''s baptism?', '["You are my beloved Son; with you I am well pleased", "This is my servant whom I have chosen", "Rise and be holy", "Go and preach the gospel"]'::jsonb, 'You are my beloved Son; with you I am well pleased', '"A voice came from heaven, You are my beloved Son; with you I am well pleased" (Mark 1:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the voice from heaven say at Jesus''s baptism?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 1, 2, 'After Jesus healed Simon''s mother-in-law, what did she do?', '["She served them", "She worshiped Jesus", "She told the town", "She went back to sleep"]'::jsonb, 'She served them', '"She began to serve them" (Mark 1:31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'After Jesus healed Simon''s mother-in-law, what did she do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 1, 2, 'In Mark 1, Jesus healed a man with leprosy. What did Jesus do before healing him?', '["He was moved with pity and touched him", "He prayed for him first", "He spoke from a distance", "He asked him about his sins"]'::jsonb, 'He was moved with pity and touched him', '"Moved with pity, he stretched out his hand and touched him" (Mark 1:41).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Mark 1, Jesus healed a man with leprosy. What did Jesus do before healing him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 1, 2, 'What did John say about the one coming after him?', '["He is mightier than I; I am not worthy to stoop down and untie his sandals", "He will judge all nations", "He will baptize with water", "He is my equal"]'::jsonb, 'He is mightier than I; I am not worthy to stoop down and untie his sandals', 'Mark 1:7: "After me comes he who is mightier than I, the strap of whose sandals I am not worthy to stoop down and untie."'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did John say about the one coming after him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 1, 2, 'What did John say the one coming after him would baptize with?', '["The Holy Spirit", "Water and fire", "Blood", "The Spirit and truth"]'::jsonb, 'The Holy Spirit', '"He will baptize you with the Holy Spirit" (Mark 1:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did John say the one coming after him would baptize with?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 1, 2, 'What did the people say after Jesus healed the man with an unclean spirit?', '["What is this? A new teaching with authority!", "He is the Messiah!", "This is witchcraft!", "We have never seen anything like this!"]'::jsonb, 'What is this? A new teaching with authority!', '"What is this? A new teaching with authority! He commands even the unclean spirits, and they obey him" (Mark 1:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the people say after Jesus healed the man with an unclean spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 1, 3, 'In Mark 1, Jesus heals many diseases and drives out demons at Simon''s house. What does his command of both physical and spiritual realms suggest?', '["That the kingdom of God has arrived in power, breaking the hold of both sickness and evil", "That Jesus was a skilled physician", "That demons cause all sickness", "That miracles were expected of prophets"]'::jsonb, 'That the kingdom of God has arrived in power, breaking the hold of both sickness and evil', 'Jesus''s comprehensive healing demonstrates that the kingdom of God has come to reverse all effects of the Fall.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'In Mark 1, Jesus heals many diseases and drives out demons at Simon''s house. What does his command of both physical and spiritual realms suggest?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 1, 3, 'Mark 1:1 calls Jesus "the Son of God." How does this title function at the start of the Gospel?', '["It signals to the reader Jesus''''s true identity before the human characters understand it — a key Markan device", "It summarizes the disciples'''' beliefs", "It quotes Psalm 2 directly", "It is simply a polite title in that culture"]'::jsonb, 'It signals to the reader Jesus''s true identity before the human characters understand it — a key Markan device', 'Mark uses dramatic irony: the reader knows who Jesus is (1:1; 1:11) long before the disciples confess it (8:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Mark 1:1 calls Jesus "the Son of God." How does this title function at the start of the Gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 1, 3, 'The crowd was astonished at Jesus''s teaching because "he taught as one who had authority, not as the scribes." What does this contrast reveal?', '["The scribes appealed to tradition and precedent; Jesus spoke on his own authority — a claim that implied divine commission", "Jesus was just more charismatic", "The scribes were all corrupt", "Jesus had more education"]'::jsonb, 'The scribes appealed to tradition and precedent; Jesus spoke on his own authority — a claim that implied divine commission', '"I say to you" (not "thus says the Lord") reflects Jesus speaking with inherent authority — a stunning contrast to rabbinic method.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'The crowd was astonished at Jesus''s teaching because "he taught as one who had authority, not as the scribes." What does this contrast reveal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 1, 3, 'What does the word "immediately" (euthys) tell us about Mark''s narrative style?', '["It creates urgency and rapid pacing, emphasizing the powerful breakthrough of God''''s kingdom", "It is only a Greek filler word", "It shows Mark was writing in a hurry", "It always signals a miracle"]'::jsonb, 'It creates urgency and rapid pacing, emphasizing the powerful breakthrough of God''s kingdom', 'Euthys appears ~41 times in Mark, driving the action forward; the kingdom is bursting into history with force.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the word "immediately" (euthys) tell us about Mark''s narrative style?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 1, 3, 'Why might Mark note that "wild animals" were with Jesus in the wilderness (1:13)?', '["It echoes the new Eden — the second Adam reigns over creation as God intended, and angels serve him", "It was just a description of the landscape", "It shows danger and testing", "It means Satan used animals to tempt him"]'::jsonb, 'It echoes the new Eden — the second Adam reigns over creation as God intended, and angels serve him', 'The wilderness + wild animals + angelic service echoes Isaiah 11:6–9 and Psalm 91:11–13 — the new Adam restoring creation order.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why might Mark note that "wild animals" were with Jesus in the wilderness (1:13)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 1, 4, 'Mark 1:2 quotes "I send my messenger before your face" from Malachi 3:1 and Isaiah 40:3. What is the theological claim being made?', '["Jesus is the LORD (YHWH) of those prophecies; John is the Elijah-like forerunner of God''''s own coming", "John is the Messiah the prophets predicted", "Isaiah 40 only refers to the return from Babylon", "This is a secondary fulfillment with no direct connection"]'::jsonb, 'Jesus is the LORD (YHWH) of those prophecies; John is the Elijah-like forerunner of God''s own coming', 'In Malachi 3:1 the Lord comes to his temple; John prepares the way for Jesus = Jesus is YHWH arriving in person.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Mark 1:2 quotes "I send my messenger before your face" from Malachi 3:1 and Isaiah 40:3. What is the theological claim being made?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 1, 4, 'Touching the leper (1:41) was a violation of purity law. What does this act reveal about Jesus''s approach to holiness?', '["Jesus''''s holiness is contagious — he does not become unclean by touching the unclean; he makes the unclean clean", "Jesus was ignorant of the law", "Purity laws were only symbolic", "Jesus was testing the Pharisees"]'::jsonb, 'Jesus''s holiness is contagious — he does not become unclean by touching the unclean; he makes the unclean clean', 'Unlike the OT purity system (defilement spreads outward), Jesus''s power spreads inward: holiness overcomes uncleanness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Touching the leper (1:41) was a violation of purity law. What does this act reveal about Jesus''s approach to holiness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 1, 4, 'What does Jesus''s early morning prayer (1:35) reveal about the relationship between his public ministry and his inner life?', '["His power and mission were sustained by intimate communion with the Father — ministry flowed from prayer", "He was simply an example for disciples to follow", "He prayed because he was tired", "Prayer was a cultural obligation"]'::jsonb, 'His power and mission were sustained by intimate communion with the Father — ministry flowed from prayer', 'Even after enormous success (1:32–34), Jesus withdrew to pray; his authority came from the Father, not his own power.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Jesus''s early morning prayer (1:35) reveal about the relationship between his public ministry and his inner life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 1, 4, 'Why is it significant that the unclean spirit, not the disciples, first publicly identifies Jesus as "the Holy One of God"?', '["It is part of Mark''''s Messianic Secret — supernatural beings know who Jesus is while humans remain blind", "The disciples later agreed", "The spirit was lying", "It is just a dramatic scene"]'::jsonb, 'It is part of Mark''s Messianic Secret — supernatural beings know who Jesus is while humans remain blind', 'Demons see through the flesh; people do not. This irony runs through Mark, where the wrong beings keep revealing the secret.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is it significant that the unclean spirit, not the disciples, first publicly identifies Jesus as "the Holy One of God"?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 1, 5, 'How does the opening of Mark 1 (baptism, temptation, calling disciples) structure itself as a new Exodus narrative?', '["Baptism through water (new Red Sea crossing), wilderness testing like Israel''''s 40 years, then calling a new community — Jesus recapitulates and succeeds where Israel failed", "It is only incidentally similar", "The Exodus is only in Matthew", "The wilderness lasted 40 days not 40 years so there is no connection"]'::jsonb, 'Baptism through water (new Red Sea crossing), wilderness testing like Israel''s 40 years, then calling a new community — Jesus recapitulates and succeeds where Israel failed', 'Mark 1 is a compressed new Exodus: the Spirit''s descent parallels the pillar of cloud, the wilderness echoes Numbers, and the calling mirrors Sinai.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does the opening of Mark 1 (baptism, temptation, calling disciples) structure itself as a new Exodus narrative?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 1, 5, 'Mark''s Gospel never records Jesus delivering a long sermon (unlike Matthew''s Sermon on the Mount). What does this structural choice say about Mark''s theological emphasis?', '["Mark emphasizes the deeds of the kingdom — what Jesus does reveals who he is — over extended teaching; the gospel is enacted, not only proclaimed", "Mark had less material available", "Mark was written for an uneducated audience", "Jesus gave no teaching in Mark"]'::jsonb, 'Mark emphasizes the deeds of the kingdom — what Jesus does reveals who he is — over extended teaching; the gospel is enacted, not only proclaimed', 'Mark''s structure foregrounds the inbreaking kingdom through action; proclamation and deed are inseparable, but deed is the lens.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'Mark''s Gospel never records Jesus delivering a long sermon (unlike Matthew''s Sermon on the Mount). What does this structural choice say about Mark''s theological emphasis?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 1, 5, 'The baptism scene (1:10–11) echoes Genesis 1:2 and Isaiah 42:1. What portrait of Jesus emerges from these allusions?', '["Jesus as the new creation agent (Spirit hovering as at creation) and the Servant of the Lord (Isaiah''''s beloved in whom God delights)", "Jesus is compared to Moses only", "These are coincidental verbal parallels", "Only Genesis 1 is relevant here"]'::jsonb, 'Jesus as the new creation agent (Spirit hovering as at creation) and the Servant of the Lord (Isaiah''s beloved in whom God delights)', 'The Spirit hovering echoes Gen. 1:2 (new creation); "beloved… well pleased" echoes Isa. 42:1 (Servant); both identities shape Mark''s Christology.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'The baptism scene (1:10–11) echoes Genesis 1:2 and Isaiah 42:1. What portrait of Jesus emerges from these allusions?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 2, 1, 'In Mark 2, who was lowered through the roof to Jesus?', '["A paralytic", "A blind man", "A leper", "A tax collector"]'::jsonb, 'A paralytic', 'Mark 2:3-4 describes a paralytic being lowered through the roof to Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'In Mark 2, who was lowered through the roof to Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 2, 2, 'Whom did Jesus call from the tax office in Mark 2?', '["Levi", "Peter", "Jairus", "Bartimaeus"]'::jsonb, 'Levi', 'Mark 2:14 says Jesus called Levi from the tax office.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'Whom did Jesus call from the tax office in Mark 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 2, 3, 'Why did Jesus heal the paralytic after first declaring his sins forgiven?', '["To show the Son of Man has authority on earth to forgive sins", "To impress the crowd with a miracle only", "To avoid speaking to the scribes", "To prove the man had perfect faith"]'::jsonb, 'To show the Son of Man has authority on earth to forgive sins', 'Mark 2:10-12 links the healing with Jesus''s authority to forgive sins.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why did Jesus heal the paralytic after first declaring his sins forgiven?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 2, 4, 'What do the sayings about fasting, cloth, and wineskins together teach in Mark 2?', '["Jesus''s ministry brings a new reality that cannot be contained by old forms", "The Law and the prophets are worthless", "Fasting is always forbidden", "Only tax collectors can follow Jesus"]'::jsonb, 'Jesus''s ministry brings a new reality that cannot be contained by old forms', 'Mark 2:18-22 uses bridegroom, patch, and wineskins imagery to show the newness of Jesus''s ministry.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'What do the sayings about fasting, cloth, and wineskins together teach in Mark 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 2, 5, 'How does Mark 2 portray Jesus''s authority in escalating ways?', '["He forgives sins, calls sinners, reorients fasting, and claims lordship over the Sabbath", "He limits himself to healing only", "He defers every decision to the scribes", "He withdraws from controversy entirely"]'::jsonb, 'He forgives sins, calls sinners, reorients fasting, and claims lordship over the Sabbath', 'Mark 2 moves from forgiving the paralytic to declaring the Son of Man Lord even of the Sabbath.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Mark 2 portray Jesus''s authority in escalating ways?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 3, 1, 'In Mark 3, what did Jesus heal in the synagogue?', '["A man with a withered hand", "A deaf child", "A leper", "A blind beggar"]'::jsonb, 'A man with a withered hand', 'Mark 3:1-5 records Jesus healing a man with a withered hand.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'In Mark 3, what did Jesus heal in the synagogue?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 3, 2, 'How many apostles did Jesus appoint in Mark 3?', '["Twelve", "Seven", "Ten", "Seventy"]'::jsonb, 'Twelve', 'Mark 3:13-19 says Jesus appointed twelve.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'How many apostles did Jesus appoint in Mark 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 3, 3, 'What is Jesus teaching with the saying about a house divided against itself?', '["Satan''s kingdom cannot stand if it is fighting itself", "Families should divide over the gospel", "The temple will soon fall", "The disciples should oppose one another"]'::jsonb, 'Satan''s kingdom cannot stand if it is fighting itself', 'Mark 3:23-27 answers the Beelzebul accusation by showing a divided kingdom cannot stand.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is Jesus teaching with the saying about a house divided against itself?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 3, 4, 'Why is blasphemy against the Holy Spirit treated as so serious in Mark 3?', '["It is the hardened attribution of God''s work in Jesus to an unclean spirit", "It refers to every careless word spoken in anger", "It means doubting one miracle", "It applies only to Judas"]'::jsonb, 'It is the hardened attribution of God''s work in Jesus to an unclean spirit', 'Mark 3:28-30 gives the warning in response to scribes saying Jesus had an unclean spirit.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is blasphemy against the Holy Spirit treated as so serious in Mark 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 3, 5, 'How does Mark 3 connect opposition, mission, and true belonging?', '["As hostility grows, Jesus forms the Twelve and defines family as those who do God''s will", "Opposition ends once the Twelve are appointed", "Jesus abandons public ministry for his relatives", "True family is limited to biological ties"]'::jsonb, 'As hostility grows, Jesus forms the Twelve and defines family as those who do God''s will', 'Mark 3 combines plots against Jesus, the appointing of the Twelve, and the redefinition of family.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Mark 3 connect opposition, mission, and true belonging?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 4, 1, 'What kind of soil produced fruit in Mark 4?', '["Good soil", "Rocky soil", "Thorny soil", "The path"]'::jsonb, 'Good soil', 'Mark 4:8 and 4:20 say the seed on good soil bore fruit.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'What kind of soil produced fruit in Mark 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 4, 2, 'What did Jesus say to the storm in Mark 4?', '["Peace, be still", "Be opened", "Come out of him", "Rise and walk"]'::jsonb, 'Peace, be still', 'Mark 4:39 says Jesus rebuked the wind and said to the sea, ''Peace, be still!'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say to the storm in Mark 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 4, 3, 'Why does Jesus explain the parable of the sower privately to the disciples?', '["They are being given insight into the secret of the kingdom", "They already understood everything perfectly", "The crowds had left permanently", "Only farmers may hear parables explained"]'::jsonb, 'They are being given insight into the secret of the kingdom', 'Mark 4:10-12 says the disciples are given the secret of the kingdom of God.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Jesus explain the parable of the sower privately to the disciples?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 4, 4, 'How do the seed parables and the calming of the storm fit together in Mark 4?', '["The kingdom grows by God''s power, and Jesus''s authority extends over creation itself", "Nature imagery has no connection to faith", "The storm interrupts the kingdom message by accident", "The disciples become fearless before Jesus speaks"]'::jsonb, 'The kingdom grows by God''s power, and Jesus''s authority extends over creation itself', 'Mark 4 moves from kingdom parables about growth to a demonstration of Jesus''s authority over the sea.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do the seed parables and the calming of the storm fit together in Mark 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 4, 5, 'Why do the disciples ask, ''Who then is this?'' after the storm?', '["Jesus has done what only God is portrayed as doing over the sea", "They forgot he was a teacher", "They think Elijah has returned", "They want to leave the boat immediately"]'::jsonb, 'Jesus has done what only God is portrayed as doing over the sea', 'Mark 4:41 shows the disciples stunned that even wind and sea obey Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why do the disciples ask, ''Who then is this?'' after the storm?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 5, 1, 'What was the name the demonized man gave for the spirits in Mark 5?', '["Legion", "Beelzebul", "Abaddon", "Mammon"]'::jsonb, 'Legion', 'Mark 5:9 says the demons answered, ''My name is Legion, for we are many.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'What was the name the demonized man gave for the spirits in Mark 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 5, 2, 'What did Jesus tell the delivered man to do after the demons were cast out?', '["Go home and tell what the Lord had done for him", "Follow in the boat with the disciples", "Go to Jerusalem silently", "Offer a sacrifice at the temple"]'::jsonb, 'Go home and tell what the Lord had done for him', 'Mark 5:19 says Jesus sent him home to tell what the Lord had done.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus tell the delivered man to do after the demons were cast out?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 5, 3, 'What do Jairus''s daughter and the bleeding woman together reveal about faith in Mark 5?', '["Faith clings to Jesus in both public desperation and hidden suffering", "Faith guarantees no delay or interruption", "Only synagogue rulers can receive help", "Women are healed without touching Jesus"]'::jsonb, 'Faith clings to Jesus in both public desperation and hidden suffering', 'Mark 5:21-43 interweaves the two stories around trusting Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What do Jairus''s daughter and the bleeding woman together reveal about faith in Mark 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 5, 4, 'Why does Jesus say, ''Do not fear, only believe'' after news of the girl''s death?', '["He calls Jairus to trust his power beyond the finality of death", "He means death is only apparent in every case", "He rebukes mourning itself as sinful", "He tells the crowd to leave town"]'::jsonb, 'He calls Jairus to trust his power beyond the finality of death', 'Mark 5:35-36 turns the crisis of death into a summons to faith.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Jesus say, ''Do not fear, only believe'' after news of the girl''s death?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 5, 5, 'How does Mark 5 present Jesus''s authority in layered form?', '["He rules over demons, chronic uncleanness, and even death", "He heals sickness but cannot command spirits", "He avoids Gentile regions entirely", "He depends on Jairus to perform the miracle"]'::jsonb, 'He rules over demons, chronic uncleanness, and even death', 'Mark 5 moves from Legion to the bleeding woman to Jairus''s daughter, showing sweeping authority.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Mark 5 present Jesus''s authority in layered form?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 6, 1, 'Where was Jesus rejected in Mark 6 (Mark 6:1)?', '["Nazareth", "Jerusalem", "Bethany", "Tyre"]'::jsonb, 'Nazareth', 'Mark 6:1-6 describes Jesus being rejected in Nazareth.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'Where was Jesus rejected in Mark 6 (Mark 6:1)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 6, 2, 'How did Jesus send out the Twelve in Mark 6?', '["Two by two", "One by one", "All together in one group", "Only after returning to Jerusalem"]'::jsonb, 'Two by two', 'Mark 6:7 says Jesus sent them out two by two.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'How did Jesus send out the Twelve in Mark 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 6, 3, 'What does Nazareth''s rejection show in Mark 6?', '["Familiarity can harden people against recognizing Jesus rightly", "Jesus cannot teach in small towns", "Miracles always produce faith", "His family already believed fully in him"]'::jsonb, 'Familiarity can harden people against recognizing Jesus rightly', 'Mark 6:3-6 shows Nazareth stumbling over Jesus''s ordinary background.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Nazareth''s rejection show in Mark 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 6, 4, 'Why is the feeding of the five thousand significant in Mark 6?', '["Jesus provides abundantly for the crowd like a shepherd for sheep without a shepherd", "It proves the disciples no longer need Jesus", "It replaces all teaching with miracles", "It happens mainly to impress Herod"]'::jsonb, 'Jesus provides abundantly for the crowd like a shepherd for sheep without a shepherd', 'Mark 6:34-44 highlights Jesus''s compassion and miraculous provision.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is the feeding of the five thousand significant in Mark 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 6, 5, 'How do the mission of the Twelve, John''s death, and the feeding miracle fit together in Mark 6?', '["Mission unfolds amid hostility, yet Jesus still shepherds and sustains his people", "John''s death ends the kingdom mission", "The disciples become independent miracle workers", "Herod responds in repentance and joins the crowd"]'::jsonb, 'Mission unfolds amid hostility, yet Jesus still shepherds and sustains his people', 'Mark 6 places the apostles'' mission and John''s martyrdom alongside Jesus''s compassionate feeding and sea crossing.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'How do the mission of the Twelve, John''s death, and the feeding miracle fit together in Mark 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 7, 1, 'According to Mark 7, what truly defiles a person?', '["What comes out of the heart", "Eating without washing hands", "Touching Gentiles", "Traveling on the Sabbath"]'::jsonb, 'What comes out of the heart', 'Mark 7:20-23 says what comes out of a person defiles him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Mark 7, what truly defiles a person?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 7, 2, 'What word did Jesus say when healing the deaf man in Mark 7?', '["Ephphatha", "Talitha cumi", "Abba", "Hosanna"]'::jsonb, 'Ephphatha', 'Mark 7:34 records Jesus saying ''Ephphatha,'' meaning ''Be opened.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'What word did Jesus say when healing the deaf man in Mark 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 7, 3, 'What is Jesus challenging in the dispute over tradition in Mark 7?', '["Human tradition that can nullify God''s commandment", "The authority of Moses altogether", "All washing as immoral", "Prayer in public settings"]'::jsonb, 'Human tradition that can nullify God''s commandment', 'Mark 7:8-13 criticizes traditions that set aside God''s word.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is Jesus challenging in the dispute over tradition in Mark 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 7, 4, 'Why is the Syrophoenician woman''s response so significant in Mark 7?', '["Her humble persistence shows surprising faith from outside Israel", "She demands political liberation first", "She proves the disciples fully understand Gentile mission", "She refuses Jesus''s help initially"]'::jsonb, 'Her humble persistence shows surprising faith from outside Israel', 'Mark 7:24-30 highlights her humble and trusting reply.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is the Syrophoenician woman''s response so significant in Mark 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 7, 5, 'How does Mark 7 widen the scope of Jesus''s ministry?', '["The chapter moves from purity debates to mercy reaching Gentile territory and bodily restoration", "Jesus narrows his work to synagogue life only", "The disciples stop traveling with Jesus", "Healing is replaced by parables alone"]'::jsonb, 'The chapter moves from purity debates to mercy reaching Gentile territory and bodily restoration', 'Mark 7 joins inner purity teaching with Gentile faith and the healing of the deaf man.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Mark 7 widen the scope of Jesus''s ministry?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 8, 1, 'How many baskets of leftovers were taken up after the four thousand were fed in Mark 8?', '["Seven", "Twelve", "Five", "Three"]'::jsonb, 'Seven', 'Mark 8:8 says seven baskets of leftovers were taken up.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'How many baskets of leftovers were taken up after the four thousand were fed in Mark 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 8, 2, 'What confession did Peter make in Mark 8?', '["You are the Christ", "You are Elijah", "You are a prophet only", "You are the Son of David"]'::jsonb, 'You are the Christ', 'Mark 8:29 records Peter saying, ''You are the Christ.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'What confession did Peter make in Mark 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 8, 3, 'Why does Jesus warn about the leaven of the Pharisees and of Herod in Mark 8?', '["Their influence is corrupting and marked by unbelief", "Their bread is ceremonially unclean", "The disciples have forgotten how to bake", "Herod controls the grain supply"]'::jsonb, 'Their influence is corrupting and marked by unbelief', 'Mark 8:15 warns against the leaven of the Pharisees and Herod.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Jesus warn about the leaven of the Pharisees and of Herod in Mark 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 8, 4, 'Why does Peter''s confession turn quickly into rebuke from Jesus?', '["Peter accepts Jesus''s title but rejects the suffering path of the Messiah", "Peter denies that Jesus performed miracles", "Peter wants to return to fishing", "Peter misunderstands the feeding miracle only"]'::jsonb, 'Peter accepts Jesus''s title but rejects the suffering path of the Messiah', 'Mark 8:29-33 shows Peter confessing Jesus yet resisting the prediction of suffering.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Peter''s confession turn quickly into rebuke from Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 8, 5, 'How does Mark 8 pivot the Gospel''s direction?', '["It moves from growing recognition of Jesus to the road of suffering and discipleship", "It ends all conflict with the Pharisees", "It shifts the story back to John the Baptist", "It replaces faith with political teaching"]'::jsonb, 'It moves from growing recognition of Jesus to the road of suffering and discipleship', 'Mark 8 centers on Peter''s confession, Jesus''s passion prediction, and the call to take up the cross.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Mark 8 pivot the Gospel''s direction?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 9, 1, 'Who appeared with Jesus at the transfiguration in Mark 9 (Mark 9:4)?', '["Moses and Elijah", "Abraham and David", "Isaiah and Jeremiah", "John and James"]'::jsonb, 'Moses and Elijah', 'Mark 9:4 says Moses and Elijah appeared with Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who appeared with Jesus at the transfiguration in Mark 9 (Mark 9:4)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 9, 2, 'What did the father of the afflicted boy cry out to Jesus in Mark 9?', '["I believe; help my unbelief", "Lord, teach us to pray", "Increase our bread", "Remember me in your kingdom"]'::jsonb, 'I believe; help my unbelief', 'Mark 9:24 records the father''s cry.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the father of the afflicted boy cry out to Jesus in Mark 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 9, 3, 'What does the transfiguration reveal about Jesus in Mark 9?', '["He is the beloved Son whose glory surpasses Moses and Elijah", "He is one prophet among many equals", "He will avoid suffering completely", "He has abandoned the disciples"]'::jsonb, 'He is the beloved Son whose glory surpasses Moses and Elijah', 'Mark 9:7 centers on the heavenly voice: ''This is my beloved Son. Listen to him.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the transfiguration reveal about Jesus in Mark 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 9, 4, 'Why could the disciples not cast out the unclean spirit from the boy?', '["This kind requires dependent prayer rather than self-confidence", "Jesus had removed all their authority", "The scribes were too strong", "The boy lacked any faith at all"]'::jsonb, 'This kind requires dependent prayer rather than self-confidence', 'Mark 9:28-29 explains that this kind comes out by prayer.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why could the disciples not cast out the unclean spirit from the boy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 9, 5, 'How does Mark 9 connect glory and discipleship?', '["The glorious Son still walks toward suffering and teaches humility, service, and radical holiness", "Glory means the cross is canceled", "Discipleship is mainly about public status", "The transfiguration replaces the need for faith"]'::jsonb, 'The glorious Son still walks toward suffering and teaches humility, service, and radical holiness', 'Mark 9 moves from the transfiguration to a passion prediction and teachings on humility and stumbling.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Mark 9 connect glory and discipleship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 10, 1, 'In Mark 10, what did blind Bartimaeus call Jesus?', '["Son of David", "Teacher from Nazareth", "Holy One of God", "King of Israel"]'::jsonb, 'Son of David', 'Mark 10:47 says Bartimaeus cried out, ''Jesus, Son of David, have mercy on me!'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'In Mark 10, what did blind Bartimaeus call Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 10, 2, 'What did Jesus say the rich man still lacked in Mark 10?', '["To sell what he had, give to the poor, and follow him", "A better knowledge of the Law", "A more respected family line", "A temple offering for cleansing"]'::jsonb, 'To sell what he had, give to the poor, and follow him', 'Mark 10:21 gives Jesus''s call to the rich man.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say the rich man still lacked in Mark 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 10, 3, 'How does Jesus redefine greatness in Mark 10?', '["Greatness is found in being servant of all", "Greatness comes from sitting nearest Rome''s power", "Greatness belongs to the wealthiest disciple", "Greatness is avoiding suffering"]'::jsonb, 'Greatness is found in being servant of all', 'Mark 10:43-45 says whoever wants to be great must be servant.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Jesus redefine greatness in Mark 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 10, 4, 'Why is Bartimaeus important at the end of Mark 10?', '["He responds with clear-sighted faith while many insiders still misunderstand Jesus''s way", "He replaces Peter as leader of the Twelve", "He refuses to follow after being healed", "He asks only for money from the crowd"]'::jsonb, 'He responds with clear-sighted faith while many insiders still misunderstand Jesus''s way', 'Mark 10:46-52 ends with Bartimaeus receiving sight and following Jesus on the way.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is Bartimaeus important at the end of Mark 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 10, 5, 'How does Mark 10 tie together marriage, children, wealth, and service?', '["Entering the kingdom requires humble reception and costly surrender rather than grasping control", "Each topic stands alone with no shared message", "Wealth solves the challenge of discipleship", "Children are used only as a side illustration"]'::jsonb, 'Entering the kingdom requires humble reception and costly surrender rather than grasping control', 'Mark 10 repeatedly opposes status, possession, and domination with childlike reception and servant discipleship.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Mark 10 tie together marriage, children, wealth, and service?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 11, 1, 'What did the crowds cry out as Jesus entered Jerusalem in Mark 11?', '["Hosanna", "Crucify him", "Alleluia forever", "Peace to Rome"]'::jsonb, 'Hosanna', 'Mark 11:9-10 records the crowd crying, ''Hosanna!'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the crowds cry out as Jesus entered Jerusalem in Mark 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 11, 2, 'What happened to the fig tree in Mark 11 after Jesus cursed it?', '["It withered from the roots", "It bore fruit immediately", "It was cut down by the disciples", "It was hidden from the crowd"]'::jsonb, 'It withered from the roots', 'Mark 11:20 says the fig tree had withered from the roots.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'What happened to the fig tree in Mark 11 after Jesus cursed it?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 11, 3, 'What does the cursing of the fig tree signify in Mark 11?', '["Judgment on fruitless religion linked with the temple scene", "A lesson against agriculture", "An act of anger with no symbolic meaning", "The end of all prayer"]'::jsonb, 'Judgment on fruitless religion linked with the temple scene', 'Mark 11 frames the temple cleansing with the fig tree episode, tying fruitlessness to judgment.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the cursing of the fig tree signify in Mark 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 11, 4, 'Why does Jesus drive out buyers and sellers from the temple in Mark 11?', '["God''s house is meant to be a house of prayer, not exploitation", "The market prices were too low", "Only priests were allowed to buy there", "He intended to end sacrifice that same day"]'::jsonb, 'God''s house is meant to be a house of prayer, not exploitation', 'Mark 11:15-17 says Jesus condemned turning the house of prayer into a den of robbers.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Jesus drive out buyers and sellers from the temple in Mark 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 11, 5, 'How do kingship, judgment, and prayer come together in Mark 11?', '["The messianic king enters Jerusalem, judges fruitless worship, and teaches trusting prayer", "The triumphal entry cancels all judgment themes", "Prayer replaces repentance entirely", "Jerusalem receives Jesus without resistance"]'::jsonb, 'The messianic king enters Jerusalem, judges fruitless worship, and teaches trusting prayer', 'Mark 11 joins the entry, temple action, fig tree, and teaching on prayer and forgiveness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'How do kingship, judgment, and prayer come together in Mark 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 12, 1, 'In Mark 12, what happened to the son in the parable of the vineyard tenants?', '["He was killed and thrown out of the vineyard", "He inherited the vineyard peacefully", "He became the new tenant", "He fled to another country"]'::jsonb, 'He was killed and thrown out of the vineyard', 'Mark 12:8 says the tenants killed the son and cast him out.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'In Mark 12, what happened to the son in the parable of the vineyard tenants?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 12, 2, 'What did Jesus say is the first commandment in Mark 12?', '["Hear, O Israel: the Lord our God, the Lord is one; love the Lord your God", "Love your neighbor as yourself", "Honor your father and mother", "Do not covet"]'::jsonb, 'Hear, O Israel: the Lord our God, the Lord is one; love the Lord your God', 'Mark 12:29-30 gives the first commandment in response to the scribe.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say is the first commandment in Mark 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 12, 3, 'What is the force of the parable of the vineyard tenants in Mark 12?', '["Israel''s leaders are rejecting God''s messengers and ultimately his beloved Son", "The vineyard owner is unjust to his workers", "Jesus is teaching agricultural technique", "The crowds are being praised for their leadership"]'::jsonb, 'Israel''s leaders are rejecting God''s messengers and ultimately his beloved Son', 'Mark 12:1-12 exposes the leaders through the parable.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the force of the parable of the vineyard tenants in Mark 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 12, 4, 'Why is the widow''s offering praised in Mark 12?', '["She gave out of her poverty with wholehearted trust", "She gave more money than anyone else", "She was publicly honored by the scribes", "Her gift fulfilled a temple tax requirement"]'::jsonb, 'She gave out of her poverty with wholehearted trust', 'Mark 12:41-44 says she gave more than the others because she gave all she had.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is the widow''s offering praised in Mark 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 12, 5, 'How does Mark 12 contrast false and true devotion?', '["Leaders seek status and reject the Son, while a poor widow gives herself wholly to God", "The scribes and widow are equally commended", "True devotion is measured by public recognition", "The chapter rejects all questions about the Law"]'::jsonb, 'Leaders seek status and reject the Son, while a poor widow gives herself wholly to God', 'Mark 12 moves from hostile leaders to the widow''s humble offering as a living contrast.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Mark 12 contrast false and true devotion?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 13, 1, 'What did Jesus predict about the temple in Mark 13 (Mark 13:2)?', '["Not one stone would be left on another", "It would be rebuilt larger immediately", "It would become the apostles'' headquarters", "It would stand untouched until the end"]'::jsonb, 'Not one stone would be left on another', 'Mark 13:2 foretells that not one stone would be left on another.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus predict about the temple in Mark 13 (Mark 13:2)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 13, 2, 'What did Jesus say about knowing the day or hour in Mark 13?', '["No one knows, not even the angels in heaven nor the Son, but only the Father", "The disciples can calculate it from signs", "The scribes have hidden the date", "It will come at the next Passover"]'::jsonb, 'No one knows, not even the angels in heaven nor the Son, but only the Father', 'Mark 13:32 says only the Father knows the day or hour.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say about knowing the day or hour in Mark 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 13, 3, 'What is the purpose of Jesus''s warnings about deception and tribulation in Mark 13?', '["To call disciples to endurance and vigilance", "To encourage panic and retreat", "To end all mission work", "To prove history is meaningless"]'::jsonb, 'To call disciples to endurance and vigilance', 'Mark 13 repeatedly urges watchfulness and endurance amid turmoil.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the purpose of Jesus''s warnings about deception and tribulation in Mark 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 13, 4, 'Why does Jesus use the image of a man away on a journey in Mark 13?', '["To stress readiness because the master may return at any time", "To explain Roman travel customs", "To praise servants who sleep without concern", "To show the disciples should leave Jerusalem immediately forever"]'::jsonb, 'To stress readiness because the master may return at any time', 'Mark 13:34-37 uses the doorkeeper image to command watchfulness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Jesus use the image of a man away on a journey in Mark 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 13, 5, 'How does Mark 13 shape discipleship in an uncertain age?', '["Followers of Jesus must endure, discern, and stay awake without pretending to control the timetable", "The end makes obedience unnecessary", "Only experts can remain faithful", "Tribulation means the gospel mission has failed"]'::jsonb, 'Followers of Jesus must endure, discern, and stay awake without pretending to control the timetable', 'Mark 13 combines suffering, proclamation, and vigilance without date-setting.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Mark 13 shape discipleship in an uncertain age?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 14, 1, 'Who anointed Jesus with expensive ointment in Mark 14?', '["A woman at Bethany", "Mary Magdalene", "Martha", "Herodias"]'::jsonb, 'A woman at Bethany', 'Mark 14:3 describes a woman anointing Jesus at Bethany.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who anointed Jesus with expensive ointment in Mark 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 14, 2, 'What sign did Jesus give for finding the place of the Passover meal in Mark 14?', '["A man carrying a jar of water", "A fig tree by the road", "A servant with a lamp", "A Roman guard at the gate"]'::jsonb, 'A man carrying a jar of water', 'Mark 14:13 says the disciples would meet a man carrying a jar of water.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'What sign did Jesus give for finding the place of the Passover meal in Mark 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 14, 3, 'What does Gethsemane reveal about Jesus in Mark 14?', '["He faces overwhelming anguish yet submits to the Father''s will", "He avoids prayer in the crisis", "He asks the disciples to lead him", "He decides not to suffer after all"]'::jsonb, 'He faces overwhelming anguish yet submits to the Father''s will', 'Mark 14:32-36 shows Jesus deeply distressed yet obedient in prayer.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Gethsemane reveal about Jesus in Mark 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 14, 4, 'Why is the anointing at Bethany important in Mark 14?', '["It interprets Jesus''s approaching death as burial and devotion", "It proves the disciples understand the cross fully", "It replaces the Passover meal", "It causes Judas to repent"]'::jsonb, 'It interprets Jesus''s approaching death as burial and devotion', 'Mark 14:8 says the woman anointed Jesus beforehand for burial.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is the anointing at Bethany important in Mark 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 14, 5, 'How does Mark 14 portray the disciples around Jesus''s suffering?', '["They misunderstand, sleep, flee, and deny, while Jesus remains faithful", "They stand strong without wavering", "They successfully defend Jesus with the sword", "They replace Judas with a better treasurer before the arrest"]'::jsonb, 'They misunderstand, sleep, flee, and deny, while Jesus remains faithful', 'Mark 14 contrasts Jesus''s obedience with the disciples'' weakness at multiple points.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Mark 14 portray the disciples around Jesus''s suffering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 15, 1, 'Who was released instead of Jesus in Mark 15?', '["Barabbas", "Simon of Cyrene", "Joseph of Arimathea", "Jairus"]'::jsonb, 'Barabbas', 'Mark 15:6-15 says Pilate released Barabbas instead of Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who was released instead of Jesus in Mark 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 15, 2, 'What title was written over Jesus on the cross in Mark 15?', '["The King of the Jews", "The Son of God", "The Holy One of Israel", "King of Nazareth"]'::jsonb, 'The King of the Jews', 'Mark 15:26 says the inscription was ''The King of the Jews.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'What title was written over Jesus on the cross in Mark 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 15, 3, 'Why is the centurion''s confession at the cross so significant in Mark 15?', '["A Gentile observer recognizes something true about Jesus at the moment of his death", "It proves Pilate became a disciple", "It replaces the need for resurrection", "It means the crowd also repented immediately"]'::jsonb, 'A Gentile observer recognizes something true about Jesus at the moment of his death', 'Mark 15:39 records the centurion saying, ''Truly this man was the Son of God.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the centurion''s confession at the cross so significant in Mark 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 15, 4, 'What is the significance of the temple veil being torn in Mark 15?', '["Jesus''s death marks decisive access and judgment in relation to the temple order", "The priests opened it for the crowd", "It shows the earthquake was the main event", "It signals the end of all worship"]'::jsonb, 'Jesus''s death marks decisive access and judgment in relation to the temple order', 'Mark 15:38 says the veil of the temple was torn in two from top to bottom.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'What is the significance of the temple veil being torn in Mark 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 15, 5, 'How does Mark 15 present Jesus''s kingship?', '["He is mocked as king yet truly reigns through suffering obedience", "His kingship is proven by military victory", "The title on the cross is only accidental irony with no meaning", "He rejects all connection to kingship"]'::jsonb, 'He is mocked as king yet truly reigns through suffering obedience', 'Mark 15 saturates the passion with kingly language while showing Jesus enthroned through the cross.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Mark 15 present Jesus''s kingship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 16, 1, 'Who went to the tomb early on the first day of the week in Mark 16?', '["Mary Magdalene, Mary the mother of James, and Salome", "Peter, James, and John", "Joseph of Arimathea and Nicodemus", "The centurion and Pilate"]'::jsonb, 'Mary Magdalene, Mary the mother of James, and Salome', 'Mark 16:1 names the women who went to the tomb.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who went to the tomb early on the first day of the week in Mark 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 16, 2, 'What message did the young man at the tomb give in Mark 16?', '["Jesus has risen and is going before the disciples into Galilee", "Jesus has been taken to Jerusalem", "The body must be reburied", "The disciples should remain in hiding"]'::jsonb, 'Jesus has risen and is going before the disciples into Galilee', 'Mark 16:6-7 announces the resurrection and the meeting in Galilee.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'What message did the young man at the tomb give in Mark 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 16, 3, 'Why is the empty tomb message in Mark 16 so important?', '["It announces that the crucified Jesus has truly been raised", "It proves the women visited the wrong tomb", "It means the story ends in defeat", "It shows the disciples had already seen Jesus before dawn"]'::jsonb, 'It announces that the crucified Jesus has truly been raised', 'Mark 16:6 says plainly, ''He has risen. He is not here.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is the empty tomb message in Mark 16 so important?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 16, 4, 'What is the effect of the women''s fear and astonishment at the tomb in Mark 16?', '["It underscores the shocking, world-altering reality of the resurrection", "It denies that the resurrection happened", "It proves they lacked any loyalty to Jesus", "It turns the story into a legend about angels only"]'::jsonb, 'It underscores the shocking, world-altering reality of the resurrection', 'Mark 16:8 emphasizes trembling and astonishment at the empty tomb.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'What is the effect of the women''s fear and astonishment at the tomb in Mark 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 16, 5, 'How does Mark''s ending fit the Gospel''s overall call to discipleship?', '["The risen Jesus goes ahead, and readers are left with the urgent question of faithful response", "The story closes every question with no tension remaining", "Fear has the final word instead of resurrection", "Discipleship is replaced by private spirituality"]'::jsonb, 'The risen Jesus goes ahead, and readers are left with the urgent question of faithful response', 'Mark 16 leaves the reader facing the resurrection announcement and the call to respond in faith.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Mark''s ending fit the Gospel''s overall call to discipleship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 2, 1, 'What kind of man was lowered through the roof to Jesus in Mark 2?', '["A paralytic", "A blind man", "A leper", "A tax collector"]'::jsonb, 'A paralytic', 'In Mark 2, friends lowered a paralyzed man through the roof so Jesus could heal him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'What kind of man was lowered through the roof to Jesus in Mark 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 2, 1, 'Whom did Jesus call from the tax office in Mark 2?', '["Levi", "Peter", "Jairus", "Bartimaeus"]'::jsonb, 'Levi', 'Jesus called Levi while he was sitting at the tax office.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'Whom did Jesus call from the tax office in Mark 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 2, 1, 'What did Jesus say the Son of Man is Lord of in Mark 2?', '["The Sabbath", "The temple tax", "The Jordan River", "The synagogue scrolls"]'::jsonb, 'The Sabbath', 'Jesus declared that the Son of Man is Lord even of the Sabbath.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say the Son of Man is Lord of in Mark 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 2, 1, 'What did Jesus say to the paralytic before healing him?', '["Son, your sins are forgiven", "Rise and walk to Galilee", "Your faith has made you rich", "Go and wash in the Jordan"]'::jsonb, 'Son, your sins are forgiven', 'Jesus first announced forgiveness before commanding the paralytic to rise.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say to the paralytic before healing him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 2, 2, 'What did Jesus say he came to call in Mark 2?', '["Sinners", "The healthy only", "Roman soldiers", "Temple builders"]'::jsonb, 'Sinners', 'Jesus said he came not to call the righteous, but sinners to repentance.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say he came to call in Mark 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 2, 2, 'What did Jesus compare himself to when explaining why he ate with sinners?', '["A physician", "A farmer", "A shepherd king", "A temple priest"]'::jsonb, 'A physician', 'Jesus said those who are sick need a physician, not those who are healthy.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus compare himself to when explaining why he ate with sinners?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 2, 2, 'What cannot be put into old wineskins according to Jesus in Mark 2?', '["New wine", "Old grain", "Fresh oil", "Temple incense"]'::jsonb, 'New wine', 'Jesus taught that new wine must be put into new wineskins.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What cannot be put into old wineskins according to Jesus in Mark 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 2, 2, 'What were the disciples doing in the grainfields that caused controversy?', '["Plucking heads of grain", "Building booths", "Baptizing crowds", "Lighting lamps"]'::jsonb, 'Plucking heads of grain', 'Jesus'' disciples were plucking grain on the Sabbath, which led to questions from the Pharisees.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What were the disciples doing in the grainfields that caused controversy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 2, 3, 'Why did Jesus heal the paralytic in front of the crowd?', '["To show the Son of Man has authority on earth to forgive sins", "To prove Levi was honest", "To quiet the storm outside", "To appoint new priests"]'::jsonb, 'To show the Son of Man has authority on earth to forgive sins', 'Jesus healed the paralytic as visible proof of his authority to forgive sins.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why did Jesus heal the paralytic in front of the crowd?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 2, 3, 'What example from David did Jesus use in the Sabbath debate?', '["David ate the consecrated bread when he was in need", "David built the temple on the Sabbath", "David baptized in the wilderness", "David refused to enter the synagogue"]'::jsonb, 'David ate the consecrated bread when he was in need', 'Jesus referred to David eating the bread of the Presence when he and his companions were hungry.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What example from David did Jesus use in the Sabbath debate?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 2, 3, 'How did the people respond after the paralytic was healed?', '["They were amazed and glorified God", "They asked for Roman guards", "They stoned the roof-openers", "They left the house in anger"]'::jsonb, 'They were amazed and glorified God', 'The crowd was amazed and glorified God, saying they had never seen anything like it.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'How did the people respond after the paralytic was healed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 2, 3, 'What picture did Jesus use for why his disciples were not fasting?', '["The bridegroom is with them", "The harvest had already ended", "The temple was closed", "The sea was too rough"]'::jsonb, 'The bridegroom is with them', 'Jesus said wedding guests do not fast while the bridegroom is with them.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What picture did Jesus use for why his disciples were not fasting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 2, 4, 'What did the scribes think in their hearts when Jesus forgave the paralytic?', '["That he was blaspheming", "That he should be crowned king", "That Levi should follow him", "That the roof should be repaired"]'::jsonb, 'That he was blaspheming', 'The scribes reasoned that only God can forgive sins, so they viewed Jesus'' words as blasphemy.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'What did the scribes think in their hearts when Jesus forgave the paralytic?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 2, 4, 'What did Jesus say about the Sabbath''s purpose?', '["The Sabbath was made for man", "The Sabbath was made for angels", "The Sabbath was made for Caesar", "The Sabbath was made for the temple market"]'::jsonb, 'The Sabbath was made for man', 'Jesus taught that the Sabbath serves human good, not the other way around.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'What did Jesus say about the Sabbath''s purpose?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 2, 4, 'What does the patch-on-old-garment image teach in Mark 2?', '["Jesus'' new work cannot simply be attached to the old system without tearing it", "Old garments should never be repaired", "The law should be discarded immediately", "Only priests may wear new cloth"]'::jsonb, 'Jesus'' new work cannot simply be attached to the old system without tearing it', 'The image of unshrunk cloth shows the incompatibility of merely patching Jesus'' new work onto the old order.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does the patch-on-old-garment image teach in Mark 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 2, 4, 'What did Jesus know when he answered the scribes without hearing them speak aloud?', '["Their inward reasoning", "The Roman governor''s plans", "Levi''s tax records", "The weather over Galilee"]'::jsonb, 'Their inward reasoning', 'Jesus perceived in his spirit what the scribes were reasoning within themselves.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'What did Jesus know when he answered the scribes without hearing them speak aloud?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 2, 5, 'How did the paralytic leave after Jesus healed him?', '["He rose, took up his mat, and went out before them all", "He had to be carried home again", "He stayed for seven days in the house", "He went directly to the temple treasury"]'::jsonb, 'He rose, took up his mat, and went out before them all', 'The man immediately rose, picked up his mat, and walked out in front of everyone.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How did the paralytic leave after Jesus healed him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 2, 5, 'What was Levi doing when Jesus called him?', '["Sitting at the tax office", "Fishing by the sea", "Praying in the synagogue", "Hiding in the hills"]'::jsonb, 'Sitting at the tax office', 'Levi was seated at the tax office when Jesus said, ''Follow me.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What was Levi doing when Jesus called him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 2, 5, 'What happened after Levi followed Jesus?', '["Jesus ate at Levi''s house with many tax collectors and sinners", "Levi returned to collecting taxes", "The Pharisees praised Jesus openly", "A storm interrupted the meal"]'::jsonb, 'Jesus ate at Levi''s house with many tax collectors and sinners', 'Levi hosted a meal where many tax collectors and sinners were reclining with Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What happened after Levi followed Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 2, 5, 'What did Jesus say would happen to the bridegroom one day?', '["He would be taken away, and then they would fast", "He would build a bigger synagogue", "He would return to Nazareth forever", "He would crown Levi king"]'::jsonb, 'He would be taken away, and then they would fast', 'Jesus pointed ahead to his departure, saying then his disciples would fast.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus say would happen to the bridegroom one day?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 3, 1, 'What condition did the man in the synagogue have in Mark 3?', '["A withered hand", "Leprosy", "Blindness", "Paralysis"]'::jsonb, 'A withered hand', 'Jesus healed a man with a withered hand in the synagogue.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'What condition did the man in the synagogue have in Mark 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 3, 1, 'How many apostles did Jesus appoint in Mark 3?', '["Twelve", "Seven", "Seventy", "Three"]'::jsonb, 'Twelve', 'Jesus appointed twelve to be with him and to be sent out to preach.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'How many apostles did Jesus appoint in Mark 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 3, 1, 'Whom did the scribes say empowered Jesus to cast out demons?', '["Beelzebul", "Moses", "Elijah", "Caesar"]'::jsonb, 'Beelzebul', 'The scribes accused Jesus of casting out demons by Beelzebul.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'Whom did the scribes say empowered Jesus to cast out demons?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 3, 1, 'Who did Jesus say are his true family?', '["Those who do the will of God", "Only his brothers by blood", "The twelve alone", "All scribes in Jerusalem"]'::jsonb, 'Those who do the will of God', 'Jesus said whoever does the will of God is his brother, sister, and mother.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who did Jesus say are his true family?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 3, 2, 'Who joined the Pharisees in plotting against Jesus after the Sabbath healing?', '["The Herodians", "The Samaritans", "The Essenes", "The Zealots"]'::jsonb, 'The Herodians', 'The Pharisees immediately conspired with the Herodians about destroying Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'Who joined the Pharisees in plotting against Jesus after the Sabbath healing?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 3, 2, 'What did Jesus give the twelve authority to do?', '["Preach and cast out demons", "Collect taxes and judge Israel", "Build synagogues and vineyards", "Guard the temple gates"]'::jsonb, 'Preach and cast out demons', 'Jesus appointed the twelve to preach and to have authority over demons.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus give the twelve authority to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 3, 2, 'What did Jesus say about a kingdom divided against itself?', '["It cannot stand", "It becomes stronger", "It rules longer", "It gains more land"]'::jsonb, 'It cannot stand', 'Jesus answered the accusation against him by saying a divided kingdom cannot stand.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say about a kingdom divided against itself?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 3, 2, 'What sin did Jesus warn never has forgiveness?', '["Blasphemy against the Holy Spirit", "Missing one Sabbath", "Touching a leper", "Eating with sinners"]'::jsonb, 'Blasphemy against the Holy Spirit', 'Jesus warned that blasphemy against the Holy Spirit never has forgiveness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What sin did Jesus warn never has forgiveness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 3, 3, 'Why were the religious leaders watching Jesus in the synagogue?', '["To see whether he would heal on the Sabbath", "To ask him about fasting", "To offer him leadership", "To bring him temple money"]'::jsonb, 'To see whether he would heal on the Sabbath', 'They watched Jesus to find grounds to accuse him if he healed on the Sabbath.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why were the religious leaders watching Jesus in the synagogue?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 3, 3, 'What question did Jesus ask about the Sabbath before healing the man?', '["Is it lawful to do good or to do harm on the Sabbath?", "Who may enter the synagogue?", "Should all men fast on the Sabbath?", "Whose coin bears Caesar''s image?"]'::jsonb, 'Is it lawful to do good or to do harm on the Sabbath?', 'Jesus confronted their hardness by asking whether it was lawful to do good or to save life on the Sabbath.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What question did Jesus ask about the Sabbath before healing the man?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 3, 3, 'What nickname did Jesus give James and John?', '["Boanerges, sons of thunder", "Fishers of men", "Sons of David", "Pillars of fire"]'::jsonb, 'Boanerges, sons of thunder', 'Jesus surnamed James and John Boanerges, meaning sons of thunder.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What nickname did Jesus give James and John?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 3, 3, 'Why did Jesus'' family try to seize him earlier in the chapter?', '["They were saying, ''He is out of his mind''", "They feared Rome would arrest them", "They wanted him to return to Nazareth for work", "They needed him to pay temple tax"]'::jsonb, 'They were saying, ''He is out of his mind''', 'Jesus'' relatives went out to seize him because people were saying he was beside himself.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why did Jesus'' family try to seize him earlier in the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 3, 4, 'What does Jesus'' ''strong man'' illustration explain in Mark 3?', '["He must bind Satan before plundering his house", "Rome had already defeated Satan", "The scribes were stronger than demons", "The apostles should arm themselves"]'::jsonb, 'He must bind Satan before plundering his house', 'Jesus used the picture of binding the strong man to explain his power over Satan''s kingdom.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Jesus'' ''strong man'' illustration explain in Mark 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 3, 4, 'Why is the charge of casting out demons by Satan self-defeating according to Jesus?', '["Because Satan would be working against himself", "Because demons never obey anyone", "Because the temple banned exorcisms", "Because the crowds would not allow it"]'::jsonb, 'Because Satan would be working against himself', 'Jesus argued that if Satan casts out Satan, his kingdom is divided and cannot stand.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is the charge of casting out demons by Satan self-defeating according to Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 3, 4, 'What does Jesus'' redefinition of family in Mark 3 emphasize?', '["Obedience to God''s will creates true kinship with him", "Blood ties no longer exist at all", "Only the twelve matter to God", "Nazareth has no place in his ministry"]'::jsonb, 'Obedience to God''s will creates true kinship with him', 'Jesus teaches that spiritual kinship is defined by doing God''s will.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Jesus'' redefinition of family in Mark 3 emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 3, 4, 'What emotion did Jesus show before healing the man with the withered hand?', '["Anger and grief at their hard hearts", "Fear of the rulers", "Confusion about the law", "Indifference to the crowd"]'::jsonb, 'Anger and grief at their hard hearts', 'Mark notes that Jesus looked around with anger, grieved at their hardness of heart.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'What emotion did Jesus show before healing the man with the withered hand?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 3, 5, 'What happened to the man with the withered hand when Jesus told him to stretch it out?', '["It was restored", "It became numb", "It shrank further", "It had to be bandaged"]'::jsonb, 'It was restored', 'When the man stretched out his hand, it was restored.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What happened to the man with the withered hand when Jesus told him to stretch it out?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 3, 5, 'What did unclean spirits do when they saw Jesus?', '["They fell down before him and cried out", "They ignored him", "They welcomed the scribes", "They fled to Jerusalem immediately"]'::jsonb, 'They fell down before him and cried out', 'The unclean spirits fell down before Jesus and cried out that he was the Son of God.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did unclean spirits do when they saw Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 3, 5, 'How did Jesus respond when the unclean spirits identified him?', '["He strictly ordered them not to make him known", "He told them to preach openly", "He sent them to Nazareth", "He asked Peter to question them"]'::jsonb, 'He strictly ordered them not to make him known', 'Jesus repeatedly warned the spirits not to reveal him publicly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How did Jesus respond when the unclean spirits identified him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 3, 5, 'Where were Jesus'' mother and brothers while he taught about true family?', '["Standing outside and calling for him", "Beside him inside the house", "Traveling to Jerusalem", "On a boat across the sea"]'::jsonb, 'Standing outside and calling for him', 'His mother and brothers stood outside and sent word, calling for him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'Where were Jesus'' mother and brothers while he taught about true family?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 4, 1, 'What parable begins Mark 4?', '["The parable of the sower", "The lost sheep", "The prodigal son", "The laborers in the vineyard"]'::jsonb, 'The parable of the sower', 'Mark 4 opens with Jesus teaching the parable of the sower by the sea.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'What parable begins Mark 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 4, 1, 'Where was Jesus when he taught the crowd in Mark 4?', '["In a boat on the sea", "On the temple steps", "In Nazareth''s synagogue", "On a mountain"]'::jsonb, 'In a boat on the sea', 'Because of the crowd, Jesus taught from a boat while the people stood on the shore.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'Where was Jesus when he taught the crowd in Mark 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 4, 1, 'What did Jesus say to the wind and sea during the storm?', '["Peace, be still", "Rise and shine", "Come to shore", "Let the storm continue"]'::jsonb, 'Peace, be still', 'Jesus rebuked the wind and said to the sea, ''Peace, be still.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say to the wind and sea during the storm?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 4, 1, 'What happened after Jesus rebuked the storm?', '["There was a great calm", "The boat sank", "The crowd cheered from shore", "Lightning struck the mast"]'::jsonb, 'There was a great calm', 'After Jesus spoke, the wind ceased and there was a great calm.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'What happened after Jesus rebuked the storm?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 4, 2, 'What does the seed represent in the parable of the sower?', '["The word", "Money", "Israel''s army", "Temple sacrifices"]'::jsonb, 'The word', 'Jesus explained that the sower sows the word.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does the seed represent in the parable of the sower?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 4, 2, 'What is not meant to be hidden according to Jesus in Mark 4?', '["A lamp", "A fishing net", "A grain basket", "A trumpet"]'::jsonb, 'A lamp', 'Jesus asked whether a lamp is brought to be put under a basket or under a bed.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What is not meant to be hidden according to Jesus in Mark 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 4, 2, 'What tiny seed did Jesus use to picture the Kingdom of God?', '["A mustard seed", "A fig seed", "A cedar seed", "A grape seed"]'::jsonb, 'A mustard seed', 'Jesus compared the Kingdom to a mustard seed that grows large.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What tiny seed did Jesus use to picture the Kingdom of God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 4, 2, 'What did the disciples ask Jesus during the storm?', '["Teacher, don''t you care that we are perishing?", "Where shall we buy bread?", "Who touched your clothes?", "Shall we call Elijah?"]'::jsonb, 'Teacher, don''t you care that we are perishing?', 'The frightened disciples woke Jesus with that desperate question.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the disciples ask Jesus during the storm?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 4, 3, 'What happens to the seed sown on rocky ground?', '["It springs up quickly but withers because it has no root", "It bears thirtyfold immediately", "It is eaten by swine", "It sinks into the sea"]'::jsonb, 'It springs up quickly but withers because it has no root', 'The rocky-ground hearers receive the word quickly but fall away when trouble comes.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What happens to the seed sown on rocky ground?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 4, 3, 'What chokes the seed among thorns in Jesus'' explanation?', '["Cares of the world, deceitfulness of riches, and desires for other things", "The wind and the sea", "Roman taxes alone", "Lack of temple offerings"]'::jsonb, 'Cares of the world, deceitfulness of riches, and desires for other things', 'Jesus said these things choke the word so it becomes unfruitful.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What chokes the seed among thorns in Jesus'' explanation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 4, 3, 'What did Jesus say had been given to his disciples?', '["The mystery of the Kingdom of God", "The throne of David", "Authority to judge Rome", "The temple treasury"]'::jsonb, 'The mystery of the Kingdom of God', 'Jesus said the mystery of the Kingdom had been given to them, while outsiders heard in parables.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did Jesus say had been given to his disciples?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 4, 3, 'How did the disciples react after the sea became calm?', '["They were filled with great fear and asked who he was", "They immediately slept", "They went back to shore without speaking", "They decided to leave him"]'::jsonb, 'They were filled with great fear and asked who he was', 'The miracle left them in awe, wondering who Jesus was that even wind and sea obeyed him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'How did the disciples react after the sea became calm?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 4, 4, 'What principle did Jesus attach to hearing with the words ''with what measure you use''?', '["The measure you use will be measured to you, and more will be added", "Every listener receives the same understanding", "Only public teachers may hear well", "Hidden things stay hidden forever"]'::jsonb, 'The measure you use will be measured to you, and more will be added', 'Jesus warned his listeners to take heed how they hear, because response affects further understanding.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'What principle did Jesus attach to hearing with the words ''with what measure you use''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 4, 4, 'What does the seed growing secretly parable emphasize?', '["God''s Kingdom grows in ways humans cannot fully explain", "The Kingdom depends only on political power", "Seeds must be buried for forty days", "Harvest never comes suddenly"]'::jsonb, 'God''s Kingdom grows in ways humans cannot fully explain', 'The man sleeps and rises while the seed grows, showing the mysterious growth of the Kingdom.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does the seed growing secretly parable emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 4, 4, 'Why did Jesus rebuke the disciples after calming the storm?', '["They still had no faith", "They had rowed the wrong direction", "They forgot to bring bread", "They told the crowd too much"]'::jsonb, 'They still had no faith', 'Jesus asked why they were afraid and whether they still had no faith.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did Jesus rebuke the disciples after calming the storm?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 4, 4, 'What does the storm miracle reveal about Jesus?', '["He has authority over creation itself", "He learned power from the disciples", "He fears the sea like others", "He came only to teach parables"]'::jsonb, 'He has authority over creation itself', 'By commanding the wind and sea, Jesus demonstrates divine authority over creation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does the storm miracle reveal about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 4, 5, 'What fruit amounts does Jesus mention for good soil?', '["Thirty, sixty, and one hundredfold", "Ten, twenty, and thirtyfold", "Seven, twelve, and seventyfold", "Forty, eighty, and one hundredfold"]'::jsonb, 'Thirty, sixty, and one hundredfold', 'The good soil hears the word and bears fruit in increasing abundance.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What fruit amounts does Jesus mention for good soil?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 4, 5, 'What should a person who has ears do, according to Jesus?', '["Hear", "Fast", "Hide", "Depart"]'::jsonb, 'Hear', 'Jesus repeatedly says, ''Whoever has ears to hear, let him hear.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What should a person who has ears do, according to Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 4, 5, 'What other boats were mentioned when Jesus crossed the sea?', '["Other little boats were with him", "A Roman warship followed", "No other boats were present", "Twelve fishing barges surrounded him"]'::jsonb, 'Other little boats were with him', 'Mark notes that other little boats were with Jesus as they set out across the sea.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What other boats were mentioned when Jesus crossed the sea?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 4, 5, 'Where was Jesus sleeping during the storm?', '["In the stern on a cushion", "At the bow holding a rope", "On the shore alone", "On the mountain praying"]'::jsonb, 'In the stern on a cushion', 'Jesus was asleep in the stern on a cushion while the storm raged.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'Where was Jesus sleeping during the storm?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 5, 1, 'What was the name the demon gave when Jesus asked in Mark 5?', '["Legion", "Beelzebul", "Abaddon", "Satan"]'::jsonb, 'Legion', 'The demon answered, ''My name is Legion, for we are many.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'What was the name the demon gave when Jesus asked in Mark 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 5, 1, 'Who asked Jesus to come because his daughter was dying in Mark 5?', '["Jairus", "Levi", "Bartimaeus", "Herod"]'::jsonb, 'Jairus', 'Jairus, a synagogue ruler, begged Jesus to come heal his little daughter.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who asked Jesus to come because his daughter was dying in Mark 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 5, 1, 'How many years had the woman suffered from bleeding in Mark 5?', '["Twelve years", "Seven years", "Three years", "Forty years"]'::jsonb, 'Twelve years', 'The woman had suffered from a flow of blood for twelve years.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'How many years had the woman suffered from bleeding in Mark 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 5, 1, 'What did Jesus say to Jairus after the news that his daughter had died?', '["Do not fear, only believe", "Go home, it is finished", "Bring more mourners", "Call the priests"]'::jsonb, 'Do not fear, only believe', 'Jesus urged Jairus to trust him even after hearing that the girl had died.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say to Jairus after the news that his daughter had died?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 5, 2, 'Where did the demon-possessed man live before Jesus healed him?', '["Among the tombs", "In the synagogue", "On a fishing boat", "At the tax office"]'::jsonb, 'Among the tombs', 'The man lived among the tombs and could not be restrained with chains.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'Where did the demon-possessed man live before Jesus healed him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 5, 2, 'What happened to the herd of pigs after the demons entered them?', '["They rushed into the sea and drowned", "They returned to the city calmly", "They were sold in the market", "They scattered into the hills unharmed"]'::jsonb, 'They rushed into the sea and drowned', 'The herd rushed down the steep bank into the sea and drowned.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'What happened to the herd of pigs after the demons entered them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 5, 2, 'What did the healed woman do after touching Jesus'' garment?', '["She told him the whole truth", "She fled to her house silently", "She denied touching him", "She argued with the disciples"]'::jsonb, 'She told him the whole truth', 'When Jesus called her out, the woman came in fear and told him the whole truth.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the healed woman do after touching Jesus'' garment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 5, 2, 'What did Jesus say had made the woman well?', '["Her faith", "The crowd''s prayers", "Her wealth", "The synagogue ruler"]'::jsonb, 'Her faith', 'Jesus said, ''Daughter, your faith has made you well.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say had made the woman well?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 5, 3, 'How many pigs were in the herd that ran into the sea?', '["About two thousand", "About five hundred", "About seventy", "About twelve"]'::jsonb, 'About two thousand', 'Mark notes that the herd numbered about two thousand.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'How many pigs were in the herd that ran into the sea?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 5, 3, 'What did the people of the region ask Jesus to do after the pigs were lost?', '["Leave their region", "Heal more sick people", "Stay and teach for seven days", "Send the healed man to them"]'::jsonb, 'Leave their region', 'The people were afraid and begged Jesus to depart from their region.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did the people of the region ask Jesus to do after the pigs were lost?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 5, 3, 'What did Jesus tell the delivered man to do instead of going with him?', '["Go home and tell what the Lord had done for him", "Become one of the twelve immediately", "Guard the shoreline", "Return to the tombs"]'::jsonb, 'Go home and tell what the Lord had done for him', 'Jesus sent the healed man back to his own people to testify about mercy received.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did Jesus tell the delivered man to do instead of going with him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 5, 3, 'What did Jesus ask after the woman touched his clothes?', '["Who touched my clothes?", "Why are you all weeping?", "Where is the bread?", "Whose coin is this?"]'::jsonb, 'Who touched my clothes?', 'Jesus perceived power had gone out from him and asked who had touched his garments.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did Jesus ask after the woman touched his clothes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 5, 4, 'What does the name ''Legion'' suggest about the man''s condition?', '["He was oppressed by many demons", "He served in the Roman army", "He ruled the tombs as king", "He had only one spirit"]'::jsonb, 'He was oppressed by many demons', 'The name ''Legion'' indicates a multitude of demons rather than a single spirit.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does the name ''Legion'' suggest about the man''s condition?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 5, 4, 'Why did Jesus permit the woman with bleeding to speak publicly after being healed?', '["To draw out her faith and restore her openly", "To shame her before the crowd", "To delay Jairus on purpose only", "To test Peter''s memory"]'::jsonb, 'To draw out her faith and restore her openly', 'Jesus brought her forward so her faith would be named and her restoration would be public and personal.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did Jesus permit the woman with bleeding to speak publicly after being healed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 5, 4, 'Why did Jesus say the girl was not dead but sleeping?', '["To speak of death as temporary before his power to raise her", "Because she was only resting", "Because the mourners misunderstood a fever", "To avoid trouble with Jairus"]'::jsonb, 'To speak of death as temporary before his power to raise her', 'Jesus used sleep language to show that her death was not beyond his authority.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did Jesus say the girl was not dead but sleeping?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 5, 4, 'What contrast does Mark highlight by placing the woman and Jairus stories together?', '["Jesus responds to both hidden uncleanness and public desperation with power and compassion", "Only rulers may receive miracles", "Crowds always understand Jesus well", "Women are ignored while leaders are honored"]'::jsonb, 'Jesus responds to both hidden uncleanness and public desperation with power and compassion', 'The intertwined stories show Jesus meeting both a desperate ruler and a suffering outcast with equal authority and mercy.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'What contrast does Mark highlight by placing the woman and Jairus stories together?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 5, 5, 'What Aramaic words did Jesus speak to Jairus''s daughter?', '["Talitha cumi", "Ephphatha", "Eloi, Eloi", "Abba, Father"]'::jsonb, 'Talitha cumi', 'Jesus took the girl by the hand and said, ''Talitha cumi,'' meaning, ''Little girl, arise.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What Aramaic words did Jesus speak to Jairus''s daughter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 5, 5, 'Which three disciples went with Jesus into Jairus''s house?', '["Peter, James, and John", "Peter, Andrew, and Matthew", "James, Jude, and Thomas", "All twelve"]'::jsonb, 'Peter, James, and John', 'Jesus allowed only Peter, James, and John to accompany him inside.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which three disciples went with Jesus into Jairus''s house?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 5, 5, 'What did Jesus tell the family to do after the girl arose?', '["Give her something to eat", "Take her to Jerusalem", "Keep her hidden for a year", "Offer two doves immediately"]'::jsonb, 'Give her something to eat', 'After raising the girl, Jesus told them to give her something to eat.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus tell the family to do after the girl arose?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 5, 5, 'How did the people react when the girl was raised?', '["They were overcome with great amazement", "They accused Jesus of sorcery", "They left without speaking", "They demanded another sign"]'::jsonb, 'They were overcome with great amazement', 'Those present were utterly astonished when the girl got up and walked.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'How did the people react when the girl was raised?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 6, 1, 'Where was Jesus rejected in Mark 6 (Nazareth)?', '["Nazareth", "Jerusalem", "Bethany", "Tyre"]'::jsonb, 'Nazareth', 'Jesus was rejected in his hometown of Nazareth.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'Where was Jesus rejected in Mark 6 (Nazareth)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 6, 1, 'How did Jesus send out the twelve in Mark 6?', '["Two by two", "One by one", "In groups of twelve", "Only Peter and John"]'::jsonb, 'Two by two', 'Jesus sent the twelve out two by two with authority over unclean spirits.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'How did Jesus send out the twelve in Mark 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 6, 1, 'How many loaves did Jesus use to feed the five thousand in Mark 6?', '["Five", "Seven", "Twelve", "Two"]'::jsonb, 'Five', 'Jesus fed the crowd with five loaves and two fish.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'How many loaves did Jesus use to feed the five thousand in Mark 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 6, 1, 'What did Jesus do on the sea in Mark 6?', '["He walked on the water", "He slept through a storm", "He caught fish", "He baptized the crowd"]'::jsonb, 'He walked on the water', 'Jesus came to the disciples walking on the sea.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus do on the sea in Mark 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 6, 2, 'Who was beheaded in Mark 6?', '["John the Baptist", "James", "Zechariah", "Stephen"]'::jsonb, 'John the Baptist', 'Herod ordered the beheading of John the Baptist.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'Who was beheaded in Mark 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 6, 2, 'What authority did Jesus give the twelve when sending them out?', '["Authority over unclean spirits", "Authority to collect taxes", "Authority over Rome", "Authority to judge Israel"]'::jsonb, 'Authority over unclean spirits', 'Jesus gave the twelve authority over unclean spirits as they went out.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'What authority did Jesus give the twelve when sending them out?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 6, 2, 'How many fish were with the five loaves in Mark 6?', '["Two", "Five", "Seven", "Twelve"]'::jsonb, 'Two', 'The disciples had five loaves and two fish.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'How many fish were with the five loaves in Mark 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 6, 2, 'Where were many people healed after Jesus crossed over?', '["Gennesaret", "Jericho", "Bethlehem", "Decapolis"]'::jsonb, 'Gennesaret', 'After crossing over, Jesus healed many in Gennesaret.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'Where were many people healed after Jesus crossed over?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 6, 3, 'What did the people in Nazareth say about Jesus that showed their offense?', '["Isn''t this the carpenter, the son of Mary?", "Isn''t this the high priest''s son?", "Isn''t this Elijah returned?", "Isn''t this Caesar''s messenger?"]'::jsonb, 'Isn''t this the carpenter, the son of Mary?', 'The people stumbled over Jesus because they knew his ordinary family background.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did the people in Nazareth say about Jesus that showed their offense?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 6, 3, 'What did Jesus say a prophet lacks in his hometown?', '["Honor", "Bread", "Followers", "A synagogue"]'::jsonb, 'Honor', 'Jesus said a prophet is not without honor except in his hometown and among his relatives.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did Jesus say a prophet lacks in his hometown?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 6, 3, 'Why did Herod think Jesus might be John raised from the dead?', '["Because he heard of Jesus'' mighty works and feared John had risen", "Because Jesus was baptizing in the Jordan", "Because the priests told him so", "Because Peter announced it publicly"]'::jsonb, 'Because he heard of Jesus'' mighty works and feared John had risen', 'Herod heard reports about Jesus and thought John had risen from the dead.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why did Herod think Jesus might be John raised from the dead?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 6, 3, 'What did Jesus say the crowd was like before feeding them?', '["Sheep without a shepherd", "Wheat ready for harvest", "A city on a hill", "Branches without fruit"]'::jsonb, 'Sheep without a shepherd', 'Jesus had compassion on the crowd because they were like sheep without a shepherd.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did Jesus say the crowd was like before feeding them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 6, 4, 'Why did Herod arrest John according to Mark 6?', '["Because John said Herod should not have his brother''s wife", "Because John refused to pay taxes", "Because John mocked Rome", "Because John healed on the Sabbath"]'::jsonb, 'Because John said Herod should not have his brother''s wife', 'John condemned Herod''s unlawful marriage to Herodias, leading to his imprisonment.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did Herod arrest John according to Mark 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 6, 4, 'What did Jesus intend to do with the disciples before the crowd followed them?', '["Take them away to a deserted place for rest", "Send them back to Nazareth", "March to Jerusalem", "Have them build shelters"]'::jsonb, 'Take them away to a deserted place for rest', 'Jesus called the disciples to come away and rest because they had no leisure even to eat.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'What did Jesus intend to do with the disciples before the crowd followed them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 6, 4, 'How many baskets of fragments were left after the feeding?', '["Twelve", "Seven", "Five", "Two"]'::jsonb, 'Twelve', 'After the five thousand were fed, twelve baskets full of broken pieces were collected.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How many baskets of fragments were left after the feeding?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 6, 4, 'Why were the disciples astonished when Jesus walked on the sea?', '["They had not understood about the loaves and their hearts were hardened", "They forgot the way to shore", "They feared John had returned", "They thought the temple was collapsing"]'::jsonb, 'They had not understood about the loaves and their hearts were hardened', 'Mark connects their amazement to their failure to understand the feeding miracle.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why were the disciples astonished when Jesus walked on the sea?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 6, 5, 'What sign did Jesus tell the disciples to leave when a house or town would not receive them?', '["Shake off the dust under their feet", "Break their sandals", "Blow a trumpet", "Fast for seven days"]'::jsonb, 'Shake off the dust under their feet', 'Jesus told them to shake off the dust as a testimony when they were rejected.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What sign did Jesus tell the disciples to leave when a house or town would not receive them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 6, 5, 'What was the result of the disciples'' mission in Mark 6?', '["People repented, many demons were cast out, and many sick were healed", "Only the disciples rested", "Herod became a follower", "Nazareth welcomed Jesus"]'::jsonb, 'People repented, many demons were cast out, and many sick were healed', 'The twelve preached repentance, cast out many demons, and healed many sick people.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What was the result of the disciples'' mission in Mark 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 6, 5, 'What did Jesus tell the frightened disciples on the sea?', '["Take courage; it is I; do not be afraid", "Row harder toward shore", "Cast your nets again", "Wait for Elijah"]'::jsonb, 'Take courage; it is I; do not be afraid', 'Jesus spoke comfort to the disciples when they were terrified on the sea.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus tell the frightened disciples on the sea?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 6, 5, 'What happened to those who touched even the fringe of Jesus'' garment in Gennesaret?', '["They were made well", "They became disciples immediately", "They fell asleep", "They were sent to Jerusalem"]'::jsonb, 'They were made well', 'Everyone who touched the fringe of Jesus'' garment was made well.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What happened to those who touched even the fringe of Jesus'' garment in Gennesaret?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 7, 1, 'What tradition did the Pharisees criticize Jesus'' disciples for not following in Mark 7?', '["Washing their hands before eating", "Keeping silent at meals", "Paying temple tax", "Wearing tassels"]'::jsonb, 'Washing their hands before eating', 'The Pharisees objected that the disciples ate with unwashed hands.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'What tradition did the Pharisees criticize Jesus'' disciples for not following in Mark 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 7, 1, 'What did Jesus say defiles a person in Mark 7?', '["What comes out from the heart", "Eating with unwashed hands", "Traveling through Gentile lands", "Sleeping in a boat"]'::jsonb, 'What comes out from the heart', 'Jesus taught that what comes from within, out of the heart, is what defiles a person.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say defiles a person in Mark 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 7, 1, 'What kind of woman asked Jesus to heal her daughter in Mark 7?', '["A Syrophoenician woman", "A woman from Nazareth", "A daughter of Jairus", "Mary Magdalene"]'::jsonb, 'A Syrophoenician woman', 'A Gentile Syrophoenician woman begged Jesus to cast the demon out of her daughter.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'What kind of woman asked Jesus to heal her daughter in Mark 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 7, 1, 'What physical problem did the man in Decapolis have in Mark 7?', '["He was deaf and had a speech impediment", "He was blind and lame", "He had leprosy", "He was paralyzed"]'::jsonb, 'He was deaf and had a speech impediment', 'Jesus healed a man who was deaf and spoke with difficulty.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'What physical problem did the man in Decapolis have in Mark 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 7, 2, 'What prophet did Jesus quote about people honoring God with lips while their hearts are far away?', '["Isaiah", "Jeremiah", "Daniel", "Micah"]'::jsonb, 'Isaiah', 'Jesus quoted Isaiah in rebuking hypocritical worship based on human tradition.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'What prophet did Jesus quote about people honoring God with lips while their hearts are far away?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 7, 2, 'What did Jesus say comes from within and defiles a person?', '["Evil thoughts and sinful acts", "Dust on the hands", "Foreign food", "Night travel"]'::jsonb, 'Evil thoughts and sinful acts', 'Jesus listed evil thoughts, theft, murder, adultery, and other sins as coming from within.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say comes from within and defiles a person?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 7, 2, 'What was wrong with the Syrophoenician woman''s daughter?', '["She had an unclean spirit", "She was blind", "She was dying of fever", "She was paralyzed"]'::jsonb, 'She had an unclean spirit', 'The woman''s little daughter had an unclean spirit, and she begged Jesus to cast it out.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'What was wrong with the Syrophoenician woman''s daughter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 7, 2, 'What did Jesus say while healing the deaf man?', '["Ephphatha", "Talitha cumi", "Peace, be still", "Eloi, Eloi"]'::jsonb, 'Ephphatha', 'Jesus said ''Ephphatha,'' meaning ''Be opened.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say while healing the deaf man?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 7, 3, 'What human tradition in Mark 7 allowed people to avoid helping parents?', '["Corban", "Circumcision", "Passover", "Nazirite vows"]'::jsonb, 'Corban', 'Jesus rebuked the practice of declaring resources ''Corban'' so they could not be used to honor parents.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What human tradition in Mark 7 allowed people to avoid helping parents?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 7, 3, 'How did the Syrophoenician woman answer Jesus'' saying about children''s bread and dogs?', '["Even the dogs under the table eat the children''s crumbs", "The children should be sent away", "I will wait until tomorrow", "Give me only water"]'::jsonb, 'Even the dogs under the table eat the children''s crumbs', 'Her humble reply displayed faith, and Jesus granted her request.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'How did the Syrophoenician woman answer Jesus'' saying about children''s bread and dogs?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 7, 3, 'What did the woman find when she returned home?', '["The child lying on the bed and the demon gone", "The house empty", "A crowd from Jerusalem", "Her daughter still tormented"]'::jsonb, 'The child lying on the bed and the demon gone', 'She found her daughter healed, lying on the bed, with the demon departed.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did the woman find when she returned home?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 7, 3, 'What did the crowd say after Jesus healed the deaf man?', '["He has done all things well", "He must be Elijah", "The scribes are wiser", "Nazareth has changed"]'::jsonb, 'He has done all things well', 'The crowd marveled, saying Jesus had done all things well.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did the crowd say after Jesus healed the deaf man?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 7, 4, 'Why did Jesus say the Pharisees were making void the word of God?', '["They were replacing it with human tradition", "They could not read Hebrew", "They stopped synagogue worship", "They denied Abraham existed"]'::jsonb, 'They were replacing it with human tradition', 'Jesus said their traditions nullified God''s command, especially in the matter of honoring parents.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did Jesus say the Pharisees were making void the word of God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 7, 4, 'What does Mark note by saying Jesus declared all foods clean?', '["Defilement is moral and spiritual, not based on ceremonial food distinctions", "The disciples could ignore hunger", "Only Gentiles may eat freely", "Temple sacrifices had ended that day"]'::jsonb, 'Defilement is moral and spiritual, not based on ceremonial food distinctions', 'Mark highlights Jesus'' teaching that uncleanness comes from the heart, not from food entering the body.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Mark note by saying Jesus declared all foods clean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 7, 4, 'Why is the Syrophoenician episode significant in Mark 7?', '["It shows Gentile faith receiving Jesus'' mercy", "It proves only Israel matters", "It replaces all synagogue worship", "It introduces Bartimaeus"]'::jsonb, 'It shows Gentile faith receiving Jesus'' mercy', 'The episode shows Jesus responding to faith outside Israel''s boundaries.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is the Syrophoenician episode significant in Mark 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 7, 4, 'Why did Jesus take the deaf man aside privately before healing him?', '["To deal personally and compassionately with him away from the crowd", "Because the disciples were afraid", "Because the priests had arrived", "To keep the man from ever speaking"]'::jsonb, 'To deal personally and compassionately with him away from the crowd', 'Jesus'' private actions show personal care and direct attention to the man''s need.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did Jesus take the deaf man aside privately before healing him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 7, 5, 'What two body parts did Jesus touch when healing the deaf man?', '["His ears and tongue", "His eyes and feet", "His hands and shoulders", "His forehead and chest"]'::jsonb, 'His ears and tongue', 'Jesus put his fingers into the man''s ears and touched his tongue.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What two body parts did Jesus touch when healing the deaf man?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 7, 5, 'How did the crowd respond to Jesus'' command not to tell anyone?', '["They proclaimed it even more zealously", "They kept completely silent", "They returned to Jerusalem only", "They arrested the healed man"]'::jsonb, 'They proclaimed it even more zealously', 'The more Jesus charged them to be quiet, the more widely they proclaimed it.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'How did the crowd respond to Jesus'' command not to tell anyone?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 7, 5, 'What region is named for the healing of the deaf and mute man?', '["Decapolis", "Nazareth", "Judea", "Samaria"]'::jsonb, 'Decapolis', 'The healing took place in the region of Decapolis.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What region is named for the healing of the deaf and mute man?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 7, 5, 'Which commandment did Jesus use when criticizing the Corban practice?', '["Honor your father and your mother", "Remember the Sabbath day", "Do not steal", "Love your neighbor"]'::jsonb, 'Honor your father and your mother', 'Jesus said their tradition undermined the command to honor father and mother.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which commandment did Jesus use when criticizing the Corban practice?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 8, 1, 'How many people were fed in Mark 8?', '["Four thousand", "Five thousand", "Twelve thousand", "Seven hundred"]'::jsonb, 'Four thousand', 'Jesus fed a crowd of about four thousand in Mark 8.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'How many people were fed in Mark 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 8, 1, 'How many loaves were used in the feeding of the four thousand?', '["Seven", "Five", "Two", "Twelve"]'::jsonb, 'Seven', 'Jesus used seven loaves to feed the four thousand.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'How many loaves were used in the feeding of the four thousand?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 8, 1, 'Who confessed that Jesus is the Christ in Mark 8?', '["Peter", "James", "John the Baptist", "Bartimaeus"]'::jsonb, 'Peter', 'At Caesarea Philippi, Peter confessed that Jesus is the Christ.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who confessed that Jesus is the Christ in Mark 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 8, 1, 'What did Jesus say a disciple must take up in order to follow him?', '["His cross", "A lamp", "A net", "A coin"]'::jsonb, 'His cross', 'Jesus said anyone who would follow him must deny himself and take up his cross.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say a disciple must take up in order to follow him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 8, 2, 'What sign did the Pharisees seek from Jesus in Mark 8?', '["A sign from heaven", "A sign in the temple market", "A sign from Rome", "A sign in Nazareth"]'::jsonb, 'A sign from heaven', 'The Pharisees demanded a sign from heaven to test Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'What sign did the Pharisees seek from Jesus in Mark 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 8, 2, 'What did Jesus warn the disciples to beware of in Mark 8?', '["The yeast of the Pharisees and Herod", "The crowds of Decapolis", "The storm on the sea", "The fish of Bethsaida"]'::jsonb, 'The yeast of the Pharisees and Herod', 'Jesus warned the disciples against the yeast of the Pharisees and Herod.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus warn the disciples to beware of in Mark 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 8, 2, 'Where was the blind man healed in stages in Mark 8?', '["Bethsaida", "Jericho", "Nazareth", "Gennesaret"]'::jsonb, 'Bethsaida', 'Jesus healed a blind man at Bethsaida in a two-stage process.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'Where was the blind man healed in stages in Mark 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 8, 2, 'What did Jesus begin to teach would happen to the Son of Man?', '["He would suffer, be killed, and rise again", "He would seize David''s throne immediately", "He would rebuild the temple alone", "He would flee to Egypt"]'::jsonb, 'He would suffer, be killed, and rise again', 'Jesus began to teach openly about his suffering, death, and resurrection.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus begin to teach would happen to the Son of Man?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 8, 3, 'How many baskets of leftovers were taken up after the four thousand were fed?', '["Seven", "Twelve", "Four", "Two"]'::jsonb, 'Seven', 'After the four thousand ate, seven baskets of broken pieces were collected.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'How many baskets of leftovers were taken up after the four thousand were fed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 8, 3, 'What misunderstanding did the disciples have after Jesus warned them about yeast?', '["They thought he was talking about not having bread", "They thought he meant temple incense", "They thought he meant Roman taxes", "They thought he meant washing rituals"]'::jsonb, 'They thought he was talking about not having bread', 'The disciples assumed Jesus was speaking about literal bread because they had forgotten to bring enough.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'What misunderstanding did the disciples have after Jesus warned them about yeast?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 8, 3, 'What did the blind man first say he saw after Jesus touched him?', '["People like trees walking", "Only darkness", "Angels descending", "A field of wheat"]'::jsonb, 'People like trees walking', 'After the first touch, the man said he saw people, but they looked like trees walking.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did the blind man first say he saw after Jesus touched him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 8, 3, 'How did Jesus respond when Peter rebuked him about suffering?', '["Get behind me, Satan", "You are wiser than the others", "Keep this between us", "Call down Elijah"]'::jsonb, 'Get behind me, Satan', 'Jesus strongly rebuked Peter for setting his mind on human things rather than God''s.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'How did Jesus respond when Peter rebuked him about suffering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 8, 4, 'Why did Jesus sigh deeply when the Pharisees asked for a sign?', '["Their demand showed unbelief despite what they had already seen", "He was physically exhausted only", "He wanted to avoid the crowd", "He feared Herod''s spies"]'::jsonb, 'Their demand showed unbelief despite what they had already seen', 'Jesus'' deep sigh reflects grief at hardened unbelief that still demanded another sign.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did Jesus sigh deeply when the Pharisees asked for a sign?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 8, 4, 'What does the gradual healing of the blind man illustrate in Mark''s narrative flow?', '["The disciples'' understanding of Jesus is coming into focus gradually", "Jesus sometimes lacked power at first", "Blindness is always healed in stages", "Bethsaida was under special judgment"]'::jsonb, 'The disciples'' understanding of Jesus is coming into focus gradually', 'Placed next to Peter''s confession and misunderstanding, the staged healing mirrors partial spiritual sight becoming clearer.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does the gradual healing of the blind man illustrate in Mark''s narrative flow?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 8, 4, 'What did Jesus ask that shows he expected the disciples to learn from the feeding miracles?', '["Do you not yet understand?", "Will you build more boats?", "Who will go to Jerusalem first?", "Why did you leave Nazareth?"]'::jsonb, 'Do you not yet understand?', 'Jesus asked pointed questions to expose their slowness in grasping the significance of the miracles.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'What did Jesus ask that shows he expected the disciples to learn from the feeding miracles?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 8, 4, 'What does Jesus say about saving and losing life?', '["Whoever loses his life for Jesus and the gospel will save it", "Anyone who protects himself will always prosper", "Only martyrs can be saved", "Life is found by avoiding suffering"]'::jsonb, 'Whoever loses his life for Jesus and the gospel will save it', 'Jesus teaches that true life is found through self-denial and loyalty to him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Jesus say about saving and losing life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 8, 5, 'At what place did Peter confess Jesus as the Christ?', '["Caesarea Philippi", "Jerusalem", "Capernaum", "Decapolis"]'::jsonb, 'Caesarea Philippi', 'Peter''s confession came at Caesarea Philippi.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'At what place did Peter confess Jesus as the Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 8, 5, 'What did Jesus ask before Peter''s confession?', '["Who do you say that I am?", "Will you also go away?", "How many loaves do you have?", "Can the blind lead the blind?"]'::jsonb, 'Who do you say that I am?', 'Jesus asked the disciples directly who they said he was.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus ask before Peter''s confession?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 8, 5, 'What profit did Jesus say there is in gaining the whole world but losing one''s soul?', '["None", "Great honor", "A lasting kingdom", "Wisdom before men"]'::jsonb, 'None', 'Jesus asked what profit there is in gaining the whole world while forfeiting one''s soul.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What profit did Jesus say there is in gaining the whole world but losing one''s soul?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 8, 5, 'What did Jesus warn about being ashamed of him and his words?', '["The Son of Man will also be ashamed when he comes in glory", "Such people will never suffer", "They will become rulers in Jerusalem", "They will understand the loaves better"]'::jsonb, 'The Son of Man will also be ashamed when he comes in glory', 'Jesus warned of future judgment for those ashamed of him in an adulterous and sinful generation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus warn about being ashamed of him and his words?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 9, 1, 'Who appeared with Jesus at the transfiguration in Mark 9 (Moses and Elijah)?', '["Moses and Elijah", "Abraham and David", "Isaiah and Jeremiah", "John and Andrew"]'::jsonb, 'Moses and Elijah', 'Moses and Elijah appeared with Jesus on the mountain.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who appeared with Jesus at the transfiguration in Mark 9 (Moses and Elijah)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 9, 1, 'What did the voice from the cloud say about Jesus in Mark 9?', '["This is my beloved Son. Listen to him", "This is Elijah returned", "This is my servant Moses", "This is the son of David only"]'::jsonb, 'This is my beloved Son. Listen to him', 'The heavenly voice identified Jesus as God''s beloved Son and commanded the disciples to listen to him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the voice from the cloud say about Jesus in Mark 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 9, 1, 'What was wrong with the boy brought to Jesus in Mark 9?', '["He had a spirit that made him mute and threw him down", "He was blind from birth", "He had leprosy", "He was lame in both feet"]'::jsonb, 'He had a spirit that made him mute and threw him down', 'A father brought his son who was tormented by a destructive spirit.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'What was wrong with the boy brought to Jesus in Mark 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 9, 1, 'What did the disciples argue about on the road in Mark 9?', '["Who was the greatest", "Who should pay taxes", "Who would leave Jesus", "Who would build the temple"]'::jsonb, 'Who was the greatest', 'The disciples argued among themselves about who was the greatest.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the disciples argue about on the road in Mark 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 9, 2, 'Which three disciples went up the mountain with Jesus?', '["Peter, James, and John", "Peter, Andrew, and Philip", "James, Matthew, and Thomas", "All twelve"]'::jsonb, 'Peter, James, and John', 'Jesus took Peter, James, and John up the high mountain.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'Which three disciples went up the mountain with Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 9, 2, 'What did Peter suggest making at the transfiguration?', '["Three tents", "A new altar", "A fishing boat", "A city gate"]'::jsonb, 'Three tents', 'Peter suggested making three tents for Jesus, Moses, and Elijah.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Peter suggest making at the transfiguration?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 9, 2, 'What did the boy''s father cry out to Jesus?', '["I believe; help my unbelief", "Increase our bread", "Call Elijah now", "Make us rulers"]'::jsonb, 'I believe; help my unbelief', 'The father confessed both faith and weakness when asking Jesus to help his son.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the boy''s father cry out to Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 9, 2, 'Whom did Jesus set in the disciples'' midst to teach about greatness?', '["A little child", "A scribe", "A leper", "A soldier"]'::jsonb, 'A little child', 'Jesus used a child to teach the disciples about humility and receiving the lowly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'Whom did Jesus set in the disciples'' midst to teach about greatness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 9, 3, 'What happened to Jesus'' clothes at the transfiguration?', '["They became dazzling white", "They were torn by the crowd", "They turned scarlet", "They were hidden by a cloud"]'::jsonb, 'They became dazzling white', 'Jesus'' clothes became intensely white, beyond what any launderer could achieve.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What happened to Jesus'' clothes at the transfiguration?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 9, 3, 'What did Jesus tell the disciples not to report until after his resurrection?', '["What they had seen on the mountain", "The feeding of the five thousand", "The calling of Levi", "The cursing of the fig tree"]'::jsonb, 'What they had seen on the mountain', 'Jesus told them to tell no one what they had seen until the Son of Man had risen.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did Jesus tell the disciples not to report until after his resurrection?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 9, 3, 'Why could the disciples not cast out the boy''s spirit?', '["This kind comes out only through prayer", "They had forgotten the law", "They lacked temple authority", "The father had too little money"]'::jsonb, 'This kind comes out only through prayer', 'Jesus said the disciples'' failure showed the need for dependence expressed in prayer.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why could the disciples not cast out the boy''s spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 9, 3, 'What did Jesus say to the disciples about someone casting out demons in his name?', '["Do not stop him", "Drive him away immediately", "Make him join the twelve first", "Report him to the scribes"]'::jsonb, 'Do not stop him', 'Jesus said the one doing mighty works in his name should not be forbidden.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did Jesus say to the disciples about someone casting out demons in his name?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 9, 4, 'What does the transfiguration reveal about Jesus in relation to Moses and Elijah?', '["He stands above the law and the prophets as the one the Father commands us to hear", "He is equal only to the scribes", "He replaces all Scripture with visions", "He came only for mountain prayer"]'::jsonb, 'He stands above the law and the prophets as the one the Father commands us to hear', 'Moses and Elijah appear with Jesus, but the Father''s voice singles Jesus out as the one to hear.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does the transfiguration reveal about Jesus in relation to Moses and Elijah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 9, 4, 'Why did Jesus say greatness is linked to receiving a little child?', '["Because humble service to the lowly reflects receiving Jesus and the Father", "Because children always outrank adults", "Because only children can believe", "Because the kingdom belongs to Nazareth"]'::jsonb, 'Because humble service to the lowly reflects receiving Jesus and the Father', 'Jesus connects receiving the child with receiving him and the One who sent him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did Jesus say greatness is linked to receiving a little child?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 9, 4, 'What do Jesus'' warnings about hand, foot, and eye emphasize?', '["The radical seriousness of removing causes of sin", "That the body is evil in itself", "That blindness is better than faith", "That salvation comes through suffering alone"]'::jsonb, 'The radical seriousness of removing causes of sin', 'Jesus uses severe imagery to stress the urgency of dealing decisively with sin.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'What do Jesus'' warnings about hand, foot, and eye emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 9, 4, 'What does ''have salt in yourselves, and be at peace with one another'' address in context?', '["The disciples'' rivalry and need for purity and peace", "The need to preserve fish in Galilee", "A temple ritual for offerings", "A Roman military saying"]'::jsonb, 'The disciples'' rivalry and need for purity and peace', 'After correcting their pride and exclusiveness, Jesus calls them to inner integrity and peace with one another.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does ''have salt in yourselves, and be at peace with one another'' address in context?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 9, 5, 'What question did the disciples discuss among themselves after Jesus mentioned rising from the dead?', '["What rising from the dead might mean", "Who would betray him", "How many loaves remained", "When Elijah would die"]'::jsonb, 'What rising from the dead might mean', 'They kept the matter to themselves, questioning what rising from the dead meant.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What question did the disciples discuss among themselves after Jesus mentioned rising from the dead?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 9, 5, 'What had the scribes taught must come first, according to the disciples'' question?', '["Elijah", "David", "Moses", "The temple tax"]'::jsonb, 'Elijah', 'The disciples asked why the scribes said Elijah must come first.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What had the scribes taught must come first, according to the disciples'' question?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 9, 5, 'What did Jesus say would happen to the Son of Man when he spoke privately with the disciples in Galilee?', '["He would be delivered, killed, and after three days rise", "He would take Jerusalem by force", "He would abolish the temple that day", "He would retreat to the wilderness"]'::jsonb, 'He would be delivered, killed, and after three days rise', 'Jesus again predicted his betrayal, death, and resurrection.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus say would happen to the Son of Man when he spoke privately with the disciples in Galilee?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 9, 5, 'What small act of kindness did Jesus say would not lose its reward?', '["Giving a cup of water in his name", "Offering a silver coin to Rome", "Building a house in Nazareth", "Lighting a lamp at noon"]'::jsonb, 'Giving a cup of water in his name', 'Jesus said even giving a cup of water to one who belongs to Christ would be rewarded.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What small act of kindness did Jesus say would not lose its reward?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 10, 1, 'What did Jesus teach about in the opening of Mark 10?', '["Marriage and divorce", "Temple sacrifices", "The feeding of crowds", "Sabbath grainfields"]'::jsonb, 'Marriage and divorce', 'Mark 10 opens with Jesus teaching about marriage and divorce.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus teach about in the opening of Mark 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 10, 1, 'Who came to Jesus asking what he must do to inherit eternal life?', '["A rich man", "Jairus", "A scribe from Jerusalem", "Bartimaeus"]'::jsonb, 'A rich man', 'A wealthy man came running to ask Jesus about inheriting eternal life.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who came to Jesus asking what he must do to inherit eternal life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 10, 1, 'Which blind man did Jesus heal near Jericho in Mark 10?', '["Bartimaeus", "Levi", "Blind man of Bethsaida", "Legion"]'::jsonb, 'Bartimaeus', 'Jesus healed blind Bartimaeus as he was leaving Jericho.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which blind man did Jesus heal near Jericho in Mark 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 10, 1, 'What did Jesus say people must receive like a child in Mark 10?', '["The Kingdom of God", "The temple law", "Roman rule", "A prophet''s reward"]'::jsonb, 'The Kingdom of God', 'Jesus said whoever does not receive the Kingdom of God like a child shall not enter it.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say people must receive like a child in Mark 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 10, 2, 'What did Jesus do when little children were brought to him?', '["He took them in his arms and blessed them", "He sent them away", "He asked them to fast", "He told them to wait outside"]'::jsonb, 'He took them in his arms and blessed them', 'Jesus welcomed the children, took them in his arms, and blessed them.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus do when little children were brought to him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 10, 2, 'What did Jesus say is hard for the rich to enter?', '["The Kingdom of God", "The synagogue", "A fishing boat", "The city of Jericho"]'::jsonb, 'The Kingdom of God', 'Jesus said how difficult it is for those who have wealth to enter the Kingdom of God.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say is hard for the rich to enter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 10, 2, 'Which two disciples asked for places at Jesus'' right and left hand?', '["James and John", "Peter and Andrew", "Philip and Thomas", "Matthew and Simon"]'::jsonb, 'James and John', 'James and John asked to sit at Jesus'' right and left in his glory.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'Which two disciples asked for places at Jesus'' right and left hand?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 10, 2, 'What title did Bartimaeus use when crying out to Jesus?', '["Son of David", "Teacher of Nazareth", "Holy One of God", "King of Rome"]'::jsonb, 'Son of David', 'Bartimaeus cried out, ''Jesus, Son of David, have mercy on me!'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'What title did Bartimaeus use when crying out to Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 10, 3, 'What reason did Jesus give for Moses'' command about divorce?', '["Your hardness of heart", "The will of Caesar", "The poverty of Israel", "The need for travel"]'::jsonb, 'Your hardness of heart', 'Jesus said Moses wrote that command because of hardness of heart.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What reason did Jesus give for Moses'' command about divorce?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 10, 3, 'What image did Jesus use to describe the difficulty for a rich person entering the Kingdom?', '["A camel through the eye of a needle", "A fig tree in winter", "A lamp under a basket", "A ship on dry land"]'::jsonb, 'A camel through the eye of a needle', 'Jesus said it is easier for a camel to go through the eye of a needle than for a rich person to enter God''s Kingdom.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What image did Jesus use to describe the difficulty for a rich person entering the Kingdom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 10, 3, 'What did Jesus say the Son of Man came to do?', '["Serve and give his life as a ransom for many", "Rule by force over the nations", "Restore the temple sacrifices", "Call down fire on Rome"]'::jsonb, 'Serve and give his life as a ransom for many', 'Jesus defined his mission in terms of service and sacrificial ransom.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did Jesus say the Son of Man came to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 10, 3, 'What did Bartimaeus do after he was healed?', '["He followed Jesus on the way", "He returned to begging", "He went to Herod''s palace", "He moved into the synagogue"]'::jsonb, 'He followed Jesus on the way', 'After receiving sight, Bartimaeus followed Jesus on the road.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did Bartimaeus do after he was healed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 10, 4, 'What does Jesus'' appeal to creation teach about marriage?', '["God joined man and woman as one flesh from the beginning", "Marriage is only a civil contract", "Divorce is always required after conflict", "Children replace marriage entirely"]'::jsonb, 'God joined man and woman as one flesh from the beginning', 'Jesus appealed to Genesis to ground marriage in God''s creation design.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Jesus'' appeal to creation teach about marriage?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 10, 4, 'Why did the rich man go away sorrowful?', '["He had great possessions and would not leave them to follow Jesus", "He could not find the disciples", "Bartimaeus rebuked him", "He wanted a sword instead"]'::jsonb, 'He had great possessions and would not leave them to follow Jesus', 'The man''s wealth exposed the competing loyalty of his heart.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did the rich man go away sorrowful?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 10, 4, 'How did Jesus redefine greatness after James and John made their request?', '["Whoever would be great must be servant of all", "Greatness belongs to the eldest only", "Greatness comes through wealth", "Greatness belongs to Nazareth"]'::jsonb, 'Whoever would be great must be servant of all', 'Jesus contrasted Gentile rule with Kingdom greatness expressed in humble service.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'How did Jesus redefine greatness after James and John made their request?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 10, 4, 'What did Jesus say is possible with God though impossible with man?', '["Salvation", "Crossing the sea unaided", "Avoiding death entirely", "Winning every argument"]'::jsonb, 'Salvation', 'When the disciples asked who can be saved, Jesus answered that with God all things are possible.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'What did Jesus say is possible with God though impossible with man?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 10, 5, 'What did Jesus tell the rich man he still lacked?', '["Sell what he had, give to the poor, and follow Jesus", "Study with the scribes longer", "Return to Nazareth first", "Offer a larger temple gift"]'::jsonb, 'Sell what he had, give to the poor, and follow Jesus', 'Jesus called the man to radical discipleship by surrendering his possessions and following him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus tell the rich man he still lacked?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 10, 5, 'What did Jesus predict for himself on the road to Jerusalem?', '["Mocking, flogging, death, and resurrection", "A royal coronation at once", "A private retreat in Bethany", "Victory over Herod''s army"]'::jsonb, 'Mocking, flogging, death, and resurrection', 'Jesus again predicted his coming suffering, death, and resurrection.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus predict for himself on the road to Jerusalem?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 10, 5, 'How did Bartimaeus respond when Jesus called for him?', '["He threw off his cloak, sprang up, and came to Jesus", "He hid behind the crowd", "He asked James to lead him", "He went home first"]'::jsonb, 'He threw off his cloak, sprang up, and came to Jesus', 'Bartimaeus responded eagerly, throwing aside his cloak and coming to Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'How did Bartimaeus respond when Jesus called for him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 10, 5, 'What did Jesus say people receive who leave house or family for his sake and the gospel''s?', '["A hundredfold now with persecutions, and in the age to come eternal life", "Immediate political rule", "Freedom from all suffering", "Only honor in Nazareth"]'::jsonb, 'A hundredfold now with persecutions, and in the age to come eternal life', 'Jesus promised multiplied blessing, persecution in this age, and eternal life in the age to come.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus say people receive who leave house or family for his sake and the gospel''s?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 11, 1, 'What animal did Jesus ride into Jerusalem in Mark 11?', '["A colt", "A horse", "A camel", "A mule cart"]'::jsonb, 'A colt', 'Jesus entered Jerusalem riding on a colt.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'What animal did Jesus ride into Jerusalem in Mark 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 11, 1, 'What did Jesus curse in Mark 11?', '["A fig tree", "The Jordan River", "A vineyard", "A flock of sheep"]'::jsonb, 'A fig tree', 'Jesus cursed a fig tree that had leaves but no fruit.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus curse in Mark 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 11, 1, 'What did Jesus do in the temple in Mark 11?', '["He drove out buyers and sellers", "He offered incense", "He paid the temple tax", "He built an altar"]'::jsonb, 'He drove out buyers and sellers', 'Jesus cleansed the temple by driving out those buying and selling.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus do in the temple in Mark 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 11, 1, 'What happened to the fig tree the next day?', '["It withered from the roots", "It bore fruit suddenly", "It was cut down by priests", "It was hidden by the crowd"]'::jsonb, 'It withered from the roots', 'The disciples saw that the fig tree had withered from the roots.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'What happened to the fig tree the next day?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 11, 2, 'What did the crowd cry as Jesus entered Jerusalem?', '["Hosanna", "Crucify him", "Long live Caesar", "Peace to Herod"]'::jsonb, 'Hosanna', 'The crowd shouted ''Hosanna'' as Jesus entered Jerusalem.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the crowd cry as Jesus entered Jerusalem?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 11, 2, 'What did Jesus call the temple?', '["A house of prayer for all nations", "A palace for Israel", "A market of necessity", "A fortress of David"]'::jsonb, 'A house of prayer for all nations', 'Jesus said the temple should be a house of prayer for all nations.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus call the temple?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 11, 2, 'What had the temple become according to Jesus?', '["A den of robbers", "A holy mountain only", "A royal court", "A school of the prophets"]'::jsonb, 'A den of robbers', 'Jesus accused the temple merchants of turning it into a den of robbers.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'What had the temple become according to Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 11, 2, 'What question did the leaders ask Jesus in the temple?', '["By what authority do you do these things?", "How many loaves remain?", "Who is the greatest?", "Where is Bartimaeus?"]'::jsonb, 'By what authority do you do these things?', 'The chief priests, scribes, and elders questioned Jesus'' authority.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'What question did the leaders ask Jesus in the temple?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 11, 3, 'What did Jesus tell the disciples to say if anyone asked about taking the colt?', '["The Lord has need of it", "Caesar has purchased it", "It belongs to the temple", "Peter will return it later"]'::jsonb, 'The Lord has need of it', 'Jesus instructed the disciples to say, ''The Lord has need of it.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did Jesus tell the disciples to say if anyone asked about taking the colt?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 11, 3, 'What did the people spread on the road before Jesus?', '["Cloaks and leafy branches", "Silver coins", "Fishing nets", "Sackcloth only"]'::jsonb, 'Cloaks and leafy branches', 'The crowd spread cloaks and branches on the road before Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did the people spread on the road before Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 11, 3, 'What did Peter say when he saw the fig tree?', '["Rabbi, look! The fig tree you cursed has withered", "The branches are growing again", "Should we build tents here?", "The temple is falling"]'::jsonb, 'Rabbi, look! The fig tree you cursed has withered', 'Peter pointed out the withered fig tree to Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did Peter say when he saw the fig tree?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 11, 3, 'What did Jesus say is necessary when praying?', '["Forgive, if you have anything against anyone", "Fast forty days first", "Travel to Jerusalem each time", "Bring a sacrifice in hand"]'::jsonb, 'Forgive, if you have anything against anyone', 'Jesus linked forgiving others with standing in prayer before the Father.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did Jesus say is necessary when praying?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 11, 4, 'Why did Jesus answer the leaders with a question about John''s baptism?', '["It exposed their refusal to answer truthfully and their fear of the crowd", "He had forgotten their question", "He needed more time to think", "He wanted to avoid the temple forever"]'::jsonb, 'It exposed their refusal to answer truthfully and their fear of the crowd', 'Jesus used John''s baptism to reveal the leaders'' dishonesty and fear of public opinion.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did Jesus answer the leaders with a question about John''s baptism?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 11, 4, 'What does the fig tree episode signify in context with the temple?', '["Judgment on fruitless religion", "The need for better farming", "A lesson about seasonal fruit only", "A prophecy about Rome''s gardens"]'::jsonb, 'Judgment on fruitless religion', 'The cursing and withering of the fig tree functions as a sign of judgment on outward appearance without fruit.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does the fig tree episode signify in context with the temple?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 11, 4, 'What kind of faith did Jesus describe after the fig tree withered?', '["Faith that does not doubt and trusts God in prayer", "Faith in political reform", "Faith in temple markets", "Faith in signs from heaven only"]'::jsonb, 'Faith that does not doubt and trusts God in prayer', 'Jesus taught about bold, trusting prayer and not doubting in the heart.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'What kind of faith did Jesus describe after the fig tree withered?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 11, 4, 'Why were the chief priests and scribes seeking a way to destroy Jesus?', '["Because they feared him as the crowd was astonished at his teaching", "Because he owed them money", "Because the Romans ordered it that day", "Because he lived in Nazareth"]'::jsonb, 'Because they feared him as the crowd was astonished at his teaching', 'The leaders feared Jesus because the crowd was amazed at his teaching and authority.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why were the chief priests and scribes seeking a way to destroy Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 11, 5, 'Where did Jesus first go after entering Jerusalem before returning to Bethany?', '["The temple", "Pilate''s headquarters", "The upper room", "The pool of Bethesda"]'::jsonb, 'The temple', 'After entering Jerusalem, Jesus looked around at everything in the temple and then went out to Bethany.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'Where did Jesus first go after entering Jerusalem before returning to Bethany?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 11, 5, 'What mountain did Jesus mention in his teaching on faith and prayer?', '["This mountain", "Mount Sinai", "Mount Hermon", "Mount Carmel"]'::jsonb, 'This mountain', 'Jesus said that if one believes, he may say to this mountain, ''Be taken up and cast into the sea.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What mountain did Jesus mention in his teaching on faith and prayer?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 11, 5, 'How did the leaders answer Jesus about John''s baptism?', '["We do not know", "It was from heaven", "It was from man", "Only Herod knows"]'::jsonb, 'We do not know', 'Refusing to commit themselves, the leaders answered, ''We do not know.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'How did the leaders answer Jesus about John''s baptism?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 11, 5, 'What was Jesus'' response after they refused to answer about John''s baptism?', '["Neither will I tell you by what authority I do these things", "He told them everything plainly", "He left Jerusalem forever", "He called for witnesses from Nazareth"]'::jsonb, 'Neither will I tell you by what authority I do these things', 'Because they would not answer honestly, Jesus declined to answer their question directly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What was Jesus'' response after they refused to answer about John''s baptism?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 12, 1, 'What did the tenants do to the vineyard owner''s beloved son in Mark 12?', '["They killed him", "They crowned him", "They paid him the rent", "They sent him back safely"]'::jsonb, 'They killed him', 'In the parable, the tenants killed the beloved son after casting him out.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the tenants do to the vineyard owner''s beloved son in Mark 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 12, 1, 'What did Jesus say should be rendered to Caesar?', '["The things that are Caesar''s", "The temple offerings", "Only the poor man''s coin", "The vineyard rent"]'::jsonb, 'The things that are Caesar''s', 'Jesus told his questioners to render to Caesar what belongs to Caesar.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say should be rendered to Caesar?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 12, 1, 'Which group questioned Jesus about the resurrection in Mark 12?', '["Sadducees", "Pharisees", "Herodians", "Zealots"]'::jsonb, 'Sadducees', 'The Sadducees, who say there is no resurrection, challenged Jesus in Mark 12.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'Which group questioned Jesus about the resurrection in Mark 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 12, 1, 'What commandment did Jesus call the first of all?', '["Love the Lord your God with all your heart", "Honor your father and mother", "Remember the Sabbath day", "Do not steal"]'::jsonb, 'Love the Lord your God with all your heart', 'Jesus said the first commandment is wholehearted love for God.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'What commandment did Jesus call the first of all?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 12, 2, 'What happened to the servants sent to the tenants before the son came?', '["They were beaten, shamed, or killed", "They all collected the fruit", "They became vineyard owners", "They joined the tenants"]'::jsonb, 'They were beaten, shamed, or killed', 'The tenants abused the owner''s servants one after another.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'What happened to the servants sent to the tenants before the son came?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 12, 2, 'What image was on the coin Jesus used in the tax discussion?', '["Caesar''s", "David''s", "Moses''", "Herod''s wife"]'::jsonb, 'Caesar''s', 'Jesus asked whose image and inscription were on the denarius, and the answer was Caesar''s.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'What image was on the coin Jesus used in the tax discussion?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 12, 2, 'What did Jesus say people are like in the resurrection?', '["Like angels in heaven", "Like kings on earth", "Like children in the marketplace", "Like priests in the temple"]'::jsonb, 'Like angels in heaven', 'Jesus said that in the resurrection people neither marry nor are given in marriage, but are like angels in heaven.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say people are like in the resurrection?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 12, 2, 'What second commandment did Jesus pair with love for God?', '["Love your neighbor as yourself", "Keep all feast days", "Honor Caesar above all", "Separate from Gentiles"]'::jsonb, 'Love your neighbor as yourself', 'Jesus said the second commandment is to love your neighbor as yourself.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'What second commandment did Jesus pair with love for God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 12, 3, 'What stone quotation did Jesus apply after the parable of the tenants?', '["The stone the builders rejected has become the cornerstone", "The Lord is my shepherd", "Out of Egypt I called my son", "A sower went out to sow"]'::jsonb, 'The stone the builders rejected has become the cornerstone', 'Jesus quoted the rejected-stone text to interpret the parable and his own rejection.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What stone quotation did Jesus apply after the parable of the tenants?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 12, 3, 'Why did Jesus say the Sadducees were wrong?', '["They knew neither the Scriptures nor the power of God", "They were too poor", "They ignored Caesar''s taxes", "They refused to fast"]'::jsonb, 'They knew neither the Scriptures nor the power of God', 'Jesus corrected the Sadducees by exposing their ignorance of both Scripture and God''s power.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why did Jesus say the Sadducees were wrong?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 12, 3, 'What did the scribe say was more than all whole burnt offerings and sacrifices?', '["To love God and neighbor", "To pay taxes honestly", "To rebuild the temple", "To fast twice a week"]'::jsonb, 'To love God and neighbor', 'The scribe agreed that loving God and neighbor is more than all burnt offerings and sacrifices.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did the scribe say was more than all whole burnt offerings and sacrifices?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 12, 3, 'What question did Jesus ask about the Christ and David?', '["How can the Christ be David''s son if David calls him Lord?", "Why did David flee Saul?", "How many psalms did David write?", "Was David taxed by Caesar?"]'::jsonb, 'How can the Christ be David''s son if David calls him Lord?', 'Jesus asked how the Messiah can be merely David''s son when David calls him Lord.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What question did Jesus ask about the Christ and David?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 12, 4, 'Why did the leaders send questioners to Jesus about taxes?', '["To trap him in his words", "To honor him publicly", "To seek financial advice", "To make him governor"]'::jsonb, 'To trap him in his words', 'The question about tribute was designed to catch Jesus between popular resentment and Roman authority.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did the leaders send questioners to Jesus about taxes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 12, 4, 'What does Jesus'' use of Exodus in the resurrection debate prove?', '["God is not God of the dead but of the living", "Marriage continues unchanged forever", "Only Moses will rise", "Resurrection belongs only to priests"]'::jsonb, 'God is not God of the dead but of the living', 'Jesus used God''s words to Moses to show that the patriarchs live before God.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Jesus'' use of Exodus in the resurrection debate prove?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 12, 4, 'Why did Jesus say the scribe was not far from the Kingdom of God?', '["He understood the priority of loving God and neighbor", "He had memorized every law", "He was wealthy like Abraham", "He rejected all sacrifices"]'::jsonb, 'He understood the priority of loving God and neighbor', 'The scribe grasped the heart of the law, showing nearness to the Kingdom.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did Jesus say the scribe was not far from the Kingdom of God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 12, 4, 'What does the tenants parable communicate about Israel''s leaders?', '["They reject God''s messengers and even the beloved Son", "They always honor the prophets", "They are innocent of violence", "They have already entered the Kingdom"]'::jsonb, 'They reject God''s messengers and even the beloved Son', 'The parable exposes the leaders'' pattern of rejecting God''s servants and his Son.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does the tenants parable communicate about Israel''s leaders?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 12, 5, 'How did the leaders react when they realized Jesus had spoken the parable against them?', '["They wanted to arrest him but feared the crowd", "They repented immediately", "They invited him to the council feast", "They crowned him as king"]'::jsonb, 'They wanted to arrest him but feared the crowd', 'The leaders understood the parable was about them but held back because they feared the crowd.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'How did the leaders react when they realized Jesus had spoken the parable against them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 12, 5, 'What did the common people do while listening to Jesus in Mark 12?', '["They heard him gladly", "They all left the temple", "They shouted for Barabbas", "They demanded a sign"]'::jsonb, 'They heard him gladly', 'Mark notes that the common people heard Jesus gladly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did the common people do while listening to Jesus in Mark 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 12, 5, 'What warning did Jesus give about the scribes?', '["They love honor and devour widows'' houses", "They are unable to read Scripture", "They never tithe mint", "They cannot enter the temple"]'::jsonb, 'They love honor and devour widows'' houses', 'Jesus warned against the scribes'' love of status and their exploitation of widows.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What warning did Jesus give about the scribes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 12, 5, 'What relationship did David have to the Messiah according to Jesus'' question?', '["David called him Lord", "David denied his coming", "David buried him in Jerusalem", "David was his priest"]'::jsonb, 'David called him Lord', 'Jesus emphasized that David himself called the Messiah ''Lord.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What relationship did David have to the Messiah according to Jesus'' question?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 13, 1, 'What did Jesus predict about the temple in Mark 13 (Not one stone would be left upon ano…)?', '["Not one stone would be left upon another", "It would become Rome''s palace", "It would stand forever unchanged", "It would be rebuilt in three days by Herod"]'::jsonb, 'Not one stone would be left upon another', 'Jesus foretold the destruction of the temple.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus predict about the temple in Mark 13 (Not one stone would be left upon ano…)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 13, 1, 'What did Jesus warn would come before the end in Mark 13?', '["Wars and rumors of wars", "Universal peace", "A rebuilt ark", "The end of preaching"]'::jsonb, 'Wars and rumors of wars', 'Jesus warned of wars and rumors of wars as part of the coming troubles.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus warn would come before the end in Mark 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 13, 1, 'What did Jesus say the gospel must first be preached to?', '["All nations", "Only Jerusalem", "Only Galilee", "Only the priests"]'::jsonb, 'All nations', 'Jesus said the gospel must first be preached to all nations.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Jesus say the gospel must first be preached to?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 13, 1, 'What repeated command closes the chapter''s teaching?', '["Watch", "Fast", "Hide", "Build"]'::jsonb, 'Watch', 'Jesus repeatedly commands his followers to watch.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'What repeated command closes the chapter''s teaching?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 13, 2, 'What should those in Judea do when they see the abomination of desolation?', '["Flee to the mountains", "Gather in the temple", "Go to Nazareth", "Wait for Herod"]'::jsonb, 'Flee to the mountains', 'Jesus warned those in Judea to flee immediately when that sign appears.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'What should those in Judea do when they see the abomination of desolation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 13, 2, 'What did Jesus say false christs and false prophets would do?', '["Show signs and wonders to lead astray if possible", "Build the temple again", "Feed the crowds daily", "Write new psalms"]'::jsonb, 'Show signs and wonders to lead astray if possible', 'Jesus warned of deceptive signs and wonders from false christs and prophets.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say false christs and false prophets would do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 13, 2, 'Who will gather the elect when the Son of Man comes?', '["Angels", "Roman armies", "The scribes", "Only Peter"]'::jsonb, 'Angels', 'Jesus said the angels will gather the elect from the ends of the earth and heaven.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'Who will gather the elect when the Son of Man comes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 13, 2, 'What lesson did Jesus say to learn from the fig tree?', '["Recognize the season when signs appear", "Never trust trees again", "Fruit always means judgment", "Summer should be feared"]'::jsonb, 'Recognize the season when signs appear', 'The fig tree teaches discernment about nearness when its branch becomes tender and puts out leaves.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'What lesson did Jesus say to learn from the fig tree?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 13, 3, 'What did Jesus call the initial troubles like wars and earthquakes?', '["The beginning of birth pains", "The final peace", "A minor inconvenience", "The day of full harvest"]'::jsonb, 'The beginning of birth pains', 'Jesus described those early troubles as the beginning of birth pains, not the end itself.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did Jesus call the initial troubles like wars and earthquakes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 13, 3, 'What did Jesus say would happen to his followers before governors and kings?', '["They would bear witness", "They would become rulers immediately", "They would always escape arrest", "They would stop preaching"]'::jsonb, 'They would bear witness', 'Jesus said persecutions would become opportunities to bear witness before rulers.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did Jesus say would happen to his followers before governors and kings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 13, 3, 'What did Jesus say about the day or hour?', '["No one knows, not even the angels, nor the Son, but only the Father", "Peter knew it exactly", "The scribes could calculate it", "It would be announced by Rome"]'::jsonb, 'No one knows, not even the angels, nor the Son, but only the Father', 'Jesus stressed that the exact day and hour are unknown except to the Father.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did Jesus say about the day or hour?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 13, 3, 'How did Jesus describe the coming of the Son of Man?', '["Coming in clouds with great power and glory", "Secretly in Nazareth only", "As a child in Bethlehem again", "As a voice in the temple"]'::jsonb, 'Coming in clouds with great power and glory', 'Jesus said the Son of Man will come in clouds with great power and glory.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'How did Jesus describe the coming of the Son of Man?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 13, 4, 'Why did Jesus warn ''See that no one leads you astray''?', '["Because deception would be a major danger before the end", "Because the roads to Jerusalem were unsafe", "Because only scribes could understand prophecy", "Because the temple market was closing"]'::jsonb, 'Because deception would be a major danger before the end', 'Jesus begins the discourse by warning against spiritual deception from false claimants and false prophets.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did Jesus warn ''See that no one leads you astray''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 13, 4, 'What does Jesus'' instruction not to premeditate defense before persecution teach?', '["The Holy Spirit will give needed words in that hour", "Preparation is always wrong", "Only the apostles should speak", "Courts no longer matter"]'::jsonb, 'The Holy Spirit will give needed words in that hour', 'Jesus encouraged trust in the Spirit''s help when disciples are brought before authorities.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Jesus'' instruction not to premeditate defense before persecution teach?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 13, 4, 'Why would the days of tribulation be shortened?', '["For the sake of the elect", "Because Rome repented", "Because the temple would survive", "Because the disciples were strong enough"]'::jsonb, 'For the sake of the elect', 'Jesus said those days would be shortened for the sake of the elect whom God chose.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why would the days of tribulation be shortened?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 13, 4, 'What image concludes Jesus'' call to readiness in Mark 13?', '["Servants watching for their master''s return", "A sower waiting for rain", "A king counting coins", "A shepherd losing sheep"]'::jsonb, 'Servants watching for their master''s return', 'Jesus ends with the picture of servants staying awake for the return of their master.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'What image concludes Jesus'' call to readiness in Mark 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 13, 5, 'Which four disciples asked Jesus privately about the temple prophecy?', '["Peter, James, John, and Andrew", "Peter, Matthew, Thomas, and Philip", "James, Jude, Bartholomew, and Simon", "All twelve"]'::jsonb, 'Peter, James, John, and Andrew', 'These four disciples asked Jesus privately when the temple destruction would happen.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'Which four disciples asked Jesus privately about the temple prophecy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 13, 5, 'What did Jesus say the one who endures to the end will do?', '["Be saved", "Escape every trial", "Become ruler over Israel", "Never die physically"]'::jsonb, 'Be saved', 'Jesus promised salvation to the one who endures to the end.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus say the one who endures to the end will do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 13, 5, 'What should the person on the housetop not do when flight is necessary?', '["Go down to take anything from the house", "Pray to the Father", "Warn the neighbors", "Leave immediately"]'::jsonb, 'Go down to take anything from the house', 'Jesus stressed urgent flight without delay or retrieval of possessions.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What should the person on the housetop not do when flight is necessary?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 13, 5, 'What did Jesus tell all his followers at the end of the discourse?', '["What I say to you I say to all: Watch", "Return to Galilee immediately", "Count the temple stones", "Tell no one what you heard"]'::jsonb, 'What I say to you I say to all: Watch', 'Jesus broadened the warning from the four disciples to all who follow him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus tell all his followers at the end of the discourse?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 14, 1, 'Who agreed to betray Jesus in Mark 14?', '["Judas Iscariot", "Peter", "John", "Bartimaeus"]'::jsonb, 'Judas Iscariot', 'Judas went to the chief priests to betray Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who agreed to betray Jesus in Mark 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 14, 1, 'What did a woman pour on Jesus in Mark 14?', '["Costly ointment", "Water", "Temple oil", "Dust"]'::jsonb, 'Costly ointment', 'A woman anointed Jesus with very costly ointment.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did a woman pour on Jesus in Mark 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 14, 1, 'Where did Jesus pray in deep sorrow in Mark 14?', '["Gethsemane", "Nazareth", "Bethany", "Jericho"]'::jsonb, 'Gethsemane', 'Jesus prayed in Gethsemane before his arrest.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'Where did Jesus pray in deep sorrow in Mark 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 14, 1, 'How many times did Peter deny Jesus in Mark 14?', '["Three", "One", "Two", "Seven"]'::jsonb, 'Three', 'Peter denied Jesus three times before the rooster crowed twice.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 14
    AND q.difficulty_stage = 1
    AND q.prompt = 'How many times did Peter deny Jesus in Mark 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 14, 2, 'What meal was Jesus eating with the disciples in Mark 14?', '["Passover", "Pentecost feast", "Wedding feast", "Daily synagogue meal"]'::jsonb, 'Passover', 'Jesus shared the Passover meal with his disciples.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'What meal was Jesus eating with the disciples in Mark 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 14, 2, 'What did Jesus say over the bread?', '["Take; this is my body", "This is the manna of Moses", "Keep this hidden", "Break it only tomorrow"]'::jsonb, 'Take; this is my body', 'Jesus identified the bread with his body.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say over the bread?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 14, 2, 'What did Jesus say about the cup?', '["This is my blood of the covenant poured out for many", "This cup belongs to Caesar", "Do not drink from it", "It is only a memorial of Egypt"]'::jsonb, 'This is my blood of the covenant poured out for many', 'Jesus identified the cup with his covenant blood poured out for many.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus say about the cup?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 14, 2, 'How did Judas identify Jesus to the arresting crowd?', '["With a kiss", "With a shout from the temple", "By handing them silver", "By pointing from a boat"]'::jsonb, 'With a kiss', 'Judas used a kiss as the agreed sign to identify Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 14
    AND q.difficulty_stage = 2
    AND q.prompt = 'How did Judas identify Jesus to the arresting crowd?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 14, 3, 'Why did Jesus defend the woman''s anointing?', '["She had anointed his body beforehand for burial", "She had paid the temple tax", "She was a prophetess from Nazareth", "She had supplied bread for the poor"]'::jsonb, 'She had anointed his body beforehand for burial', 'Jesus said the woman had done a beautiful thing by preparing his body for burial.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why did Jesus defend the woman''s anointing?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 14, 3, 'What did Jesus predict the disciples would do that night?', '["They would all fall away", "They would all die with him", "They would rule Jerusalem", "They would cast out more demons"]'::jsonb, 'They would all fall away', 'Jesus predicted that all the disciples would fall away that night.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did Jesus predict the disciples would do that night?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 14, 3, 'What did Jesus pray concerning the cup in Gethsemane?', '["If possible, let this cup pass; yet not what I will, but what you will", "Destroy this cup and rebuild it", "Give this cup to Peter", "Let the soldiers drink it"]'::jsonb, 'If possible, let this cup pass; yet not what I will, but what you will', 'Jesus prayed honestly about the coming suffering while submitting to the Father''s will.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did Jesus pray concerning the cup in Gethsemane?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 14, 3, 'What did the disciples repeatedly do while Jesus prayed?', '["They slept", "They fought the crowd", "They sang psalms", "They left for Nazareth"]'::jsonb, 'They slept', 'Jesus found Peter, James, and John sleeping instead of watching with him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 14
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did the disciples repeatedly do while Jesus prayed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 14, 4, 'What does Jesus'' statement about one dipping bread with him show in Mark 14?', '["Betrayal comes from one in close fellowship", "Only strangers reject him", "The meal itself caused the betrayal", "Peter was the betrayer"]'::jsonb, 'Betrayal comes from one in close fellowship', 'Jesus emphasized the pain and treachery of betrayal by one sharing the meal with him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Jesus'' statement about one dipping bread with him show in Mark 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 14, 4, 'Why did Jesus say the spirit is willing but the flesh is weak?', '["To explain the disciples'' failure to stay awake and pray", "To excuse Judas completely", "To reject prayer as useless", "To praise Peter''s strength"]'::jsonb, 'To explain the disciples'' failure to stay awake and pray', 'Jesus used the saying to expose the disciples'' weakness in the face of temptation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did Jesus say the spirit is willing but the flesh is weak?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 14, 4, 'What false testimony was brought against Jesus at the trial?', '["That he would destroy the temple made with hands and build another not made with hands", "That he denied Moses existed", "That he served Rome as a spy", "That he stole from widows"]'::jsonb, 'That he would destroy the temple made with hands and build another not made with hands', 'Witnesses twisted Jesus'' words into a charge about destroying and rebuilding the temple.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'What false testimony was brought against Jesus at the trial?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 14, 4, 'What happened when Jesus affirmed his identity before the high priest?', '["He was condemned for blasphemy", "The council repented", "Pilate released him", "Peter confessed publicly"]'::jsonb, 'He was condemned for blasphemy', 'After Jesus affirmed his identity and spoke of the Son of Man, the high priest tore his garments and the council condemned him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 14
    AND q.difficulty_stage = 4
    AND q.prompt = 'What happened when Jesus affirmed his identity before the high priest?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 14, 5, 'What unusual detail does Mark include about a young man at Jesus'' arrest?', '["He fled naked after leaving his linen cloth behind", "He drew a sword and was captured", "He gave Jesus water", "He carried the cross"]'::jsonb, 'He fled naked after leaving his linen cloth behind', 'Mark uniquely notes that a young man escaped naked after the crowd seized his linen garment.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'What unusual detail does Mark include about a young man at Jesus'' arrest?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 14, 5, 'What did Jesus say he would not drink again until he drank it new in the Kingdom of God?', '["The fruit of the vine", "Water from the Jordan", "Milk and honey", "Temple wine alone"]'::jsonb, 'The fruit of the vine', 'Jesus said he would not drink again of the fruit of the vine until the Kingdom.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus say he would not drink again until he drank it new in the Kingdom of God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 14, 5, 'How did Peter react after the rooster crowed the second time?', '["He broke down and wept", "He returned to the fire calmly", "He denied Jesus again", "He struck the servant"]'::jsonb, 'He broke down and wept', 'When Peter remembered Jesus'' words, he broke down and wept.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'How did Peter react after the rooster crowed the second time?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 14, 5, 'What was Jesus'' answer when asked if he was the Christ, the Son of the Blessed?', '["I am", "Ask the Father instead", "You say it, not I", "Silence"]'::jsonb, 'I am', 'Jesus answered directly, ''I am,'' and spoke of the Son of Man seated at the right hand of Power.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 14
    AND q.difficulty_stage = 5
    AND q.prompt = 'What was Jesus'' answer when asked if he was the Christ, the Son of the Blessed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 15, 1, 'Whom did the crowd ask Pilate to release instead of Jesus in Mark 15?', '["Barabbas", "Judas", "Joseph of Arimathea", "Simon of Cyrene"]'::jsonb, 'Barabbas', 'The crowd asked for Barabbas to be released instead of Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'Whom did the crowd ask Pilate to release instead of Jesus in Mark 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 15, 1, 'Who carried Jesus'' cross in Mark 15?', '["Simon of Cyrene", "Peter", "John", "Pilate"]'::jsonb, 'Simon of Cyrene', 'Simon of Cyrene was compelled to carry Jesus'' cross.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who carried Jesus'' cross in Mark 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 15, 1, 'What title was written over Jesus on the cross?', '["The King of the Jews", "The Prophet of Nazareth", "The Son of David", "The Holy One of God"]'::jsonb, 'The King of the Jews', 'The inscription over Jesus read, ''The King of the Jews.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'What title was written over Jesus on the cross?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 15, 1, 'Who buried Jesus in Mark 15?', '["Joseph of Arimathea", "Nicodemus", "Pilate", "Barabbas"]'::jsonb, 'Joseph of Arimathea', 'Joseph of Arimathea took courage, asked for Jesus'' body, and buried him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 15
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who buried Jesus in Mark 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 15, 2, 'What did Pilate ask Jesus at the start of the trial?', '["Are you the King of the Jews?", "Are you Elijah?", "Will you rebuild the temple?", "Can you feed the crowd?"]'::jsonb, 'Are you the King of the Jews?', 'Pilate questioned Jesus by asking if he was the King of the Jews.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Pilate ask Jesus at the start of the trial?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 15, 2, 'What did the soldiers put on Jesus while mocking him?', '["Purple and a crown of thorns", "White linen and sandals", "A high priestly robe", "A fisherman''s cloak"]'::jsonb, 'Purple and a crown of thorns', 'The soldiers clothed Jesus in purple and crowned him with thorns to mock him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the soldiers put on Jesus while mocking him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 15, 2, 'What happened from the sixth hour to the ninth hour in Mark 15?', '["Darkness came over the whole land", "The temple was rebuilt", "A flood covered Jerusalem", "The crowd went home"]'::jsonb, 'Darkness came over the whole land', 'Darkness covered the whole land from the sixth hour until the ninth hour.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'What happened from the sixth hour to the ninth hour in Mark 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 15, 2, 'What happened to the temple veil when Jesus died?', '["It was torn in two", "It turned scarlet", "It was removed by priests", "It became thicker"]'::jsonb, 'It was torn in two', 'At Jesus'' death the veil of the temple was torn in two from top to bottom.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 15
    AND q.difficulty_stage = 2
    AND q.prompt = 'What happened to the temple veil when Jesus died?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 15, 3, 'Why did Pilate know the chief priests had delivered Jesus up?', '["Because of envy", "Because Jesus had confessed robbery", "Because Herod sent him", "Because the crowd was silent"]'::jsonb, 'Because of envy', 'Pilate perceived that the chief priests had handed Jesus over out of envy.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why did Pilate know the chief priests had delivered Jesus up?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 15, 3, 'What did Jesus cry from the cross in Aramaic?', '["Eloi, Eloi, lama sabachthani?", "Talitha cumi", "Ephphatha", "Abba, Father"]'::jsonb, 'Eloi, Eloi, lama sabachthani?', 'Jesus cried out, ''My God, my God, why have you forsaken me?'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did Jesus cry from the cross in Aramaic?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 15, 3, 'How did the centurion respond when he saw how Jesus died?', '["Truly this man was the Son of God", "He was only a righteous teacher", "Caesar is lord", "The temple must stand forever"]'::jsonb, 'Truly this man was the Son of God', 'The centurion confessed Jesus as God''s Son when he saw how he died.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'How did the centurion respond when he saw how Jesus died?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 15, 3, 'What was Golgotha interpreted to mean?', '["Place of a Skull", "House of Bread", "Valley of Tears", "Gate of the King"]'::jsonb, 'Place of a Skull', 'Golgotha is translated ''Place of a Skull.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 15
    AND q.difficulty_stage = 3
    AND q.prompt = 'What was Golgotha interpreted to mean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 15, 4, 'What does Barabbas''s release highlight in the passion narrative?', '["The innocent Jesus is condemned while the guilty go free", "Rome always acted justly", "Pilate had full courage", "The priests believed in Jesus"]'::jsonb, 'The innocent Jesus is condemned while the guilty go free', 'The exchange between Jesus and Barabbas highlights the injustice of the trial and the substitutionary pattern of the passion.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Barabbas''s release highlight in the passion narrative?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 15, 4, 'Why is the tearing of the veil significant?', '["It signals a decisive opening and judgment connected to Jesus'' death", "It proves the earthquake alone caused all events", "It means the temple service continued unchanged", "It only marks a weather disturbance"]'::jsonb, 'It signals a decisive opening and judgment connected to Jesus'' death', 'The torn veil marks the significance of Jesus'' death in relation to access to God and judgment on the old order.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is the tearing of the veil significant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 15, 4, 'What irony runs through the soldiers'' mockery of Jesus as king?', '["They mockingly proclaim a truth they do not understand", "Jesus truly had lost all authority", "Pilate had secretly crowned Barabbas", "The priests were defending God''s Son"]'::jsonb, 'They mockingly proclaim a truth they do not understand', 'Their taunts about kingship ironically announce Jesus'' true identity.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'What irony runs through the soldiers'' mockery of Jesus as king?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 15, 4, 'Why did Joseph of Arimathea''s action matter at the end of Mark 15?', '["It provided an honorable burial and fixed the known location of Jesus'' tomb", "It allowed the priests to take control", "It hid the body from the women", "It fulfilled Caesar''s command"]'::jsonb, 'It provided an honorable burial and fixed the known location of Jesus'' tomb', 'Joseph''s burial of Jesus establishes both dignity and the public location of the tomb.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 15
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why did Joseph of Arimathea''s action matter at the end of Mark 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 15, 5, 'What did Jesus refuse after tasting it before the crucifixion?', '["Wine mixed with myrrh", "Water from the Jordan", "Bread from the temple", "Oil for anointing"]'::jsonb, 'Wine mixed with myrrh', 'Jesus was offered wine mixed with myrrh, but he did not take it.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Jesus refuse after tasting it before the crucifixion?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 15, 5, 'What did the soldiers do with Jesus'' garments?', '["They cast lots for them", "They burned them", "They returned them to Mary", "They gave them to Barabbas"]'::jsonb, 'They cast lots for them', 'The soldiers divided Jesus'' garments by casting lots.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did the soldiers do with Jesus'' garments?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 15, 5, 'Who were among the women watching from a distance in Mark 15?', '["Mary Magdalene, Mary the mother of James the younger and of Joses, and Salome", "Only Pilate''s wife", "Martha and Mary of Bethany only", "No women were present"]'::jsonb, 'Mary Magdalene, Mary the mother of James the younger and of Joses, and Salome', 'Mark names these women among those watching from a distance.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'Who were among the women watching from a distance in Mark 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 15, 5, 'What did Joseph use to close Jesus'' tomb?', '["A stone rolled against the entrance", "A wooden door", "A Roman seal only", "A curtain"]'::jsonb, 'A stone rolled against the entrance', 'Joseph rolled a stone against the door of the tomb.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 15
    AND q.difficulty_stage = 5
    AND q.prompt = 'What did Joseph use to close Jesus'' tomb?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 16, 1, 'Who went to Jesus'' tomb in Mark 16?', '["Mary Magdalene, Mary the mother of James, and Salome", "Peter, James, and John", "Pilate and the guards", "Joseph of Arimathea and Nicodemus"]'::jsonb, 'Mary Magdalene, Mary the mother of James, and Salome', 'These women came to the tomb early on the first day of the week.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who went to Jesus'' tomb in Mark 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 16, 1, 'What did the women find at the tomb in Mark 16?', '["The stone rolled away", "Jesus still lying there", "Roman guards asleep outside", "A sealed entrance"]'::jsonb, 'The stone rolled away', 'When the women arrived, they saw that the stone had already been rolled away.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did the women find at the tomb in Mark 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 16, 1, 'Who first saw the risen Jesus according to Mark 16?', '["Mary Magdalene", "Peter", "Salome", "Joseph of Arimathea"]'::jsonb, 'Mary Magdalene', 'Mark says Jesus appeared first to Mary Magdalene.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who first saw the risen Jesus according to Mark 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 16, 1, 'Where did Jesus say the disciples would see him?', '["Galilee", "Nazareth", "Jerusalem''s temple", "Bethany"]'::jsonb, 'Galilee', 'The messenger at the tomb said Jesus was going before them to Galilee.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 16
    AND q.difficulty_stage = 1
    AND q.prompt = 'Where did Jesus say the disciples would see him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 16, 2, 'What kind of figure did the women see sitting in the tomb?', '["A young man clothed in a white robe", "An armed soldier", "John the Baptist", "Elijah"]'::jsonb, 'A young man clothed in a white robe', 'The women saw a young man in a white robe sitting on the right side inside the tomb.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'What kind of figure did the women see sitting in the tomb?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 16, 2, 'What message did the young man give about Jesus?', '["He has risen; he is not here", "He has gone back to Nazareth permanently", "He sleeps until the last day", "He was taken by the priests"]'::jsonb, 'He has risen; he is not here', 'The messenger announced the resurrection and pointed to the empty place where Jesus had been laid.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'What message did the young man give about Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 16, 2, 'What did Jesus rebuke the eleven for in Mark 16?', '["Their unbelief and hardness of heart", "Their lack of food", "Their poor fishing", "Their refusal to go to Nazareth"]'::jsonb, 'Their unbelief and hardness of heart', 'Jesus rebuked the eleven because they did not believe those who had seen him risen.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus rebuke the eleven for in Mark 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 16, 2, 'What did Jesus command to be preached in Mark 16?', '["The gospel to all creation", "Only the law of Moses", "The rebuilding of the temple", "Judgment on Rome alone"]'::jsonb, 'The gospel to all creation', 'Jesus commissioned the disciples to preach the gospel to all creation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 16
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Jesus command to be preached in Mark 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 16, 3, 'What did the women initially do after leaving the tomb?', '["They fled trembling and said nothing to anyone because they were afraid", "They immediately preached in the temple", "They ran to Pilate first", "They returned home rejoicing loudly"]'::jsonb, 'They fled trembling and said nothing to anyone because they were afraid', 'Mark records their fear and trembling after hearing the resurrection message.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did the women initially do after leaving the tomb?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 16, 3, 'To whom did Jesus appear in another form while they were walking in the country?', '["Two disciples", "The chief priests", "Mary and Martha", "James and John alone"]'::jsonb, 'Two disciples', 'Mark says Jesus appeared in another form to two of them as they walked into the country.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'To whom did Jesus appear in another form while they were walking in the country?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 16, 3, 'What did Jesus say about belief and baptism in Mark 16?', '["Whoever believes and is baptized will be saved", "Only those from Galilee will be saved", "Belief is unnecessary if one is sincere", "Baptism saves apart from faith"]'::jsonb, 'Whoever believes and is baptized will be saved', 'Jesus linked salvation with belief and baptism while condemning unbelief.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'What did Jesus say about belief and baptism in Mark 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 16, 3, 'Where did Jesus go after speaking to the disciples?', '["He was taken up into heaven and sat at God''s right hand", "He returned to the tomb", "He hid in the wilderness", "He went to Rome"]'::jsonb, 'He was taken up into heaven and sat at God''s right hand', 'Mark concludes with Jesus'' ascension and exaltation at God''s right hand.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 16
    AND q.difficulty_stage = 3
    AND q.prompt = 'Where did Jesus go after speaking to the disciples?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 16, 4, 'Why is Peter named specifically in the message at the tomb?', '["It highlights restoration for the disciple who had denied Jesus", "It means Peter alone would see Jesus", "It excludes the other disciples", "It appoints Peter as a priest of the temple"]'::jsonb, 'It highlights restoration for the disciple who had denied Jesus', 'The specific mention of Peter carries grace toward the one who had failed so publicly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is Peter named specifically in the message at the tomb?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 16, 4, 'What does Jesus'' rebuke of the eleven show after the resurrection?', '["Even after the resurrection, faith must replace stubborn unbelief", "The resurrection changed nothing", "Only Mary could truly understand", "The disciples were rejected forever"]'::jsonb, 'Even after the resurrection, faith must replace stubborn unbelief', 'Jesus confronts their unbelief and calls them into responsive trust before sending them out.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Jesus'' rebuke of the eleven show after the resurrection?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 16, 4, 'What is the purpose of the signs mentioned in Mark 16?', '["They accompany and confirm the preached gospel", "They replace the need for preaching", "They are for display only", "They are given to every person equally"]'::jsonb, 'They accompany and confirm the preached gospel', 'The signs are presented as accompanying believers and confirming the message proclaimed.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'What is the purpose of the signs mentioned in Mark 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 16, 4, 'What does Jesus'' ascension to God''s right hand communicate?', '["His exalted authority after resurrection", "His retirement from mission", "His defeat by earthly rulers", "His return to ordinary life"]'::jsonb, 'His exalted authority after resurrection', 'Sitting at God''s right hand signifies Jesus'' exalted reign and authority.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 16
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Jesus'' ascension to God''s right hand communicate?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 16, 5, 'What question were the women asking on the way to the tomb?', '["Who will roll away the stone for us?", "Who will feed the crowd?", "Who will betray Jesus?", "Who will pay the tax?"]'::jsonb, 'Who will roll away the stone for us?', 'On the way, the women wondered who would roll away the heavy stone from the tomb entrance.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What question were the women asking on the way to the tomb?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 16, 5, 'What had Jesus cast out of Mary Magdalene, according to Mark 16?', '["Seven demons", "A legion of demons", "Leprosy", "Blindness"]'::jsonb, 'Seven demons', 'Mark notes that Jesus had cast seven demons out of Mary Magdalene.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What had Jesus cast out of Mary Magdalene, according to Mark 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 16, 5, 'How did the disciples respond when Mary Magdalene reported that she had seen the risen Jesus?', '["They did not believe", "They worshiped immediately", "They ran to Galilee at once", "They informed Pilate"]'::jsonb, 'They did not believe', 'Mark says the disciples did not believe Mary''s report at first.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'How did the disciples respond when Mary Magdalene reported that she had seen the risen Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 16, 5, 'What happened after the disciples went out preaching everywhere?', '["The Lord worked with them and confirmed the message", "They returned to fishing permanently", "Rome stopped all their preaching", "No one listened to them"]'::jsonb, 'The Lord worked with them and confirmed the message', 'Mark closes by saying the Lord worked with the disciples and confirmed the word through accompanying signs.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 16
    AND q.difficulty_stage = 5
    AND q.prompt = 'What happened after the disciples went out preaching everywhere?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 1, 4, 'What does Jesus'' cleansing of the leper in Mark 1 show about his holiness?', '["His holiness overcomes uncleanness rather than being defiled by it", "He ignores the law entirely", "He avoids all contact with suffering people", "He can help only after priestly approval"]'::jsonb, 'His holiness overcomes uncleanness rather than being defiled by it', 'When Jesus touched the leper, uncleanness did not spread to him; instead, cleansing flowed from him to the leper.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Jesus'' cleansing of the leper in Mark 1 show about his holiness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 1, 5, 'How does Mark 1 present Jesus'' ministry in relation to John''s preparatory role?', '["John prepares the way, and Jesus immediately arrives as the promised Lord and stronger one", "John replaces Jesus as the main focus of the Gospel", "Jesus begins only after John''s teaching is forgotten", "John and Jesus preach opposing messages"]'::jsonb, 'John prepares the way, and Jesus immediately arrives as the promised Lord and stronger one', 'Mark opens with John as the forerunner, then presents Jesus as the promised one whose authority and mission fulfill that preparation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Mark 1 present Jesus'' ministry in relation to John''s preparatory role?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 41, 1, 5, 'Why is it significant in Mark 1 that Jesus both preaches the Kingdom and casts out demons?', '["It shows God''s reign arriving in word and power against evil", "It proves Rome has already fallen", "It means teaching matters less than miracles", "It limits his mission to Capernaum only"]'::jsonb, 'It shows God''s reign arriving in word and power against evil', 'Mark 1 joins proclamation and exorcism to show that Jesus announces God''s Kingdom and demonstrates its authority over evil.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 41
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is it significant in Mark 1 that Jesus both preaches the Kingdom and casts out demons?'
);
