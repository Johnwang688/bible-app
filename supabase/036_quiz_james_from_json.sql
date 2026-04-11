-- ============================================================================
-- LOGOS LIGHT - James (book 59) quiz questions from quiz-questions/james.json
-- ============================================================================
-- Idempotent: skips rows that already match (book_number, chapter, difficulty_stage, prompt).
-- ============================================================================

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 1, 1, 'According to James 1, what should a person ask God for when lacking it?', '["Wisdom","Wealth","Long life","A sign"]'::jsonb, 'Wisdom', 'James says to ask God for wisdom, who gives generously (James 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to James 1, what should a person ask God for when lacking it?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 1, 1, 'According to James 1, what should the lowly brother do?', '["Glory in his high position","Hide from trials","Seek revenge","Boast in riches"]'::jsonb, 'Glory in his high position', 'The lowly brother is to glory in his high position in Christ (James 1:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to James 1, what should the lowly brother do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 1, 1, 'According to James 1, what kind of person is unstable in all his ways?', '["A double-minded man","A quiet listener","A cheerful giver","A faithful elder"]'::jsonb, 'A double-minded man', 'James describes the doubter as double-minded and unstable in all his ways (James 1:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to James 1, what kind of person is unstable in all his ways?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 1, 1, 'According to James 1, what fades away in its pursuits?', '["The rich man","The poor widow","The sower","The teacher"]'::jsonb, 'The rich man', 'James says the rich man will fade away in his pursuits like a flower (James 1:10-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to James 1, what fades away in its pursuits?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 1, 1, 'According to James 1, what crown is promised to the one who endures temptation?', '["The crown of life","The crown of gold","The victor''s wreath","The royal crown"]'::jsonb, 'The crown of life', 'The one who endures testing will receive the crown of life (James 1:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to James 1, what crown is promised to the one who endures temptation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 1, 1, 'According to James 1, every good gift and every perfect gift comes from whom?', '["The Father of lights","The elders","Human effort","The law of Moses"]'::jsonb, 'The Father of lights', 'James says every good and perfect gift comes down from the Father of lights (James 1:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to James 1, every good gift and every perfect gift comes from whom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 1, 1, 'According to James 1, what should everyone be quick to do?', '["Hear","Speak","Judge","Promise"]'::jsonb, 'Hear', 'James says everyone should be quick to hear, slow to speak, and slow to anger (James 1:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to James 1, what should everyone be quick to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 1, 2, 'According to James 1, how should believers regard various trials?', '["As all joy","As a curse only","As proof God left them","As reasons to quit praying"]'::jsonb, 'As all joy', 'James tells believers to count it all joy when they fall into various trials (James 1:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to James 1, how should believers regard various trials?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 1, 2, 'According to James 1, what does the testing of faith produce?', '["Perseverance","Comfort only","Riches","Reputation"]'::jsonb, 'Perseverance', 'The testing of faith produces perseverance or patience (James 1:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to James 1, what does the testing of faith produce?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 1, 2, 'According to James 1, how must a person ask God for wisdom?', '["In faith, without doubting","With many witnesses","Only while fasting","By repeating long prayers"]'::jsonb, 'In faith, without doubting', 'James says the one who asks must ask in faith without any doubting (James 1:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to James 1, how must a person ask God for wisdom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 1, 2, 'According to James 1, to what is the doubter compared?', '["A wave of the sea","A rooted tree","A city on a hill","A lamp on a stand"]'::jsonb, 'A wave of the sea', 'The doubter is like a wave of the sea driven by the wind and tossed (James 1:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to James 1, to what is the doubter compared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 1, 2, 'According to James 1, what gives birth to sin when it has conceived?', '["Lust","Wisdom","Mercy","Discipline"]'::jsonb, 'Lust', 'James says each person is drawn away by his own lust, and when lust has conceived, it gives birth to sin (James 1:14-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to James 1, what gives birth to sin when it has conceived?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 1, 2, 'According to James 1, by what did God bring believers forth?', '["The word of truth","Signs and wonders","Temple sacrifices","National heritage"]'::jsonb, 'The word of truth', 'James says God brought us forth by the word of truth (James 1:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to James 1, by what did God bring believers forth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 1, 2, 'According to James 1, what should believers put away to receive the implanted word?', '["All filthiness and overflow of wickedness","All food and drink","Every earthly job","Every friendship"]'::jsonb, 'All filthiness and overflow of wickedness', 'James calls believers to put away filthiness and rampant wickedness and receive the implanted word (James 1:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to James 1, what should believers put away to receive the implanted word?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 1, 3, 'In James 1, why can trials be counted as joy?', '["They mature believers through tested faith","They always remove pain immediately","They guarantee earthly wealth","They replace the need for prayer"]'::jsonb, 'They mature believers through tested faith', 'James ties joy in trials to tested faith producing perseverance and maturity (James 1:2-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'In James 1, why can trials be counted as joy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 1, 3, 'What does James 1 imply about the person who doubts while praying for wisdom?', '["He lacks settled trust in God","He prays too quietly","He asks for too little","He should stop reading Scripture"]'::jsonb, 'He lacks settled trust in God', 'James links doubting with instability and warns such a person not to expect to receive from the Lord (James 1:6-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does James 1 imply about the person who doubts while praying for wisdom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 1, 3, 'What contrast does James 1 make between humble believers and rich people?', '["Status before God outlasts earthly prosperity","Riches guarantee spiritual authority","Poverty blocks spiritual growth","Humility means refusing all work"]'::jsonb, 'Status before God outlasts earthly prosperity', 'James tells the lowly brother to glory in exaltation and the rich in humiliation because wealth fades like a flower (James 1:9-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What contrast does James 1 make between humble believers and rich people?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 1, 3, 'According to James 1, where does temptation toward sin arise?', '["From a person''s own desires","From God''s character","From the implanted word","From pure religion"]'::jsonb, 'From a person''s own desires', 'James says each person is tempted when drawn away by his own lust, not by God (James 1:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to James 1, where does temptation toward sin arise?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 1, 3, 'Why does James 1 call the word "implanted"?', '["It is received inwardly and can save the soul","It is carved only on stone tablets","It grows only through public debate","It belongs only to teachers"]'::jsonb, 'It is received inwardly and can save the soul', 'James urges believers to receive the implanted word, which is able to save their souls (James 1:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does James 1 call the word "implanted"?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 1, 3, 'What is wrong with hearing the word without doing it in James 1?', '["It produces self-deception","It proves the word is weak","It replaces worship","It guarantees blessing anyway"]'::jsonb, 'It produces self-deception', 'James says hearers who are not doers deceive themselves (James 1:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is wrong with hearing the word without doing it in James 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 1, 3, 'Why does James compare a hearer-only person to someone looking in a mirror?', '["He sees truth briefly but fails to act on it","He studies the law too carefully","He learns to judge others","He becomes more eloquent"]'::jsonb, 'He sees truth briefly but fails to act on it', 'The hearer-only person looks, goes away, and forgets what he was like (James 1:23-24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does James compare a hearer-only person to someone looking in a mirror?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 1, 4, 'How does James 1 connect prayer for wisdom with endurance in trials?', '["God-given wisdom helps believers respond faithfully under testing","Wisdom removes every trial at once","Only the wealthy need wisdom","Trials matter only after wisdom is gained"]'::jsonb, 'God-given wisdom helps believers respond faithfully under testing', 'The call to ask for wisdom follows directly after James explains the purpose of trials and perseverance (James 1:2-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does James 1 connect prayer for wisdom with endurance in trials?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 1, 4, 'What does James 1 teach by saying God does not change like shifting shadows?', '["His goodness is constant and reliable","He cannot see human suffering","He changes plans daily","He favors only one class of people"]'::jsonb, 'His goodness is constant and reliable', 'James grounds every good gift in the Father of lights, with whom there is no variation or shifting shadow (James 1:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does James 1 teach by saying God does not change like shifting shadows?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 1, 4, 'Why does James 1 place anger next to hearing and speaking?', '["Unchecked speech and anger hinder righteous response to God''s word","Anger is needed to understand truth","Listening matters only in conflict","Speech is holier than obedience"]'::jsonb, 'Unchecked speech and anger hinder righteous response to God''s word', 'James calls believers to be quick to hear, slow to speak, and slow to anger because human anger does not produce God''s righteousness (James 1:19-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does James 1 place anger next to hearing and speaking?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 1, 4, 'What is the function of the mirror image in James 1 within the chapter''s larger argument?', '["It shows that revelation demands obedient response","It proves Scripture is unclear","It dismisses the value of self-examination","It teaches that memory is sinful"]'::jsonb, 'It shows that revelation demands obedient response', 'James uses the mirror image to contrast fleeting hearing with persevering obedience to the word (James 1:22-25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What is the function of the mirror image in James 1 within the chapter''s larger argument?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 1, 4, 'How does James 1 define the blessed person in relation to the law of liberty?', '["He continues in it as a doer, not a forgetful hearer","He avoids the law entirely","He masters arguments about the law","He teaches others but does not practice it"]'::jsonb, 'He continues in it as a doer, not a forgetful hearer', 'The one who looks into the perfect law of liberty and continues in it will be blessed in doing (James 1:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does James 1 define the blessed person in relation to the law of liberty?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 1, 4, 'Why does James 1 say unbridled speech can make religion worthless?', '["Speech reveals whether the heart is self-deceived","Words never affect spiritual life","Silence is the only true worship","Teaching is forbidden to believers"]'::jsonb, 'Speech reveals whether the heart is self-deceived', 'James says a person who does not bridle his tongue deceives his heart and his religion is worthless (James 1:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does James 1 say unbridled speech can make religion worthless?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 1, 4, 'What two marks of pure religion are paired in James 1?', '["Mercy toward the vulnerable and personal holiness","Public miracles and long prayers","Temple attendance and fasting","Debate skill and social honor"]'::jsonb, 'Mercy toward the vulnerable and personal holiness', 'Pure religion visits orphans and widows in their affliction and keeps oneself unstained from the world (James 1:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What two marks of pure religion are paired in James 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 1, 5, 'How does James 1 reflect wisdom teaching when it links trials, steadfastness, and maturity?', '["It treats endurance as the path to complete character","It rejects moral formation entirely","It limits wisdom to intellectual study","It says testing has no purpose"]'::jsonb, 'It treats endurance as the path to complete character', 'James sounds like wisdom literature by presenting tested perseverance as the route to being complete and lacking nothing (James 1:2-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does James 1 reflect wisdom teaching when it links trials, steadfastness, and maturity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 1, 5, 'What theological point is made in James 1 by denying that God tempts anyone?', '["God''s holiness means evil arises from human desire, not his character","God lacks power over evil","Trials and temptation are identical gifts","Sin is caused by creation itself"]'::jsonb, 'God''s holiness means evil arises from human desire, not his character', 'James insists God cannot be tempted by evil and does not tempt anyone, shifting blame away from God to human desire (James 1:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What theological point is made in James 1 by denying that God tempts anyone?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 1, 5, 'Why is the phrase "first fruits of his creatures" significant in James 1?', '["Believers are portrayed as the beginning of God''s renewed people","Only Israel can be saved","Creation has been abandoned","Humans become angels"]'::jsonb, 'Believers are portrayed as the beginning of God''s renewed people', 'James says God brought believers forth by the word of truth so that they would be a kind of first fruits of his creatures (James 1:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the phrase "first fruits of his creatures" significant in James 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 1, 5, 'How does James 1 hold together new birth by the word and obedience to the word?', '["The word both creates new life and governs the new life it creates","New birth makes obedience unnecessary","Obedience replaces the need for grace","The word matters only at conversion"]'::jsonb, 'The word both creates new life and governs the new life it creates', 'James says God brought believers forth by the word of truth and then commands them to receive and do that word (James 1:18, 21-25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does James 1 hold together new birth by the word and obedience to the word?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 1, 5, 'What is the likely force of calling Scripture the "perfect law of liberty" in James 1?', '["God''s word frees people into obedient life rather than bondage","James rejects all moral commands","Liberty means having no master at all","The law applies only to judges"]'::jsonb, 'God''s word frees people into obedient life rather than bondage', 'James presents the perfect law of liberty as the pattern in which the doer continues and is blessed (James 1:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the likely force of calling Scripture the "perfect law of liberty" in James 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 1, 5, 'How does James 1 challenge a merely external religion?', '["It measures faith by bridled speech, mercy, and holiness","It replaces conduct with ceremony","It says emotions alone define devotion","It limits religion to private ideas"]'::jsonb, 'It measures faith by bridled speech, mercy, and holiness', 'James closes by testing religion through the tongue, care for the vulnerable, and separation from worldly stain (James 1:26-27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does James 1 challenge a merely external religion?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 1, 5, 'What larger biblical reversal stands behind James 1:9-11 on the lowly and the rich?', '["God overturns worldly status by exalting the humble and humbling the proud","Material success is always a sign of election","Poverty is holier than obedience","Social class cannot be judged by God"]'::jsonb, 'God overturns worldly status by exalting the humble and humbling the proud', 'James echoes a broader biblical theme by telling the lowly to boast in exaltation and the rich in humiliation because earthly splendor fades (James 1:9-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger biblical reversal stands behind James 1:9-11 on the lowly and the rich?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 2, 1, 'According to James 2, what should believers not show while holding the faith of Jesus Christ?', '["Partiality","Mercy","Patience","Hospitality"]'::jsonb, 'Partiality', 'James says believers must not hold the faith of Jesus Christ with partiality (James 2:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to James 2, what should believers not show while holding the faith of Jesus Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 2, 1, 'According to James 2, what did the favored visitor wear on his fingers?', '["A gold ring","A priestly seal","Iron chains","Silver bracelets"]'::jsonb, 'A gold ring', 'James describes a rich man coming in with a gold ring and fine clothing (James 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to James 2, what did the favored visitor wear on his fingers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 2, 1, 'According to James 2, where was the poor man told to stand or sit?', '["By your footstool","At the place of honor","Beside the teacher","At the head table"]'::jsonb, 'By your footstool', 'The poor man is told to stand there or sit by the footstool (James 2:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to James 2, where was the poor man told to stand or sit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 2, 1, 'According to James 2, what law is fulfilled by loving your neighbor as yourself?', '["The royal law","The ceremonial law","The food law","The civil code"]'::jsonb, 'The royal law', 'James calls "You shall love your neighbor as yourself" the royal law (James 2:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to James 2, what law is fulfilled by loving your neighbor as yourself?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 2, 1, 'According to James 2, mercy triumphs over what?', '["Judgment","Discipline","Knowledge","Weakness"]'::jsonb, 'Judgment', 'James says mercy triumphs over judgment (James 2:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to James 2, mercy triumphs over what?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 2, 1, 'According to James 2, what kind of faith is dead?', '["Faith without works","Faith with prayer","Faith with patience","Faith with mercy"]'::jsonb, 'Faith without works', 'James says faith by itself, if it has no works, is dead (James 2:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to James 2, what kind of faith is dead?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 2, 1, 'According to James 2, which prostitute is named as an example?', '["Rahab","Jezebel","Gomer","Delilah"]'::jsonb, 'Rahab', 'James names Rahab the prostitute as an example of faith shown by works (James 2:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to James 2, which prostitute is named as an example?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 2, 2, 'According to James 2, what have believers become if they favor the rich over the poor?', '["Judges with evil thoughts","Wise stewards","Peaceful servants","Guardians of order"]'::jsonb, 'Judges with evil thoughts', 'James says such favoritism makes them judges with evil thoughts (James 2:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to James 2, what have believers become if they favor the rich over the poor?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 2, 2, 'According to James 2, whom has God chosen to be rich in faith?', '["The poor as to the world","The famous teachers","The rulers of the synagogue","The merchants"]'::jsonb, 'The poor as to the world', 'James says God chose the poor as to the world to be rich in faith and heirs of the kingdom (James 2:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to James 2, whom has God chosen to be rich in faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 2, 2, 'According to James 2, who were dragging believers before courts?', '["The rich","The poor","The widows","The tax collectors"]'::jsonb, 'The rich', 'James asks whether the rich are not the ones oppressing believers and dragging them into court (James 2:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to James 2, who were dragging believers before courts?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 2, 2, 'According to James 2, what happens if someone keeps the whole law but stumbles in one point?', '["He becomes guilty of all","He is excused by effort","He breaks only a minor rule","He needs no repentance"]'::jsonb, 'He becomes guilty of all', 'James says stumbling in one point makes a person guilty of all (James 2:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to James 2, what happens if someone keeps the whole law but stumbles in one point?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 2, 2, 'According to James 2, how should believers speak and act?', '["As those judged by a law of liberty","As those beyond judgment","As those seeking honor","As those fearing the rich"]'::jsonb, 'As those judged by a law of liberty', 'James says to speak and act as those who will be judged by a law of liberty (James 2:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to James 2, how should believers speak and act?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 2, 2, 'In James 2, what example shows that words alone do not help someone in need?', '["Telling a poorly clothed brother to be warmed and filled","Inviting a rich man to the front seat","Asking God for wisdom","Anointing the sick with oil"]'::jsonb, 'Telling a poorly clothed brother to be warmed and filled', 'James says empty words without giving needed help do not profit the needy (James 2:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'In James 2, what example shows that words alone do not help someone in need?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 2, 2, 'According to James 2, what do demons do that shows mere belief is insufficient?', '["They believe that God is one and shudder","They pray with faith","They perform works of mercy","They confess publicly and obey"]'::jsonb, 'They believe that God is one and shudder', 'James says even the demons believe that God is one, and they shudder (James 2:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to James 2, what do demons do that shows mere belief is insufficient?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 2, 3, 'Why does James 2 treat favoritism as incompatible with faith in Christ?', '["It contradicts God''s valuing of the lowly and neighbor love","It helps protect church order","It is only a social mistake","It matters only in public worship"]'::jsonb, 'It contradicts God''s valuing of the lowly and neighbor love', 'James condemns favoritism because God chose the poor and because the royal law requires love of neighbor (James 2:1-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does James 2 treat favoritism as incompatible with faith in Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 2, 3, 'What does James 2 suggest about selective obedience to the law?', '["Breaking one part exposes rebellion against the Lawgiver","Selective obedience is good enough","Only major sins count","Neighbor love replaces all commands"]'::jsonb, 'Breaking one part exposes rebellion against the Lawgiver', 'James argues from the one God who said both not to commit adultery and not to murder (James 2:10-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does James 2 suggest about selective obedience to the law?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 2, 3, 'Why does James ask whether faith can save a person who never helps the needy?', '["He is exposing a claim to faith that lacks living evidence","He is denying the value of confession entirely","He is teaching salvation by wealth","He is arguing against prayer for the poor"]'::jsonb, 'He is exposing a claim to faith that lacks living evidence', 'James challenges a merely verbal claim to faith when no merciful action appears (James 2:14-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does James ask whether faith can save a person who never helps the needy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 2, 3, 'What does James 2 mean when it says faith was working with Abraham''s works?', '["His actions expressed and completed his trust in God","His works replaced faith","His faith began only at Moriah","His obedience was unrelated to belief"]'::jsonb, 'His actions expressed and completed his trust in God', 'James says faith worked with Abraham''s works and by works faith was perfected (James 2:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does James 2 mean when it says faith was working with Abraham''s works?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 2, 3, 'Why is Rahab a striking example in James 2?', '["Her risky action showed faith from an unexpected person","She was an Israelite judge","She kept silent rather than acting","She was wealthy and honored first"]'::jsonb, 'Her risky action showed faith from an unexpected person', 'Rahab the prostitute demonstrated faith by receiving the messengers and sending them out another way (James 2:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is Rahab a striking example in James 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 2, 3, 'What is the force of James 2:13, "mercy triumphs over judgment"?', '["Those shaped by mercy should show mercy in view of coming judgment","Judgment no longer exists","Mercy cancels all moral responsibility","Only judges need mercy"]'::jsonb, 'Those shaped by mercy should show mercy in view of coming judgment', 'James warns that judgment is without mercy to the one who has shown no mercy, then says mercy triumphs over judgment (James 2:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the force of James 2:13, "mercy triumphs over judgment"?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 2, 3, 'How does the body-spirit comparison clarify James''s point about faith?', '["Works are to faith what breath is to a body''s life","Works are optional decorations","Faith is a body and works are a shadow","The spirit can save a dead body by itself"]'::jsonb, 'Works are to faith what breath is to a body''s life', 'James says just as the body apart from the spirit is dead, so faith apart from works is dead (James 2:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does the body-spirit comparison clarify James''s point about faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 2, 4, 'How does James 2 connect church seating practices with theology?', '["Social favoritism reveals distorted values before the God who honors the poor","Seating order is merely administrative","Rich visitors are always holier guests","The poor should never attend assemblies"]'::jsonb, 'Social favoritism reveals distorted values before the God who honors the poor', 'James moves from seating the rich and poor differently to God''s choice of the poor and the royal law of love (James 2:2-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does James 2 connect church seating practices with theology?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 2, 4, 'Why does James 2 use both the royal law and the law of liberty?', '["To show that God''s liberating word still demands neighbor love","To separate two contradictory moral systems","To limit liberty to wealthy believers","To replace mercy with strict ritual"]'::jsonb, 'To show that God''s liberating word still demands neighbor love', 'James speaks of the royal law, love of neighbor, and then says believers will be judged by the law of liberty (James 2:8, 12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does James 2 use both the royal law and the law of liberty?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 2, 4, 'What role does the Shema-like confession "God is one" play in James 2?', '["It proves orthodox words alone do not equal obedient faith","It shows demons are saved","It denies the need for confession","It replaces Abraham as an example"]'::jsonb, 'It proves orthodox words alone do not equal obedient faith', 'James uses correct monotheistic belief to show that doctrinal accuracy by itself is not saving faith, since demons believe and shudder (James 2:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'What role does the Shema-like confession "God is one" play in James 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 2, 4, 'How do Abraham and Rahab together strengthen James''s argument?', '["They show living faith across radically different social backgrounds","They prove only ancestors can obey","They limit faith to Israelite heroes","They show works matter only in wartime"]'::jsonb, 'They show living faith across radically different social backgrounds', 'James pairs Abraham, the patriarch, with Rahab, a Gentile prostitute, to show that genuine faith acts (James 2:21-25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do Abraham and Rahab together strengthen James''s argument?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 2, 4, 'What does James 2 imply about the relationship between profession and practice?', '["A verbal claim must be matched by deeds of love and obedience","Practice matters only for leaders","Profession alone is the highest form of faith","Deeds can replace all belief"]'::jsonb, 'A verbal claim must be matched by deeds of love and obedience', 'James repeatedly tests the claim "I have faith" by asking whether concrete actions accompany it (James 2:14-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does James 2 imply about the relationship between profession and practice?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 2, 4, 'Why does James 2 frame mercy in the context of future judgment?', '["Present conduct reveals whether one grasps God''s merciful rule","Future judgment is only symbolic","Mercy belongs only to courts","Judgment applies only to unbelievers"]'::jsonb, 'Present conduct reveals whether one grasps God''s merciful rule', 'James tells believers to speak and act as those who will be judged, then warns the merciless about judgment (James 2:12-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does James 2 frame mercy in the context of future judgment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 2, 4, 'How does James 2 guard against separating doctrine from ethics?', '["It insists true belief must be embodied in love and obedience","It says ethics matter but doctrine does not","It reduces faith to social activism only","It treats doctrine as a private hobby"]'::jsonb, 'It insists true belief must be embodied in love and obedience', 'James criticizes favoritism, lack of mercy, and inactive faith to show that theology must shape conduct (James 2:1-26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does James 2 guard against separating doctrine from ethics?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 2, 5, 'How does James 2 use Leviticus 19:18 in its argument about favoritism?', '["Neighbor love exposes partiality as a direct violation of God''s royal command","It narrows love to one''s economic equals","It replaces concern for the poor with ritual purity","It proves courts are unnecessary"]'::jsonb, 'Neighbor love exposes partiality as a direct violation of God''s royal command', 'James cites "You shall love your neighbor as yourself" and applies it against favoritism in the assembly (James 2:8-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does James 2 use Leviticus 19:18 in its argument about favoritism?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 2, 5, 'What is the theological logic behind James 2:10-11 on becoming guilty of all?', '["The unity of the law reflects the authority of the one Lawgiver","Every sin is equal in earthly consequence","Only murder and adultery matter","The law can be divided by preference"]'::jsonb, 'The unity of the law reflects the authority of the one Lawgiver', 'James argues that the same God who forbade adultery also forbade murder, so selective obedience still opposes him (James 2:10-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the theological logic behind James 2:10-11 on becoming guilty of all?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 2, 5, 'Why is James 2:24 often discussed in relation to Abraham?', '["It stresses that genuine faith is shown and completed in obedient action","It denies Abraham''s prior belief entirely","It teaches that sacrifice earns salvation mechanically","It rejects Genesis as unreliable"]'::jsonb, 'It stresses that genuine faith is shown and completed in obedient action', 'James points to Abraham''s offering of Isaac to show that faith was active with his works and was perfected by them (James 2:21-24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is James 2:24 often discussed in relation to Abraham?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 2, 5, 'How does James 2 redefine what counts as "seeing" true faith?', '["Faith becomes visible through deeds that correspond to confession","Only inward sincerity can ever be known","Faith is seen through wealth and rank","Speech alone makes faith visible"]'::jsonb, 'Faith becomes visible through deeds that correspond to confession', 'James responds to the challenge "Show me your faith" by insisting faith is shown by works (James 2:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does James 2 redefine what counts as "seeing" true faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 2, 5, 'What broader biblical pattern appears when James 2 highlights the poor as heirs of the kingdom?', '["God often honors those the world overlooks","Earthly poverty automatically saves","The kingdom excludes the rich by definition","Material lack replaces repentance"]'::jsonb, 'God often honors those the world overlooks', 'James says God chose the poor in the world to be rich in faith and heirs of the kingdom, echoing a repeated biblical reversal (James 2:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What broader biblical pattern appears when James 2 highlights the poor as heirs of the kingdom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 2, 5, 'How does James 2 resist reducing salvation to either bare assent or bare activism?', '["It presents works as the living expression of real faith","It says faith and works are unrelated paths","It makes action valuable without trust in God","It teaches that belief is enough if emotions are sincere"]'::jsonb, 'It presents works as the living expression of real faith', 'James does not praise deeds apart from faith; he argues that real faith is active and not dead (James 2:17-26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does James 2 resist reducing salvation to either bare assent or bare activism?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 2, 5, 'What is the effect of placing Rahab after Abraham in James 2?', '["It widens the claim so that active faith is not confined to one class or history","It weakens the example by moving away from Israel","It proves lineage matters more than belief","It limits the lesson to spies and warfare"]'::jsonb, 'It widens the claim so that active faith is not confined to one class or history', 'By pairing Abraham and Rahab, James shows that active faith characterizes God''s people across very different backgrounds (James 2:21-25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the effect of placing Rahab after Abraham in James 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 3, 1, 'According to James 3, why should not many become teachers?', '["They will receive heavier judgment","They must travel constantly","They cannot marry","They must stop working"]'::jsonb, 'They will receive heavier judgment', 'James warns that teachers will receive heavier judgment (James 3:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to James 3, why should not many become teachers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 3, 1, 'According to James 3, what small object is put into horses'' mouths?', '["Bits","Stones","Hooks","Coins"]'::jsonb, 'Bits', 'James mentions bits in horses'' mouths to direct their whole bodies (James 3:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to James 3, what small object is put into horses'' mouths?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 3, 1, 'According to James 3, what tiny thing steers a large ship?', '["A rudder","An anchor","A sailcloth patch","A rope knot"]'::jsonb, 'A rudder', 'James says a very small rudder turns a large ship (James 3:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to James 3, what tiny thing steers a large ship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 3, 1, 'According to James 3, the tongue is compared to what that sets a forest ablaze?', '["A small fire","A flood","A hammer","A thorn bush"]'::jsonb, 'A small fire', 'James says see how small a fire can ignite a great forest (James 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to James 3, the tongue is compared to what that sets a forest ablaze?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 3, 1, 'According to James 3, what do people bless with the tongue?', '["The Lord and Father","Only friends","Their own wisdom","The rich alone"]'::jsonb, 'The Lord and Father', 'James says with the tongue we bless our Lord and Father (James 3:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to James 3, what do people bless with the tongue?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 3, 1, 'According to James 3, what cannot produce both fresh and bitter water?', '["A spring","A vineyard","A mountain","A cistern lid"]'::jsonb, 'A spring', 'James asks whether a spring pours out fresh and bitter water from the same opening (James 3:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to James 3, what cannot produce both fresh and bitter water?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 3, 1, 'According to James 3, what is first among the qualities of wisdom from above?', '["Pure","Popular","Bold","Severe"]'::jsonb, 'Pure', 'James says the wisdom from above is first pure, then peaceable and more (James 3:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to James 3, what is first among the qualities of wisdom from above?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 3, 2, 'According to James 3, in how many things do we all stumble?', '["Many things","One thing only","Only in speech","Never at all"]'::jsonb, 'Many things', 'James says we all stumble in many things (James 3:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to James 3, in how many things do we all stumble?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 3, 2, 'According to James 3, what kind of person is able to bridle the whole body?', '["A man who does not stumble in word","A wealthy elder","A silent monk","A strong soldier"]'::jsonb, 'A man who does not stumble in word', 'James says if anyone does not stumble in word, he is a perfect man able to bridle the whole body (James 3:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to James 3, what kind of person is able to bridle the whole body?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 3, 2, 'According to James 3, what is the tongue full of?', '["Deadly poison","Quiet wisdom","Living water","Sacred mystery"]'::jsonb, 'Deadly poison', 'James calls the tongue a restless evil full of deadly poison (James 3:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to James 3, what is the tongue full of?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 3, 2, 'According to James 3, after blessing God with the tongue, what do people also do with it?', '["Curse people made in God''s likeness","Sing psalms all day","Teach the law perfectly","Heal the sick"]'::jsonb, 'Curse people made in God''s likeness', 'James says with the same tongue people curse men who are made in the likeness of God (James 3:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to James 3, after blessing God with the tongue, what do people also do with it?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 3, 2, 'According to James 3, what cannot a fig tree bear?', '["Olives","Figs","Leaves","Shade"]'::jsonb, 'Olives', 'James asks if a fig tree can yield olives; the implied answer is no (James 3:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to James 3, what cannot a fig tree bear?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 3, 2, 'According to James 3, how should a wise and understanding person show his works?', '["By good conduct in meekness of wisdom","By loud speeches","By public honors","By strict appearance alone"]'::jsonb, 'By good conduct in meekness of wisdom', 'James says wisdom should be shown by good conduct with the humility of wisdom (James 3:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to James 3, how should a wise and understanding person show his works?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 3, 2, 'According to James 3, what follows where jealousy and selfish ambition exist?', '["Confusion and every evil deed","Peace and order","Long life and health","Forgiveness and joy"]'::jsonb, 'Confusion and every evil deed', 'James says where jealousy and selfish ambition are, there is confusion and every evil deed (James 3:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to James 3, what follows where jealousy and selfish ambition exist?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 3, 3, 'Why does James 3 begin with a warning to teachers before discussing the tongue broadly?', '["Teachers especially influence others through speech","Teaching avoids accountability","Only teachers struggle with words","The church needed fewer listeners"]'::jsonb, 'Teachers especially influence others through speech', 'James warns teachers of stricter judgment and then develops how powerful and dangerous speech can be (James 3:1-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does James 3 begin with a warning to teachers before discussing the tongue broadly?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 3, 3, 'What does James 3 suggest about the tongue''s power relative to its size?', '["Small instruments can direct or destroy far more than their size suggests","Only large things matter spiritually","Words matter less than intentions","Speech cannot shape conduct"]'::jsonb, 'Small instruments can direct or destroy far more than their size suggests', 'James compares the tongue to a bit, rudder, and small fire to show disproportionate influence (James 3:3-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does James 3 suggest about the tongue''s power relative to its size?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 3, 3, 'Why does James call the tongue inconsistent when it blesses God and curses people?', '["People bear God''s likeness, so cursing them contradicts worship","Cursing is acceptable in worship","Speech has no moral link to theology","Only public cursing is wrong"]'::jsonb, 'People bear God''s likeness, so cursing them contradicts worship', 'James grounds the inconsistency in the fact that humans are made in God''s likeness (James 3:9-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does James call the tongue inconsistent when it blesses God and curses people?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 3, 3, 'What is James 3 communicating through the spring, fig tree, and vine examples?', '["A source should produce output consistent with its nature","Nature can change by willpower instantly","Speech is morally neutral","Mixed fruit is a mark of wisdom"]'::jsonb, 'A source should produce output consistent with its nature', 'James uses natural analogies to show that corrupt speech reveals a deeper inconsistency at the source (James 3:11-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is James 3 communicating through the spring, fig tree, and vine examples?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 3, 3, 'How does James 3 distinguish earthly wisdom from wisdom from above?', '["One is driven by envy and ambition, the other by purity and peace","One belongs to teachers and the other to laypeople","One is practical and the other useless","One avoids works and the other avoids doctrine"]'::jsonb, 'One is driven by envy and ambition, the other by purity and peace', 'Earthly wisdom is marked by jealousy and selfish ambition, while wisdom from above is pure and peaceable (James 3:14-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does James 3 distinguish earthly wisdom from wisdom from above?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 3, 3, 'Why is meekness important in James 3''s description of wisdom?', '["True wisdom shows itself without proud self-assertion","Meekness means never speaking","Wisdom requires social weakness only","Meekness replaces truthfulness"]'::jsonb, 'True wisdom shows itself without proud self-assertion', 'James says wise people show their works in the meekness or humility of wisdom (James 3:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is meekness important in James 3''s description of wisdom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 3, 3, 'What does James 3 imply about communities marked by selfish ambition?', '["They become disorderly and morally corrupted","They become disciplined and fruitful","They avoid conflict through silence","They naturally produce righteousness"]'::jsonb, 'They become disorderly and morally corrupted', 'James says jealousy and selfish ambition produce disorder and every evil practice (James 3:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does James 3 imply about communities marked by selfish ambition?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 3, 4, 'How do the opening images in James 3 support its warning about leadership?', '["They show how small acts of speech can steer whole lives and groups","They prove teachers should never speak publicly","They limit speech problems to children","They teach that actions matter but words do not"]'::jsonb, 'They show how small acts of speech can steer whole lives and groups', 'The bit, rudder, and fire images explain why speech, especially from teachers, carries serious moral weight (James 3:1-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do the opening images in James 3 support its warning about leadership?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 3, 4, 'What is the theological tension in James 3 when humans bless God and curse people?', '["Worship of God is contradicted by contempt for his image-bearers","God values speech but not people","Human likeness to God ended after Eden","Cursing is a form of blessing"]'::jsonb, 'Worship of God is contradicted by contempt for his image-bearers', 'James says such speech is improper because people are made in God''s likeness (James 3:9-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'What is the theological tension in James 3 when humans bless God and curse people?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 3, 4, 'Why does James 3 call certain wisdom earthly, sensual, and demonic?', '["Because its source and fruits oppose the character of God","Because all practical skill is evil","Because wisdom belongs only to heaven","Because emotion is always sinful"]'::jsonb, 'Because its source and fruits oppose the character of God', 'James labels jealous and self-seeking wisdom as earthly, unspiritual, and demonic because it yields disorder and evil (James 3:14-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does James 3 call certain wisdom earthly, sensual, and demonic?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 3, 4, 'How does James 3 define peace in relation to wisdom?', '["Peace is both a trait of heavenly wisdom and the soil where righteousness grows","Peace means avoiding all correction","Peace belongs only to private devotion","Peace comes from winning arguments"]'::jsonb, 'Peace is both a trait of heavenly wisdom and the soil where righteousness grows', 'Wisdom from above is peaceable, and the fruit of righteousness is sown in peace by peacemakers (James 3:17-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does James 3 define peace in relation to wisdom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 3, 4, 'What connection exists in James 3 between inner motives and outward speech?', '["Corrupt motives eventually surface in destructive words and disorder","Speech is detached from the heart","Only public teaching reveals motives","Words can purify envy by themselves"]'::jsonb, 'Corrupt motives eventually surface in destructive words and disorder', 'James moves from the tongue''s danger to jealousy and selfish ambition, showing the moral source behind harmful speech (James 3:6, 14-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'What connection exists in James 3 between inner motives and outward speech?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 3, 4, 'Why does James 3 emphasize that no human can tame the tongue?', '["It exposes human weakness and the need for deeper transformation","It excuses reckless speech","It means discipline is useless","It singles out only unbelievers"]'::jsonb, 'It exposes human weakness and the need for deeper transformation', 'James contrasts humanity''s ability to tame animals with its inability to tame the tongue, underscoring the seriousness of the problem (James 3:7-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does James 3 emphasize that no human can tame the tongue?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 3, 4, 'How does James 3 tie wisdom to conduct rather than mere claims?', '["The wise must show their works by good conduct and meekness","Wisdom is proved by mystical experiences","Claims of wisdom are enough by themselves","Only silence counts as wisdom"]'::jsonb, 'The wise must show their works by good conduct and meekness', 'James asks who is wise, then answers by pointing to observable conduct shaped by humility (James 3:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does James 3 tie wisdom to conduct rather than mere claims?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 3, 5, 'What Genesis echo strengthens James 3''s argument about cursing people?', '["Humans are made in the image and likeness of God","Language was divided at Babel","Adam named the animals","The serpent spoke in Eden"]'::jsonb, 'Humans are made in the image and likeness of God', 'James grounds the wrongness of cursing people in their being made in God''s likeness, echoing Genesis image-bearing language (James 3:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What Genesis echo strengthens James 3''s argument about cursing people?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 3, 5, 'How does James 3 portray speech as a theological issue and not just a social one?', '["Speech reveals allegiance either to God''s wisdom or to corrupted desire","Speech matters only for reputation","The tongue is dangerous only in worship services","Words are important mainly for politics"]'::jsonb, 'Speech reveals allegiance either to God''s wisdom or to corrupted desire', 'James links speech to judgment, image-bearing, demonic wisdom, and righteous peace, making it deeply theological (James 3:1, 9, 15-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does James 3 portray speech as a theological issue and not just a social one?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 3, 5, 'Why is wisdom from above described first as pure in James 3?', '["Moral integrity is the fountainhead of the rest of its qualities","Purity is less important than peace","James means ritual washing only","Purity refers only to speech volume"]'::jsonb, 'Moral integrity is the fountainhead of the rest of its qualities', 'James orders heavenly wisdom beginning with purity, then peaceableness and other communal fruits (James 3:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is wisdom from above described first as pure in James 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 3, 5, 'What is the significance of the phrase "fruit of righteousness" in James 3:18?', '["Right living grows in the atmosphere created by peacemakers","Righteousness is earned by avoiding conflict","Fruit refers only to speech control","Peace is the same as compromise"]'::jsonb, 'Right living grows in the atmosphere created by peacemakers', 'James says the fruit of righteousness is sown in peace by those who make peace (James 3:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the significance of the phrase "fruit of righteousness" in James 3:18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 3, 5, 'How does James 3 anticipate the next chapter''s discussion of conflicts?', '["It exposes envy and selfish ambition as seeds of communal disorder","It resolves all disputes before chapter 4 begins","It shifts away from inner motives entirely","It treats conflict as purely political"]'::jsonb, 'It exposes envy and selfish ambition as seeds of communal disorder', 'James 3 ends by naming envy and selfish ambition, which chapter 4 then develops into quarrels and fights (James 3:14-16; 4:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does James 3 anticipate the next chapter''s discussion of conflicts?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 3, 5, 'What does James 3 imply about the relationship between created order and moral order?', '["Creation''s consistent fruits expose the absurdity of morally mixed speech","Nature is morally irrelevant","Speech creates a new nature each day","Moral order changes with social rank"]'::jsonb, 'Creation''s consistent fruits expose the absurdity of morally mixed speech', 'James appeals to springs, fig trees, and vines to show that moral inconsistency should be as unnatural as mixed natural outputs (James 3:11-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does James 3 imply about the relationship between created order and moral order?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 3, 5, 'Why does James 3 join meekness with wisdom rather than with weakness?', '["Because heavenly wisdom acts without proud rivalry and still produces good works","Because meekness means refusing responsibility","Because only the powerless can be wise","Because wisdom hides itself from community life"]'::jsonb, 'Because heavenly wisdom acts without proud rivalry and still produces good works', 'James presents meekness as the proper mode in which wise conduct appears, in contrast to selfish ambition (James 3:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does James 3 join meekness with wisdom rather than with weakness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 4, 1, 'According to James 4, where do wars and fightings among believers come from?', '["Their pleasures that war in their members","Rome''s taxes","Bad weather","Lack of teachers"]'::jsonb, 'Their pleasures that war in their members', 'James says conflicts come from pleasures that war in their members (James 4:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to James 4, where do wars and fightings among believers come from?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 4, 1, 'According to James 4, what kind of friendship is enmity with God?', '["Friendship with the world","Friendship with believers","Friendship with strangers","Friendship with the poor"]'::jsonb, 'Friendship with the world', 'James says friendship with the world is enmity with God (James 4:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to James 4, what kind of friendship is enmity with God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 4, 1, 'According to James 4, to whom does God give grace?', '["The humble","The proud","The wealthy","The angry"]'::jsonb, 'The humble', 'James says God resists the proud but gives grace to the humble (James 4:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to James 4, to whom does God give grace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 4, 1, 'According to James 4, what should believers do and the devil will flee?', '["Resist him","Ignore him","Debate him","Serve him"]'::jsonb, 'Resist him', 'James says resist the devil, and he will flee from you (James 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to James 4, what should believers do and the devil will flee?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 4, 1, 'According to James 4, what should believers draw near to?', '["God","The marketplace","Public praise","The rich"]'::jsonb, 'God', 'James says draw near to God, and he will draw near to you (James 4:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to James 4, what should believers draw near to?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 4, 1, 'According to James 4, what is your life like?', '["A vapor","A fortress","A river","A mountain"]'::jsonb, 'A vapor', 'James says life is a vapor that appears for a little time and then vanishes (James 4:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to James 4, what is your life like?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 4, 1, 'According to James 4, what is it if someone knows to do good and does not do it?', '["Sin","Weakness only","A small mistake","No offense"]'::jsonb, 'Sin', 'James says to the one who knows to do good and does not do it, to him it is sin (James 4:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to James 4, what is it if someone knows to do good and does not do it?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 4, 2, 'According to James 4, why do believers not have what they desire?', '["They do not ask","They fast too often","They work too hard","They obey too much"]'::jsonb, 'They do not ask', 'James says, "You don''t have because you don''t ask" (James 4:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to James 4, why do believers not have what they desire?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 4, 2, 'According to James 4, why do some ask and still not receive?', '["They ask with wrong motives to spend it on pleasures","They ask too quietly","They ask on the Sabbath","They ask without elders present"]'::jsonb, 'They ask with wrong motives to spend it on pleasures', 'James says some ask and do not receive because they ask wrongly to spend it on pleasures (James 4:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to James 4, why do some ask and still not receive?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 4, 2, 'According to James 4, what should sinners do with their hands?', '["Cleanse them","Raise them in pride","Hide them","Fold them in laziness"]'::jsonb, 'Cleanse them', 'James says, "Cleanse your hands, you sinners" (James 4:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to James 4, what should sinners do with their hands?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 4, 2, 'According to James 4, what should the double-minded do with their hearts?', '["Purify them","Harden them","Follow them","Ignore them"]'::jsonb, 'Purify them', 'James says, "Purify your hearts, you double-minded" (James 4:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to James 4, what should the double-minded do with their hearts?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 4, 2, 'According to James 4, what should believers not do against one another?', '["Speak against one another","Pray for one another","Confess to one another","Serve one another"]'::jsonb, 'Speak against one another', 'James tells believers not to speak against one another (James 4:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to James 4, what should believers not do against one another?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 4, 2, 'According to James 4, who is the one lawgiver and judge?', '["God","Moses","The church elder","Caesar"]'::jsonb, 'God', 'James says there is one lawgiver and judge, who is able to save and destroy (James 4:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to James 4, who is the one lawgiver and judge?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 4, 2, 'According to James 4, what should people say instead of boasting about tomorrow?', '["If the Lord wills, we will live and do this or that","Tomorrow is guaranteed","We control our own future","Fortune will favor us"]'::jsonb, 'If the Lord wills, we will live and do this or that', 'James says plans should be made with the words, "If the Lord wills" (James 4:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to James 4, what should people say instead of boasting about tomorrow?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 4, 3, 'What does James 4 identify as the root of outward conflict?', '["Disordered desires within people","A lack of political power","Poor communication only","Too much fasting"]'::jsonb, 'Disordered desires within people', 'James traces fights to pleasures warring within the members (James 4:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does James 4 identify as the root of outward conflict?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 4, 3, 'Why does James 4 call worldliness spiritual adultery?', '["Because divided loyalty betrays covenant friendship with God","Because all social contact is sinful","Because marriage is the only theme in the chapter","Because wealth itself is always forbidden"]'::jsonb, 'Because divided loyalty betrays covenant friendship with God', 'James addresses "adulterers and adulteresses" because friendship with the world makes one God''s enemy (James 4:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does James 4 call worldliness spiritual adultery?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 4, 3, 'What is the logic of James 4:6, "He gives more grace"?', '["God opposes pride but provides grace for repentance and humility","Grace removes the need to repent","Grace is given only after perfection","Pride attracts God''s favor"]'::jsonb, 'God opposes pride but provides grace for repentance and humility', 'James couples greater grace with the statement that God resists the proud and gives grace to the humble (James 4:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the logic of James 4:6, "He gives more grace"?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 4, 3, 'Why does James 4 combine submission to God with resistance to the devil?', '["Spiritual victory depends on yielding to God rather than to rival powers","The devil can be resisted without repentance","Submission and resistance are opposites only","The devil flees from human strength alone"]'::jsonb, 'Spiritual victory depends on yielding to God rather than to rival powers', 'James says submit to God, resist the devil, and draw near to God as parts of one response (James 4:7-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does James 4 combine submission to God with resistance to the devil?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 4, 3, 'What is wrong with boasting about future business in James 4?', '["It assumes control over a life and future that belong to God","Trade is inherently sinful","Travel is forbidden to Christians","Planning is always unbelief"]'::jsonb, 'It assumes control over a life and future that belong to God', 'James rebukes arrogant planning because life is brief and plans must be subject to the Lord''s will (James 4:13-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is wrong with boasting about future business in James 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 4, 3, 'Why does James 4 treat slander as an attack on the law?', '["Judging a brother arrogates to oneself the authority of the Lawgiver","The law commands public insult","Speech against a brother is never serious","Only civil courts can judge speech"]'::jsonb, 'Judging a brother arrogates to oneself the authority of the Lawgiver', 'James says the one who speaks against a brother speaks against the law and judges the law, though there is one Lawgiver (James 4:11-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does James 4 treat slander as an attack on the law?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 4, 3, 'What kind of repentance does James 4 call for in verses 8-10?', '["A humble, serious turning from sin toward God","A merely public ritual","A private mood with no change","A celebration of self-confidence"]'::jsonb, 'A humble, serious turning from sin toward God', 'James calls for cleansing, purifying, mourning, weeping, and humbling oneself before the Lord (James 4:8-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What kind of repentance does James 4 call for in verses 8-10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 4, 4, 'How does James 4 connect unanswered prayer with inner desires?', '["Prayer is corrupted when requests merely feed self-centered passions","God never answers requests for daily needs","Desire is always sinful regardless of object","Wrong motives matter less than persistence"]'::jsonb, 'Prayer is corrupted when requests merely feed self-centered passions', 'James says some do not receive because they ask wrongly to spend it on pleasures (James 4:2-3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does James 4 connect unanswered prayer with inner desires?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 4, 4, 'What progression does James 4 present from pride to restoration?', '["Pride must yield to humility before God, who then exalts","Self-assertion leads directly to honor","Restoration comes through judging others","Humility is useful only after success"]'::jsonb, 'Pride must yield to humility before God, who then exalts', 'James quotes God''s opposition to the proud and ends the section by saying, "Humble yourselves... and he will exalt you" (James 4:6, 10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'What progression does James 4 present from pride to restoration?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 4, 4, 'Why does James 4 move from resisting the devil to cleansing hands and purifying hearts?', '["Spiritual warfare involves concrete repentance, not slogans only","The devil is defeated by ritual washing alone","External cleansing replaces inner change","Resistance means withdrawing from all people"]'::jsonb, 'Spiritual warfare involves concrete repentance, not slogans only', 'James pairs resistance with drawing near to God, cleansing hands, and purifying hearts, showing a moral and spiritual response (James 4:7-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does James 4 move from resisting the devil to cleansing hands and purifying hearts?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 4, 4, 'How does James 4 challenge human autonomy in making plans?', '["It demands that planning be subordinated to God''s sovereign will","It forbids all business decisions","It says tomorrow can be known exactly","It values confidence more than dependence"]'::jsonb, 'It demands that planning be subordinated to God''s sovereign will', 'James rebukes boastful planning and insists that people say, "If the Lord wills" (James 4:13-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does James 4 challenge human autonomy in making plans?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 4, 4, 'What does James 4 teach about speech against a brother in relation to community life?', '["Slander fractures fellowship by replacing humility with self-appointed judgment","Strong communities depend on accusations","Speech is unrelated to community order","Only formal judges may sin this way"]'::jsonb, 'Slander fractures fellowship by replacing humility with self-appointed judgment', 'James forbids speaking against one another and roots the warning in God''s sole authority as Lawgiver and Judge (James 4:11-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does James 4 teach about speech against a brother in relation to community life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 4, 4, 'Why does James 4 end with a statement about knowing the good and failing to do it?', '["It broadens sin beyond evil acts to include culpable omission","It excuses inaction when motives are sincere","It limits sin to wealthy traders","It separates knowledge from responsibility"]'::jsonb, 'It broadens sin beyond evil acts to include culpable omission', 'James concludes that failing to do known good is itself sin (James 4:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does James 4 end with a statement about knowing the good and failing to do it?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 4, 4, 'How does James 4 tie inner cravings to broader social conflict and worldliness?', '["Private passions spill outward into quarrels and divided loyalty","Social conflict is caused only by outsiders","Worldliness is merely a fashion choice","Conflict ends when desire is celebrated"]'::jsonb, 'Private passions spill outward into quarrels and divided loyalty', 'James begins with passions at war within people and then calls world-friendship spiritual adultery against God (James 4:1-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does James 4 tie inner cravings to broader social conflict and worldliness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 4, 5, 'How does James 4 echo prophetic covenant language by calling the readers adulterous?', '["It portrays friendship with the world as unfaithfulness to God","It addresses only literal marital sin","It abolishes the idea of covenant","It refers only to Gentile customs"]'::jsonb, 'It portrays friendship with the world as unfaithfulness to God', 'James uses adulterous language to describe disloyalty to God through friendship with the world (James 4:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does James 4 echo prophetic covenant language by calling the readers adulterous?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 4, 5, 'What is the theological weight of "He yearns jealously over the spirit" in James 4?', '["God tolerates no rival loyalty in his people","Human jealousy is always virtuous","The verse denies human responsibility","It teaches that envy is a gift"]'::jsonb, 'God tolerates no rival loyalty in his people', 'In context James is stressing God''s jealous claim over his people in contrast to world-friendship (James 4:4-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the theological weight of "He yearns jealously over the spirit" in James 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 4, 5, 'Why is the call to humble mourning in James 4 not opposed to grace?', '["Grace is given to the humble and leads them into real repentance","Grace removes all sorrow over sin","Repentance earns grace by severity","Mourning is a substitute for obedience"]'::jsonb, 'Grace is given to the humble and leads them into real repentance', 'James says God gives more grace, then commands humility, repentance, and mourning before promising exaltation (James 4:6-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the call to humble mourning in James 4 not opposed to grace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 4, 5, 'How does James 4 reshape the ethics of planning and commerce?', '["It places ordinary business under God''s sovereignty and human frailty","It condemns profit as inherently evil","It teaches fatalism instead of planning","It treats commerce as outside moral concern"]'::jsonb, 'It places ordinary business under God''s sovereignty and human frailty', 'James addresses merchants directly and reminds them that life is a vapor and the Lord''s will governs future action (James 4:13-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does James 4 reshape the ethics of planning and commerce?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 4, 5, 'What does James 4 reveal about sin when it includes both bad desires and neglected good?', '["Sin includes corrupt motives, arrogant speech, and culpable omission","Sin is only outward violence","Only unbelievers commit omission sins","Good intentions cancel neglected duties"]'::jsonb, 'Sin includes corrupt motives, arrogant speech, and culpable omission', 'James addresses lustful motives, slander, boastful presumption, and finally failure to do known good (James 4:1-3, 11-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does James 4 reveal about sin when it includes both bad desires and neglected good?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 4, 5, 'Why does James 4 say there is one Lawgiver and Judge?', '["To undercut human pretensions to final moral authority over others","To deny the role of civil government entirely","To suggest the law has no application now","To limit judgment to the afterlife only"]'::jsonb, 'To undercut human pretensions to final moral authority over others', 'James uses God''s sole authority as Lawgiver and Judge to rebuke slanderous judgment of a brother (James 4:11-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does James 4 say there is one Lawgiver and Judge?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 4, 5, 'How does James 4 integrate spiritual warfare, repentance, and humility?', '["Victory over evil comes through submission to God and repentant nearness to him","Spiritual warfare is fought mainly by argument","Humility weakens resistance to evil","Repentance matters only after the conflict ends"]'::jsonb, 'Victory over evil comes through submission to God and repentant nearness to him', 'James joins submitting to God, resisting the devil, drawing near, cleansing, mourning, and humbling oneself before the Lord (James 4:7-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does James 4 integrate spiritual warfare, repentance, and humility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 5, 1, 'According to James 5, what should the rich do because of coming miseries?', '["Weep and howl","Celebrate loudly","Build bigger barns","Demand more honor"]'::jsonb, 'Weep and howl', 'James tells the rich to weep and howl for the miseries coming on them (James 5:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to James 5, what should the rich do because of coming miseries?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 5, 1, 'According to James 5, what has happened to the rich people''s garments?', '["They are moth-eaten","They are anointed","They are dyed purple","They are stored in cedar"]'::jsonb, 'They are moth-eaten', 'James says their garments are moth-eaten (James 5:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to James 5, what has happened to the rich people''s garments?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 5, 1, 'According to James 5, what has been withheld by fraud?', '["The wages of laborers","The temple tax","The king''s tribute","The widow''s inheritance"]'::jsonb, 'The wages of laborers', 'James says the wages withheld by fraud cry out against the rich (James 5:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to James 5, what has been withheld by fraud?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 5, 1, 'According to James 5, what should believers be until the Lord''s coming?', '["Patient","Silent forever","Suspicious","Idle"]'::jsonb, 'Patient', 'James says to be patient until the coming of the Lord (James 5:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to James 5, what should believers be until the Lord''s coming?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 5, 1, 'According to James 5, which Old Testament figure is given as an example of steadfastness in suffering?', '["Job","Samson","Saul","Ahab"]'::jsonb, 'Job', 'James points to the endurance of Job (James 5:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to James 5, which Old Testament figure is given as an example of steadfastness in suffering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 5, 1, 'According to James 5, what should believers not do when making everyday statements?', '["Swear by heaven or earth","Confess sins","Pray in faith","Sing praise"]'::jsonb, 'Swear by heaven or earth', 'James says not to swear either by heaven, earth, or any other oath (James 5:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to James 5, what should believers not do when making everyday statements?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 5, 1, 'According to James 5, what should a cheerful person do?', '["Sing praise","Store wealth","Call a judge","Fast in secret"]'::jsonb, 'Sing praise', 'James says if anyone is cheerful, let him sing praise (James 5:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to James 5, what should a cheerful person do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 5, 2, 'According to James 5, to what is the patient believer compared while waiting for the Lord?', '["A farmer waiting for precious fruit","A merchant chasing profit","A soldier awaiting orders","A judge on a bench"]'::jsonb, 'A farmer waiting for precious fruit', 'James compares patience to a farmer waiting for the earth''s precious fruit (James 5:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to James 5, to what is the patient believer compared while waiting for the Lord?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 5, 2, 'According to James 5, what should believers establish because the Lord''s coming is near?', '["Their hearts","Their barns","Their trading routes","Their legal claims"]'::jsonb, 'Their hearts', 'James says, "Establish your hearts, for the coming of the Lord is at hand" (James 5:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to James 5, what should believers establish because the Lord''s coming is near?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 5, 2, 'According to James 5, where is the Judge standing?', '["At the door","In the field","At the temple gate","By the sea"]'::jsonb, 'At the door', 'James says the Judge is standing at the door (James 5:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to James 5, where is the Judge standing?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 5, 2, 'According to James 5, whom should the sick call?', '["The elders of the assembly","The nearest merchant","A Roman official","The town crier"]'::jsonb, 'The elders of the assembly', 'James says the sick should call for the elders of the assembly (James 5:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to James 5, whom should the sick call?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 5, 2, 'According to James 5, what should believers confess to one another?', '["Their sins","Their dreams","Their profits","Their travel plans"]'::jsonb, 'Their sins', 'James says, "Confess your sins to one another" (James 5:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to James 5, what should believers confess to one another?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 5, 2, 'According to James 5, what kind of prayer has great power?', '["The prayer of a righteous person","The longest prayer","A prayer made in public only","A prayer with many oaths"]'::jsonb, 'The prayer of a righteous person', 'James says the insistent prayer of a righteous person is very powerful (James 5:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to James 5, what kind of prayer has great power?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 5, 2, 'According to James 5, how long did it not rain when Elijah prayed?', '["Three years and six months","Forty days","Seven years","Twelve months"]'::jsonb, 'Three years and six months', 'James says the sky withheld rain for three years and six months (James 5:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to James 5, how long did it not rain when Elijah prayed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 5, 3, 'What does James 5 suggest about wealth stored unjustly?', '["It becomes evidence against its owners in judgment","It guarantees protection from God","It is neutral no matter how gained","It excuses harsh treatment of workers"]'::jsonb, 'It becomes evidence against its owners in judgment', 'James says corroded gold and silver will testify against the rich, alongside wages withheld by fraud (James 5:2-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does James 5 suggest about wealth stored unjustly?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 5, 3, 'Why does James 5 tell suffering believers to be patient rather than retaliate?', '["The Lord''s coming and judgment are near","Injustice does not matter","Believers should never care about righteousness","Patience guarantees wealth"]'::jsonb, 'The Lord''s coming and judgment are near', 'James grounds patience in the nearness of the Lord''s coming and the Judge standing at the door (James 5:7-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does James 5 tell suffering believers to be patient rather than retaliate?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 5, 3, 'What is the point of using the prophets in James 5 as examples?', '["Faithful suffering has long marked those who speak in the Lord''s name","Prophets were spared all hardship","Only prophets should endure patiently","Suffering proves God has abandoned his servants"]'::jsonb, 'Faithful suffering has long marked those who speak in the Lord''s name', 'James points to the prophets as examples of suffering and patience (James 5:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the point of using the prophets in James 5 as examples?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 5, 3, 'Why does James 5 forbid swearing and instead call for simple yes and no?', '["Truthful speech should not need manipulative guarantees","Ordinary speech has no moral weight","Oaths are needed for sincere believers","Only judges may speak plainly"]'::jsonb, 'Truthful speech should not need manipulative guarantees', 'James tells believers to let their yes be yes and their no be no, so they do not fall under judgment (James 5:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does James 5 forbid swearing and instead call for simple yes and no?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 5, 3, 'What does James 5 imply about prayer across changing circumstances?', '["Prayer and praise belong in suffering, sickness, and cheerfulness alike","Prayer is mainly for emergencies","Cheerful people have no need to worship","Only elders should pray"]'::jsonb, 'Prayer and praise belong in suffering, sickness, and cheerfulness alike', 'James gives different responses for suffering, cheerfulness, and sickness, all centered on prayerful dependence on God (James 5:13-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does James 5 imply about prayer across changing circumstances?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 5, 3, 'Why does James 5 mention forgiveness alongside healing?', '["The community''s care addresses both bodily need and sin before God","Every sickness is directly caused by one known sin","Forgiveness comes only through elders","Healing makes confession unnecessary"]'::jsonb, 'The community''s care addresses both bodily need and sin before God', 'James says the prayer of faith will save the sick and adds that if he has committed sins, he will be forgiven (James 5:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does James 5 mention forgiveness alongside healing?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 5, 3, 'What does the Elijah example teach in James 5?', '["A human prophet like us could pray effectively under God''s power","Only miracle workers should pray about weather","Prayer changes God against his will","Elijah succeeded because he was sinless"]'::jsonb, 'A human prophet like us could pray effectively under God''s power', 'James stresses that Elijah was a man with a nature like ours, yet his prayers were effective (James 5:17-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the Elijah example teach in James 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 5, 4, 'How does James 5 connect economic injustice with eschatological judgment?', '["Unjust wealth is portrayed as stored up for the last days as evidence against oppressors","Judgment concerns only private morality","Economic sin is ignored if worship is sincere","The last days reward every form of accumulation"]'::jsonb, 'Unjust wealth is portrayed as stored up for the last days as evidence against oppressors', 'James says the rich have stored up treasure in the last days while defrauded wages cry out and corrosion testifies against them (James 5:3-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does James 5 connect economic injustice with eschatological judgment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 5, 4, 'Why does James 5 move from condemning rich oppressors to urging patience in believers?', '["The righteous must entrust vindication to the Lord rather than seize it themselves","Believers should admire the rich","Patience is only for farmers, not the oppressed","The chapter shifts topics without connection"]'::jsonb, 'The righteous must entrust vindication to the Lord rather than seize it themselves', 'After denouncing oppressors, James tells brothers to be patient until the Lord''s coming and not to grumble (James 5:1-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does James 5 move from condemning rich oppressors to urging patience in believers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 5, 4, 'What does James 5 reveal about communal care in times of sickness?', '["The church responds through prayer, anointing, confession, and mutual intercession","Sickness should always remain private","Only physicians may be involved in healing","Confession belongs only in public assemblies"]'::jsonb, 'The church responds through prayer, anointing, confession, and mutual intercession', 'James instructs the sick to call elders, receive prayer and anointing, and then calls the whole community to confess and pray for one another (James 5:14-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does James 5 reveal about communal care in times of sickness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 5, 4, 'How does Job function in James 5 beyond being simply a patient sufferer?', '["His story proves the Lord is compassionate and merciful in the end","He shows suffering has no purpose","He teaches believers to stay silent before injustice","He replaces the prophets as the only example"]'::jsonb, 'His story proves the Lord is compassionate and merciful in the end', 'James points to Job''s endurance and says readers have seen the Lord''s purpose, that the Lord is full of compassion and mercy (James 5:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Job function in James 5 beyond being simply a patient sufferer?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 5, 4, 'Why does James 5 set truthful speech alongside prayer and patience?', '["Steadfast communities require integrity in words as well as dependence on God","Oaths are the strongest form of prayer","Patience eliminates the need for honesty","Speech matters only in court"]'::jsonb, 'Steadfast communities require integrity in words as well as dependence on God', 'James moves from patience to honest speech to prayer, showing a community ethic shaped by truthfulness and trust in God (James 5:7-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does James 5 set truthful speech alongside prayer and patience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 5, 4, 'What is the function of Elijah being "like us" in James 5?', '["It encourages ordinary believers that effective prayer is not reserved for a different class of human","It lowers Elijah''s importance in Scripture","It means prayer works automatically","It suggests prophets had no special calling"]'::jsonb, 'It encourages ordinary believers that effective prayer is not reserved for a different class of human', 'James highlights Elijah''s shared human nature to encourage confidence in righteous prayer (James 5:16-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'What is the function of Elijah being "like us" in James 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 5, 4, 'How does James 5 end the letter on a pastoral rather than merely personal note?', '["It calls believers to restore wanderers and save them from ruin","It turns to private meditation only","It closes with greetings and travel plans","It asks readers to avoid struggling members"]'::jsonb, 'It calls believers to restore wanderers and save them from ruin', 'James ends by urging the community to turn back one who wanders from the truth, saving a soul from death and covering sins (James 5:19-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does James 5 end the letter on a pastoral rather than merely personal note?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 5, 5, 'How does James 5 echo prophetic denunciations of oppressive wealth?', '["It treats luxury built on injustice as grounds for divine judgment","It praises wealth as neutral power","It says prophets ignored economic sin","It limits oppression to foreign nations"]'::jsonb, 'It treats luxury built on injustice as grounds for divine judgment', 'James condemns hoarded riches, withheld wages, and self-indulgence in language similar to the prophets'' judgments on oppression (James 5:1-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does James 5 echo prophetic denunciations of oppressive wealth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 5, 5, 'What eschatological perspective shapes the commands in James 5:7-9?', '["The nearness of the Lord''s coming and judgment should steady believers","The end is distant so urgency is unnecessary","Only the rich need to think about the future","Judgment belongs entirely to human courts"]'::jsonb, 'The nearness of the Lord''s coming and judgment should steady believers', 'James grounds patience, heart-strengthening, and freedom from grumbling in the Lord''s near coming and the Judge at the door (James 5:7-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What eschatological perspective shapes the commands in James 5:7-9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 5, 5, 'How does James 5 present prayer as communal participation in God''s mercy?', '["The church bears one another''s suffering, sickness, sin, and restoration through prayer","Prayer is a private act with no communal dimension","Only elders may ever pray effectively","Prayer replaces confession and restoration"]'::jsonb, 'The church bears one another''s suffering, sickness, sin, and restoration through prayer', 'James moves from prayer in suffering to prayer for the sick, confession, mutual intercession, and restoring wanderers (James 5:13-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does James 5 present prayer as communal participation in God''s mercy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 5, 5, 'Why is the righteous person''s prayer called powerful in James 5?', '["James links effective prayer with a life aligned to God''s will, not magical formulas","Righteous people control God","Length of prayer is the key factor","Power belongs only to prophets from the past"]'::jsonb, 'James links effective prayer with a life aligned to God''s will, not magical formulas', 'James says the prayer of a righteous person is powerful and then illustrates with Elijah''s earnest prayer (James 5:16-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the righteous person''s prayer called powerful in James 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 5, 5, 'What does James 5 imply by joining healing, forgiveness, and confession?', '["God''s saving care addresses the whole person within the believing community","All illness is always punishment for a specific sin","Confession is useful only when healing fails","Forgiveness depends on oil itself"]'::jsonb, 'God''s saving care addresses the whole person within the believing community', 'James combines prayer for healing, forgiveness of sins, confession, and mutual prayer in one pastoral vision (James 5:14-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does James 5 imply by joining healing, forgiveness, and confession?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 5, 5, 'How does James 5 present restoration of a wanderer as an act of salvation?', '["Turning a sinner back rescues from death and covers a multitude of sins","Correction is mainly about preserving reputation","Restoration applies only to teachers","Wanderers should be left alone once they drift"]'::jsonb, 'Turning a sinner back rescues from death and covers a multitude of sins', 'James ends by saying that whoever turns back a sinner will save a soul from death and cover a multitude of sins (James 5:19-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does James 5 present restoration of a wanderer as an act of salvation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 59, 5, 5, 'What larger theme of James is gathered up in the letter''s final call to restore the wandering?', '["Real faith takes active responsibility for the good of others","Faith is mainly private and inward","Speech alone is enough to heal communities","Trials matter more than mercy"]'::jsonb, 'Real faith takes active responsibility for the good of others', 'The ending fits James''s repeated emphasis that living faith acts in mercy, prayer, truthfulness, and care for others (James 1:27; 2:14-17; 5:19-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 59
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger theme of James is gathered up in the letter''s final call to restore the wandering?'
);
