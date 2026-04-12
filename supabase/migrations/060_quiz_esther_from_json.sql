-- Auto-generated from quiz-questions/esther.json
-- Book: Esther (book_number 17)
INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  1,
  'According to Esther 1, who was the king of Persia?',
  '["Cyrus","Darius","Ahasuerus","Xerxes II"]'::jsonb,
  'Ahasuerus',
  'The king mentioned is Ahasuerus (Esther 1:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'According to Esther 1, who was the king of Persia?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  1,
  'How many provinces did King Ahasuerus rule over?',
  '["70","100","127","150"]'::jsonb,
  '127',
  'He ruled over 127 provinces (Esther 1:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'How many provinces did King Ahasuerus rule over?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  1,
  'Where did King Ahasuerus hold his royal throne?',
  '["Babylon","Jerusalem","Susa (the citadel)","Nineveh"]'::jsonb,
  'Susa (the citadel)',
  'His throne was in Susa (Esther 1:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'Where did King Ahasuerus hold his royal throne?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  1,
  'In which year of his reign did Ahasuerus give a feast for his officials?',
  '["1st year","3rd year","7th year","10th year"]'::jsonb,
  '3rd year',
  'The feast occurred in the third year (Esther 1:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'In which year of his reign did Ahasuerus give a feast for his officials?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  1,
  'How long did the king’s feast for his officials last?',
  '["7 days","30 days","180 days","1 year"]'::jsonb,
  '180 days',
  'The feast lasted 180 days (Esther 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'How long did the king’s feast for his officials last?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  1,
  'After the long feast, how long was the feast for all the people in Susa?',
  '["3 days","7 days","10 days","30 days"]'::jsonb,
  '7 days',
  'There was a 7-day feast for all people (Esther 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'After the long feast, how long was the feast for all the people in Susa?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  1,
  'What was the setting of the feast described with?',
  '["Gold and silver decorations","Simple tents","Wooden tables","Stone walls"]'::jsonb,
  'Gold and silver decorations',
  'The setting included luxurious decorations (Esther 1:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'What was the setting of the feast described with?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  1,
  'How was wine served at the feast?',
  '["In clay cups","In golden vessels","In wooden cups","In silver bowls"]'::jsonb,
  'In golden vessels',
  'Wine was served in golden vessels (Esther 1:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'How was wine served at the feast?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  1,
  'Who was the queen during this time?',
  '["Esther","Vashti","Ruth","Deborah"]'::jsonb,
  'Vashti',
  'Queen Vashti is mentioned (Esther 1:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'Who was the queen during this time?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  1,
  'What did King Ahasuerus command Queen Vashti to do?',
  '["Prepare food","Come before him wearing her royal crown","Leave the palace","Sing"]'::jsonb,
  'Come before him wearing her royal crown',
  'He wanted to display her beauty (Esther 1:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'What did King Ahasuerus command Queen Vashti to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  2,
  'Why did King Ahasuerus want Queen Vashti to appear?',
  '["To give a speech","To show her beauty to the people","To crown her","To honor her"]'::jsonb,
  'To show her beauty to the people',
  'He wanted to display her beauty (Esther 1:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'Why did King Ahasuerus want Queen Vashti to appear?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  2,
  'How did Queen Vashti respond to the king’s command?',
  '["She obeyed","She refused to come","She delayed","She sent a message"]'::jsonb,
  'She refused to come',
  'Vashti refused the king’s command (Esther 1:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'How did Queen Vashti respond to the king’s command?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  2,
  'How did the king react to Vashti’s refusal?',
  '["He laughed","He became angry","He ignored it","He praised her"]'::jsonb,
  'He became angry',
  'The king was enraged (Esther 1:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'How did the king react to Vashti’s refusal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  2,
  'Who did the king consult after Vashti’s refusal?',
  '["Priests","Wise men who knew the law","Soldiers","Servants"]'::jsonb,
  'Wise men who knew the law',
  'He consulted his advisors (Esther 1:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'Who did the king consult after Vashti’s refusal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  2,
  'What concern did Memucan raise?',
  '["War","Vashti’s actions would spread disobedience among women","Wealth","Food shortage"]'::jsonb,
  'Vashti’s actions would spread disobedience among women',
  'He feared widespread disrespect (Esther 1:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'What concern did Memucan raise?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  2,
  'What punishment was suggested for Vashti?',
  '["Fine","Exile","Removal as queen","Imprisonment"]'::jsonb,
  'Removal as queen',
  'She should no longer come before the king (Esther 1:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'What punishment was suggested for Vashti?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  2,
  'What did the king decide to do?',
  '["Forgive her","Remove Vashti as queen","Ignore the issue","Leave the throne"]'::jsonb,
  'Remove Vashti as queen',
  'The king followed the advice (Esther 1:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'What did the king decide to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  2,
  'What decree was sent throughout the kingdom?',
  '["Tax law","Every man should rule in his own house","War declaration","Trade law"]'::jsonb,
  'Every man should rule in his own house',
  'A decree about household authority was issued (Esther 1:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'What decree was sent throughout the kingdom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  2,
  'How was the decree distributed?',
  '["By word","Written in every province’s language","Through messengers only","In one language"]'::jsonb,
  'Written in every province’s language',
  'It was sent in all languages (Esther 1:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'How was the decree distributed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  2,
  'What was the result of Vashti’s removal?',
  '["War","A search for a new queen later","Peace","Celebration"]'::jsonb,
  'A search for a new queen later',
  'Her removal leads to Esther’s rise.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'What was the result of Vashti’s removal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  3,
  'What does the lavish feast reveal about the king?',
  '["Humility","Wealth and power","Weakness","Fear"]'::jsonb,
  'Wealth and power',
  'The feast displays his riches.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'What does the lavish feast reveal about the king?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  3,
  'Why is Vashti’s refusal significant?',
  '["It is minor","It challenges authority","It is expected","It is hidden"]'::jsonb,
  'It challenges authority',
  'It defies the king publicly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'Why is Vashti’s refusal significant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  3,
  'What does the king’s anger reveal?',
  '["Patience","Pride and lack of self-control","Wisdom","Fear"]'::jsonb,
  'Pride and lack of self-control',
  'He reacts strongly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'What does the king’s anger reveal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  3,
  'Why do the advisors exaggerate the situation?',
  '["To help","To protect their own authority","To confuse","To delay"]'::jsonb,
  'To protect their own authority',
  'They fear losing control.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'Why do the advisors exaggerate the situation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  3,
  'What does the decree show about the kingdom?',
  '["Freedom","Control and order","Weakness","Confusion"]'::jsonb,
  'Control and order',
  'The king enforces authority.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'What does the decree show about the kingdom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  3,
  'What role does pride play in this chapter?',
  '["None","Central to conflict","Minor","Hidden"]'::jsonb,
  'Central to conflict',
  'Pride drives actions.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'What role does pride play in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  3,
  'Why is public image important to the king?',
  '["For fun","To maintain authority and honor","To impress","To compete"]'::jsonb,
  'To maintain authority and honor',
  'He values reputation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'Why is public image important to the king?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  3,
  'What does Vashti’s action suggest?',
  '["Fear","Courage or resistance","Weakness","Confusion"]'::jsonb,
  'Courage or resistance',
  'She refuses the command.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'What does Vashti’s action suggest?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  3,
  'What does Nehemiah 1 (Esther 1 contextually) show about power?',
  '["Stable","Fragile and reactive","Weak","Temporary"]'::jsonb,
  'Fragile and reactive',
  'Power reacts strongly to challenges.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'What does Nehemiah 1 (Esther 1 contextually) show about power?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  3,
  'What theme begins in this chapter?',
  '["War","God’s unseen providence","Wealth","Law"]'::jsonb,
  'God’s unseen providence',
  'Events prepare for Esther’s story.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'What theme begins in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  4,
  'How does Esther 1 set the stage for the book?',
  '["Ends story","Introduces conflict and royal setting","Ignores plot","Focuses on war"]'::jsonb,
  'Introduces conflict and royal setting',
  'It sets up future events.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'How does Esther 1 set the stage for the book?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  4,
  'What leadership flaws are evident in Ahasuerus?',
  '["Humility","Impulsiveness and pride","Wisdom","Patience"]'::jsonb,
  'Impulsiveness and pride',
  'He reacts emotionally.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'What leadership flaws are evident in Ahasuerus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  4,
  'Why is Vashti’s removal important?',
  '["Minor event","Opens the way for Esther","Ends conflict","Builds tension only"]'::jsonb,
  'Opens the way for Esther',
  'It prepares for Esther’s rise.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'Why is Vashti’s removal important?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  4,
  'How does the chapter portray authority?',
  '["Flexible","Rigid and enforced","Weak","Optional"]'::jsonb,
  'Rigid and enforced',
  'The king enforces his will.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'How does the chapter portray authority?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  4,
  'What role do advisors play?',
  '["None","Influence royal decisions","Minor","Hidden"]'::jsonb,
  'Influence royal decisions',
  'They guide the king.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'What role do advisors play?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  4,
  'How does the chapter highlight human weakness?',
  '["Strength","Pride and overreaction","Wisdom","Faith"]'::jsonb,
  'Pride and overreaction',
  'Human flaws are evident.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'How does the chapter highlight human weakness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  4,
  'What larger theme is introduced?',
  '["War","Providence behind human actions","Wealth","Law"]'::jsonb,
  'Providence behind human actions',
  'God’s plan unfolds indirectly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'What larger theme is introduced?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  4,
  'Why is the decree significant?',
  '["Minor","Shows the reach of royal authority","Optional","Hidden"]'::jsonb,
  'Shows the reach of royal authority',
  'It affects the whole empire.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'Why is the decree significant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  4,
  'What does the feast symbolize?',
  '["Poverty","Royal glory and excess","War","Fear"]'::jsonb,
  'Royal glory and excess',
  'It displays wealth.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'What does the feast symbolize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  4,
  'How does Esther 1 portray conflict?',
  '["External war","Internal palace conflict","None","Hidden"]'::jsonb,
  'Internal palace conflict',
  'Conflict begins in the palace.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'How does Esther 1 portray conflict?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  5,
  'What theological theme is central to Esther 1?',
  '["God’s hidden providence","Wealth","Power","War"]'::jsonb,
  'God’s hidden providence',
  'God works behind the scenes.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'What theological theme is central to Esther 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  5,
  'How does Esther 1 portray power?',
  '["Stable","Fragile and reactive","Weak","Temporary"]'::jsonb,
  'Fragile and reactive',
  'Power reacts to challenges.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 1 portray power?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  5,
  'What does the chapter teach about pride?',
  '["Positive","Leads to poor decisions","Neutral","Hidden"]'::jsonb,
  'Leads to poor decisions',
  'Pride drives conflict.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'What does the chapter teach about pride?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  5,
  'How does Esther 1 contribute to the book’s message?',
  '["Ends story","Begins the chain of events leading to deliverance","Ignores plot","Focuses on law"]'::jsonb,
  'Begins the chain of events leading to deliverance',
  'It sets up Esther’s role.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 1 contribute to the book’s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  5,
  'Why is Vashti’s removal significant in God’s plan?',
  '["Coincidence","Prepares for Esther’s rise","Ends conflict","Minor"]'::jsonb,
  'Prepares for Esther’s rise',
  'It opens the way for Esther.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'Why is Vashti’s removal significant in God’s plan?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  5,
  'What does Esther 1 teach about human authority?',
  '["Perfect","Flawed and limited","Divine","Unchanging"]'::jsonb,
  'Flawed and limited',
  'Human leaders are imperfect.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'What does Esther 1 teach about human authority?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  5,
  'In the flow of Esther, what is the main role of chapter 1?',
  '["Introduction of setting and conflict","Ending story","Victory","Law"]'::jsonb,
  'Introduction of setting and conflict',
  'It sets the stage.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'In the flow of Esther, what is the main role of chapter 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  5,
  'How does Esther 1 frame success?',
  '["Wealth","Control and image","Faithfulness","Power"]'::jsonb,
  'Control and image',
  'The king values image.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 1 frame success?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  5,
  'What larger message does Esther 1 leave?',
  '["God works through human events","Wealth matters most","Power is key","Work is enough"]'::jsonb,
  'God works through human events',
  'God’s plan unfolds indirectly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'What larger message does Esther 1 leave?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  5,
  'How does Esther 1 frame responsibility?',
  '["Optional","Human decisions have consequences","Individual only","Political"]'::jsonb,
  'Human decisions have consequences',
  'Choices shape outcomes.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 1 frame responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  1,
  'According to Esther 1, who was the king of Persia?',
  '["Cyrus","Darius","Ahasuerus","Xerxes II"]'::jsonb,
  'Ahasuerus',
  'The king mentioned is Ahasuerus (Esther 1:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'According to Esther 1, who was the king of Persia?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  1,
  'How many provinces did King Ahasuerus rule over?',
  '["70","100","127","150"]'::jsonb,
  '127',
  'He ruled over 127 provinces (Esther 1:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'How many provinces did King Ahasuerus rule over?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  1,
  'Where did King Ahasuerus hold his royal throne?',
  '["Babylon","Jerusalem","Susa (the citadel)","Nineveh"]'::jsonb,
  'Susa (the citadel)',
  'His throne was in Susa (Esther 1:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'Where did King Ahasuerus hold his royal throne?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  1,
  'In which year of his reign did Ahasuerus give a feast for his officials?',
  '["1st year","3rd year","7th year","10th year"]'::jsonb,
  '3rd year',
  'The feast occurred in the third year (Esther 1:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'In which year of his reign did Ahasuerus give a feast for his officials?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  1,
  'How long did the king’s feast for his officials last?',
  '["7 days","30 days","180 days","1 year"]'::jsonb,
  '180 days',
  'The feast lasted 180 days (Esther 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'How long did the king’s feast for his officials last?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  1,
  'After the long feast, how long was the feast for all the people in Susa?',
  '["3 days","7 days","10 days","30 days"]'::jsonb,
  '7 days',
  'There was a 7-day feast for all people (Esther 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'After the long feast, how long was the feast for all the people in Susa?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  1,
  'What was the setting of the feast described with?',
  '["Gold and silver decorations","Simple tents","Wooden tables","Stone walls"]'::jsonb,
  'Gold and silver decorations',
  'The setting included luxurious decorations (Esther 1:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'What was the setting of the feast described with?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  1,
  'How was wine served at the feast?',
  '["In clay cups","In golden vessels","In wooden cups","In silver bowls"]'::jsonb,
  'In golden vessels',
  'Wine was served in golden vessels (Esther 1:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'How was wine served at the feast?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  1,
  'Who was the queen during this time?',
  '["Esther","Vashti","Ruth","Deborah"]'::jsonb,
  'Vashti',
  'Queen Vashti is mentioned (Esther 1:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'Who was the queen during this time?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  1,
  'What did King Ahasuerus command Queen Vashti to do?',
  '["Prepare food","Come before him wearing her royal crown","Leave the palace","Sing"]'::jsonb,
  'Come before him wearing her royal crown',
  'He wanted to display her beauty (Esther 1:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'What did King Ahasuerus command Queen Vashti to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  2,
  'Why did King Ahasuerus want Queen Vashti to appear?',
  '["To give a speech","To show her beauty to the people","To crown her","To honor her"]'::jsonb,
  'To show her beauty to the people',
  'He wanted to display her beauty (Esther 1:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'Why did King Ahasuerus want Queen Vashti to appear?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  2,
  'How did Queen Vashti respond to the king’s command?',
  '["She obeyed","She refused to come","She delayed","She sent a message"]'::jsonb,
  'She refused to come',
  'Vashti refused the king’s command (Esther 1:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'How did Queen Vashti respond to the king’s command?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  2,
  'How did the king react to Vashti’s refusal?',
  '["He laughed","He became angry","He ignored it","He praised her"]'::jsonb,
  'He became angry',
  'The king was enraged (Esther 1:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'How did the king react to Vashti’s refusal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  2,
  'Who did the king consult after Vashti’s refusal?',
  '["Priests","Wise men who knew the law","Soldiers","Servants"]'::jsonb,
  'Wise men who knew the law',
  'He consulted his advisors (Esther 1:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'Who did the king consult after Vashti’s refusal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  2,
  'What concern did Memucan raise?',
  '["War","Vashti’s actions would spread disobedience among women","Wealth","Food shortage"]'::jsonb,
  'Vashti’s actions would spread disobedience among women',
  'He feared widespread disrespect (Esther 1:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'What concern did Memucan raise?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  2,
  'What punishment was suggested for Vashti?',
  '["Fine","Exile","Removal as queen","Imprisonment"]'::jsonb,
  'Removal as queen',
  'She should no longer come before the king (Esther 1:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'What punishment was suggested for Vashti?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  2,
  'What did the king decide to do?',
  '["Forgive her","Remove Vashti as queen","Ignore the issue","Leave the throne"]'::jsonb,
  'Remove Vashti as queen',
  'The king followed the advice (Esther 1:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'What did the king decide to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  2,
  'What decree was sent throughout the kingdom?',
  '["Tax law","Every man should rule in his own house","War declaration","Trade law"]'::jsonb,
  'Every man should rule in his own house',
  'A decree about household authority was issued (Esther 1:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'What decree was sent throughout the kingdom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  2,
  'How was the decree distributed?',
  '["By word","Written in every province’s language","Through messengers only","In one language"]'::jsonb,
  'Written in every province’s language',
  'It was sent in all languages (Esther 1:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'How was the decree distributed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  2,
  'What was the result of Vashti’s removal?',
  '["War","A search for a new queen later","Peace","Celebration"]'::jsonb,
  'A search for a new queen later',
  'Her removal leads to Esther’s rise.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'What was the result of Vashti’s removal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  3,
  'What does the lavish feast reveal about the king?',
  '["Humility","Wealth and power","Weakness","Fear"]'::jsonb,
  'Wealth and power',
  'The feast displays his riches.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'What does the lavish feast reveal about the king?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  3,
  'Why is Vashti’s refusal significant?',
  '["It is minor","It challenges authority","It is expected","It is hidden"]'::jsonb,
  'It challenges authority',
  'It defies the king publicly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'Why is Vashti’s refusal significant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  3,
  'What does the king’s anger reveal?',
  '["Patience","Pride and lack of self-control","Wisdom","Fear"]'::jsonb,
  'Pride and lack of self-control',
  'He reacts strongly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'What does the king’s anger reveal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  3,
  'Why do the advisors exaggerate the situation?',
  '["To help","To protect their own authority","To confuse","To delay"]'::jsonb,
  'To protect their own authority',
  'They fear losing control.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'Why do the advisors exaggerate the situation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  3,
  'What does the decree show about the kingdom?',
  '["Freedom","Control and order","Weakness","Confusion"]'::jsonb,
  'Control and order',
  'The king enforces authority.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'What does the decree show about the kingdom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  3,
  'What role does pride play in this chapter?',
  '["None","Central to conflict","Minor","Hidden"]'::jsonb,
  'Central to conflict',
  'Pride drives actions.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'What role does pride play in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  3,
  'Why is public image important to the king?',
  '["For fun","To maintain authority and honor","To impress","To compete"]'::jsonb,
  'To maintain authority and honor',
  'He values reputation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'Why is public image important to the king?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  3,
  'What does Vashti’s action suggest?',
  '["Fear","Courage or resistance","Weakness","Confusion"]'::jsonb,
  'Courage or resistance',
  'She refuses the command.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'What does Vashti’s action suggest?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  3,
  'What does Nehemiah 1 (Esther 1 contextually) show about power?',
  '["Stable","Fragile and reactive","Weak","Temporary"]'::jsonb,
  'Fragile and reactive',
  'Power reacts strongly to challenges.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'What does Nehemiah 1 (Esther 1 contextually) show about power?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  3,
  'What theme begins in this chapter?',
  '["War","God’s unseen providence","Wealth","Law"]'::jsonb,
  'God’s unseen providence',
  'Events prepare for Esther’s story.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'What theme begins in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  4,
  'How does Esther 1 set the stage for the book?',
  '["Ends story","Introduces conflict and royal setting","Ignores plot","Focuses on war"]'::jsonb,
  'Introduces conflict and royal setting',
  'It sets up future events.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'How does Esther 1 set the stage for the book?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  4,
  'What leadership flaws are evident in Ahasuerus?',
  '["Humility","Impulsiveness and pride","Wisdom","Patience"]'::jsonb,
  'Impulsiveness and pride',
  'He reacts emotionally.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'What leadership flaws are evident in Ahasuerus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  4,
  'Why is Vashti’s removal important?',
  '["Minor event","Opens the way for Esther","Ends conflict","Builds tension only"]'::jsonb,
  'Opens the way for Esther',
  'It prepares for Esther’s rise.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'Why is Vashti’s removal important?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  4,
  'How does the chapter portray authority?',
  '["Flexible","Rigid and enforced","Weak","Optional"]'::jsonb,
  'Rigid and enforced',
  'The king enforces his will.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'How does the chapter portray authority?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  4,
  'What role do advisors play?',
  '["None","Influence royal decisions","Minor","Hidden"]'::jsonb,
  'Influence royal decisions',
  'They guide the king.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'What role do advisors play?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  4,
  'How does the chapter highlight human weakness?',
  '["Strength","Pride and overreaction","Wisdom","Faith"]'::jsonb,
  'Pride and overreaction',
  'Human flaws are evident.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'How does the chapter highlight human weakness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  4,
  'What larger theme is introduced?',
  '["War","Providence behind human actions","Wealth","Law"]'::jsonb,
  'Providence behind human actions',
  'God’s plan unfolds indirectly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'What larger theme is introduced?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  4,
  'Why is the decree significant?',
  '["Minor","Shows the reach of royal authority","Optional","Hidden"]'::jsonb,
  'Shows the reach of royal authority',
  'It affects the whole empire.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'Why is the decree significant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  4,
  'What does the feast symbolize?',
  '["Poverty","Royal glory and excess","War","Fear"]'::jsonb,
  'Royal glory and excess',
  'It displays wealth.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'What does the feast symbolize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  4,
  'How does Esther 1 portray conflict?',
  '["External war","Internal palace conflict","None","Hidden"]'::jsonb,
  'Internal palace conflict',
  'Conflict begins in the palace.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'How does Esther 1 portray conflict?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  5,
  'What theological theme is central to Esther 1?',
  '["God’s hidden providence","Wealth","Power","War"]'::jsonb,
  'God’s hidden providence',
  'God works behind the scenes.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'What theological theme is central to Esther 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  5,
  'How does Esther 1 portray power?',
  '["Stable","Fragile and reactive","Weak","Temporary"]'::jsonb,
  'Fragile and reactive',
  'Power reacts to challenges.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 1 portray power?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  5,
  'What does the chapter teach about pride?',
  '["Positive","Leads to poor decisions","Neutral","Hidden"]'::jsonb,
  'Leads to poor decisions',
  'Pride drives conflict.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'What does the chapter teach about pride?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  5,
  'How does Esther 1 contribute to the book’s message?',
  '["Ends story","Begins the chain of events leading to deliverance","Ignores plot","Focuses on law"]'::jsonb,
  'Begins the chain of events leading to deliverance',
  'It sets up Esther’s role.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 1 contribute to the book’s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  5,
  'Why is Vashti’s removal significant in God’s plan?',
  '["Coincidence","Prepares for Esther’s rise","Ends conflict","Minor"]'::jsonb,
  'Prepares for Esther’s rise',
  'It opens the way for Esther.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'Why is Vashti’s removal significant in God’s plan?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  5,
  'What does Esther 1 teach about human authority?',
  '["Perfect","Flawed and limited","Divine","Unchanging"]'::jsonb,
  'Flawed and limited',
  'Human leaders are imperfect.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'What does Esther 1 teach about human authority?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  5,
  'In the flow of Esther, what is the main role of chapter 1?',
  '["Introduction of setting and conflict","Ending story","Victory","Law"]'::jsonb,
  'Introduction of setting and conflict',
  'It sets the stage.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'In the flow of Esther, what is the main role of chapter 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  5,
  'How does Esther 1 frame success?',
  '["Wealth","Control and image","Faithfulness","Power"]'::jsonb,
  'Control and image',
  'The king values image.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 1 frame success?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  5,
  'What larger message does Esther 1 leave?',
  '["God works through human events","Wealth matters most","Power is key","Work is enough"]'::jsonb,
  'God works through human events',
  'God’s plan unfolds indirectly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'What larger message does Esther 1 leave?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  1,
  5,
  'How does Esther 1 frame responsibility?',
  '["Optional","Human decisions have consequences","Individual only","Political"]'::jsonb,
  'Human decisions have consequences',
  'Choices shape outcomes.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 1 frame responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  1,
  'According to Esther 2, what did the king begin to remember after his anger subsided?',
  '["His wealth","Vashti and what she had done","His kingdom","His enemies"]'::jsonb,
  'Vashti and what she had done',
  'The king remembered Vashti after his anger subsided (Esther 2:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 1
    AND prompt = 'According to Esther 2, what did the king begin to remember after his anger subsided?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  1,
  'What plan was suggested to the king to find a new queen?',
  '["Choose a princess","Gather beautiful young virgins","Hold a war","Ask the priests"]'::jsonb,
  'Gather beautiful young virgins',
  'Young women were gathered to find a new queen (Esther 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 1
    AND prompt = 'What plan was suggested to the king to find a new queen?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  1,
  'Where were the young women gathered?',
  '["Jerusalem","Babylon","Susa, the citadel","Egypt"]'::jsonb,
  'Susa, the citadel',
  'They were brought to Susa (Esther 2:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 1
    AND prompt = 'Where were the young women gathered?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  1,
  'Who was in charge of the women?',
  '["Mordecai","Hegai","Nehemiah","Ezra"]'::jsonb,
  'Hegai',
  'Hegai was the king’s eunuch in charge of the women (Esther 2:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 1
    AND prompt = 'Who was in charge of the women?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  1,
  'Who was Esther also known as?',
  '["Deborah","Hadassah","Ruth","Vashti"]'::jsonb,
  'Hadassah',
  'Esther’s Hebrew name was Hadassah (Esther 2:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 1
    AND prompt = 'Who was Esther also known as?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  1,
  'Who raised Esther?',
  '["Ezra","Mordecai","Nehemiah","David"]'::jsonb,
  'Mordecai',
  'Mordecai raised Esther as his own daughter (Esther 2:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 1
    AND prompt = 'Who raised Esther?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  1,
  'What was Esther’s family background?',
  '["Egyptian","Jewish","Persian","Babylonian"]'::jsonb,
  'Jewish',
  'Esther was a Jew (Esther 2:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 1
    AND prompt = 'What was Esther’s family background?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  1,
  'What instruction did Mordecai give Esther?',
  '["Reveal everything","Not to reveal her people or family","Leave the palace","Speak loudly"]'::jsonb,
  'Not to reveal her people or family',
  'Esther kept her identity secret (Esther 2:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 1
    AND prompt = 'What instruction did Mordecai give Esther?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  1,
  'How long did the preparation for each woman last?',
  '["3 months","6 months","12 months","2 years"]'::jsonb,
  '12 months',
  'Each woman underwent 12 months of beauty treatment (Esther 2:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 1
    AND prompt = 'How long did the preparation for each woman last?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  1,
  'Who was chosen as queen?',
  '["Vashti","Esther","Deborah","Ruth"]'::jsonb,
  'Esther',
  'Esther found favor and was chosen as queen (Esther 2:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 1
    AND prompt = 'Who was chosen as queen?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  2,
  'What did the king do after choosing Esther as queen?',
  '["Went to war","Held a great feast","Left the palace","Built a temple"]'::jsonb,
  'Held a great feast',
  'The king held Esther’s feast (Esther 2:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 2
    AND prompt = 'What did the king do after choosing Esther as queen?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  2,
  'What did the king grant during the feast?',
  '["Taxes","Remission of taxes and gifts","War","Food"]'::jsonb,
  'Remission of taxes and gifts',
  'He granted tax relief and gave gifts (Esther 2:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 2
    AND prompt = 'What did the king grant during the feast?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  2,
  'Where did Mordecai sit?',
  '["Temple","King’s gate","Palace","Market"]'::jsonb,
  'King’s gate',
  'Mordecai sat at the king’s gate (Esther 2:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 2
    AND prompt = 'Where did Mordecai sit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  2,
  'Did Esther reveal her identity after becoming queen?',
  '["Yes","No","Sometimes","Only to the king"]'::jsonb,
  'No',
  'She continued to keep it secret (Esther 2:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 2
    AND prompt = 'Did Esther reveal her identity after becoming queen?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  2,
  'What plot did Mordecai discover?',
  '["War plan","Assassination plot against the king","Trade plan","Marriage plan"]'::jsonb,
  'Assassination plot against the king',
  'Two eunuchs plotted to kill the king (Esther 2:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 2
    AND prompt = 'What plot did Mordecai discover?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  2,
  'Who were the conspirators?',
  '["Sanballat and Tobiah","Bigthan and Teresh","Haman and Mordecai","Ezra and Nehemiah"]'::jsonb,
  'Bigthan and Teresh',
  'They were the king’s eunuchs (Esther 2:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 2
    AND prompt = 'Who were the conspirators?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  2,
  'How did Mordecai respond to the plot?',
  '["Ignored it","Reported it to Esther","Joined it","Left"]'::jsonb,
  'Reported it to Esther',
  'Mordecai told Esther (Esther 2:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 2
    AND prompt = 'How did Mordecai respond to the plot?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  2,
  'How was the plot handled?',
  '["Ignored","Investigated and confirmed","Hidden","Forgotten"]'::jsonb,
  'Investigated and confirmed',
  'The matter was investigated (Esther 2:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 2
    AND prompt = 'How was the plot handled?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  2,
  'What happened to the conspirators?',
  '["Freed","Exiled","Hanged","Punished lightly"]'::jsonb,
  'Hanged',
  'They were executed (Esther 2:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 2
    AND prompt = 'What happened to the conspirators?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  2,
  'Where was this event recorded?',
  '["Temple scroll","Book of chronicles","Law scroll","Prophecy"]'::jsonb,
  'Book of chronicles',
  'It was recorded before the king (Esther 2:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 2
    AND prompt = 'Where was this event recorded?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  3,
  'Why is Esther’s selection significant?',
  '["Wealth","God’s providence in placing her","Power","Beauty"]'::jsonb,
  'God’s providence in placing her',
  'She is positioned for future events.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 3
    AND prompt = 'Why is Esther’s selection significant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  3,
  'What does Esther’s obedience to Mordecai show?',
  '["Fear","Respect and humility","Weakness","Confusion"]'::jsonb,
  'Respect and humility',
  'She listens to Mordecai.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 3
    AND prompt = 'What does Esther’s obedience to Mordecai show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  3,
  'Why is Esther’s identity hidden?',
  '["Random","Strategic for future events","Unimportant","Temporary"]'::jsonb,
  'Strategic for future events',
  'It becomes important later.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 3
    AND prompt = 'Why is Esther’s identity hidden?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  3,
  'What does Mordecai’s action reveal?',
  '["Selfishness","Loyalty to the king","Fear","Weakness"]'::jsonb,
  'Loyalty to the king',
  'He protects the king.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 3
    AND prompt = 'What does Mordecai’s action reveal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  3,
  'Why is the assassination plot important?',
  '["Minor","Foreshadows future reward","Ends story","Confuses"]'::jsonb,
  'Foreshadows future reward',
  'It will matter later.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 3
    AND prompt = 'Why is the assassination plot important?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  3,
  'What role does favor play in Esther’s rise?',
  '["None","Central to her success","Minor","Hidden"]'::jsonb,
  'Central to her success',
  'She finds favor with others.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 3
    AND prompt = 'What role does favor play in Esther’s rise?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  3,
  'What does the beauty process show?',
  '["Spiritual growth","Cultural practices of the kingdom","War","Fear"]'::jsonb,
  'Cultural practices of the kingdom',
  'It reflects Persian customs.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 3
    AND prompt = 'What does the beauty process show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  3,
  'What does the king’s feast show?',
  '["Humility","Celebration and authority","Fear","Weakness"]'::jsonb,
  'Celebration and authority',
  'The king celebrates publicly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 3
    AND prompt = 'What does the king’s feast show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  3,
  'What does Nehemiah 2 (Esther 2 contextually) suggest about God’s work?',
  '["Visible","Hidden but active","Absent","Delayed"]'::jsonb,
  'Hidden but active',
  'God works behind the scenes.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 3
    AND prompt = 'What does Nehemiah 2 (Esther 2 contextually) suggest about God’s work?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  3,
  'What theme continues from chapter 1?',
  '["War","Providence","Wealth","Law"]'::jsonb,
  'Providence',
  'God’s plan unfolds quietly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 3
    AND prompt = 'What theme continues from chapter 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  4,
  'How does Esther 2 develop the theme of providence?',
  '["Ends story","Shows God placing Esther strategically","Ignores plot","Focuses on war"]'::jsonb,
  'Shows God placing Esther strategically',
  'Esther is positioned as queen.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 4
    AND prompt = 'How does Esther 2 develop the theme of providence?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  4,
  'What leadership qualities are shown by Mordecai?',
  '["Fear","Loyalty and wisdom","Wealth","Power"]'::jsonb,
  'Loyalty and wisdom',
  'He protects the king.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 4
    AND prompt = 'What leadership qualities are shown by Mordecai?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  4,
  'Why is Esther’s rise important?',
  '["Minor","Prepares for deliverance of her people","Ends story","Builds tension only"]'::jsonb,
  'Prepares for deliverance of her people',
  'She will play a key role.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 4
    AND prompt = 'Why is Esther’s rise important?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  4,
  'How does the chapter portray identity?',
  '["Unimportant","Hidden but significant","Temporary","Optional"]'::jsonb,
  'Hidden but significant',
  'Esther’s identity matters later.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 4
    AND prompt = 'How does the chapter portray identity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  4,
  'What role does timing play?',
  '["None","Critical in unfolding events","Minor","Hidden"]'::jsonb,
  'Critical in unfolding events',
  'Events happen at the right time.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 4
    AND prompt = 'What role does timing play?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  4,
  'How does Esther 2 connect to chapter 1?',
  '["Ends story","Fulfills the search for a new queen","Ignores conflict","Focuses on law"]'::jsonb,
  'Fulfills the search for a new queen',
  'Esther replaces Vashti.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 4
    AND prompt = 'How does Esther 2 connect to chapter 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  4,
  'What larger theme is reinforced?',
  '["Hidden providence","War","Wealth","Law"]'::jsonb,
  'Hidden providence',
  'God’s plan continues.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 4
    AND prompt = 'What larger theme is reinforced?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  4,
  'Why is record-keeping important?',
  '["To impress","To preserve events for future significance","To gain power","To compete"]'::jsonb,
  'To preserve events for future significance',
  'Mordecai’s act is recorded.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 4
    AND prompt = 'Why is record-keeping important?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  4,
  'What does Esther 2 teach about opportunity?',
  '["Random","Prepared by circumstances","Unimportant","Hidden"]'::jsonb,
  'Prepared by circumstances',
  'Esther is placed strategically.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 4
    AND prompt = 'What does Esther 2 teach about opportunity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  4,
  'How does Esther 2 portray success?',
  '["Wealth","Favor and positioning","Power","Victory"]'::jsonb,
  'Favor and positioning',
  'Esther gains favor.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 4
    AND prompt = 'How does Esther 2 portray success?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  5,
  'What theological theme is central to Esther 2?',
  '["God’s providence and timing","Wealth","Power","War"]'::jsonb,
  'God’s providence and timing',
  'God works through events.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 5
    AND prompt = 'What theological theme is central to Esther 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  5,
  'How does Esther 2 portray God’s role?',
  '["Explicit","Hidden but active","Absent","Uncertain"]'::jsonb,
  'Hidden but active',
  'God is not named but is working.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 2 portray God’s role?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  5,
  'What does the chapter teach about preparation?',
  '["Optional","God prepares people for future roles","Temporary","Hidden"]'::jsonb,
  'God prepares people for future roles',
  'Esther is prepared.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 5
    AND prompt = 'What does the chapter teach about preparation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  5,
  'How does Esther 2 contribute to the book’s message?',
  '["Ends story","Advances God’s plan for deliverance","Ignores plot","Focuses on law"]'::jsonb,
  'Advances God’s plan for deliverance',
  'Esther is placed as queen.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 2 contribute to the book’s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  5,
  'Why is Mordecai’s action significant?',
  '["Minor","Foreshadows future reward and deliverance","Ends story","Confuses"]'::jsonb,
  'Foreshadows future reward and deliverance',
  'It will be remembered later.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 5
    AND prompt = 'Why is Mordecai’s action significant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  5,
  'What does Esther 2 teach about identity?',
  '["Unimportant","Can be hidden yet purposeful","Temporary","Optional"]'::jsonb,
  'Can be hidden yet purposeful',
  'Her identity matters later.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 5
    AND prompt = 'What does Esther 2 teach about identity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  5,
  'In the flow of Esther, what is the main role of chapter 2?',
  '["Esther becomes queen","Ending story","Victory","Law"]'::jsonb,
  'Esther becomes queen',
  'She is chosen as queen.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 5
    AND prompt = 'In the flow of Esther, what is the main role of chapter 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  5,
  'How does Esther 2 frame success?',
  '["Wealth","Favor and divine positioning","Power","Victory"]'::jsonb,
  'Favor and divine positioning',
  'Esther gains favor.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 2 frame success?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  5,
  'What larger message does Esther 2 leave?',
  '["God prepares people for His purposes","Wealth matters most","Power is key","Work is enough"]'::jsonb,
  'God prepares people for His purposes',
  'God positions Esther.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 5
    AND prompt = 'What larger message does Esther 2 leave?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  2,
  5,
  'How does Esther 2 frame responsibility?',
  '["Optional","Faithfulness in hidden roles","Individual only","Political"]'::jsonb,
  'Faithfulness in hidden roles',
  'Esther and Mordecai act faithfully.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 2
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 2 frame responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  1,
  'According to Esther 3, who was promoted by King Ahasuerus?',
  '["Mordecai","Haman","Esther","Memucan"]'::jsonb,
  'Haman',
  'Haman the Agagite was promoted and set above all the officials (Esther 3:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 1
    AND prompt = 'According to Esther 3, who was promoted by King Ahasuerus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  1,
  'What did the king command people to do to Haman?',
  '["Ignore him","Bow down and pay homage","Give him gifts","Follow him"]'::jsonb,
  'Bow down and pay homage',
  'All the king’s servants were to bow down to Haman (Esther 3:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 1
    AND prompt = 'What did the king command people to do to Haman?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  1,
  'Who refused to bow down to Haman?',
  '["Esther","Mordecai","The priests","The Levites"]'::jsonb,
  'Mordecai',
  'Mordecai refused to bow down (Esther 3:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 1
    AND prompt = 'Who refused to bow down to Haman?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  1,
  'How did Haman react when he saw Mordecai would not bow?',
  '["He ignored it","He was filled with fury","He laughed","He left"]'::jsonb,
  'He was filled with fury',
  'Haman was enraged (Esther 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 1
    AND prompt = 'How did Haman react when he saw Mordecai would not bow?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  1,
  'What group did Haman decide to destroy?',
  '["The Persians","The Jews","The Egyptians","The Babylonians"]'::jsonb,
  'The Jews',
  'Haman sought to destroy all the Jews (Esther 3:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 1
    AND prompt = 'What group did Haman decide to destroy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  1,
  'In which month did Haman cast the lot (Pur)?',
  '["First month","Second month","Twelfth month","Seventh month"]'::jsonb,
  'First month',
  'The lot was cast in the first month (Esther 3:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 1
    AND prompt = 'In which month did Haman cast the lot (Pur)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  1,
  'What was the name of the twelfth month?',
  '["Nisan","Adar","Tishri","Elul"]'::jsonb,
  'Adar',
  'The twelfth month is Adar (Esther 3:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 1
    AND prompt = 'What was the name of the twelfth month?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  1,
  'What accusation did Haman make against the Jews?',
  '["They were rich","They had different laws and did not obey the king","They were weak","They were few"]'::jsonb,
  'They had different laws and did not obey the king',
  'Haman accused them of disobedience (Esther 3:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 1
    AND prompt = 'What accusation did Haman make against the Jews?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  1,
  'What did Haman offer the king in exchange for destroying the Jews?',
  '["Gold","Ten thousand talents of silver","Land","Soldiers"]'::jsonb,
  'Ten thousand talents of silver',
  'Haman offered silver to carry out the plan (Esther 3:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 1
    AND prompt = 'What did Haman offer the king in exchange for destroying the Jews?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  1,
  'What did the king give Haman to authorize the decree?',
  '["A crown","His signet ring","A sword","A scroll"]'::jsonb,
  'His signet ring',
  'The king gave Haman his ring (Esther 3:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 1
    AND prompt = 'What did the king give Haman to authorize the decree?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  2,
  'What did the king say about the silver Haman offered?',
  '["Keep it","Give it to the people","Use it for war","Store it"]'::jsonb,
  'Keep it',
  'The king told Haman to keep the money (Esther 3:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 2
    AND prompt = 'What did the king say about the silver Haman offered?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  2,
  'Who wrote the decree to destroy the Jews?',
  '["The king","The scribes","Haman himself","Mordecai"]'::jsonb,
  'The scribes',
  'The king’s scribes wrote the decree (Esther 3:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 2
    AND prompt = 'Who wrote the decree to destroy the Jews?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  2,
  'In whose name was the decree issued?',
  '["Haman","Esther","King Ahasuerus","Mordecai"]'::jsonb,
  'King Ahasuerus',
  'It was written in the king’s name (Esther 3:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 2
    AND prompt = 'In whose name was the decree issued?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  2,
  'What was the content of the decree?',
  '["Tax law","Destroy all Jews in one day","Peace treaty","Marriage law"]'::jsonb,
  'Destroy all Jews in one day',
  'The decree ordered their destruction (Esther 3:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 2
    AND prompt = 'What was the content of the decree?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  2,
  'What was to be done with the property of the Jews?',
  '["Protected","Plundered","Burned","Given to priests"]'::jsonb,
  'Plundered',
  'Their goods were to be taken (Esther 3:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 2
    AND prompt = 'What was to be done with the property of the Jews?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  2,
  'How was the decree distributed?',
  '["Privately","To every province and people","Only in Susa","Only to leaders"]'::jsonb,
  'To every province and people',
  'The decree was sent throughout the empire (Esther 3:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 2
    AND prompt = 'How was the decree distributed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  2,
  'How were messengers sent out?',
  '["Slowly","Quickly by couriers","Only by letter","By word"]'::jsonb,
  'Quickly by couriers',
  'Couriers hurried out the decree (Esther 3:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 2
    AND prompt = 'How were messengers sent out?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  2,
  'What was the reaction in the city of Susa?',
  '["Joy","Confusion","Celebration","Silence"]'::jsonb,
  'Confusion',
  'The city was thrown into confusion (Esther 3:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 2
    AND prompt = 'What was the reaction in the city of Susa?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  2,
  'What did the king and Haman do after issuing the decree?',
  '["Prayed","Sat down to drink","Left the city","Went to war"]'::jsonb,
  'Sat down to drink',
  'They sat down to drink while the city was in confusion (Esther 3:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 2
    AND prompt = 'What did the king and Haman do after issuing the decree?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  2,
  'What does the term ''Pur'' refer to?',
  '["A feast","A lot or casting of lots","A law","A city"]'::jsonb,
  'A lot or casting of lots',
  'Pur means lot (Esther 3:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 2
    AND prompt = 'What does the term ''Pur'' refer to?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  3,
  'Why does Mordecai refuse to bow to Haman?',
  '["Pride","Religious conviction","Fear","Confusion"]'::jsonb,
  'Religious conviction',
  'Mordecai likely refuses due to faithfulness to God.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 3
    AND prompt = 'Why does Mordecai refuse to bow to Haman?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  3,
  'What does Haman’s reaction reveal about his character?',
  '["Humility","Pride and hatred","Wisdom","Patience"]'::jsonb,
  'Pride and hatred',
  'He reacts with extreme anger.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 3
    AND prompt = 'What does Haman’s reaction reveal about his character?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  3,
  'Why does Haman target all Jews instead of just Mordecai?',
  '["Mistake","Extreme hatred and vengeance","Fear","Strategy only"]'::jsonb,
  'Extreme hatred and vengeance',
  'He seeks total destruction.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 3
    AND prompt = 'Why does Haman target all Jews instead of just Mordecai?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  3,
  'What does casting lots show about Haman’s plan?',
  '["Faith","Superstition","Wisdom","Patience"]'::jsonb,
  'Superstition',
  'He relies on chance or fate.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 3
    AND prompt = 'What does casting lots show about Haman’s plan?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  3,
  'What does the king’s quick agreement reveal?',
  '["Careful thought","Carelessness and lack of inquiry","Wisdom","Fear"]'::jsonb,
  'Carelessness and lack of inquiry',
  'The king does not investigate.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 3
    AND prompt = 'What does the king’s quick agreement reveal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  3,
  'Why is the decree dangerous?',
  '["It is small","It affects the entire empire","It is hidden","It is temporary"]'::jsonb,
  'It affects the entire empire',
  'It targets all Jews everywhere.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 3
    AND prompt = 'Why is the decree dangerous?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  3,
  'What contrast is shown at the end of the chapter?',
  '["Joy and peace","King’s calm vs. city’s confusion","War and peace","Wealth and poverty"]'::jsonb,
  'King’s calm vs. city’s confusion',
  'Leaders celebrate while others panic.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 3
    AND prompt = 'What contrast is shown at the end of the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  3,
  'What does Haman’s accusation distort?',
  '["Truth","The identity and loyalty of the Jews","Law","Wealth"]'::jsonb,
  'The identity and loyalty of the Jews',
  'He misrepresents them.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 3
    AND prompt = 'What does Haman’s accusation distort?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  3,
  'What does this chapter suggest about power?',
  '["Stable","Easily misused","Weak","Temporary"]'::jsonb,
  'Easily misused',
  'Authority is abused.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 3
    AND prompt = 'What does this chapter suggest about power?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  3,
  'What theme is developing in the story?',
  '["War","Threat to God’s people","Wealth","Law"]'::jsonb,
  'Threat to God’s people',
  'The Jews face destruction.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 3
    AND prompt = 'What theme is developing in the story?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  4,
  'How does Esther 3 develop the theme of conflict?',
  '["Ends story","Introduces major threat","Ignores plot","Focuses on law"]'::jsonb,
  'Introduces major threat',
  'The decree creates the central conflict.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 4
    AND prompt = 'How does Esther 3 develop the theme of conflict?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  4,
  'What leadership flaws are shown by the king?',
  '["Wisdom","Carelessness and passivity","Courage","Patience"]'::jsonb,
  'Carelessness and passivity',
  'He approves without investigation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 4
    AND prompt = 'What leadership flaws are shown by the king?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  4,
  'Why is Haman’s rise significant?',
  '["Minor","Leads to persecution of Jews","Ends story","Builds tension only"]'::jsonb,
  'Leads to persecution of Jews',
  'He becomes the antagonist.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 4
    AND prompt = 'Why is Haman’s rise significant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  4,
  'How does the chapter portray injustice?',
  '["Absent","Systemic and widespread","Minor","Hidden"]'::jsonb,
  'Systemic and widespread',
  'A whole people is targeted.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 4
    AND prompt = 'How does the chapter portray injustice?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  4,
  'What role does manipulation play?',
  '["None","Central to Haman’s success","Minor","Hidden"]'::jsonb,
  'Central to Haman’s success',
  'He deceives the king.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 4
    AND prompt = 'What role does manipulation play?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  4,
  'How does Esther 3 connect to earlier chapters?',
  '["Ends story","Escalates conflict after Esther becomes queen","Ignores plot","Focuses on law"]'::jsonb,
  'Escalates conflict after Esther becomes queen',
  'The threat intensifies.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 4
    AND prompt = 'How does Esther 3 connect to earlier chapters?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  4,
  'What larger theme is reinforced?',
  '["Opposition to God’s people","Wealth","Power","Law"]'::jsonb,
  'Opposition to God’s people',
  'The Jews are targeted.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 4
    AND prompt = 'What larger theme is reinforced?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  4,
  'Why is the decree’s reach important?',
  '["Minor","Shows empire-wide impact","Optional","Hidden"]'::jsonb,
  'Shows empire-wide impact',
  'It affects all provinces.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 4
    AND prompt = 'Why is the decree’s reach important?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  4,
  'What does this chapter teach about influence?',
  '["None","Advisors can shape major decisions","Minor","Hidden"]'::jsonb,
  'Advisors can shape major decisions',
  'Haman influences the king.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 4
    AND prompt = 'What does this chapter teach about influence?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  4,
  'How does Esther 3 portray tension?',
  '["Low","High and escalating","None","Hidden"]'::jsonb,
  'High and escalating',
  'The threat grows.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 4
    AND prompt = 'How does Esther 3 portray tension?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  5,
  'What theological theme is central to Esther 3?',
  '["Threat to God’s covenant people","Wealth","Power","War"]'::jsonb,
  'Threat to God’s covenant people',
  'The Jews face destruction.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 5
    AND prompt = 'What theological theme is central to Esther 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  5,
  'How does Esther 3 portray evil?',
  '["Weak","Intentional and destructive","Hidden","Temporary"]'::jsonb,
  'Intentional and destructive',
  'Haman’s plan is deliberate.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 3 portray evil?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  5,
  'What does the chapter teach about injustice?',
  '["Rare","Can be widespread and systemic","Minor","Hidden"]'::jsonb,
  'Can be widespread and systemic',
  'The decree affects all Jews.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 5
    AND prompt = 'What does the chapter teach about injustice?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  5,
  'How does Esther 3 contribute to the book’s message?',
  '["Ends story","Introduces the central crisis","Ignores plot","Focuses on law"]'::jsonb,
  'Introduces the central crisis',
  'It sets up the main conflict.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 3 contribute to the book’s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  5,
  'Why is Mordecai’s stand important?',
  '["Minor","Shows faithfulness despite danger","Ends story","Confuses"]'::jsonb,
  'Shows faithfulness despite danger',
  'He refuses to compromise.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 5
    AND prompt = 'Why is Mordecai’s stand important?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  5,
  'What does Esther 3 teach about power?',
  '["Perfect","Can be misused for evil","Divine","Unchanging"]'::jsonb,
  'Can be misused for evil',
  'Authority is abused.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 5
    AND prompt = 'What does Esther 3 teach about power?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  5,
  'In the flow of Esther, what is the main role of chapter 3?',
  '["Introduction of the main threat","Ending story","Victory","Law"]'::jsonb,
  'Introduction of the main threat',
  'The decree creates the crisis.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 5
    AND prompt = 'In the flow of Esther, what is the main role of chapter 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  5,
  'How does Esther 3 frame success?',
  '["Wealth","Control and influence","Faithfulness","Victory"]'::jsonb,
  'Control and influence',
  'Haman seeks power.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 3 frame success?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  5,
  'What larger message does Esther 3 leave?',
  '["Evil can rise against God’s people","Wealth matters most","Power is key","Work is enough"]'::jsonb,
  'Evil can rise against God’s people',
  'The Jews face danger.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 5
    AND prompt = 'What larger message does Esther 3 leave?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  3,
  5,
  'How does Esther 3 frame responsibility?',
  '["Optional","Stand firm in faith","Individual only","Political"]'::jsonb,
  'Stand firm in faith',
  'Mordecai remains faithful.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 3
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 3 frame responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  1,
  'According to Esther 4, how did Mordecai react when he learned of the decree?',
  '["He celebrated","He tore his clothes and mourned","He ignored it","He left the city"]'::jsonb,
  'He tore his clothes and mourned',
  'Mordecai tore his clothes, put on sackcloth and ashes, and cried loudly (Esther 4:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 1
    AND prompt = 'According to Esther 4, how did Mordecai react when he learned of the decree?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  1,
  'Where did Mordecai go while mourning?',
  '["The temple","The king’s gate","The palace","The market"]'::jsonb,
  'The king’s gate',
  'He went as far as the king’s gate (Esther 4:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 1
    AND prompt = 'Where did Mordecai go while mourning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  1,
  'How did the Jews in every province respond to the decree?',
  '["With joy","With fasting, weeping, and mourning","With silence","With celebration"]'::jsonb,
  'With fasting, weeping, and mourning',
  'There was great mourning among the Jews (Esther 4:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 1
    AND prompt = 'How did the Jews in every province respond to the decree?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  1,
  'What did Esther do when she heard about Mordecai?',
  '["Ignored him","Sent garments to clothe him","Went to him","Called the king"]'::jsonb,
  'Sent garments to clothe him',
  'Esther sent clothes, but Mordecai refused them (Esther 4:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 1
    AND prompt = 'What did Esther do when she heard about Mordecai?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  1,
  'Who did Esther send to find out what was happening?',
  '["Hegai","Hathach","Nehemiah","Ezra"]'::jsonb,
  'Hathach',
  'Hathach was sent to Mordecai (Esther 4:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 1
    AND prompt = 'Who did Esther send to find out what was happening?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  1,
  'What did Mordecai give Hathach to show Esther?',
  '["A letter","A copy of the decree","Money","Clothes"]'::jsonb,
  'A copy of the decree',
  'He gave a copy of the decree (Esther 4:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 1
    AND prompt = 'What did Mordecai give Hathach to show Esther?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  1,
  'What did Mordecai ask Esther to do?',
  '["Leave the palace","Go to the king and plead for her people","Hide","Send money"]'::jsonb,
  'Go to the king and plead for her people',
  'Mordecai urged her to intercede (Esther 4:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 1
    AND prompt = 'What did Mordecai ask Esther to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  1,
  'What was the risk of going to the king uninvited?',
  '["Exile","Death unless the king extends the golden scepter","Imprisonment","Fine"]'::jsonb,
  'Death unless the king extends the golden scepter',
  'Uninvited entry could result in death (Esther 4:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 1
    AND prompt = 'What was the risk of going to the king uninvited?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  1,
  'How long had it been since Esther was called to the king?',
  '["7 days","30 days","3 months","1 year"]'::jsonb,
  '30 days',
  'She had not been called for 30 days (Esther 4:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 1
    AND prompt = 'How long had it been since Esther was called to the king?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  1,
  'What famous statement did Esther make about going to the king?',
  '["I will not go","If I perish, I perish","I am afraid","I will wait"]'::jsonb,
  'If I perish, I perish',
  'Esther accepted the risk (Esther 4:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 1
    AND prompt = 'What famous statement did Esther make about going to the king?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  2,
  'What did Mordecai warn Esther about her position?',
  '["She is safe","She would not escape even in the palace","She should leave","She should hide"]'::jsonb,
  'She would not escape even in the palace',
  'Mordecai said she would not escape (Esther 4:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 2
    AND prompt = 'What did Mordecai warn Esther about her position?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  2,
  'What did Mordecai say would happen if Esther remained silent?',
  '["Nothing","Relief and deliverance would come from another place","War","Peace"]'::jsonb,
  'Relief and deliverance would come from another place',
  'God’s deliverance would still come (Esther 4:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 2
    AND prompt = 'What did Mordecai say would happen if Esther remained silent?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  2,
  'What possibility did Mordecai suggest about Esther’s position?',
  '["Coincidence","She came to the kingdom for such a time as this","Luck","Chance"]'::jsonb,
  'She came to the kingdom for such a time as this',
  'Mordecai pointed to divine purpose (Esther 4:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 2
    AND prompt = 'What possibility did Mordecai suggest about Esther’s position?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  2,
  'What did Esther ask the Jews in Susa to do?',
  '["Pray only","Fast for three days","Fight","Leave"]'::jsonb,
  'Fast for three days',
  'She asked them to fast (Esther 4:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 2
    AND prompt = 'What did Esther ask the Jews in Susa to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  2,
  'Did Esther also fast?',
  '["No","Yes, with her maids","Only once","Only at night"]'::jsonb,
  'Yes, with her maids',
  'Esther fasted with her attendants (Esther 4:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 2
    AND prompt = 'Did Esther also fast?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  2,
  'How long was the fast to last?',
  '["1 day","3 days and nights","7 days","30 days"]'::jsonb,
  '3 days and nights',
  'They fasted for three days (Esther 4:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 2
    AND prompt = 'How long was the fast to last?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  2,
  'What did Mordecai do after Esther’s response?',
  '["Ignored it","Went away and did as Esther commanded","Left the city","Prayed only"]'::jsonb,
  'Went away and did as Esther commanded',
  'Mordecai obeyed Esther (Esther 4:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 2
    AND prompt = 'What did Mordecai do after Esther’s response?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  2,
  'What does fasting in this chapter represent?',
  '["Tradition","Seeking God in crisis","Celebration","Fear"]'::jsonb,
  'Seeking God in crisis',
  'Fasting reflects dependence on God.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 2
    AND prompt = 'What does fasting in this chapter represent?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  2,
  'What is the mood among the Jews?',
  '["Joy","Fear and mourning","Peace","Excitement"]'::jsonb,
  'Fear and mourning',
  'They mourned deeply.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 2
    AND prompt = 'What is the mood among the Jews?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  2,
  'What is Esther’s initial reaction to Mordecai’s request?',
  '["Immediate agreement","Hesitation due to risk","Anger","Joy"]'::jsonb,
  'Hesitation due to risk',
  'She feared approaching the king.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 2
    AND prompt = 'What is Esther’s initial reaction to Mordecai’s request?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  3,
  'Why is Mordecai’s mourning significant?',
  '["Tradition","Shows the seriousness of the situation","Wealth","Power"]'::jsonb,
  'Shows the seriousness of the situation',
  'The threat is severe.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 3
    AND prompt = 'Why is Mordecai’s mourning significant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  3,
  'What does Esther’s hesitation reveal?',
  '["Fear","Human vulnerability","Strength","Confidence"]'::jsonb,
  'Human vulnerability',
  'She recognizes the danger.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 3
    AND prompt = 'What does Esther’s hesitation reveal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  3,
  'What does Mordecai’s message teach about providence?',
  '["Chance","God’s plan will prevail","Weakness","Confusion"]'::jsonb,
  'God’s plan will prevail',
  'Deliverance will come.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 3
    AND prompt = 'What does Mordecai’s message teach about providence?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  3,
  'What does ''for such a time as this'' imply?',
  '["Coincidence","Divine purpose","Luck","Fear"]'::jsonb,
  'Divine purpose',
  'Esther’s position is intentional.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 3
    AND prompt = 'What does ''for such a time as this'' imply?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  3,
  'Why is fasting important here?',
  '["Tradition","Dependence on God","Wealth","Power"]'::jsonb,
  'Dependence on God',
  'They seek God’s help.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 3
    AND prompt = 'Why is fasting important here?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  3,
  'What does Esther’s decision show?',
  '["Fear","Courage and faith","Weakness","Confusion"]'::jsonb,
  'Courage and faith',
  'She risks her life.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 3
    AND prompt = 'What does Esther’s decision show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  3,
  'What does the chapter suggest about leadership?',
  '["Avoid risk","Take responsibility in crisis","Ignore danger","Wait"]'::jsonb,
  'Take responsibility in crisis',
  'Esther steps up.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 3
    AND prompt = 'What does the chapter suggest about leadership?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  3,
  'What role does community play?',
  '["None","Supports through fasting and unity","Minor","Hidden"]'::jsonb,
  'Supports through fasting and unity',
  'The Jews act together.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 3
    AND prompt = 'What role does community play?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  3,
  'What tension is present?',
  '["War","Risk versus obedience","Wealth","Power"]'::jsonb,
  'Risk versus obedience',
  'Esther must choose.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 3
    AND prompt = 'What tension is present?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  3,
  'What does Nehemiah 4 (Esther 4 contextually) show about crisis?',
  '["Easy","Requires action and faith","Optional","Hidden"]'::jsonb,
  'Requires action and faith',
  'Action is needed.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 3
    AND prompt = 'What does Nehemiah 4 (Esther 4 contextually) show about crisis?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  4,
  'How does Esther 4 develop the theme of deliverance?',
  '["Ends story","Prepares for intervention","Ignores plot","Focuses on law"]'::jsonb,
  'Prepares for intervention',
  'Esther is called to act.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 4
    AND prompt = 'How does Esther 4 develop the theme of deliverance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  4,
  'What leadership qualities are shown by Esther?',
  '["Fear","Courage and responsibility","Wealth","Power"]'::jsonb,
  'Courage and responsibility',
  'She accepts the risk.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 4
    AND prompt = 'What leadership qualities are shown by Esther?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  4,
  'Why is Mordecai’s statement important?',
  '["Minor","Reveals divine purpose","Ends story","Confuses"]'::jsonb,
  'Reveals divine purpose',
  'It points to God’s plan.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 4
    AND prompt = 'Why is Mordecai’s statement important?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  4,
  'How does the chapter portray faith?',
  '["Absent","Expressed through fasting and action","Hidden","Temporary"]'::jsonb,
  'Expressed through fasting and action',
  'Faith leads to action.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 4
    AND prompt = 'How does the chapter portray faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  4,
  'What role does risk play?',
  '["None","Essential for obedience","Optional","Hidden"]'::jsonb,
  'Essential for obedience',
  'Esther risks her life.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 4
    AND prompt = 'What role does risk play?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  4,
  'How does Esther 4 connect to earlier chapters?',
  '["Ends story","Responds to the threat in chapter 3","Ignores plot","Focuses on law"]'::jsonb,
  'Responds to the threat in chapter 3',
  'The crisis is addressed.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 4
    AND prompt = 'How does Esther 4 connect to earlier chapters?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  4,
  'What larger theme is reinforced?',
  '["Divine purpose","Wealth","Power","Law"]'::jsonb,
  'Divine purpose',
  'God’s plan unfolds.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 4
    AND prompt = 'What larger theme is reinforced?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  4,
  'Why is unity important?',
  '["To gain power","To strengthen response to crisis","To impress","To compete"]'::jsonb,
  'To strengthen response to crisis',
  'The people act together.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 4
    AND prompt = 'Why is unity important?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  4,
  'What does Esther 4 teach about calling?',
  '["Optional","Specific and purposeful","Hidden","Temporary"]'::jsonb,
  'Specific and purposeful',
  'Esther has a role.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 4
    AND prompt = 'What does Esther 4 teach about calling?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  4,
  'How does Esther 4 portray transformation?',
  '["Absent","From fear to courage","Temporary","Hidden"]'::jsonb,
  'From fear to courage',
  'Esther grows in courage.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 4
    AND prompt = 'How does Esther 4 portray transformation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  5,
  'What theological theme is central to Esther 4?',
  '["Divine providence and human responsibility","Wealth","Power","War"]'::jsonb,
  'Divine providence and human responsibility',
  'God’s plan and human action intersect.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 5
    AND prompt = 'What theological theme is central to Esther 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  5,
  'How does Esther 4 portray faith?',
  '["Passive","Active and courageous","Hidden","Temporary"]'::jsonb,
  'Active and courageous',
  'Faith leads to action.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 4 portray faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  5,
  'What does the chapter teach about purpose?',
  '["Random","God places people intentionally","Temporary","Hidden"]'::jsonb,
  'God places people intentionally',
  'Esther’s role is purposeful.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 5
    AND prompt = 'What does the chapter teach about purpose?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  5,
  'How does Esther 4 contribute to the book’s message?',
  '["Ends story","Marks the turning point toward deliverance","Ignores plot","Focuses on law"]'::jsonb,
  'Marks the turning point toward deliverance',
  'Esther decides to act.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 4 contribute to the book’s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  5,
  'Why is Esther’s statement important?',
  '["Minor","Shows willingness to sacrifice","Ends story","Confuses"]'::jsonb,
  'Shows willingness to sacrifice',
  'She accepts risk.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 5
    AND prompt = 'Why is Esther’s statement important?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  5,
  'What does Esther 4 teach about leadership?',
  '["Avoid risk","Lead with courage in crisis","Seek power","Be passive"]'::jsonb,
  'Lead with courage in crisis',
  'Esther steps up.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 5
    AND prompt = 'What does Esther 4 teach about leadership?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  5,
  'In the flow of Esther, what is the main role of chapter 4?',
  '["Turning point toward action","Ending story","Victory","Law"]'::jsonb,
  'Turning point toward action',
  'Esther decides to intervene.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 5
    AND prompt = 'In the flow of Esther, what is the main role of chapter 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  5,
  'How does Esther 4 frame success?',
  '["Wealth","Faithful obedience despite risk","Power","Victory"]'::jsonb,
  'Faithful obedience despite risk',
  'Success is obedience.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 4 frame success?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  5,
  'What larger message does Esther 4 leave?',
  '["God uses people at the right time","Wealth matters most","Power is key","Work is enough"]'::jsonb,
  'God uses people at the right time',
  'Esther is placed for a purpose.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 5
    AND prompt = 'What larger message does Esther 4 leave?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  4,
  5,
  'How does Esther 4 frame responsibility?',
  '["Optional","Act when called despite risk","Individual only","Political"]'::jsonb,
  'Act when called despite risk',
  'Responsibility requires action.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 4
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 4 frame responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  1,
  'According to Esther 5, what did Esther do on the third day?',
  '["She fasted","She put on her royal robes and stood in the inner court","She left the palace","She sent a letter"]'::jsonb,
  'She put on her royal robes and stood in the inner court',
  'Esther approached the king in the inner court (Esther 5:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 1
    AND prompt = 'According to Esther 5, what did Esther do on the third day?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  1,
  'What did the king do when he saw Esther?',
  '["Ignored her","Extended the golden scepter","Became angry","Left"]'::jsonb,
  'Extended the golden scepter',
  'The king showed favor by extending the scepter (Esther 5:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 1
    AND prompt = 'What did the king do when he saw Esther?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  1,
  'What did the king offer Esther?',
  '["Gold","Up to half the kingdom","A crown","A feast"]'::jsonb,
  'Up to half the kingdom',
  'The king offered her up to half his kingdom (Esther 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 1
    AND prompt = 'What did the king offer Esther?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  1,
  'What did Esther request first?',
  '["Money","A banquet for the king and Haman","A law change","A war"]'::jsonb,
  'A banquet for the king and Haman',
  'Esther invited them to a banquet (Esther 5:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 1
    AND prompt = 'What did Esther request first?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  1,
  'Who attended the banquet Esther prepared?',
  '["Only the king","Only Haman","The king and Haman","All officials"]'::jsonb,
  'The king and Haman',
  'Both attended the banquet (Esther 5:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 1
    AND prompt = 'Who attended the banquet Esther prepared?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  1,
  'What did the king ask Esther again at the banquet?',
  '["To leave","What her request was","To fast","To rule"]'::jsonb,
  'What her request was',
  'He again offered to grant her request (Esther 5:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 1
    AND prompt = 'What did the king ask Esther again at the banquet?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  1,
  'What did Esther request instead of revealing her petition immediately?',
  '["Another fast","Another banquet the next day","Money","A decree"]'::jsonb,
  'Another banquet the next day',
  'She invited them to another banquet (Esther 5:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 1
    AND prompt = 'What did Esther request instead of revealing her petition immediately?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  1,
  'How did Haman feel as he left the banquet?',
  '["Sad","Joyful and glad of heart","Angry","Afraid"]'::jsonb,
  'Joyful and glad of heart',
  'Haman was pleased (Esther 5:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 1
    AND prompt = 'How did Haman feel as he left the banquet?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  1,
  'What made Haman angry again?',
  '["The king","Mordecai not bowing to him","Esther","The feast"]'::jsonb,
  'Mordecai not bowing to him',
  'Mordecai’s refusal angered him (Esther 5:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 1
    AND prompt = 'What made Haman angry again?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  1,
  'What did Haman’s wife suggest he do?',
  '["Forgive Mordecai","Build a gallows to hang Mordecai","Leave the city","Ignore him"]'::jsonb,
  'Build a gallows to hang Mordecai',
  'Zeresh suggested building a gallows (Esther 5:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 1
    AND prompt = 'What did Haman’s wife suggest he do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  2,
  'Where did Esther stand when approaching the king?',
  '["Outside the palace","In the inner court of the king’s palace","In the city","At the gate"]'::jsonb,
  'In the inner court of the king’s palace',
  'She stood in the inner court (Esther 5:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 2
    AND prompt = 'Where did Esther stand when approaching the king?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  2,
  'What did Esther touch when the king extended it?',
  '["The crown","The top of the scepter","The throne","His robe"]'::jsonb,
  'The top of the scepter',
  'She touched the tip of the scepter (Esther 5:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 2
    AND prompt = 'What did Esther touch when the king extended it?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  2,
  'What did Haman boast about to his family and friends?',
  '["His wisdom","His wealth, sons, and promotion","His army","His land"]'::jsonb,
  'His wealth, sons, and promotion',
  'Haman bragged about his status (Esther 5:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 2
    AND prompt = 'What did Haman boast about to his family and friends?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  2,
  'What special privilege did Haman mention?',
  '["He led the army","He was invited alone with the king to Esther’s banquet","He ruled a province","He was wealthy"]'::jsonb,
  'He was invited alone with the king to Esther’s banquet',
  'Haman highlighted this honor (Esther 5:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 2
    AND prompt = 'What special privilege did Haman mention?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  2,
  'Why was Haman still dissatisfied?',
  '["He lacked money","Mordecai would not bow to him","He was tired","He feared the king"]'::jsonb,
  'Mordecai would not bow to him',
  'Mordecai’s refusal troubled him (Esther 5:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 2
    AND prompt = 'Why was Haman still dissatisfied?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  2,
  'How tall was the gallows Haman planned?',
  '["20 cubits","50 cubits","100 cubits","10 cubits"]'::jsonb,
  '50 cubits',
  'The gallows was 50 cubits high (Esther 5:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 2
    AND prompt = 'How tall was the gallows Haman planned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  2,
  'What was Haman told to do the next morning?',
  '["Go to war","Ask the king to hang Mordecai","Fast","Leave"]'::jsonb,
  'Ask the king to hang Mordecai',
  'He planned to request Mordecai’s execution.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 2
    AND prompt = 'What was Haman told to do the next morning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  2,
  'How did Haman feel about the plan to build the gallows?',
  '["Uncertain","Pleased","Angry","Afraid"]'::jsonb,
  'Pleased',
  'The suggestion pleased Haman (Esther 5:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 2
    AND prompt = 'How did Haman feel about the plan to build the gallows?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  2,
  'What does Esther’s delay in revealing her request show?',
  '["Fear only","Careful planning","Confusion","Weakness"]'::jsonb,
  'Careful planning',
  'She is strategic in timing.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 2
    AND prompt = 'What does Esther’s delay in revealing her request show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  2,
  'What setting dominates this chapter?',
  '["Battlefield","Royal court and banquets","Temple","City gates"]'::jsonb,
  'Royal court and banquets',
  'Events occur in the palace.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 2
    AND prompt = 'What setting dominates this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  3,
  'Why is Esther’s approach to the king significant?',
  '["Tradition","It risks her life","It is easy","It is expected"]'::jsonb,
  'It risks her life',
  'She enters without invitation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 3
    AND prompt = 'Why is Esther’s approach to the king significant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  3,
  'What does the king’s response show?',
  '["Anger","Favor toward Esther","Fear","Weakness"]'::jsonb,
  'Favor toward Esther',
  'He receives her kindly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 3
    AND prompt = 'What does the king’s response show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  3,
  'Why does Esther delay her request?',
  '["Fear only","Strategic timing","Confusion","Weakness"]'::jsonb,
  'Strategic timing',
  'She waits for the right moment.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 3
    AND prompt = 'Why does Esther delay her request?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  3,
  'What does Haman’s joy reveal about him?',
  '["Humility","Pride","Wisdom","Fear"]'::jsonb,
  'Pride',
  'He delights in honor.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 3
    AND prompt = 'What does Haman’s joy reveal about him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  3,
  'Why does Mordecai’s behavior anger Haman so much?',
  '["Wealth","Challenge to his pride","Fear","Confusion"]'::jsonb,
  'Challenge to his pride',
  'Haman cannot tolerate disrespect.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 3
    AND prompt = 'Why does Mordecai’s behavior anger Haman so much?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  3,
  'What does Haman’s boasting show?',
  '["Humility","Arrogance","Wisdom","Fear"]'::jsonb,
  'Arrogance',
  'He boasts of his achievements.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 3
    AND prompt = 'What does Haman’s boasting show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  3,
  'What does the gallows plan reveal?',
  '["Mercy","Desire for revenge","Wisdom","Patience"]'::jsonb,
  'Desire for revenge',
  'Haman seeks vengeance.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 3
    AND prompt = 'What does the gallows plan reveal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  3,
  'What contrast is seen in this chapter?',
  '["War and peace","Esther’s patience vs. Haman’s impulsiveness","Wealth and poverty","Fear and courage"]'::jsonb,
  'Esther’s patience vs. Haman’s impulsiveness',
  'Their responses differ greatly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 3
    AND prompt = 'What contrast is seen in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  3,
  'What role does timing play?',
  '["None","Critical in unfolding events","Minor","Hidden"]'::jsonb,
  'Critical in unfolding events',
  'Esther waits for the right moment.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 3
    AND prompt = 'What role does timing play?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  3,
  'What does Esther 5 suggest about wisdom?',
  '["Optional","Wise planning is important","Hidden","Temporary"]'::jsonb,
  'Wise planning is important',
  'Esther acts carefully.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 3
    AND prompt = 'What does Esther 5 suggest about wisdom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  4,
  'How does Esther 5 develop the theme of deliverance?',
  '["Ends story","Begins the process through Esther’s action","Ignores plot","Focuses on war"]'::jsonb,
  'Begins the process through Esther’s action',
  'Esther starts to intervene.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 4
    AND prompt = 'How does Esther 5 develop the theme of deliverance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  4,
  'What leadership qualities are shown by Esther?',
  '["Fear","Wisdom and courage","Wealth","Power"]'::jsonb,
  'Wisdom and courage',
  'She acts strategically.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 4
    AND prompt = 'What leadership qualities are shown by Esther?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  4,
  'Why is Haman’s reaction important?',
  '["Minor","Shows his pride and sets up his downfall","Ends story","Confuses"]'::jsonb,
  'Shows his pride and sets up his downfall',
  'His arrogance leads to consequences.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 4
    AND prompt = 'Why is Haman’s reaction important?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  4,
  'How does the chapter portray pride?',
  '["Positive","Destructive","Neutral","Hidden"]'::jsonb,
  'Destructive',
  'Haman’s pride leads to evil plans.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 4
    AND prompt = 'How does the chapter portray pride?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  4,
  'What role does planning play?',
  '["None","Essential in Esther’s strategy","Optional","Hidden"]'::jsonb,
  'Essential in Esther’s strategy',
  'She plans carefully.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 4
    AND prompt = 'What role does planning play?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  4,
  'How does Esther 5 connect to earlier chapters?',
  '["Ends story","Follows Esther’s decision to act in chapter 4","Ignores plot","Focuses on law"]'::jsonb,
  'Follows Esther’s decision to act in chapter 4',
  'She begins her plan.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 4
    AND prompt = 'How does Esther 5 connect to earlier chapters?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  4,
  'What larger theme is reinforced?',
  '["Pride vs. wisdom","Wealth","Power","Law"]'::jsonb,
  'Pride vs. wisdom',
  'Esther and Haman contrast.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 4
    AND prompt = 'What larger theme is reinforced?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  4,
  'Why is patience important?',
  '["To gain power","To allow the right moment","To impress","To compete"]'::jsonb,
  'To allow the right moment',
  'Timing matters.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 4
    AND prompt = 'Why is patience important?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  4,
  'What does Esther 5 teach about influence?',
  '["None","Can be used wisely or wrongly","Minor","Hidden"]'::jsonb,
  'Can be used wisely or wrongly',
  'Esther and Haman both influence events.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 4
    AND prompt = 'What does Esther 5 teach about influence?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  4,
  'How does Esther 5 portray tension?',
  '["Low","Building toward climax","None","Hidden"]'::jsonb,
  'Building toward climax',
  'Events intensify.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 4
    AND prompt = 'How does Esther 5 portray tension?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  5,
  'What theological theme is central to Esther 5?',
  '["Wisdom and providence in action","Wealth","Power","War"]'::jsonb,
  'Wisdom and providence in action',
  'God’s plan unfolds through Esther’s wisdom.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 5
    AND prompt = 'What theological theme is central to Esther 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  5,
  'How does Esther 5 portray leadership?',
  '["Passive","Strategic and courageous","Hidden","Temporary"]'::jsonb,
  'Strategic and courageous',
  'Esther leads wisely.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 5 portray leadership?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  5,
  'What does the chapter teach about pride?',
  '["Helpful","Leads to downfall","Neutral","Hidden"]'::jsonb,
  'Leads to downfall',
  'Haman’s pride is dangerous.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 5
    AND prompt = 'What does the chapter teach about pride?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  5,
  'How does Esther 5 contribute to the book’s message?',
  '["Ends story","Advances the plan toward deliverance","Ignores plot","Focuses on law"]'::jsonb,
  'Advances the plan toward deliverance',
  'Esther begins her intervention.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 5 contribute to the book’s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  5,
  'Why is Esther’s strategy important?',
  '["Minor","It demonstrates wisdom and timing","Ends story","Confuses"]'::jsonb,
  'It demonstrates wisdom and timing',
  'She acts carefully.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 5
    AND prompt = 'Why is Esther’s strategy important?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  5,
  'What does Esther 5 teach about influence?',
  '["None","Can shape major outcomes","Minor","Hidden"]'::jsonb,
  'Can shape major outcomes',
  'Esther influences the king.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 5
    AND prompt = 'What does Esther 5 teach about influence?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  5,
  'In the flow of Esther, what is the main role of chapter 5?',
  '["Esther begins her plan","Ending story","Victory","Law"]'::jsonb,
  'Esther begins her plan',
  'She initiates action.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 5
    AND prompt = 'In the flow of Esther, what is the main role of chapter 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  5,
  'How does Esther 5 frame success?',
  '["Wealth","Wise and timely action","Power","Victory"]'::jsonb,
  'Wise and timely action',
  'Success comes through wisdom.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 5 frame success?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  5,
  'What larger message does Esther 5 leave?',
  '["Wisdom and patience are powerful","Wealth matters most","Power is key","Work is enough"]'::jsonb,
  'Wisdom and patience are powerful',
  'Esther acts wisely.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 5
    AND prompt = 'What larger message does Esther 5 leave?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  5,
  5,
  'How does Esther 5 frame responsibility?',
  '["Optional","Act wisely with courage","Individual only","Political"]'::jsonb,
  'Act wisely with courage',
  'Esther models responsibility.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 5
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 5 frame responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  1,
  'According to Esther 6, what happened to the king during the night?',
  '["He slept peacefully","He could not sleep","He traveled","He feasted"]'::jsonb,
  'He could not sleep',
  'The king could not sleep that night (Esther 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 1
    AND prompt = 'According to Esther 6, what happened to the king during the night?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  1,
  'What did the king have read to him?',
  '["The law","The book of chronicles","A prophecy","A letter"]'::jsonb,
  'The book of chronicles',
  'The records of the chronicles were read (Esther 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 1
    AND prompt = 'What did the king have read to him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  1,
  'What event was recorded in the chronicles?',
  '["A war","Mordecai saving the king","A feast","A decree"]'::jsonb,
  'Mordecai saving the king',
  'It recorded Mordecai’s report of the assassination plot (Esther 6:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 1
    AND prompt = 'What event was recorded in the chronicles?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  1,
  'What question did the king ask about Mordecai?',
  '["Where is he?","What honor has been given to him?","Is he alive?","What did he do?"]'::jsonb,
  'What honor has been given to him?',
  'The king asked how Mordecai had been rewarded (Esther 6:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 1
    AND prompt = 'What question did the king ask about Mordecai?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  1,
  'What was the answer about Mordecai’s reward?',
  '["He was promoted","Nothing had been done","He was given gold","He was honored"]'::jsonb,
  'Nothing had been done',
  'Mordecai had not been rewarded (Esther 6:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 1
    AND prompt = 'What was the answer about Mordecai’s reward?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  1,
  'Who entered the court at that time?',
  '["Esther","Haman","Mordecai","Ezra"]'::jsonb,
  'Haman',
  'Haman entered the court (Esther 6:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 1
    AND prompt = 'Who entered the court at that time?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  1,
  'Why had Haman come to the court?',
  '["To see Esther","To ask to hang Mordecai","To attend a feast","To report news"]'::jsonb,
  'To ask to hang Mordecai',
  'He planned to request Mordecai’s execution (Esther 6:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 1
    AND prompt = 'Why had Haman come to the court?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  1,
  'What question did the king ask Haman?',
  '["What do you want?","What should be done for the man the king delights to honor?","Where are you going?","Who are you?"]'::jsonb,
  'What should be done for the man the king delights to honor?',
  'The king asked Haman for advice (Esther 6:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 1
    AND prompt = 'What question did the king ask Haman?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  1,
  'Who did Haman think the king wanted to honor?',
  '["Mordecai","Himself","Esther","Another official"]'::jsonb,
  'Himself',
  'Haman assumed it was about him (Esther 6:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 1
    AND prompt = 'Who did Haman think the king wanted to honor?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  1,
  'What did the king command Haman to do?',
  '["Build a gallows","Honor Mordecai publicly","Leave the palace","Go to war"]'::jsonb,
  'Honor Mordecai publicly',
  'Haman had to honor Mordecai (Esther 6:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 1
    AND prompt = 'What did the king command Haman to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  2,
  'What items did Haman suggest for honoring the man?',
  '["Gold and silver","Royal robe, horse, and crown","Food","Land"]'::jsonb,
  'Royal robe, horse, and crown',
  'He described royal honors (Esther 6:7-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 2
    AND prompt = 'What items did Haman suggest for honoring the man?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  2,
  'Who was to lead the honored man through the city?',
  '["The king","A noble official","The priests","The soldiers"]'::jsonb,
  'A noble official',
  'A high official would lead him (Esther 6:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 2
    AND prompt = 'Who was to lead the honored man through the city?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  2,
  'What did Haman have to proclaim?',
  '["A decree","Thus shall it be done to the man the king delights to honor","A law","A blessing"]'::jsonb,
  'Thus shall it be done to the man the king delights to honor',
  'He had to publicly honor Mordecai (Esther 6:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 2
    AND prompt = 'What did Haman have to proclaim?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  2,
  'Where did Haman lead Mordecai?',
  '["Temple","City square","Through the city square","Palace"]'::jsonb,
  'Through the city square',
  'He led him through the city (Esther 6:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 2
    AND prompt = 'Where did Haman lead Mordecai?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  2,
  'What did Mordecai do after being honored?',
  '["Celebrated","Returned to the king’s gate","Left the city","Went to the temple"]'::jsonb,
  'Returned to the king’s gate',
  'Mordecai returned to his post (Esther 6:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 2
    AND prompt = 'What did Mordecai do after being honored?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  2,
  'How did Haman react afterward?',
  '["Happy","Hurried home mourning","Celebrated","Ignored it"]'::jsonb,
  'Hurried home mourning',
  'Haman was humiliated (Esther 6:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 2
    AND prompt = 'How did Haman react afterward?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  2,
  'What did Haman’s wife and friends predict?',
  '["Victory","His downfall","Wealth","Promotion"]'::jsonb,
  'His downfall',
  'They foresaw his defeat (Esther 6:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 2
    AND prompt = 'What did Haman’s wife and friends predict?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  2,
  'What reason did they give for his downfall?',
  '["War","Mordecai was of Jewish origin","Luck","Wealth"]'::jsonb,
  'Mordecai was of Jewish origin',
  'They recognized God’s favor (Esther 6:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 2
    AND prompt = 'What reason did they give for his downfall?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  2,
  'What happened immediately after Haman returned home?',
  '["He slept","He was taken to Esther’s banquet","He left the city","He prayed"]'::jsonb,
  'He was taken to Esther’s banquet',
  'The king’s eunuchs hurried him (Esther 6:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 2
    AND prompt = 'What happened immediately after Haman returned home?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  2,
  'What does the king’s insomnia lead to?',
  '["Nothing","A reversal of events","War","Confusion"]'::jsonb,
  'A reversal of events',
  'It triggers Mordecai’s honor.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 2
    AND prompt = 'What does the king’s insomnia lead to?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  3,
  'Why is the king’s sleepless night significant?',
  '["Random","Part of providence","Unimportant","Coincidence"]'::jsonb,
  'Part of providence',
  'It leads to Mordecai’s recognition.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 3
    AND prompt = 'Why is the king’s sleepless night significant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  3,
  'What does Haman’s assumption reveal?',
  '["Humility","Pride","Wisdom","Fear"]'::jsonb,
  'Pride',
  'He assumes he will be honored.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 3
    AND prompt = 'What does Haman’s assumption reveal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  3,
  'What is ironic about Haman’s situation?',
  '["He wins","He honors the man he hates","He leaves","He hides"]'::jsonb,
  'He honors the man he hates',
  'The situation is reversed.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 3
    AND prompt = 'What is ironic about Haman’s situation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  3,
  'What does Mordecai’s response show?',
  '["Pride","Humility","Fear","Confusion"]'::jsonb,
  'Humility',
  'He returns to his duties.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 3
    AND prompt = 'What does Mordecai’s response show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  3,
  'What does the reversal theme show?',
  '["Chaos","God’s control over events","Fear","Wealth"]'::jsonb,
  'God’s control over events',
  'Events turn unexpectedly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 3
    AND prompt = 'What does the reversal theme show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  3,
  'Why is Haman’s humiliation important?',
  '["Minor","It marks the beginning of his downfall","Ends story","Confuses"]'::jsonb,
  'It marks the beginning of his downfall',
  'His decline begins.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 3
    AND prompt = 'Why is Haman’s humiliation important?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  3,
  'What role does timing play?',
  '["None","Critical","Minor","Hidden"]'::jsonb,
  'Critical',
  'Events align perfectly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 3
    AND prompt = 'What role does timing play?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  3,
  'What does the chapter suggest about justice?',
  '["Absent","Delayed but coming","Immediate","Hidden"]'::jsonb,
  'Delayed but coming',
  'Justice begins to unfold.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 3
    AND prompt = 'What does the chapter suggest about justice?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  3,
  'What does Haman’s fear reveal?',
  '["Strength","Awareness of coming defeat","Wisdom","Confidence"]'::jsonb,
  'Awareness of coming defeat',
  'He realizes danger.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 3
    AND prompt = 'What does Haman’s fear reveal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  3,
  'What theme is emphasized?',
  '["War","Reversal of fortunes","Wealth","Law"]'::jsonb,
  'Reversal of fortunes',
  'Positions are reversed.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 3
    AND prompt = 'What theme is emphasized?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  4,
  'How does Esther 6 develop the theme of providence?',
  '["Ends story","Shows God orchestrating events indirectly","Ignores plot","Focuses on war"]'::jsonb,
  'Shows God orchestrating events indirectly',
  'The events align perfectly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 4
    AND prompt = 'How does Esther 6 develop the theme of providence?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  4,
  'What leadership flaw is shown by the king earlier?',
  '["Wisdom","Neglecting to reward Mordecai","Courage","Patience"]'::jsonb,
  'Neglecting to reward Mordecai',
  'The king had overlooked him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 4
    AND prompt = 'What leadership flaw is shown by the king earlier?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  4,
  'Why is Haman’s downfall significant?',
  '["Minor","Reveals justice and reversal","Ends story","Confuses"]'::jsonb,
  'Reveals justice and reversal',
  'Justice begins to unfold.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 4
    AND prompt = 'Why is Haman’s downfall significant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  4,
  'How does the chapter portray pride?',
  '["Positive","Leads to humiliation","Neutral","Hidden"]'::jsonb,
  'Leads to humiliation',
  'Haman’s pride is exposed.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 4
    AND prompt = 'How does the chapter portray pride?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  4,
  'What role does memory play?',
  '["None","Brings forgotten justice to light","Minor","Hidden"]'::jsonb,
  'Brings forgotten justice to light',
  'The records remind the king.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 4
    AND prompt = 'What role does memory play?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  4,
  'How does Esther 6 connect to earlier chapters?',
  '["Ends story","Reverses Haman’s plan from chapter 5","Ignores plot","Focuses on law"]'::jsonb,
  'Reverses Haman’s plan from chapter 5',
  'Mordecai is honored instead of executed.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 4
    AND prompt = 'How does Esther 6 connect to earlier chapters?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  4,
  'What larger theme is reinforced?',
  '["Reversal and justice","Wealth","Power","Law"]'::jsonb,
  'Reversal and justice',
  'Events turn in favor of the righteous.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 4
    AND prompt = 'What larger theme is reinforced?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  4,
  'Why is humility important?',
  '["To gain power","To avoid downfall","To impress","To compete"]'::jsonb,
  'To avoid downfall',
  'Haman’s pride leads to failure.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 4
    AND prompt = 'Why is humility important?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  4,
  'What does Esther 6 teach about timing?',
  '["Irrelevant","Essential in God’s plan","Minor","Hidden"]'::jsonb,
  'Essential in God’s plan',
  'Events happen at the right time.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 4
    AND prompt = 'What does Esther 6 teach about timing?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  4,
  'How does Esther 6 portray tension?',
  '["Low","Turning point in the story","None","Hidden"]'::jsonb,
  'Turning point in the story',
  'The situation begins to change.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 4
    AND prompt = 'How does Esther 6 portray tension?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  5,
  'What theological theme is central to Esther 6?',
  '["Divine providence and reversal","Wealth","Power","War"]'::jsonb,
  'Divine providence and reversal',
  'God reverses the situation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 5
    AND prompt = 'What theological theme is central to Esther 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  5,
  'How does Esther 6 portray justice?',
  '["Absent","Emerging through reversal","Immediate","Hidden"]'::jsonb,
  'Emerging through reversal',
  'Justice begins to appear.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 6 portray justice?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  5,
  'What does the chapter teach about pride?',
  '["Helpful","Leads to downfall","Neutral","Hidden"]'::jsonb,
  'Leads to downfall',
  'Haman’s pride results in humiliation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 5
    AND prompt = 'What does the chapter teach about pride?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  5,
  'How does Esther 6 contribute to the book’s message?',
  '["Ends story","Marks the turning point toward deliverance","Ignores plot","Focuses on law"]'::jsonb,
  'Marks the turning point toward deliverance',
  'Events begin to reverse.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 6 contribute to the book’s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  5,
  'Why is Mordecai’s honor significant?',
  '["Minor","Shows God’s reward for faithfulness","Ends story","Confuses"]'::jsonb,
  'Shows God’s reward for faithfulness',
  'His faithfulness is recognized.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 5
    AND prompt = 'Why is Mordecai’s honor significant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  5,
  'What does Esther 6 teach about God’s control?',
  '["None","God directs events behind the scenes","Minor","Hidden"]'::jsonb,
  'God directs events behind the scenes',
  'Providence is evident.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 5
    AND prompt = 'What does Esther 6 teach about God’s control?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  5,
  'In the flow of Esther, what is the main role of chapter 6?',
  '["Turning point with reversal","Ending story","Victory","Law"]'::jsonb,
  'Turning point with reversal',
  'The story shifts direction.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 5
    AND prompt = 'In the flow of Esther, what is the main role of chapter 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  5,
  'How does Esther 6 frame success?',
  '["Wealth","Faithfulness rewarded in due time","Power","Victory"]'::jsonb,
  'Faithfulness rewarded in due time',
  'Mordecai is honored.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 6 frame success?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  5,
  'What larger message does Esther 6 leave?',
  '["God can reverse situations suddenly","Wealth matters most","Power is key","Work is enough"]'::jsonb,
  'God can reverse situations suddenly',
  'Events change quickly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 5
    AND prompt = 'What larger message does Esther 6 leave?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  6,
  5,
  'How does Esther 6 frame responsibility?',
  '["Optional","Remain faithful and trust timing","Individual only","Political"]'::jsonb,
  'Remain faithful and trust timing',
  'Mordecai remains steady.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 6
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 6 frame responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  1,
  'According to Esther 7, who attended the second banquet with Esther?',
  '["Only the king","Only Haman","The king and Haman","All officials"]'::jsonb,
  'The king and Haman',
  'Both the king and Haman attended Esther’s second banquet (Esther 7:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 1
    AND prompt = 'According to Esther 7, who attended the second banquet with Esther?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  1,
  'What did the king ask Esther again at the banquet?',
  '["To leave","What her petition was","To fast","To rule"]'::jsonb,
  'What her petition was',
  'The king again offered to grant her request (Esther 7:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 1
    AND prompt = 'What did the king ask Esther again at the banquet?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  1,
  'What did Esther request from the king?',
  '["Wealth","Her life and the lives of her people","A new palace","A feast"]'::jsonb,
  'Her life and the lives of her people',
  'Esther asked for her life and her people’s lives (Esther 7:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 1
    AND prompt = 'What did Esther request from the king?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  1,
  'What danger did Esther reveal?',
  '["War","Her people were to be destroyed","Famine","Exile"]'::jsonb,
  'Her people were to be destroyed',
  'She revealed the decree to destroy the Jews (Esther 7:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 1
    AND prompt = 'What danger did Esther reveal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  1,
  'Who did Esther identify as the enemy?',
  '["Mordecai","Haman","The king","The priests"]'::jsonb,
  'Haman',
  'She identified Haman as the adversary (Esther 7:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 1
    AND prompt = 'Who did Esther identify as the enemy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  1,
  'How did Haman react when he was exposed?',
  '["He laughed","He was terrified","He fled","He argued"]'::jsonb,
  'He was terrified',
  'Haman was filled with fear before the king and queen (Esther 7:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 1
    AND prompt = 'How did Haman react when he was exposed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  1,
  'Where did the king go after hearing Esther’s accusation?',
  '["His room","The garden","The temple","The gate"]'::jsonb,
  'The garden',
  'The king went out into the palace garden (Esther 7:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 1
    AND prompt = 'Where did the king go after hearing Esther’s accusation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  1,
  'What did Haman do while the king was gone?',
  '["Left","Begged Esther for his life","Slept","Ate"]'::jsonb,
  'Begged Esther for his life',
  'Haman pleaded with Esther (Esther 7:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 1
    AND prompt = 'What did Haman do while the king was gone?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  1,
  'What did the king think when he saw Haman near Esther?',
  '["He was helping","He was assaulting the queen","He was praying","He was leaving"]'::jsonb,
  'He was assaulting the queen',
  'The king thought Haman was attacking Esther (Esther 7:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 1
    AND prompt = 'What did the king think when he saw Haman near Esther?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  1,
  'What happened to Haman?',
  '["He was exiled","He was hanged on the gallows","He escaped","He was forgiven"]'::jsonb,
  'He was hanged on the gallows',
  'Haman was executed on the gallows he built (Esther 7:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 1
    AND prompt = 'What happened to Haman?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  2,
  'What phrase did Esther use to describe the situation?',
  '["We are in danger","We have been sold to be destroyed","We are poor","We are lost"]'::jsonb,
  'We have been sold to be destroyed',
  'Esther said they were sold to destruction (Esther 7:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 2
    AND prompt = 'What phrase did Esther use to describe the situation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  2,
  'How did the king react to Esther’s revelation?',
  '["He ignored it","He became angry","He laughed","He left immediately"]'::jsonb,
  'He became angry',
  'The king was filled with wrath (Esther 7:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 2
    AND prompt = 'How did the king react to Esther’s revelation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  2,
  'What question did the king ask when Esther revealed the plot?',
  '["Where is he?","Who is he, and where is he?","Why now?","What happened?"]'::jsonb,
  'Who is he, and where is he?',
  'The king demanded to know the culprit (Esther 7:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 2
    AND prompt = 'What question did the king ask when Esther revealed the plot?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  2,
  'Who suggested Haman be hanged on the gallows?',
  '["The king","Esther","Harbona","Mordecai"]'::jsonb,
  'Harbona',
  'Harbona mentioned the gallows (Esther 7:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 2
    AND prompt = 'Who suggested Haman be hanged on the gallows?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  2,
  'What was the gallows originally built for?',
  '["The king","Esther","Mordecai","Haman"]'::jsonb,
  'Mordecai',
  'Haman built it for Mordecai (Esther 7:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 2
    AND prompt = 'What was the gallows originally built for?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  2,
  'Where was the gallows located?',
  '["In the palace","At Haman’s house","In the city square","In the garden"]'::jsonb,
  'At Haman’s house',
  'It stood at Haman’s house (Esther 7:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 2
    AND prompt = 'Where was the gallows located?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  2,
  'What happened to the king’s anger after Haman’s execution?',
  '["Increased","Subsided","Stayed the same","Turned to joy"]'::jsonb,
  'Subsided',
  'The king’s anger subsided (Esther 7:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 2
    AND prompt = 'What happened to the king’s anger after Haman’s execution?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  2,
  'What does Haman’s pleading show?',
  '["Confidence","Fear and desperation","Pride","Wisdom"]'::jsonb,
  'Fear and desperation',
  'Haman was terrified.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 2
    AND prompt = 'What does Haman’s pleading show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  2,
  'What role does Esther play in this chapter?',
  '["Silent","Advocate for her people","Observer","Servant"]'::jsonb,
  'Advocate for her people',
  'She reveals the plot and pleads for her people.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 2
    AND prompt = 'What role does Esther play in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  2,
  'What is the outcome of Esther’s request?',
  '["Nothing","Haman is judged","War begins","Peace treaty"]'::jsonb,
  'Haman is judged',
  'Her request leads to Haman’s downfall.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 2
    AND prompt = 'What is the outcome of Esther’s request?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  3,
  'Why is Esther’s revelation significant?',
  '["Minor","It exposes the enemy and saves her people","Confusing","Hidden"]'::jsonb,
  'It exposes the enemy and saves her people',
  'She reveals the truth.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 3
    AND prompt = 'Why is Esther’s revelation significant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  3,
  'What does Haman’s fear reveal about him?',
  '["Strength","Awareness of guilt","Wisdom","Confidence"]'::jsonb,
  'Awareness of guilt',
  'He knows he is in danger.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 3
    AND prompt = 'What does Haman’s fear reveal about him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  3,
  'What is ironic about Haman’s death?',
  '["He escapes","He dies on the gallows he built","He wins","He hides"]'::jsonb,
  'He dies on the gallows he built',
  'The punishment matches his plan.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 3
    AND prompt = 'What is ironic about Haman’s death?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  3,
  'What does the king’s reaction show?',
  '["Patience","Strong emotion and justice","Fear","Weakness"]'::jsonb,
  'Strong emotion and justice',
  'He reacts decisively.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 3
    AND prompt = 'What does the king’s reaction show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  3,
  'What theme is emphasized?',
  '["Wealth","Justice and reversal","War","Law"]'::jsonb,
  'Justice and reversal',
  'Haman’s fate is reversed.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 3
    AND prompt = 'What theme is emphasized?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  3,
  'Why is timing important in Esther’s speech?',
  '["Irrelevant","It ensures the king listens","Minor","Hidden"]'::jsonb,
  'It ensures the king listens',
  'She speaks at the right moment.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 3
    AND prompt = 'Why is timing important in Esther’s speech?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  3,
  'What does Esther’s courage show?',
  '["Fear","Faith and bravery","Weakness","Confusion"]'::jsonb,
  'Faith and bravery',
  'She risks speaking.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 3
    AND prompt = 'What does Esther’s courage show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  3,
  'What role does justice play?',
  '["Absent","Immediate and decisive","Delayed","Hidden"]'::jsonb,
  'Immediate and decisive',
  'Haman is punished quickly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 3
    AND prompt = 'What role does justice play?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  3,
  'What does the chapter suggest about evil?',
  '["Weak","Ultimately defeated","Hidden","Temporary"]'::jsonb,
  'Ultimately defeated',
  'Haman’s plan fails.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 3
    AND prompt = 'What does the chapter suggest about evil?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  3,
  'What contrast is present?',
  '["War and peace","Esther’s courage vs. Haman’s fear","Wealth and poverty","Power and law"]'::jsonb,
  'Esther’s courage vs. Haman’s fear',
  'Their responses differ.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 3
    AND prompt = 'What contrast is present?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  4,
  'How does Esther 7 develop the theme of deliverance?',
  '["Ends story","Brings immediate judgment on the enemy","Ignores plot","Focuses on law"]'::jsonb,
  'Brings immediate judgment on the enemy',
  'Haman is punished.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 4
    AND prompt = 'How does Esther 7 develop the theme of deliverance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  4,
  'What leadership qualities are shown by Esther?',
  '["Fear","Courage and boldness","Wealth","Power"]'::jsonb,
  'Courage and boldness',
  'She speaks truth to power.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 4
    AND prompt = 'What leadership qualities are shown by Esther?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  4,
  'Why is Haman’s downfall significant?',
  '["Minor","It fulfills justice and reverses his plan","Ends story","Confuses"]'::jsonb,
  'It fulfills justice and reverses his plan',
  'His plan backfires.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 4
    AND prompt = 'Why is Haman’s downfall significant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  4,
  'How does the chapter portray justice?',
  '["Absent","Swift and fitting","Delayed","Hidden"]'::jsonb,
  'Swift and fitting',
  'Haman’s punishment matches his intent.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 4
    AND prompt = 'How does the chapter portray justice?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  4,
  'What role does truth play?',
  '["None","Exposes evil","Minor","Hidden"]'::jsonb,
  'Exposes evil',
  'Esther reveals the truth.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 4
    AND prompt = 'What role does truth play?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  4,
  'How does Esther 7 connect to earlier chapters?',
  '["Ends story","Resolves the conflict introduced in chapter 3","Ignores plot","Focuses on law"]'::jsonb,
  'Resolves the conflict introduced in chapter 3',
  'The enemy is defeated.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 4
    AND prompt = 'How does Esther 7 connect to earlier chapters?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  4,
  'What larger theme is reinforced?',
  '["Justice and reversal","Wealth","Power","Law"]'::jsonb,
  'Justice and reversal',
  'God’s justice is seen.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 4
    AND prompt = 'What larger theme is reinforced?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  4,
  'Why is courage important?',
  '["To gain power","To stand for truth","To impress","To compete"]'::jsonb,
  'To stand for truth',
  'Esther risks her life.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 4
    AND prompt = 'Why is courage important?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  4,
  'What does Esther 7 teach about influence?',
  '["None","Can bring justice","Minor","Hidden"]'::jsonb,
  'Can bring justice',
  'Esther influences the king.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 4
    AND prompt = 'What does Esther 7 teach about influence?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  4,
  'How does Esther 7 portray resolution?',
  '["Incomplete","Major turning point","None","Hidden"]'::jsonb,
  'Major turning point',
  'The main enemy is removed.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 4
    AND prompt = 'How does Esther 7 portray resolution?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  5,
  'What theological theme is central to Esther 7?',
  '["Justice and divine reversal","Wealth","Power","War"]'::jsonb,
  'Justice and divine reversal',
  'God brings justice through events.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 5
    AND prompt = 'What theological theme is central to Esther 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  5,
  'How does Esther 7 portray evil?',
  '["Strong","Defeated and exposed","Hidden","Temporary"]'::jsonb,
  'Defeated and exposed',
  'Haman’s evil is revealed.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 7 portray evil?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  5,
  'What does the chapter teach about courage?',
  '["Optional","Essential for justice","Temporary","Hidden"]'::jsonb,
  'Essential for justice',
  'Esther’s courage leads to deliverance.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 5
    AND prompt = 'What does the chapter teach about courage?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  5,
  'How does Esther 7 contribute to the book’s message?',
  '["Ends story","Brings the downfall of the enemy","Ignores plot","Focuses on law"]'::jsonb,
  'Brings the downfall of the enemy',
  'Haman is defeated.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 7 contribute to the book’s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  5,
  'Why is Haman’s death significant?',
  '["Minor","It completes the reversal of his plan","Ends story","Confuses"]'::jsonb,
  'It completes the reversal of his plan',
  'He suffers his intended punishment.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 5
    AND prompt = 'Why is Haman’s death significant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  5,
  'What does Esther 7 teach about justice?',
  '["Absent","Eventually prevails","Delayed","Hidden"]'::jsonb,
  'Eventually prevails',
  'Justice is fulfilled.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 5
    AND prompt = 'What does Esther 7 teach about justice?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  5,
  'In the flow of Esther, what is the main role of chapter 7?',
  '["Defeat of Haman","Ending story","Victory","Law"]'::jsonb,
  'Defeat of Haman',
  'The main enemy is removed.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 5
    AND prompt = 'In the flow of Esther, what is the main role of chapter 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  5,
  'How does Esther 7 frame success?',
  '["Wealth","Justice and deliverance","Power","Victory"]'::jsonb,
  'Justice and deliverance',
  'Evil is punished.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 7 frame success?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  5,
  'What larger message does Esther 7 leave?',
  '["Evil plans can be reversed","Wealth matters most","Power is key","Work is enough"]'::jsonb,
  'Evil plans can be reversed',
  'God overturns evil.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 5
    AND prompt = 'What larger message does Esther 7 leave?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  7,
  5,
  'How does Esther 7 frame responsibility?',
  '["Optional","Speak truth and act courageously","Individual only","Political"]'::jsonb,
  'Speak truth and act courageously',
  'Esther acts boldly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 7
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 7 frame responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  1,
  'According to Esther 8, what did the king give Esther?',
  '["A crown","The house of Haman","Gold","A province"]'::jsonb,
  'The house of Haman',
  'The king gave Esther the house of Haman (Esther 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 1
    AND prompt = 'According to Esther 8, what did the king give Esther?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  1,
  'Who was set over the house of Haman?',
  '["Haman’s family","Mordecai","The king","Esther"]'::jsonb,
  'Mordecai',
  'Esther set Mordecai over Haman’s house (Esther 8:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 1
    AND prompt = 'Who was set over the house of Haman?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  1,
  'What did the king give Mordecai?',
  '["A sword","His signet ring","A robe","A crown"]'::jsonb,
  'His signet ring',
  'The king gave Mordecai the ring previously given to Haman (Esther 8:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 1
    AND prompt = 'What did the king give Mordecai?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  1,
  'What did Esther do before the king regarding her people?',
  '["Ignored the issue","Pleaded with tears to stop the evil plan","Left","Fasted"]'::jsonb,
  'Pleaded with tears to stop the evil plan',
  'Esther pleaded for her people (Esther 8:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 1
    AND prompt = 'What did Esther do before the king regarding her people?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  1,
  'What did the king extend to Esther again?',
  '["His crown","The golden scepter","His robe","A letter"]'::jsonb,
  'The golden scepter',
  'The king extended the scepter to Esther (Esther 8:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 1
    AND prompt = 'What did the king extend to Esther again?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  1,
  'Why couldn’t the original decree be revoked?',
  '["It was lost","It was written in the king’s name and sealed","It was forgotten","It was unimportant"]'::jsonb,
  'It was written in the king’s name and sealed',
  'Persian law could not be revoked (Esther 8:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 1
    AND prompt = 'Why couldn’t the original decree be revoked?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  1,
  'What solution did the king allow?',
  '["Ignore the decree","Write another decree in favor of the Jews","Go to war","Leave"]'::jsonb,
  'Write another decree in favor of the Jews',
  'A new decree could be issued (Esther 8:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 1
    AND prompt = 'What solution did the king allow?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  1,
  'What did the new decree allow the Jews to do?',
  '["Leave the land","Defend themselves","Hide","Pay taxes"]'::jsonb,
  'Defend themselves',
  'They could defend their lives (Esther 8:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 1
    AND prompt = 'What did the new decree allow the Jews to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  1,
  'How was the new decree sent out?',
  '["Slowly","Quickly by couriers","Privately","By word"]'::jsonb,
  'Quickly by couriers',
  'Couriers rode out swiftly (Esther 8:10,14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 1
    AND prompt = 'How was the new decree sent out?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  1,
  'How did Mordecai appear after leaving the king?',
  '["Sad","In royal robes with great honor","Angry","Afraid"]'::jsonb,
  'In royal robes with great honor',
  'Mordecai wore royal garments (Esther 8:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 1
    AND prompt = 'How did Mordecai appear after leaving the king?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  2,
  'What colors were Mordecai’s royal robes?',
  '["Red and gold","Blue and white","Black and silver","Green and purple"]'::jsonb,
  'Blue and white',
  'Mordecai wore blue and white robes (Esther 8:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 2
    AND prompt = 'What colors were Mordecai’s royal robes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  2,
  'What additional items did Mordecai wear?',
  '["A sword","A great golden crown and fine linen","A helmet","Armor"]'::jsonb,
  'A great golden crown and fine linen',
  'He wore royal garments (Esther 8:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 2
    AND prompt = 'What additional items did Mordecai wear?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  2,
  'How did the city of Susa react?',
  '["Confusion","Joy and gladness","Fear","Silence"]'::jsonb,
  'Joy and gladness',
  'The city rejoiced (Esther 8:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 2
    AND prompt = 'How did the city of Susa react?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  2,
  'What did the Jews experience?',
  '["Fear","Light, joy, gladness, and honor","Confusion","Anger"]'::jsonb,
  'Light, joy, gladness, and honor',
  'They experienced great joy (Esther 8:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 2
    AND prompt = 'What did the Jews experience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  2,
  'What happened in many provinces after the decree?',
  '["War","Many became Jews","Famine","Silence"]'::jsonb,
  'Many became Jews',
  'People declared themselves Jews (Esther 8:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 2
    AND prompt = 'What happened in many provinces after the decree?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  2,
  'Why did many people become Jews?',
  '["Wealth","Fear of the Jews","Tradition","Law"]'::jsonb,
  'Fear of the Jews',
  'They feared the Jews (Esther 8:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 2
    AND prompt = 'Why did many people become Jews?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  2,
  'What day was set for the Jews to defend themselves?',
  '["First day","Twelfth month, thirteenth day","Seventh day","Third month"]'::jsonb,
  'Twelfth month, thirteenth day',
  'The same day as the original decree (Esther 8:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 2
    AND prompt = 'What day was set for the Jews to defend themselves?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  2,
  'Who wrote the new decree?',
  '["The king","Mordecai and the scribes","Esther","Haman"]'::jsonb,
  'Mordecai and the scribes',
  'Mordecai directed the writing (Esther 8:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 2
    AND prompt = 'Who wrote the new decree?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  2,
  'In how many languages was the decree written?',
  '["One","Many, according to each people","Two","Three"]'::jsonb,
  'Many, according to each people',
  'It was written in every language (Esther 8:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 2
    AND prompt = 'In how many languages was the decree written?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  2,
  'What does the new decree counteract?',
  '["A war","The original decree of destruction","A famine","A feast"]'::jsonb,
  'The original decree of destruction',
  'It provides a way for the Jews to survive.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 2
    AND prompt = 'What does the new decree counteract?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  3,
  'Why is Esther’s plea significant?',
  '["Minor","She intercedes for her people","Confusing","Hidden"]'::jsonb,
  'She intercedes for her people',
  'She advocates for the Jews.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 3
    AND prompt = 'Why is Esther’s plea significant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  3,
  'What does the king’s response show?',
  '["Weakness","Willingness to help within limits","Fear","Confusion"]'::jsonb,
  'Willingness to help within limits',
  'He allows a new decree.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 3
    AND prompt = 'What does the king’s response show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  3,
  'Why can’t the original decree be undone?',
  '["Forgotten","Law is unchangeable","Hidden","Minor"]'::jsonb,
  'Law is unchangeable',
  'Persian law cannot be revoked.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 3
    AND prompt = 'Why can’t the original decree be undone?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  3,
  'What does the new decree accomplish?',
  '["Nothing","Provides a way for defense and survival","War","Confusion"]'::jsonb,
  'Provides a way for defense and survival',
  'The Jews can defend themselves.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 3
    AND prompt = 'What does the new decree accomplish?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  3,
  'What does Mordecai’s promotion show?',
  '["Luck","Reversal of fortune","Fear","Weakness"]'::jsonb,
  'Reversal of fortune',
  'He rises in place of Haman.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 3
    AND prompt = 'What does Mordecai’s promotion show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  3,
  'What role does joy play?',
  '["None","Sign of deliverance","Minor","Hidden"]'::jsonb,
  'Sign of deliverance',
  'Joy reflects hope.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 3
    AND prompt = 'What role does joy play?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  3,
  'Why do people become Jews?',
  '["Faith only","Fear and recognition of power","Wealth","Law"]'::jsonb,
  'Fear and recognition of power',
  'They fear the Jews’ rising influence.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 3
    AND prompt = 'Why do people become Jews?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  3,
  'What does the chapter suggest about justice?',
  '["Absent","Restoration and protection","Immediate punishment","Hidden"]'::jsonb,
  'Restoration and protection',
  'The Jews are protected.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 3
    AND prompt = 'What does the chapter suggest about justice?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  3,
  'What theme continues here?',
  '["War","Reversal and deliverance","Wealth","Law"]'::jsonb,
  'Reversal and deliverance',
  'Fortunes are reversed.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 3
    AND prompt = 'What theme continues here?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  3,
  'What does Mordecai’s new role symbolize?',
  '["Failure","Victory and honor","Fear","Confusion"]'::jsonb,
  'Victory and honor',
  'He is elevated.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 3
    AND prompt = 'What does Mordecai’s new role symbolize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  4,
  'How does Esther 8 develop the theme of deliverance?',
  '["Ends story","Provides a solution for survival","Ignores plot","Focuses on law"]'::jsonb,
  'Provides a solution for survival',
  'The Jews can defend themselves.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 4
    AND prompt = 'How does Esther 8 develop the theme of deliverance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  4,
  'What leadership qualities are shown by Esther?',
  '["Fear","Persistence and compassion","Wealth","Power"]'::jsonb,
  'Persistence and compassion',
  'She continues to plead.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 4
    AND prompt = 'What leadership qualities are shown by Esther?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  4,
  'Why is Mordecai’s rise significant?',
  '["Minor","Shows reversal and justice","Ends story","Confuses"]'::jsonb,
  'Shows reversal and justice',
  'He replaces Haman.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 4
    AND prompt = 'Why is Mordecai’s rise significant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  4,
  'How does the chapter portray law?',
  '["Flexible","Rigid but workable through new decrees","Weak","Hidden"]'::jsonb,
  'Rigid but workable through new decrees',
  'The law cannot be revoked but can be countered.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 4
    AND prompt = 'How does the chapter portray law?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  4,
  'What role does influence play?',
  '["None","Used for protection and justice","Minor","Hidden"]'::jsonb,
  'Used for protection and justice',
  'Esther and Mordecai use their influence.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 4
    AND prompt = 'What role does influence play?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  4,
  'How does Esther 8 connect to earlier chapters?',
  '["Ends story","Responds to the crisis from chapter 3","Ignores plot","Focuses on law"]'::jsonb,
  'Responds to the crisis from chapter 3',
  'It addresses the decree.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 4
    AND prompt = 'How does Esther 8 connect to earlier chapters?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  4,
  'What larger theme is reinforced?',
  '["Deliverance and reversal","Wealth","Power","Law"]'::jsonb,
  'Deliverance and reversal',
  'God’s people are protected.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 4
    AND prompt = 'What larger theme is reinforced?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  4,
  'Why is joy important?',
  '["To gain power","To reflect hope and salvation","To impress","To compete"]'::jsonb,
  'To reflect hope and salvation',
  'Joy follows deliverance.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 4
    AND prompt = 'Why is joy important?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  4,
  'What does Esther 8 teach about persistence?',
  '["Optional","Important in achieving justice","Hidden","Temporary"]'::jsonb,
  'Important in achieving justice',
  'Esther continues her efforts.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 4
    AND prompt = 'What does Esther 8 teach about persistence?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  4,
  'How does Esther 8 portray resolution?',
  '["Complete","Partial but hopeful","None","Hidden"]'::jsonb,
  'Partial but hopeful',
  'The threat remains but is countered.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 4
    AND prompt = 'How does Esther 8 portray resolution?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  5,
  'What theological theme is central to Esther 8?',
  '["Deliverance through providence","Wealth","Power","War"]'::jsonb,
  'Deliverance through providence',
  'God provides a way for salvation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 5
    AND prompt = 'What theological theme is central to Esther 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  5,
  'How does Esther 8 portray justice?',
  '["Absent","Restorative and protective","Immediate punishment","Hidden"]'::jsonb,
  'Restorative and protective',
  'The Jews are given protection.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 8 portray justice?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  5,
  'What does the chapter teach about leadership?',
  '["Passive","Active in protecting others","Hidden","Temporary"]'::jsonb,
  'Active in protecting others',
  'Esther and Mordecai act decisively.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 5
    AND prompt = 'What does the chapter teach about leadership?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  5,
  'How does Esther 8 contribute to the book’s message?',
  '["Ends story","Advances deliverance for the Jews","Ignores plot","Focuses on law"]'::jsonb,
  'Advances deliverance for the Jews',
  'The Jews are given a way to survive.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 8 contribute to the book’s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  5,
  'Why is Mordecai’s authority important?',
  '["Minor","Enables protection of the Jews","Ends story","Confuses"]'::jsonb,
  'Enables protection of the Jews',
  'He issues the new decree.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 5
    AND prompt = 'Why is Mordecai’s authority important?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  5,
  'What does Esther 8 teach about influence?',
  '["None","Can be used for good","Minor","Hidden"]'::jsonb,
  'Can be used for good',
  'Esther and Mordecai use influence wisely.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 5
    AND prompt = 'What does Esther 8 teach about influence?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  5,
  'In the flow of Esther, what is the main role of chapter 8?',
  '["Provision for Jewish survival","Ending story","Victory","Law"]'::jsonb,
  'Provision for Jewish survival',
  'A new decree is issued.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 5
    AND prompt = 'In the flow of Esther, what is the main role of chapter 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  5,
  'How does Esther 8 frame success?',
  '["Wealth","Protection and hope","Power","Victory"]'::jsonb,
  'Protection and hope',
  'The Jews are given hope.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 8 frame success?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  5,
  'What larger message does Esther 8 leave?',
  '["God provides a way of escape","Wealth matters most","Power is key","Work is enough"]'::jsonb,
  'God provides a way of escape',
  'Deliverance is possible.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 5
    AND prompt = 'What larger message does Esther 8 leave?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  8,
  5,
  'How does Esther 8 frame responsibility?',
  '["Optional","Use position to protect others","Individual only","Political"]'::jsonb,
  'Use position to protect others',
  'Esther and Mordecai act responsibly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 8
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 8 frame responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  1,
  'According to Esther 9, on what day did the Jews defend themselves?',
  '["First month","Twelfth month, thirteenth day","Seventh day","Third month"]'::jsonb,
  'Twelfth month, thirteenth day',
  'The Jews defended themselves on the thirteenth day of Adar (Esther 9:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 1
    AND prompt = 'According to Esther 9, on what day did the Jews defend themselves?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  1,
  'What happened to those who sought to harm the Jews?',
  '["They escaped","They were defeated","They ruled","They hid"]'::jsonb,
  'They were defeated',
  'The Jews gained mastery over their enemies (Esther 9:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 1
    AND prompt = 'What happened to those who sought to harm the Jews?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  1,
  'Who helped the Jews because of fear of Mordecai?',
  '["Only priests","Officials and governors","Only soldiers","No one"]'::jsonb,
  'Officials and governors',
  'Leaders helped the Jews (Esther 9:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 1
    AND prompt = 'Who helped the Jews because of fear of Mordecai?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  1,
  'Why did people fear Mordecai?',
  '["His wealth","His power and position","His army","His family"]'::jsonb,
  'His power and position',
  'Mordecai’s influence grew (Esther 9:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 1
    AND prompt = 'Why did people fear Mordecai?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  1,
  'How many of Haman’s sons were killed?',
  '["5","10","20","50"]'::jsonb,
  '10',
  'Haman’s ten sons were killed (Esther 9:7-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 1
    AND prompt = 'How many of Haman’s sons were killed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  1,
  'What did the Jews refuse to do with their enemies’ plunder?',
  '["Burn it","Take it","Sell it","Hide it"]'::jsonb,
  'Take it',
  'They did not lay hands on the plunder (Esther 9:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 1
    AND prompt = 'What did the Jews refuse to do with their enemies’ plunder?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  1,
  'What did the king ask Esther after hearing the events?',
  '["What happened?","What is your further request?","Who did it?","Why now?"]'::jsonb,
  'What is your further request?',
  'The king asked if she had another request (Esther 9:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 1
    AND prompt = 'What did the king ask Esther after hearing the events?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  1,
  'What additional request did Esther make?',
  '["More gold","Another day to defend themselves","Peace treaty","A feast"]'::jsonb,
  'Another day to defend themselves',
  'She asked for another day (Esther 9:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 1
    AND prompt = 'What additional request did Esther make?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  1,
  'What feast was established as a result of these events?',
  '["Passover","Purim","Pentecost","Tabernacles"]'::jsonb,
  'Purim',
  'The feast of Purim was established (Esther 9:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 1
    AND prompt = 'What feast was established as a result of these events?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  1,
  'What does the name ''Purim'' come from?',
  '["A feast","Casting lots (Pur)","A king","A city"]'::jsonb,
  'Casting lots (Pur)',
  'Pur refers to the lot cast by Haman (Esther 9:24-26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 1
    AND prompt = 'What does the name ''Purim'' come from?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  2,
  'What happened in the city of Susa on the second day?',
  '["Peace","More enemies were defeated","A feast","Silence"]'::jsonb,
  'More enemies were defeated',
  'The Jews defended themselves again (Esther 9:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 2
    AND prompt = 'What happened in the city of Susa on the second day?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  2,
  'How many enemies were killed in Susa?',
  '["100","300","500","1000"]'::jsonb,
  '500',
  '500 men were killed in Susa (Esther 9:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 2
    AND prompt = 'How many enemies were killed in Susa?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  2,
  'How many enemies were killed in the provinces?',
  '["25,000","50,000","75,000","100,000"]'::jsonb,
  '75,000',
  '75,000 enemies were killed (Esther 9:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 2
    AND prompt = 'How many enemies were killed in the provinces?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  2,
  'What did the Jews do after their victory?',
  '["Went to war","Rested and celebrated","Left the land","Fasted"]'::jsonb,
  'Rested and celebrated',
  'They rested and made it a day of feasting (Esther 9:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 2
    AND prompt = 'What did the Jews do after their victory?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  2,
  'What did Mordecai send letters to establish?',
  '["A law","The celebration of Purim","A war","A tax"]'::jsonb,
  'The celebration of Purim',
  'Mordecai established the festival (Esther 9:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 2
    AND prompt = 'What did Mordecai send letters to establish?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  2,
  'What were the Jews instructed to do during Purim?',
  '["Fast","Feast, rejoice, and send gifts","Fight","Pray only"]'::jsonb,
  'Feast, rejoice, and send gifts',
  'They celebrated with joy and giving (Esther 9:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 2
    AND prompt = 'What were the Jews instructed to do during Purim?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  2,
  'Who confirmed the practices of Purim?',
  '["The king","Esther and Mordecai","Priests","People"]'::jsonb,
  'Esther and Mordecai',
  'They confirmed the observance (Esther 9:29-32).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 2
    AND prompt = 'Who confirmed the practices of Purim?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  2,
  'What else were they to give during Purim?',
  '["Gold","Gifts to the poor","Animals","Land"]'::jsonb,
  'Gifts to the poor',
  'They gave gifts to the needy (Esther 9:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 2
    AND prompt = 'What else were they to give during Purim?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  2,
  'What does the celebration commemorate?',
  '["War","Deliverance from enemies","Wealth","Law"]'::jsonb,
  'Deliverance from enemies',
  'It remembers their deliverance.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 2
    AND prompt = 'What does the celebration commemorate?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  2,
  'What role did fasting and mourning play before Purim?',
  '["None","Preceded the celebration","Ended the story","Replaced the feast"]'::jsonb,
  'Preceded the celebration',
  'Fasting turned into joy.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 2
    AND prompt = 'What role did fasting and mourning play before Purim?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  3,
  'Why is the Jews’ victory significant?',
  '["Wealth","Deliverance from destruction","Confusion","Fear"]'::jsonb,
  'Deliverance from destruction',
  'They were saved.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 3
    AND prompt = 'Why is the Jews’ victory significant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  3,
  'Why did the Jews not take plunder?',
  '["Fear","To show restraint and justice","Weakness","Confusion"]'::jsonb,
  'To show restraint and justice',
  'They avoided greed.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 3
    AND prompt = 'Why did the Jews not take plunder?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  3,
  'What does Purim celebrate?',
  '["War","Reversal from sorrow to joy","Wealth","Law"]'::jsonb,
  'Reversal from sorrow to joy',
  'It celebrates deliverance.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 3
    AND prompt = 'What does Purim celebrate?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  3,
  'What does the fear of Mordecai show?',
  '["Weakness","His authority and influence","Fear","Confusion"]'::jsonb,
  'His authority and influence',
  'People respected his power.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 3
    AND prompt = 'What does the fear of Mordecai show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  3,
  'What does the second day in Susa show?',
  '["Confusion","Thoroughness of justice","Fear","Weakness"]'::jsonb,
  'Thoroughness of justice',
  'The enemies are fully defeated.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 3
    AND prompt = 'What does the second day in Susa show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  3,
  'What does celebration after victory show?',
  '["Pride","Gratitude and relief","Fear","Confusion"]'::jsonb,
  'Gratitude and relief',
  'They rejoice after deliverance.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 3
    AND prompt = 'What does celebration after victory show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  3,
  'What role does memory play in Purim?',
  '["None","Remembering God’s deliverance","Minor","Hidden"]'::jsonb,
  'Remembering God’s deliverance',
  'It preserves the event.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 3
    AND prompt = 'What role does memory play in Purim?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  3,
  'Why are gifts to the poor included?',
  '["Wealth","Compassion and community","Fear","Law"]'::jsonb,
  'Compassion and community',
  'They share blessings.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 3
    AND prompt = 'Why are gifts to the poor included?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  3,
  'What theme is emphasized?',
  '["War","Reversal and celebration","Wealth","Law"]'::jsonb,
  'Reversal and celebration',
  'Sorrow turns to joy.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 3
    AND prompt = 'What theme is emphasized?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  3,
  'What does the chapter suggest about justice?',
  '["Absent","Carried out fully","Delayed","Hidden"]'::jsonb,
  'Carried out fully',
  'Enemies are defeated.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 3
    AND prompt = 'What does the chapter suggest about justice?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  4,
  'How does Esther 9 develop the theme of deliverance?',
  '["Ends story","Shows the fulfillment of deliverance","Ignores plot","Focuses on law"]'::jsonb,
  'Shows the fulfillment of deliverance',
  'The Jews are saved.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 4
    AND prompt = 'How does Esther 9 develop the theme of deliverance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  4,
  'What leadership qualities are shown by Mordecai?',
  '["Fear","Authority and organization","Wealth","Power"]'::jsonb,
  'Authority and organization',
  'He leads the celebration.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 4
    AND prompt = 'What leadership qualities are shown by Mordecai?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  4,
  'Why is Purim important?',
  '["Minor","Establishes lasting remembrance","Ends story","Confuses"]'::jsonb,
  'Establishes lasting remembrance',
  'It becomes a yearly celebration.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 4
    AND prompt = 'Why is Purim important?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  4,
  'How does the chapter portray justice?',
  '["Absent","Complete and decisive","Delayed","Hidden"]'::jsonb,
  'Complete and decisive',
  'Enemies are defeated.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 4
    AND prompt = 'How does the chapter portray justice?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  4,
  'What role does community play?',
  '["None","Celebrates together","Minor","Hidden"]'::jsonb,
  'Celebrates together',
  'The Jews rejoice as a group.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 4
    AND prompt = 'What role does community play?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  4,
  'How does Esther 9 connect to earlier chapters?',
  '["Ends story","Fulfills the deliverance planned earlier","Ignores plot","Focuses on law"]'::jsonb,
  'Fulfills the deliverance planned earlier',
  'The threat is overcome.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 4
    AND prompt = 'How does Esther 9 connect to earlier chapters?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  4,
  'What larger theme is reinforced?',
  '["Reversal and remembrance","Wealth","Power","Law"]'::jsonb,
  'Reversal and remembrance',
  'They remember deliverance.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 4
    AND prompt = 'What larger theme is reinforced?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  4,
  'Why is remembrance important?',
  '["To gain power","To honor God’s work","To impress","To compete"]'::jsonb,
  'To honor God’s work',
  'They remember what happened.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 4
    AND prompt = 'Why is remembrance important?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  4,
  'What does Esther 9 teach about celebration?',
  '["Optional","Important after deliverance","Hidden","Temporary"]'::jsonb,
  'Important after deliverance',
  'Celebration follows victory.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 4
    AND prompt = 'What does Esther 9 teach about celebration?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  4,
  'How does Esther 9 portray resolution?',
  '["Incomplete","Largely complete","None","Hidden"]'::jsonb,
  'Largely complete',
  'The conflict is resolved.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 4
    AND prompt = 'How does Esther 9 portray resolution?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  5,
  'What theological theme is central to Esther 9?',
  '["Deliverance and reversal","Wealth","Power","War"]'::jsonb,
  'Deliverance and reversal',
  'God delivers His people.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 5
    AND prompt = 'What theological theme is central to Esther 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  5,
  'How does Esther 9 portray justice?',
  '["Absent","Fulfilled through victory","Delayed","Hidden"]'::jsonb,
  'Fulfilled through victory',
  'The enemies are defeated.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 9 portray justice?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  5,
  'What does the chapter teach about remembrance?',
  '["Optional","Essential to preserve God’s work","Temporary","Hidden"]'::jsonb,
  'Essential to preserve God’s work',
  'Purim is established.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 5
    AND prompt = 'What does the chapter teach about remembrance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  5,
  'How does Esther 9 contribute to the book’s message?',
  '["Ends story","Shows the fulfillment of deliverance","Ignores plot","Focuses on law"]'::jsonb,
  'Shows the fulfillment of deliverance',
  'The Jews are saved.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 9 contribute to the book’s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  5,
  'Why is Purim significant?',
  '["Minor","It commemorates God’s deliverance","Ends story","Confuses"]'::jsonb,
  'It commemorates God’s deliverance',
  'It remembers their rescue.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 5
    AND prompt = 'Why is Purim significant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  5,
  'What does Esther 9 teach about community?',
  '["None","Celebrate and support one another","Minor","Hidden"]'::jsonb,
  'Celebrate and support one another',
  'They give gifts and rejoice.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 5
    AND prompt = 'What does Esther 9 teach about community?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  5,
  'In the flow of Esther, what is the main role of chapter 9?',
  '["Fulfillment of deliverance","Ending story","Victory","Law"]'::jsonb,
  'Fulfillment of deliverance',
  'The Jews are saved.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 5
    AND prompt = 'In the flow of Esther, what is the main role of chapter 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  5,
  'How does Esther 9 frame success?',
  '["Wealth","Deliverance and joy","Power","Victory"]'::jsonb,
  'Deliverance and joy',
  'The people rejoice.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 9 frame success?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  5,
  'What larger message does Esther 9 leave?',
  '["God turns sorrow into joy","Wealth matters most","Power is key","Work is enough"]'::jsonb,
  'God turns sorrow into joy',
  'Their mourning becomes celebration.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 5
    AND prompt = 'What larger message does Esther 9 leave?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  9,
  5,
  'How does Esther 9 frame responsibility?',
  '["Optional","Remember and celebrate God’s work","Individual only","Political"]'::jsonb,
  'Remember and celebrate God’s work',
  'They establish Purim.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 9
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 9 frame responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  1,
  'According to Esther 10, what did King Ahasuerus impose on the land?',
  '["A feast","A tribute","A war","A fast"]'::jsonb,
  'A tribute',
  'The king imposed tribute on the land and the coastlands (Esther 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 1
    AND prompt = 'According to Esther 10, what did King Ahasuerus impose on the land?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  1,
  'Where else did the king impose tribute?',
  '["Mountains","Coastlands of the sea","Deserts","Cities only"]'::jsonb,
  'Coastlands of the sea',
  'Tribute was also imposed on the coastlands (Esther 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 1
    AND prompt = 'Where else did the king impose tribute?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  1,
  'Where are the acts of King Ahasuerus recorded?',
  '["Temple scroll","Book of chronicles of the kings of Media and Persia","Law scroll","Prophecy"]'::jsonb,
  'Book of chronicles of the kings of Media and Persia',
  'They are recorded in the chronicles (Esther 10:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 1
    AND prompt = 'Where are the acts of King Ahasuerus recorded?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  1,
  'Who is described as second in rank to King Ahasuerus?',
  '["Haman","Mordecai","Esther","Ezra"]'::jsonb,
  'Mordecai',
  'Mordecai was second in rank (Esther 10:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 1
    AND prompt = 'Who is described as second in rank to King Ahasuerus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  1,
  'How is Mordecai described among the Jews?',
  '["Hated","Great and respected","Unknown","Feared"]'::jsonb,
  'Great and respected',
  'Mordecai was great among the Jews (Esther 10:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 1
    AND prompt = 'How is Mordecai described among the Jews?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  1,
  'What did Mordecai seek for his people?',
  '["Wealth","Good and welfare","War","Power"]'::jsonb,
  'Good and welfare',
  'He sought the welfare of his people (Esther 10:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 1
    AND prompt = 'What did Mordecai seek for his people?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  1,
  'What did Mordecai speak for his people?',
  '["Judgment","Peace","War","Law"]'::jsonb,
  'Peace',
  'He spoke peace to his people (Esther 10:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 1
    AND prompt = 'What did Mordecai speak for his people?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  1,
  'How was Mordecai regarded by his brothers?',
  '["Ignored","Well received","Rejected","Feared"]'::jsonb,
  'Well received',
  'He was well received by his fellow Jews (Esther 10:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 1
    AND prompt = 'How was Mordecai regarded by his brothers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  1,
  'What position did Mordecai hold in the kingdom?',
  '["Priest","Governor","Second to the king","Soldier"]'::jsonb,
  'Second to the king',
  'He held a high position (Esther 10:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 1
    AND prompt = 'What position did Mordecai hold in the kingdom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  1,
  'What is the main focus of Esther 10?',
  '["War","Mordecai’s greatness and position","A feast","A law"]'::jsonb,
  'Mordecai’s greatness and position',
  'The chapter highlights Mordecai’s honor.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 1
    AND prompt = 'What is the main focus of Esther 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  2,
  'What does the tribute indicate about the king?',
  '["Weakness","Authority and control","Fear","Confusion"]'::jsonb,
  'Authority and control',
  'Tribute shows the king’s power.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 2
    AND prompt = 'What does the tribute indicate about the king?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  2,
  'Why are the chronicles mentioned?',
  '["To confuse","To record important events","To hide truth","To end story"]'::jsonb,
  'To record important events',
  'They preserve history.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 2
    AND prompt = 'Why are the chronicles mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  2,
  'What does Mordecai’s promotion show?',
  '["Failure","Reversal of fortune","Fear","Weakness"]'::jsonb,
  'Reversal of fortune',
  'He rises from low to high position.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 2
    AND prompt = 'What does Mordecai’s promotion show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  2,
  'How did Mordecai benefit the Jews?',
  '["He taxed them","He sought their welfare","He ignored them","He ruled harshly"]'::jsonb,
  'He sought their welfare',
  'He worked for their good.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 2
    AND prompt = 'How did Mordecai benefit the Jews?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  2,
  'What does ''second to the king'' imply?',
  '["Weak","Great authority","Minor role","Hidden"]'::jsonb,
  'Great authority',
  'He held significant power.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 2
    AND prompt = 'What does ''second to the king'' imply?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  2,
  'What quality is emphasized about Mordecai?',
  '["Wealth","Leadership and care","Fear","Anger"]'::jsonb,
  'Leadership and care',
  'He leads and cares for others.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 2
    AND prompt = 'What quality is emphasized about Mordecai?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  2,
  'What does speaking peace suggest?',
  '["War","Harmony and stability","Fear","Confusion"]'::jsonb,
  'Harmony and stability',
  'He promotes peace.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 2
    AND prompt = 'What does speaking peace suggest?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  2,
  'How does this chapter conclude the story?',
  '["With conflict","With honor and stability","With war","With confusion"]'::jsonb,
  'With honor and stability',
  'The story ends positively.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 2
    AND prompt = 'How does this chapter conclude the story?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  2,
  'What is the tone of the chapter?',
  '["Sad","Triumphant","Fearful","Angry"]'::jsonb,
  'Triumphant',
  'It reflects success and honor.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 2
    AND prompt = 'What is the tone of the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  2,
  'What does Mordecai’s role show about influence?',
  '["None","Used for good","Negative","Hidden"]'::jsonb,
  'Used for good',
  'He uses power to help others.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 2
    AND prompt = 'What does Mordecai’s role show about influence?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  3,
  'Why is Mordecai’s rise significant?',
  '["Minor","Shows reversal and reward","Confusion","Fear"]'::jsonb,
  'Shows reversal and reward',
  'He is elevated after hardship.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 3
    AND prompt = 'Why is Mordecai’s rise significant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  3,
  'What does Mordecai’s leadership reveal?',
  '["Selfishness","Care for his people","Fear","Weakness"]'::jsonb,
  'Care for his people',
  'He seeks their welfare.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 3
    AND prompt = 'What does Mordecai’s leadership reveal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  3,
  'What theme is completed in this chapter?',
  '["War","Reversal of fortunes","Wealth","Law"]'::jsonb,
  'Reversal of fortunes',
  'The story concludes with reversal.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 3
    AND prompt = 'What theme is completed in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  3,
  'What does the mention of chronicles suggest?',
  '["Confusion","Importance of remembering history","Fear","Weakness"]'::jsonb,
  'Importance of remembering history',
  'Events are recorded.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 3
    AND prompt = 'What does the mention of chronicles suggest?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  3,
  'What does Mordecai’s influence show?',
  '["Weakness","Positive leadership impact","Fear","Confusion"]'::jsonb,
  'Positive leadership impact',
  'He benefits others.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 3
    AND prompt = 'What does Mordecai’s influence show?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  3,
  'What does speaking peace imply?',
  '["War","Stability and unity","Fear","Confusion"]'::jsonb,
  'Stability and unity',
  'He promotes harmony.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 3
    AND prompt = 'What does speaking peace imply?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  3,
  'What does the ending suggest about justice?',
  '["Absent","Achieved","Delayed","Hidden"]'::jsonb,
  'Achieved',
  'Justice is fulfilled.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 3
    AND prompt = 'What does the ending suggest about justice?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  3,
  'What role does honor play?',
  '["None","Reward for faithfulness","Minor","Hidden"]'::jsonb,
  'Reward for faithfulness',
  'Mordecai is honored.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 3
    AND prompt = 'What role does honor play?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  3,
  'What does the chapter suggest about leadership?',
  '["Avoid responsibility","Serve others","Seek power","Be passive"]'::jsonb,
  'Serve others',
  'Mordecai leads selflessly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 3
    AND prompt = 'What does the chapter suggest about leadership?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  3,
  'What is emphasized about Mordecai’s reputation?',
  '["Negative","Positive among his people","Hidden","Fearful"]'::jsonb,
  'Positive among his people',
  'He is well respected.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 3
    AND prompt = 'What is emphasized about Mordecai’s reputation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  4,
  'How does Esther 10 conclude the theme of deliverance?',
  '["Ends abruptly","Shows lasting peace and leadership","Ignores plot","Focuses on war"]'::jsonb,
  'Shows lasting peace and leadership',
  'The story ends with stability.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 4
    AND prompt = 'How does Esther 10 conclude the theme of deliverance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  4,
  'What leadership qualities are highlighted in Mordecai?',
  '["Fear","Wisdom and care","Wealth","Power"]'::jsonb,
  'Wisdom and care',
  'He seeks the good of his people.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 4
    AND prompt = 'What leadership qualities are highlighted in Mordecai?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  4,
  'Why is Mordecai’s position important?',
  '["Minor","Allows him to influence the kingdom for good","Ends story","Confuses"]'::jsonb,
  'Allows him to influence the kingdom for good',
  'He has great authority.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 4
    AND prompt = 'Why is Mordecai’s position important?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  4,
  'How does the chapter portray authority?',
  '["Negative","Used for good","Hidden","Temporary"]'::jsonb,
  'Used for good',
  'Mordecai uses power wisely.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 4
    AND prompt = 'How does the chapter portray authority?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  4,
  'What role does remembrance play?',
  '["None","Ensures legacy of events","Minor","Hidden"]'::jsonb,
  'Ensures legacy of events',
  'Chronicles record the story.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 4
    AND prompt = 'What role does remembrance play?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  4,
  'How does Esther 10 connect to earlier chapters?',
  '["Ends story","Shows final outcome of reversal","Ignores plot","Focuses on law"]'::jsonb,
  'Shows final outcome of reversal',
  'Mordecai replaces Haman.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 4
    AND prompt = 'How does Esther 10 connect to earlier chapters?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  4,
  'What larger theme is reinforced?',
  '["Reversal and peace","Wealth","Power","Law"]'::jsonb,
  'Reversal and peace',
  'The story ends in peace.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 4
    AND prompt = 'What larger theme is reinforced?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  4,
  'Why is peace important?',
  '["To gain power","To reflect stability after deliverance","To impress","To compete"]'::jsonb,
  'To reflect stability after deliverance',
  'Peace follows victory.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 4
    AND prompt = 'Why is peace important?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  4,
  'What does Esther 10 teach about leadership impact?',
  '["None","Can benefit many people","Minor","Hidden"]'::jsonb,
  'Can benefit many people',
  'Mordecai helps his nation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 4
    AND prompt = 'What does Esther 10 teach about leadership impact?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  4,
  'How does Esther 10 portray resolution?',
  '["Incomplete","Fully resolved","None","Hidden"]'::jsonb,
  'Fully resolved',
  'The story concludes positively.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 4
    AND prompt = 'How does Esther 10 portray resolution?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  5,
  'What theological theme is central to Esther 10?',
  '["God’s providence leading to peace","Wealth","Power","War"]'::jsonb,
  'God’s providence leading to peace',
  'The story ends with stability.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 5
    AND prompt = 'What theological theme is central to Esther 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  5,
  'How does Esther 10 portray leadership?',
  '["Passive","Servant leadership","Hidden","Temporary"]'::jsonb,
  'Servant leadership',
  'Mordecai serves his people.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 10 portray leadership?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  5,
  'What does the chapter teach about influence?',
  '["None","Should be used for good","Minor","Hidden"]'::jsonb,
  'Should be used for good',
  'Mordecai uses power wisely.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 5
    AND prompt = 'What does the chapter teach about influence?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  5,
  'How does Esther 10 contribute to the book’s message?',
  '["Ends story","Shows final fulfillment of reversal and deliverance","Ignores plot","Focuses on law"]'::jsonb,
  'Shows final fulfillment of reversal and deliverance',
  'The story concludes.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 10 contribute to the book’s message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  5,
  'Why is Mordecai’s legacy important?',
  '["Minor","Demonstrates lasting impact of faithfulness","Ends story","Confuses"]'::jsonb,
  'Demonstrates lasting impact of faithfulness',
  'He leaves a positive legacy.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 5
    AND prompt = 'Why is Mordecai’s legacy important?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  5,
  'What does Esther 10 teach about peace?',
  '["Optional","Result of deliverance and justice","Temporary","Hidden"]'::jsonb,
  'Result of deliverance and justice',
  'Peace follows victory.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 5
    AND prompt = 'What does Esther 10 teach about peace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  5,
  'In the flow of Esther, what is the main role of chapter 10?',
  '["Conclusion and summary","Ending story","Victory","Law"]'::jsonb,
  'Conclusion and summary',
  'It wraps up the narrative.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 5
    AND prompt = 'In the flow of Esther, what is the main role of chapter 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  5,
  'How does Esther 10 frame success?',
  '["Wealth","Peace and leadership","Power","Victory"]'::jsonb,
  'Peace and leadership',
  'Mordecai leads successfully.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 10 frame success?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  5,
  'What larger message does Esther 10 leave?',
  '["Faithfulness leads to lasting impact","Wealth matters most","Power is key","Work is enough"]'::jsonb,
  'Faithfulness leads to lasting impact',
  'Mordecai’s life shows this.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 5
    AND prompt = 'What larger message does Esther 10 leave?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  17,
  10,
  5,
  'How does Esther 10 frame responsibility?',
  '["Optional","Use influence to seek others’ good","Individual only","Political"]'::jsonb,
  'Use influence to seek others’ good',
  'Mordecai serves his people.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 17
    AND chapter = 10
    AND difficulty_stage = 5
    AND prompt = 'How does Esther 10 frame responsibility?'
);
