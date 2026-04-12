-- Auto-generated from quiz-questions/1kings.json
-- Book: 1 Kings (book_number 11)

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  1,
  1,
  'Who does Adonijah confer with in 1 Kings 1?',
  '["He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","He is not present at the counter-coronation of Solomon (1 Kings 1:32-34)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)"]'::jsonb,
  'Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)',
  'This detail is directly tied to 1 Kings 1:7.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'Who does Adonijah confer with in 1 Kings 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  1,
  1,
  'What happens in 1 Kings 1?',
  '["He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He is not present at the counter-coronation of Solomon (1 Kings 1:32-34)"]'::jsonb,
  'He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)',
  'This event is part of the chapter''s verse-linked source material (1 Kings 1:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'What happens in 1 Kings 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  1,
  1,
  'Who appears in 1 Kings 1?',
  '["Bathsheba","David","Solomon","Adonijah"]'::jsonb,
  'David',
  'David is listed among the key people for this chapter (1 Kings 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'Who appears in 1 Kings 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  1,
  1,
  'Which verse is highlighted in 1 Kings 1?',
  '["1 Kings 1:5","1 Kings 1:11","1 Kings 1:29","1 Kings 1:39"]'::jsonb,
  '1 Kings 1:5',
  '1 Kings 1:5 is one of the chapter''s supporting verses.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'Which verse is highlighted in 1 Kings 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  1,
  1,
  'What theme stands out in 1 Kings 1?',
  '["Covenant legitimacy","Public anointing","Royal succession","David''s final days"]'::jsonb,
  'Royal succession',
  'Royal succession is listed among the chapter themes (1 Kings 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'What theme stands out in 1 Kings 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  1,
  1,
  'Which title best fits 1 Kings 1?',
  '["David''s charge and Solomon''s first judgments","Solomon asks for wisdom","Prosperity, administration, and wisdom","Solomon anointed amid succession crisis"]'::jsonb,
  'Solomon anointed amid succession crisis',
  'Solomon anointed amid succession crisis is the chapter title in the commentary notes (1 Kings 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'Which title best fits 1 Kings 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  1,
  1,
  'What does Abiathar give in 1 Kings 1?',
  '["He is not present at the counter-coronation of Solomon (1 Kings 1:32-34)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)"]'::jsonb,
  'Abiathar gives his help and support to the rebellion (1 Kings 1:7)',
  'This verse-linked detail appears in the source notes for 1 Kings 1:7.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'What does Abiathar give in 1 Kings 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  1,
  2,
  'Where is he not present in 1 Kings 1?',
  '["Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","He is not present at the counter-coronation of Solomon (1 Kings 1:32-34)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)"]'::jsonb,
  'He is not present at the counter-coronation of Solomon (1 Kings 1:32-34)',
  'This detail belongs to the chapter''s source notes (1 Kings 1:32-34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'Where is he not present in 1 Kings 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  1,
  2,
  'What detail appears in 1 Kings 1?',
  '["David had never disciplined him or questioned his actions (1 Kings 1:6)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)"]'::jsonb,
  'David had never disciplined him or questioned his actions (1 Kings 1:6)',
  'The source material for 1 Kings 1:6 includes this detail.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'What detail appears in 1 Kings 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  1,
  2,
  'Which phrase is used in 1 Kings 1?',
  '["Let Solomon my son reign","Zadok the priest","Nathan the prophet","the king said, Call Bathsheba"]'::jsonb,
  'Let Solomon my son reign',
  'This phrase appears among the chapter''s evidence phrases (1 Kings 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'Which phrase is used in 1 Kings 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  1,
  2,
  'What key point stands out in 1 Kings 1?',
  '["Adonijah''s bid fails, and he seeks refuge at the altar.","Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people."]'::jsonb,
  'Adonijah attempts to claim the throne without David''s approval.',
  'This key point is part of the commentary notes for the chapter (1 Kings 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'What key point stands out in 1 Kings 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  1,
  2,
  'How is he described in 1 Kings 1?',
  '["He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","He is described as a very handsome man (1 Kings 1:6)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)"]'::jsonb,
  'He is described as a very handsome man (1 Kings 1:6)',
  'This scene is tied to 1 Kings 1:6.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'How is he described in 1 Kings 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  1,
  2,
  'What does this betrayal undo in 1 Kings 1?',
  '["This feast was a formal attempt to stage a coup against David''s intentions.","This intervention prevents Adonijah''s coup from being finalized.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride."]'::jsonb,
  'This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.',
  'This significance statement is attached to verse-linked material from this chapter (1 Kings 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'What does this betrayal undo in 1 Kings 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  1,
  2,
  'What does Abiathar make in 1 Kings 1?',
  '["As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Nathan the prophet and Bathsheba alert King David to Adonijah''s rebellion.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne."]'::jsonb,
  'Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.',
  'This summary line comes from source material connected to 1 Kings 1:5.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'What does Abiathar make in 1 Kings 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  1,
  3,
  'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 1?',
  '["the king said, Call Bathsheba","Zadok the priest","Let Solomon my son reign","Nathan the prophet"]'::jsonb,
  'Zadok the priest',
  'This phrase most directly reflects the chapter''s focal line (1 Kings 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  1,
  3,
  'Which key point best summarizes what 1 Kings 1 emphasizes?',
  '["Adonijah attempts to claim the throne without David''s approval.","Solomon is anointed king and proclaimed by the people.","Adonijah''s bid fails, and he seeks refuge at the altar.","Nathan and Bathsheba appeal to David to act before the crisis grows."]'::jsonb,
  'Nathan and Bathsheba appeal to David to act before the crisis grows.',
  'This key point best captures the emphasis of the chapter summary (1 Kings 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'Which key point best summarizes what 1 Kings 1 emphasizes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  1,
  3,
  'Which line best explains why the events of 1 Kings 1 matter?',
  '["This intervention prevents Adonijah''s coup from being finalized.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions."]'::jsonb,
  'This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.',
  'This significance line best explains the chapter''s weight (1 Kings 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'Which line best explains why the events of 1 Kings 1 matter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  1,
  3,
  'Which statement best captures the chapter''s main action in 1 Kings 1?',
  '["Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Nathan the prophet and Bathsheba alert King David to Adonijah''s rebellion.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following."]'::jsonb,
  'Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.',
  'This summary best fits the chapter''s core movement (1 Kings 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'Which statement best captures the chapter''s main action in 1 Kings 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  1,
  3,
  'Which statement best matches the leadership pressure in 1 Kings 1?',
  '["Nathan and Bathsheba appeal to David to act before the crisis grows.","Adonijah''s bid fails, and he seeks refuge at the altar.","Solomon is anointed king and proclaimed by the people.","Adonijah attempts to claim the throne without David''s approval."]'::jsonb,
  'Solomon is anointed king and proclaimed by the people.',
  'This statement best matches the chapter''s leadership pressure (1 Kings 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'Which statement best matches the leadership pressure in 1 Kings 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  1,
  3,
  'Which summary statement best fits the movement of 1 Kings 1?',
  '["As David grows old, Adonijah tries to seize the throne, but Nathan, Bathsheba, Zadok, and Benaiah move quickly to secure Solomon''s anointing. David publicly confirms Solomon as his chosen successor, and the people celebrate the new king. The chapter closes with Adonijah seeking mercy as Solomon begins his reign with legitimacy and peace.","David gives Solomon final instructions to walk faithfully, guard the kingdom, and deal wisely with unresolved matters in the court. Solomon secures his throne by removing threats from Adonijah, Abiathar, Joab, and Shimei. The chapter shows that the new king''s rule must be rooted in obedience, justice, and discernment.","At Gibeon, Solomon asks God for a listening heart rather than riches, long life, or victory over enemies. God grants him unmatched wisdom along with wealth and honor because he asked for discernment to govern well. His first judgment between two women proves that the gift is real and that the people can trust his rule.","Solomon''s kingdom is organized through a wide network of officials, districts, and provisions that keep the royal court well supplied. Peace extends throughout the land, and the king''s wisdom surpasses that of the surrounding sages. His rule is marked by order, abundance, and a reputation that draws admiration from every direction."]'::jsonb,
  'As David grows old, Adonijah tries to seize the throne, but Nathan, Bathsheba, Zadok, and Benaiah move quickly to secure Solomon''s anointing. David publicly confirms Solomon as his chosen successor, and the people celebrate the new king. The chapter closes with Adonijah seeking mercy as Solomon begins his reign with legitimacy and peace.',
  'This is the chapter summary for 1 Kings 1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'Which summary statement best fits the movement of 1 Kings 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  1,
  3,
  'Which theme best interprets the events of 1 Kings 1?',
  '["Royal succession","David''s final days","Covenant legitimacy","Public anointing"]'::jsonb,
  'Royal succession',
  'Royal succession is the best thematic lens supplied in the notes (1 Kings 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'Which theme best interprets the events of 1 Kings 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  1,
  4,
  'How does 1 Kings 1 function in the wider narrative of 1 Kings?',
  '["It advances the temple-centered shape of worship and kingship in Israel.","It turns spoken warnings into visible judgment within the royal story.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign."]'::jsonb,
  'It contrasts self-exalting ambition with the kingly order David affirms.',
  'This option best fits the chapter''s narrative role within 1 Kings (1 Kings 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'How does 1 Kings 1 function in the wider narrative of 1 Kings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  1,
  4,
  'Which claim best fits the chapter''s larger significance in 1 Kings 1?',
  '["Nathan the prophet and Bathsheba alert King David to Adonijah''s rebellion.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king."]'::jsonb,
  'Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.',
  'This claim best fits the chapter''s larger significance in context (1 Kings 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'Which claim best fits the chapter''s larger significance in 1 Kings 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  1,
  4,
  'Which conclusion best matches the covenant pressure visible in 1 Kings 1?',
  '["The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force."]'::jsonb,
  'The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.',
  'This conclusion best matches the chapter''s covenant pressure (1 Kings 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'Which conclusion best matches the covenant pressure visible in 1 Kings 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  1,
  4,
  'Which reading best connects the chapter''s facts and themes in 1 Kings 1?',
  '["This feast was a formal attempt to stage a coup against David''s intentions.","This intervention prevents Adonijah''s coup from being finalized.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride."]'::jsonb,
  'This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.',
  'This reading best connects the chapter''s verse-linked facts and its meaning (1 Kings 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'Which reading best connects the chapter''s facts and themes in 1 Kings 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  1,
  4,
  'Which statement best explains the chapter''s contribution to the book in 1 Kings 1?',
  '["It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel.","It turns spoken warnings into visible judgment within the royal story."]'::jsonb,
  'It contrasts self-exalting ambition with the kingly order David affirms.',
  'This statement best explains how the chapter contributes to the book''s flow (1 Kings 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains the chapter''s contribution to the book in 1 Kings 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  1,
  4,
  'Which statement best explains why the chapter is strategically important in 1 Kings 1?',
  '["It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel.","It turns spoken warnings into visible judgment within the royal story."]'::jsonb,
  'It contrasts self-exalting ambition with the kingly order David affirms.',
  'This option best explains the chapter''s strategic importance in the book (1 Kings 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains why the chapter is strategically important in 1 Kings 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  1,
  4,
  'Which theological reading best fits 1 Kings 1?',
  '["The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people."]'::jsonb,
  'The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.',
  'This theological reading best fits the chapter''s themes and developments (1 Kings 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'Which theological reading best fits 1 Kings 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  1,
  5,
  'Which advanced synthesis best captures the theology of 1 Kings 1?',
  '["The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage."]'::jsonb,
  'The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.',
  'This is the strongest theological synthesis grounded in the chapter''s notes (1 Kings 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'Which advanced synthesis best captures the theology of 1 Kings 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  1,
  5,
  'Which book-level synthesis best explains 1 Kings 1?',
  '["It turns spoken warnings into visible judgment within the royal story.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel."]'::jsonb,
  'It contrasts self-exalting ambition with the kingly order David affirms.',
  'This is the best book-level synthesis of the chapter''s role (1 Kings 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'Which book-level synthesis best explains 1 Kings 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  1,
  5,
  'Which high-level reading best explains why 1 Kings 1 is remembered?',
  '["This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","This intervention prevents Adonijah''s coup from being finalized."]'::jsonb,
  'This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.',
  'This high-level reading best explains why the chapter remains significant (1 Kings 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'Which high-level reading best explains why 1 Kings 1 is remembered?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  1,
  5,
  'Which interpretive conclusion best fits the chapter''s place in 1 Kings 1?',
  '["It advances the temple-centered shape of worship and kingship in Israel.","It turns spoken warnings into visible judgment within the royal story.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign."]'::jsonb,
  'It contrasts self-exalting ambition with the kingly order David affirms.',
  'This interpretive conclusion best fits the chapter''s place in the book (1 Kings 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'Which interpretive conclusion best fits the chapter''s place in 1 Kings 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  1,
  5,
  'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 1?',
  '["The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people."]'::jsonb,
  'The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.',
  'This statement best captures the chapter''s lasting theological pressure (1 Kings 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  1,
  5,
  'Which statement best reflects the long-range force of 1 Kings 1?',
  '["This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","This intervention prevents Adonijah''s coup from being finalized."]'::jsonb,
  'This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.',
  'This statement best reflects the chapter''s long-range force within the narrative (1 Kings 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'Which statement best reflects the long-range force of 1 Kings 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  1,
  5,
  'Which synthesis best joins the factual details and themes of 1 Kings 1?',
  '["The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force."]'::jsonb,
  'The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.',
  'This synthesis most successfully joins the chapter''s details and themes (1 Kings 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'Which synthesis best joins the factual details and themes of 1 Kings 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  2,
  1,
  'Whom does Solomon call in 1 Kings 2?',
  '["He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Solomon calls Abiathar ''worthy of death'' (1 Kings 2:26)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)"]'::jsonb,
  'Solomon calls Abiathar ''worthy of death'' (1 Kings 2:26)',
  'This detail is directly tied to 1 Kings 2:26.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 2
    AND difficulty_stage = 1
    AND prompt = 'Whom does Solomon call in 1 Kings 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  2,
  1,
  'What does Solomon order in 1 Kings 2?',
  '["Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Solomon orders him to go to his estate in Anathoth (1 Kings 2:26)"]'::jsonb,
  'Solomon orders him to go to his estate in Anathoth (1 Kings 2:26)',
  'This event is part of the chapter''s verse-linked source material (1 Kings 2:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 2
    AND difficulty_stage = 1
    AND prompt = 'What does Solomon order in 1 Kings 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  2,
  1,
  'Who appears in 1 Kings 2?',
  '["David","Solomon","Adonijah","Bathsheba"]'::jsonb,
  'David',
  'David is listed among the key people for this chapter (1 Kings 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 2
    AND difficulty_stage = 1
    AND prompt = 'Who appears in 1 Kings 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  2,
  1,
  'Which verse is highlighted in 1 Kings 2?',
  '["1 Kings 1:5","1 Kings 1:11","1 Kings 1:29","1 Kings 2:2"]'::jsonb,
  '1 Kings 2:2',
  '1 Kings 2:2 is one of the chapter''s supporting verses.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 2
    AND difficulty_stage = 1
    AND prompt = 'Which verse is highlighted in 1 Kings 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  2,
  1,
  'What theme stands out in 1 Kings 2?',
  '["Covenant legitimacy","David''s farewell","Royal succession","David''s final days"]'::jsonb,
  'David''s farewell',
  'David''s farewell is listed among the chapter themes (1 Kings 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 2
    AND difficulty_stage = 1
    AND prompt = 'What theme stands out in 1 Kings 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  2,
  1,
  'Which title best fits 1 Kings 2?',
  '["Solomon asks for wisdom","Prosperity, administration, and wisdom","David''s charge and Solomon''s first judgments","Solomon anointed amid succession crisis"]'::jsonb,
  'David''s charge and Solomon''s first judgments',
  'David''s charge and Solomon''s first judgments is the chapter title in the commentary notes (1 Kings 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 2
    AND difficulty_stage = 1
    AND prompt = 'Which title best fits 1 Kings 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  2,
  1,
  'What happens in 1 Kings 2?',
  '["He spares him because he carried the Ark and shared David''s afflictions (1 Kings 2:26)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)"]'::jsonb,
  'He spares him because he carried the Ark and shared David''s afflictions (1 Kings 2:26)',
  'This verse-linked detail appears in the source notes for 1 Kings 2:26.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 2
    AND difficulty_stage = 1
    AND prompt = 'What happens in 1 Kings 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  2,
  2,
  'What happens to abiathar in 1 Kings 2?',
  '["He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Abiathar is officially expelled from being priest to the Lord (1 Kings 2:27)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)"]'::jsonb,
  'Abiathar is officially expelled from being priest to the Lord (1 Kings 2:27)',
  'This detail belongs to the chapter''s source notes (1 Kings 2:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 2
    AND difficulty_stage = 2
    AND prompt = 'What happens to abiathar in 1 Kings 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  2,
  2,
  'Where was the judgment originally given in 1 Kings 2?',
  '["Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","The judgment was originally given at Shiloh (1 Kings 2:27)"]'::jsonb,
  'The judgment was originally given at Shiloh (1 Kings 2:27)',
  'The source material for 1 Kings 2:27 includes this detail.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 2
    AND difficulty_stage = 2
    AND prompt = 'Where was the judgment originally given in 1 Kings 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  2,
  2,
  'Which phrase is used in 1 Kings 2?',
  '["Let Solomon my son reign","Zadok the priest","Nathan the prophet","be strong, and show yourself a man"]'::jsonb,
  'be strong, and show yourself a man',
  'This phrase appears among the chapter''s evidence phrases (1 Kings 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 2
    AND difficulty_stage = 2
    AND prompt = 'Which phrase is used in 1 Kings 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  2,
  2,
  'What does David charge in 1 Kings 2?',
  '["David charges Solomon to keep the LORD''s commandments.","Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people."]'::jsonb,
  'David charges Solomon to keep the LORD''s commandments.',
  'This key point is part of the commentary notes for the chapter (1 Kings 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 2
    AND difficulty_stage = 2
    AND prompt = 'What does David charge in 1 Kings 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  2,
  2,
  'What does the text note in 1 Kings 2?',
  '["The text notes this fulfilled the word against the house of Eli (1 Kings 2:27)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)"]'::jsonb,
  'The text notes this fulfilled the word against the house of Eli (1 Kings 2:27)',
  'This scene is tied to 1 Kings 2:27.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 2
    AND difficulty_stage = 2
    AND prompt = 'What does the text note in 1 Kings 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  2,
  2,
  'What does his removal end in 1 Kings 2?',
  '["This feast was a formal attempt to stage a coup against David''s intentions.","His removal ends the influence of the house of Ithamar in the priesthood.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride."]'::jsonb,
  'His removal ends the influence of the house of Ithamar in the priesthood.',
  'This significance statement is attached to verse-linked material from this chapter (1 Kings 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 2
    AND difficulty_stage = 2
    AND prompt = 'What does his removal end in 1 Kings 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  2,
  2,
  'Whom does Solomon remove in 1 Kings 2?',
  '["As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Solomon removes Abiathar from the priesthood but spares his life due to his history with David.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne."]'::jsonb,
  'Solomon removes Abiathar from the priesthood but spares his life due to his history with David.',
  'This summary line comes from source material connected to 1 Kings 2:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 2
    AND difficulty_stage = 2
    AND prompt = 'Whom does Solomon remove in 1 Kings 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  2,
  3,
  'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 2?',
  '["keep the charge of the LORD","Let Solomon my son reign","Zadok the priest","Nathan the prophet"]'::jsonb,
  'keep the charge of the LORD',
  'This phrase most directly reflects the chapter''s focal line (1 Kings 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 2
    AND difficulty_stage = 3
    AND prompt = 'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  2,
  3,
  'Which key point best summarizes what 1 Kings 2 emphasizes?',
  '["Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people.","Solomon acts decisively to secure the throne.","Adonijah attempts to claim the throne without David''s approval."]'::jsonb,
  'Solomon acts decisively to secure the throne.',
  'This key point best captures the emphasis of the chapter summary (1 Kings 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 2
    AND difficulty_stage = 3
    AND prompt = 'Which key point best summarizes what 1 Kings 2 emphasizes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  2,
  3,
  'Which line best explains why the events of 1 Kings 2 matter?',
  '["His removal ends the influence of the house of Ithamar in the priesthood.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions."]'::jsonb,
  'His removal ends the influence of the house of Ithamar in the priesthood.',
  'This significance line best explains the chapter''s weight (1 Kings 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 2
    AND difficulty_stage = 3
    AND prompt = 'Which line best explains why the events of 1 Kings 2 matter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  2,
  3,
  'Which statement best captures the chapter''s main action in 1 Kings 2?',
  '["Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Solomon removes Abiathar from the priesthood but spares his life due to his history with David.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following."]'::jsonb,
  'Solomon removes Abiathar from the priesthood but spares his life due to his history with David.',
  'This summary best fits the chapter''s core movement (1 Kings 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 2
    AND difficulty_stage = 3
    AND prompt = 'Which statement best captures the chapter''s main action in 1 Kings 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  2,
  3,
  'Which statement best matches the leadership pressure in 1 Kings 2?',
  '["Solomon is anointed king and proclaimed by the people.","Adonijah''s request becomes another threat to the kingdom.","Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows."]'::jsonb,
  'Adonijah''s request becomes another threat to the kingdom.',
  'This statement best matches the chapter''s leadership pressure (1 Kings 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 2
    AND difficulty_stage = 3
    AND prompt = 'Which statement best matches the leadership pressure in 1 Kings 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  2,
  3,
  'Which summary statement best fits the movement of 1 Kings 2?',
  '["As David grows old, Adonijah tries to seize the throne, but Nathan, Bathsheba, Zadok, and Benaiah move quickly to secure Solomon''s anointing. David publicly confirms Solomon as his chosen successor, and the people celebrate the new king. The chapter closes with Adonijah seeking mercy as Solomon begins his reign with legitimacy and peace.","At Gibeon, Solomon asks God for a listening heart rather than riches, long life, or victory over enemies. God grants him unmatched wisdom along with wealth and honor because he asked for discernment to govern well. His first judgment between two women proves that the gift is real and that the people can trust his rule.","Solomon''s kingdom is organized through a wide network of officials, districts, and provisions that keep the royal court well supplied. Peace extends throughout the land, and the king''s wisdom surpasses that of the surrounding sages. His rule is marked by order, abundance, and a reputation that draws admiration from every direction.","David gives Solomon final instructions to walk faithfully, guard the kingdom, and deal wisely with unresolved matters in the court. Solomon secures his throne by removing threats from Adonijah, Abiathar, Joab, and Shimei. The chapter shows that the new king''s rule must be rooted in obedience, justice, and discernment."]'::jsonb,
  'David gives Solomon final instructions to walk faithfully, guard the kingdom, and deal wisely with unresolved matters in the court. Solomon secures his throne by removing threats from Adonijah, Abiathar, Joab, and Shimei. The chapter shows that the new king''s rule must be rooted in obedience, justice, and discernment.',
  'This is the chapter summary for 1 Kings 2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 2
    AND difficulty_stage = 3
    AND prompt = 'Which summary statement best fits the movement of 1 Kings 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  2,
  3,
  'Which theme best interprets the events of 1 Kings 2?',
  '["Royal succession","David''s final days","Covenant legitimacy","David''s farewell"]'::jsonb,
  'David''s farewell',
  'David''s farewell is the best thematic lens supplied in the notes (1 Kings 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 2
    AND difficulty_stage = 3
    AND prompt = 'Which theme best interprets the events of 1 Kings 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  2,
  4,
  'How does 1 Kings 2 function in the wider narrative of 1 Kings?',
  '["It turns spoken warnings into visible judgment within the royal story.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel."]'::jsonb,
  'It contrasts self-exalting ambition with the kingly order David affirms.',
  'This option best fits the chapter''s narrative role within 1 Kings (1 Kings 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 2
    AND difficulty_stage = 4
    AND prompt = 'How does 1 Kings 2 function in the wider narrative of 1 Kings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  2,
  4,
  'Which claim best fits the chapter''s larger significance in 1 Kings 2?',
  '["Solomon removes Abiathar from the priesthood but spares his life due to his history with David.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king."]'::jsonb,
  'Solomon removes Abiathar from the priesthood but spares his life due to his history with David.',
  'This claim best fits the chapter''s larger significance in context (1 Kings 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 2
    AND difficulty_stage = 4
    AND prompt = 'Which claim best fits the chapter''s larger significance in 1 Kings 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  2,
  4,
  'Which conclusion best matches the covenant pressure visible in 1 Kings 2?',
  '["The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage."]'::jsonb,
  'The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.',
  'This conclusion best matches the chapter''s covenant pressure (1 Kings 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 2
    AND difficulty_stage = 4
    AND prompt = 'Which conclusion best matches the covenant pressure visible in 1 Kings 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  2,
  4,
  'Which reading best connects the chapter''s facts and themes in 1 Kings 2?',
  '["This feast was a formal attempt to stage a coup against David''s intentions.","His removal ends the influence of the house of Ithamar in the priesthood.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride."]'::jsonb,
  'His removal ends the influence of the house of Ithamar in the priesthood.',
  'This reading best connects the chapter''s verse-linked facts and its meaning (1 Kings 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 2
    AND difficulty_stage = 4
    AND prompt = 'Which reading best connects the chapter''s facts and themes in 1 Kings 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  2,
  4,
  'Which statement best explains the chapter''s contribution to the book in 1 Kings 2?',
  '["It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel.","It turns spoken warnings into visible judgment within the royal story.","It contrasts self-exalting ambition with the kingly order David affirms."]'::jsonb,
  'It contrasts self-exalting ambition with the kingly order David affirms.',
  'This statement best explains how the chapter contributes to the book''s flow (1 Kings 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 2
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains the chapter''s contribution to the book in 1 Kings 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  2,
  4,
  'Which statement best explains why the chapter is strategically important in 1 Kings 2?',
  '["It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel.","It turns spoken warnings into visible judgment within the royal story.","It contrasts self-exalting ambition with the kingly order David affirms."]'::jsonb,
  'It contrasts self-exalting ambition with the kingly order David affirms.',
  'This option best explains the chapter''s strategic importance in the book (1 Kings 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 2
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains why the chapter is strategically important in 1 Kings 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  2,
  4,
  'Which theological reading best fits 1 Kings 2?',
  '["The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter teaches that divine judgment is patient, but it does not fail to arrive."]'::jsonb,
  'The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.',
  'This theological reading best fits the chapter''s themes and developments (1 Kings 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 2
    AND difficulty_stage = 4
    AND prompt = 'Which theological reading best fits 1 Kings 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  2,
  5,
  'Which advanced synthesis best captures the theology of 1 Kings 2?',
  '["The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people."]'::jsonb,
  'The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.',
  'This is the strongest theological synthesis grounded in the chapter''s notes (1 Kings 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 2
    AND difficulty_stage = 5
    AND prompt = 'Which advanced synthesis best captures the theology of 1 Kings 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  2,
  5,
  'Which book-level synthesis best explains 1 Kings 2?',
  '["It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel.","It turns spoken warnings into visible judgment within the royal story."]'::jsonb,
  'It contrasts self-exalting ambition with the kingly order David affirms.',
  'This is the best book-level synthesis of the chapter''s role (1 Kings 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 2
    AND difficulty_stage = 5
    AND prompt = 'Which book-level synthesis best explains 1 Kings 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  2,
  5,
  'Which high-level reading best explains why 1 Kings 2 is remembered?',
  '["This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","His removal ends the influence of the house of Ithamar in the priesthood."]'::jsonb,
  'His removal ends the influence of the house of Ithamar in the priesthood.',
  'This high-level reading best explains why the chapter remains significant (1 Kings 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 2
    AND difficulty_stage = 5
    AND prompt = 'Which high-level reading best explains why 1 Kings 2 is remembered?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  2,
  5,
  'Which interpretive conclusion best fits the chapter''s place in 1 Kings 2?',
  '["It turns spoken warnings into visible judgment within the royal story.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel."]'::jsonb,
  'It contrasts self-exalting ambition with the kingly order David affirms.',
  'This interpretive conclusion best fits the chapter''s place in the book (1 Kings 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 2
    AND difficulty_stage = 5
    AND prompt = 'Which interpretive conclusion best fits the chapter''s place in 1 Kings 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  2,
  5,
  'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 2?',
  '["The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter teaches that divine judgment is patient, but it does not fail to arrive."]'::jsonb,
  'The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.',
  'This statement best captures the chapter''s lasting theological pressure (1 Kings 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 2
    AND difficulty_stage = 5
    AND prompt = 'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  2,
  5,
  'Which statement best reflects the long-range force of 1 Kings 2?',
  '["This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","His removal ends the influence of the house of Ithamar in the priesthood."]'::jsonb,
  'His removal ends the influence of the house of Ithamar in the priesthood.',
  'This statement best reflects the chapter''s long-range force within the narrative (1 Kings 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 2
    AND difficulty_stage = 5
    AND prompt = 'Which statement best reflects the long-range force of 1 Kings 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  2,
  5,
  'Which synthesis best joins the factual details and themes of 1 Kings 2?',
  '["The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage."]'::jsonb,
  'The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.',
  'This synthesis most successfully joins the chapter''s details and themes (1 Kings 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 2
    AND difficulty_stage = 5
    AND prompt = 'Which synthesis best joins the factual details and themes of 1 Kings 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  3,
  1,
  'Whom does Solomon marry in 1 Kings 3?',
  '["Solomon marries the daughter of Pharaoh (1 Kings 3:1)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)"]'::jsonb,
  'Solomon marries the daughter of Pharaoh (1 Kings 3:1)',
  'This detail is directly tied to 1 Kings 3:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 3
    AND difficulty_stage = 1
    AND prompt = 'Whom does Solomon marry in 1 Kings 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  3,
  1,
  'What does Egypt become in 1 Kings 3?',
  '["Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Egypt becomes a primary source for Solomon''s horses and chariots (1 Kings 10:28)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)"]'::jsonb,
  'Egypt becomes a primary source for Solomon''s horses and chariots (1 Kings 10:28)',
  'This event is part of the chapter''s verse-linked source material (1 Kings 10:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 3
    AND difficulty_stage = 1
    AND prompt = 'What does Egypt become in 1 Kings 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  3,
  1,
  'Who appears in 1 Kings 3?',
  '["David","Adonijah","Bathsheba","Solomon"]'::jsonb,
  'Solomon',
  'Solomon is listed among the key people for this chapter (1 Kings 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 3
    AND difficulty_stage = 1
    AND prompt = 'Who appears in 1 Kings 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  3,
  1,
  'Which verse is highlighted in 1 Kings 3?',
  '["1 Kings 1:11","1 Kings 1:29","1 Kings 3:5","1 Kings 1:5"]'::jsonb,
  '1 Kings 3:5',
  '1 Kings 3:5 is one of the chapter''s supporting verses.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 3
    AND difficulty_stage = 1
    AND prompt = 'Which verse is highlighted in 1 Kings 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  3,
  1,
  'What theme stands out in 1 Kings 3?',
  '["Wisdom over wealth","Royal succession","David''s final days","Covenant legitimacy"]'::jsonb,
  'Wisdom over wealth',
  'Wisdom over wealth is listed among the chapter themes (1 Kings 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 3
    AND difficulty_stage = 1
    AND prompt = 'What theme stands out in 1 Kings 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  3,
  1,
  'Which title best fits 1 Kings 3?',
  '["Prosperity, administration, and wisdom","Solomon asks for wisdom","Solomon anointed amid succession crisis","David''s charge and Solomon''s first judgments"]'::jsonb,
  'Solomon asks for wisdom',
  'Solomon asks for wisdom is the chapter title in the commentary notes (1 Kings 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 3
    AND difficulty_stage = 1
    AND prompt = 'Which title best fits 1 Kings 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  3,
  1,
  'What does Pharaoh captures Gezer and give in 1 Kings 3?',
  '["Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Pharaoh captures Gezer and gives it as a dowry for his daughter (1 Kings 9:16)"]'::jsonb,
  'Pharaoh captures Gezer and gives it as a dowry for his daughter (1 Kings 9:16)',
  'This verse-linked detail appears in the source notes for 1 Kings 9:16.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 3
    AND difficulty_stage = 1
    AND prompt = 'What does Pharaoh captures Gezer and give in 1 Kings 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  3,
  2,
  'What happens in 1 Kings 3?',
  '["Egyptian influence contributes to the spiritual compromise of the king (1 Kings 11:1-4)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)"]'::jsonb,
  'Egyptian influence contributes to the spiritual compromise of the king (1 Kings 11:1-4)',
  'This detail belongs to the chapter''s source notes (1 Kings 11:1-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 3
    AND difficulty_stage = 2
    AND prompt = 'What happens in 1 Kings 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  3,
  2,
  'What does Solomon import in 1 Kings 3?',
  '["Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Solomon imports horses and chariots from Egypt (1 Kings 10:28-29)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)"]'::jsonb,
  'Solomon imports horses and chariots from Egypt (1 Kings 10:28-29)',
  'The source material for 1 Kings 10:28-29 includes this detail.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 3
    AND difficulty_stage = 2
    AND prompt = 'What does Solomon import in 1 Kings 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  3,
  2,
  'Which phrase is used in 1 Kings 3?',
  '["Zadok the priest","Nathan the prophet","an understanding heart","Let Solomon my son reign"]'::jsonb,
  'an understanding heart',
  'This phrase appears among the chapter''s evidence phrases (1 Kings 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 3
    AND difficulty_stage = 2
    AND prompt = 'Which phrase is used in 1 Kings 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  3,
  2,
  'What does Solomon ask for in 1 Kings 3?',
  '["Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people.","Solomon asks for an understanding heart to judge the people."]'::jsonb,
  'Solomon asks for an understanding heart to judge the people.',
  'This key point is part of the commentary notes for the chapter (1 Kings 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 3
    AND difficulty_stage = 2
    AND prompt = 'What does Solomon ask for in 1 Kings 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  3,
  2,
  'What does Solomon make in 1 Kings 3?',
  '["Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Solomon makes a marriage alliance with Pharaoh and receives a city as a dowry (1 Kings 3:1, 9:16)"]'::jsonb,
  'Solomon makes a marriage alliance with Pharaoh and receives a city as a dowry (1 Kings 3:1, 9:16)',
  'This scene is tied to 1 Kings 3:1,.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 3
    AND difficulty_stage = 2
    AND prompt = 'What does Solomon make in 1 Kings 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  3,
  2,
  'What did the alliance mark in 1 Kings 3?',
  '["The alliance marked a dangerous return to reliance on the ''broken reed'' of Egypt.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions."]'::jsonb,
  'The alliance marked a dangerous return to reliance on the ''broken reed'' of Egypt.',
  'This significance statement is attached to verse-linked material from this chapter (1 Kings 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 3
    AND difficulty_stage = 2
    AND prompt = 'What did the alliance mark in 1 Kings 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  3,
  2,
  'What does Solomon enter into in 1 Kings 3?',
  '["Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Solomon enters into a diplomatic and marital alliance with the Egyptians.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following."]'::jsonb,
  'Solomon enters into a diplomatic and marital alliance with the Egyptians.',
  'This summary line comes from source material connected to 1 Kings 3:5.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 3
    AND difficulty_stage = 2
    AND prompt = 'What does Solomon enter into in 1 Kings 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  3,
  3,
  'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 3?',
  '["Let Solomon my son reign","Zadok the priest","Nathan the prophet","I have given you a wise and understanding heart"]'::jsonb,
  'I have given you a wise and understanding heart',
  'This phrase most directly reflects the chapter''s focal line (1 Kings 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 3
    AND difficulty_stage = 3
    AND prompt = 'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  3,
  3,
  'Which key point best summarizes what 1 Kings 3 emphasizes?',
  '["Solomon is anointed king and proclaimed by the people.","God grants wisdom, riches, and honor beyond all kings.","Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows."]'::jsonb,
  'God grants wisdom, riches, and honor beyond all kings.',
  'This key point best captures the emphasis of the chapter summary (1 Kings 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 3
    AND difficulty_stage = 3
    AND prompt = 'Which key point best summarizes what 1 Kings 3 emphasizes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  3,
  3,
  'Which line best explains why the events of 1 Kings 3 matter?',
  '["This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","The alliance marked a dangerous return to reliance on the ''broken reed'' of Egypt."]'::jsonb,
  'The alliance marked a dangerous return to reliance on the ''broken reed'' of Egypt.',
  'This significance line best explains the chapter''s weight (1 Kings 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 3
    AND difficulty_stage = 3
    AND prompt = 'Which line best explains why the events of 1 Kings 3 matter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  3,
  3,
  'Which statement best captures the chapter''s main action in 1 Kings 3?',
  '["Solomon enters into a diplomatic and marital alliance with the Egyptians.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king."]'::jsonb,
  'Solomon enters into a diplomatic and marital alliance with the Egyptians.',
  'This summary best fits the chapter''s core movement (1 Kings 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 3
    AND difficulty_stage = 3
    AND prompt = 'Which statement best captures the chapter''s main action in 1 Kings 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  3,
  3,
  'Which statement best matches the leadership pressure in 1 Kings 3?',
  '["The dispute over the child reveals Solomon''s discernment.","Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people."]'::jsonb,
  'The dispute over the child reveals Solomon''s discernment.',
  'This statement best matches the chapter''s leadership pressure (1 Kings 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 3
    AND difficulty_stage = 3
    AND prompt = 'Which statement best matches the leadership pressure in 1 Kings 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  3,
  3,
  'Which summary statement best fits the movement of 1 Kings 3?',
  '["David gives Solomon final instructions to walk faithfully, guard the kingdom, and deal wisely with unresolved matters in the court. Solomon secures his throne by removing threats from Adonijah, Abiathar, Joab, and Shimei. The chapter shows that the new king''s rule must be rooted in obedience, justice, and discernment.","Solomon''s kingdom is organized through a wide network of officials, districts, and provisions that keep the royal court well supplied. Peace extends throughout the land, and the king''s wisdom surpasses that of the surrounding sages. His rule is marked by order, abundance, and a reputation that draws admiration from every direction.","At Gibeon, Solomon asks God for a listening heart rather than riches, long life, or victory over enemies. God grants him unmatched wisdom along with wealth and honor because he asked for discernment to govern well. His first judgment between two women proves that the gift is real and that the people can trust his rule.","As David grows old, Adonijah tries to seize the throne, but Nathan, Bathsheba, Zadok, and Benaiah move quickly to secure Solomon''s anointing. David publicly confirms Solomon as his chosen successor, and the people celebrate the new king. The chapter closes with Adonijah seeking mercy as Solomon begins his reign with legitimacy and peace."]'::jsonb,
  'At Gibeon, Solomon asks God for a listening heart rather than riches, long life, or victory over enemies. God grants him unmatched wisdom along with wealth and honor because he asked for discernment to govern well. His first judgment between two women proves that the gift is real and that the people can trust his rule.',
  'This is the chapter summary for 1 Kings 3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 3
    AND difficulty_stage = 3
    AND prompt = 'Which summary statement best fits the movement of 1 Kings 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  3,
  3,
  'Which theme best interprets the events of 1 Kings 3?',
  '["David''s final days","Covenant legitimacy","Wisdom over wealth","Royal succession"]'::jsonb,
  'Wisdom over wealth',
  'Wisdom over wealth is the best thematic lens supplied in the notes (1 Kings 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 3
    AND difficulty_stage = 3
    AND prompt = 'Which theme best interprets the events of 1 Kings 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  3,
  4,
  'How does 1 Kings 3 function in the wider narrative of 1 Kings?',
  '["It presents wise rule as foundational to the success of Solomon''s reign.","It contrasts self-exalting ambition with the kingly order David affirms.","It advances the temple-centered shape of worship and kingship in Israel.","It turns spoken warnings into visible judgment within the royal story."]'::jsonb,
  'It presents wise rule as foundational to the success of Solomon''s reign.',
  'This option best fits the chapter''s narrative role within 1 Kings (1 Kings 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 3
    AND difficulty_stage = 4
    AND prompt = 'How does 1 Kings 3 function in the wider narrative of 1 Kings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  3,
  4,
  'Which claim best fits the chapter''s larger significance in 1 Kings 3?',
  '["Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Solomon enters into a diplomatic and marital alliance with the Egyptians."]'::jsonb,
  'Solomon enters into a diplomatic and marital alliance with the Egyptians.',
  'This claim best fits the chapter''s larger significance in context (1 Kings 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 3
    AND difficulty_stage = 4
    AND prompt = 'Which claim best fits the chapter''s larger significance in 1 Kings 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  3,
  4,
  'Which conclusion best matches the covenant pressure visible in 1 Kings 3?',
  '["The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people."]'::jsonb,
  'The chapter teaches that discernment is a gift to be sought above status and advantage.',
  'This conclusion best matches the chapter''s covenant pressure (1 Kings 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 3
    AND difficulty_stage = 4
    AND prompt = 'Which conclusion best matches the covenant pressure visible in 1 Kings 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  3,
  4,
  'Which reading best connects the chapter''s facts and themes in 1 Kings 3?',
  '["The alliance marked a dangerous return to reliance on the ''broken reed'' of Egypt.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions."]'::jsonb,
  'The alliance marked a dangerous return to reliance on the ''broken reed'' of Egypt.',
  'This reading best connects the chapter''s verse-linked facts and its meaning (1 Kings 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 3
    AND difficulty_stage = 4
    AND prompt = 'Which reading best connects the chapter''s facts and themes in 1 Kings 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  3,
  4,
  'Which statement best explains the chapter''s contribution to the book in 1 Kings 3?',
  '["It advances the temple-centered shape of worship and kingship in Israel.","It turns spoken warnings into visible judgment within the royal story.","It presents wise rule as foundational to the success of Solomon''s reign.","It contrasts self-exalting ambition with the kingly order David affirms."]'::jsonb,
  'It presents wise rule as foundational to the success of Solomon''s reign.',
  'This statement best explains how the chapter contributes to the book''s flow (1 Kings 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 3
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains the chapter''s contribution to the book in 1 Kings 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  3,
  4,
  'Which statement best explains why the chapter is strategically important in 1 Kings 3?',
  '["It advances the temple-centered shape of worship and kingship in Israel.","It turns spoken warnings into visible judgment within the royal story.","It presents wise rule as foundational to the success of Solomon''s reign.","It contrasts self-exalting ambition with the kingly order David affirms."]'::jsonb,
  'It presents wise rule as foundational to the success of Solomon''s reign.',
  'This option best explains the chapter''s strategic importance in the book (1 Kings 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 3
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains why the chapter is strategically important in 1 Kings 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  3,
  4,
  'Which theological reading best fits 1 Kings 3?',
  '["The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter teaches that discernment is a gift to be sought above status and advantage."]'::jsonb,
  'The chapter teaches that discernment is a gift to be sought above status and advantage.',
  'This theological reading best fits the chapter''s themes and developments (1 Kings 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 3
    AND difficulty_stage = 4
    AND prompt = 'Which theological reading best fits 1 Kings 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  3,
  5,
  'Which advanced synthesis best captures the theology of 1 Kings 3?',
  '["The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter teaches that divine judgment is patient, but it does not fail to arrive."]'::jsonb,
  'The chapter teaches that discernment is a gift to be sought above status and advantage.',
  'This is the strongest theological synthesis grounded in the chapter''s notes (1 Kings 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 3
    AND difficulty_stage = 5
    AND prompt = 'Which advanced synthesis best captures the theology of 1 Kings 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  3,
  5,
  'Which book-level synthesis best explains 1 Kings 3?',
  '["It contrasts self-exalting ambition with the kingly order David affirms.","It advances the temple-centered shape of worship and kingship in Israel.","It turns spoken warnings into visible judgment within the royal story.","It presents wise rule as foundational to the success of Solomon''s reign."]'::jsonb,
  'It presents wise rule as foundational to the success of Solomon''s reign.',
  'This is the best book-level synthesis of the chapter''s role (1 Kings 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 3
    AND difficulty_stage = 5
    AND prompt = 'Which book-level synthesis best explains 1 Kings 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  3,
  5,
  'Which high-level reading best explains why 1 Kings 3 is remembered?',
  '["This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","The alliance marked a dangerous return to reliance on the ''broken reed'' of Egypt.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty."]'::jsonb,
  'The alliance marked a dangerous return to reliance on the ''broken reed'' of Egypt.',
  'This high-level reading best explains why the chapter remains significant (1 Kings 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 3
    AND difficulty_stage = 5
    AND prompt = 'Which high-level reading best explains why 1 Kings 3 is remembered?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  3,
  5,
  'Which interpretive conclusion best fits the chapter''s place in 1 Kings 3?',
  '["It presents wise rule as foundational to the success of Solomon''s reign.","It contrasts self-exalting ambition with the kingly order David affirms.","It advances the temple-centered shape of worship and kingship in Israel.","It turns spoken warnings into visible judgment within the royal story."]'::jsonb,
  'It presents wise rule as foundational to the success of Solomon''s reign.',
  'This interpretive conclusion best fits the chapter''s place in the book (1 Kings 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 3
    AND difficulty_stage = 5
    AND prompt = 'Which interpretive conclusion best fits the chapter''s place in 1 Kings 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  3,
  5,
  'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 3?',
  '["The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter teaches that discernment is a gift to be sought above status and advantage."]'::jsonb,
  'The chapter teaches that discernment is a gift to be sought above status and advantage.',
  'This statement best captures the chapter''s lasting theological pressure (1 Kings 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 3
    AND difficulty_stage = 5
    AND prompt = 'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  3,
  5,
  'Which statement best reflects the long-range force of 1 Kings 3?',
  '["This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","The alliance marked a dangerous return to reliance on the ''broken reed'' of Egypt.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty."]'::jsonb,
  'The alliance marked a dangerous return to reliance on the ''broken reed'' of Egypt.',
  'This statement best reflects the chapter''s long-range force within the narrative (1 Kings 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 3
    AND difficulty_stage = 5
    AND prompt = 'Which statement best reflects the long-range force of 1 Kings 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  3,
  5,
  'Which synthesis best joins the factual details and themes of 1 Kings 3?',
  '["The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people."]'::jsonb,
  'The chapter teaches that discernment is a gift to be sought above status and advantage.',
  'This synthesis most successfully joins the chapter''s details and themes (1 Kings 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 3
    AND difficulty_stage = 5
    AND prompt = 'Which synthesis best joins the factual details and themes of 1 Kings 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  4,
  1,
  'How is He listed in 1 Kings 4?',
  '["Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","He is listed as the officer over the territory of Naphtali (1 Kings 4:15)"]'::jsonb,
  'He is listed as the officer over the territory of Naphtali (1 Kings 4:15)',
  'This detail is directly tied to 1 Kings 4:15.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 4
    AND difficulty_stage = 1
    AND prompt = 'How is He listed in 1 Kings 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  4,
  1,
  'What does this mean in 1 Kings 4?',
  '["He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","This marriage cements his status as part of the royal inner circle (1 Kings 4:15)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)"]'::jsonb,
  'This marriage cements his status as part of the royal inner circle (1 Kings 4:15)',
  'This event is part of the chapter''s verse-linked source material (1 Kings 4:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 4
    AND difficulty_stage = 1
    AND prompt = 'What does this mean in 1 Kings 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  4,
  1,
  'Who appears in 1 Kings 4?',
  '["Adonijah","Bathsheba","Solomon","David"]'::jsonb,
  'Solomon',
  'Solomon is listed among the key people for this chapter (1 Kings 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 4
    AND difficulty_stage = 1
    AND prompt = 'Who appears in 1 Kings 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  4,
  1,
  'Which verse is highlighted in 1 Kings 4?',
  '["1 Kings 1:29","1 Kings 4:7","1 Kings 1:5","1 Kings 1:11"]'::jsonb,
  '1 Kings 4:7',
  '1 Kings 4:7 is one of the chapter''s supporting verses.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 4
    AND difficulty_stage = 1
    AND prompt = 'Which verse is highlighted in 1 Kings 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  4,
  1,
  'What theme stands out in 1 Kings 4?',
  '["Royal succession","David''s final days","Covenant legitimacy","Administrative order"]'::jsonb,
  'Administrative order',
  'Administrative order is listed among the chapter themes (1 Kings 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 4
    AND difficulty_stage = 1
    AND prompt = 'What theme stands out in 1 Kings 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  4,
  1,
  'Which title best fits 1 Kings 4?',
  '["Prosperity, administration, and wisdom","Solomon anointed amid succession crisis","David''s charge and Solomon''s first judgments","Solomon asks for wisdom"]'::jsonb,
  'Prosperity, administration, and wisdom',
  'Prosperity, administration, and wisdom is the chapter title in the commentary notes (1 Kings 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 4
    AND difficulty_stage = 1
    AND prompt = 'Which title best fits 1 Kings 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  4,
  1,
  'Whom does He marry in 1 Kings 4?',
  '["Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","He marries Basemath, one of Solomon''s daughters (1 Kings 4:15)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)"]'::jsonb,
  'He marries Basemath, one of Solomon''s daughters (1 Kings 4:15)',
  'This verse-linked detail appears in the source notes for 1 Kings 4:15.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 4
    AND difficulty_stage = 1
    AND prompt = 'Whom does He marry in 1 Kings 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  4,
  2,
  'What happens in 1 Kings 4?',
  '["Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","He continues the priestly and noble legacy of his father Zadok (1 Kings 4:15)"]'::jsonb,
  'He continues the priestly and noble legacy of his father Zadok (1 Kings 4:15)',
  'This detail belongs to the chapter''s source notes (1 Kings 4:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 4
    AND difficulty_stage = 2
    AND prompt = 'What happens in 1 Kings 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  4,
  2,
  'How is Ben-Abinadab named in 1 Kings 4?',
  '["He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Ben-Abinadab is named as the officer over the region of Naphath-dor (1 Kings 4:11)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)"]'::jsonb,
  'Ben-Abinadab is named as the officer over the region of Naphath-dor (1 Kings 4:11)',
  'The source material for 1 Kings 4:11 includes this detail.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 4
    AND difficulty_stage = 2
    AND prompt = 'How is Ben-Abinadab named in 1 Kings 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  4,
  2,
  'Which phrase is used in 1 Kings 4?',
  '["Nathan the prophet","one officer in the land","Let Solomon my son reign","Zadok the priest"]'::jsonb,
  'one officer in the land',
  'This phrase appears among the chapter''s evidence phrases (1 Kings 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 4
    AND difficulty_stage = 2
    AND prompt = 'Which phrase is used in 1 Kings 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  4,
  2,
  'What does Solomon appoint in 1 Kings 4?',
  '["Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people.","Solomon appoints officials over the kingdom''s needs.","Adonijah attempts to claim the throne without David''s approval."]'::jsonb,
  'Solomon appoints officials over the kingdom''s needs.',
  'This key point is part of the commentary notes for the chapter (1 Kings 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 4
    AND difficulty_stage = 2
    AND prompt = 'What does Solomon appoint in 1 Kings 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  4,
  2,
  'What scene appears in 1 Kings 4?',
  '["Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Solomon had twelve officers over all Israel (1 Kings 4:7)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)"]'::jsonb,
  'Solomon had twelve officers over all Israel (1 Kings 4:7)',
  'This scene is tied to 1 Kings 4:7.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 4
    AND difficulty_stage = 2
    AND prompt = 'What scene appears in 1 Kings 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  4,
  2,
  'What did his faithful service lead to in 1 Kings 4?',
  '["This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","His faithful service to David led to a position of great honor in the next generation."]'::jsonb,
  'His faithful service to David led to a position of great honor in the next generation.',
  'This significance statement is attached to verse-linked material from this chapter (1 Kings 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 4
    AND difficulty_stage = 2
    AND prompt = 'What did his faithful service lead to in 1 Kings 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  4,
  2,
  'Which summary best fits 1 Kings 4?',
  '["In the reign of Solomon, Ahimaaz serves as a high-level official over a district.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king."]'::jsonb,
  'In the reign of Solomon, Ahimaaz serves as a high-level official over a district.',
  'This summary line comes from source material connected to 1 Kings 4:7.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 4
    AND difficulty_stage = 2
    AND prompt = 'Which summary best fits 1 Kings 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  4,
  3,
  'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 4?',
  '["Zadok the priest","Nathan the prophet","Judah and Israel were many","Let Solomon my son reign"]'::jsonb,
  'Judah and Israel were many',
  'This phrase most directly reflects the chapter''s focal line (1 Kings 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 4
    AND difficulty_stage = 3
    AND prompt = 'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  4,
  3,
  'Which key point best summarizes what 1 Kings 4 emphasizes?',
  '["Each district provides food for the royal household.","Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people."]'::jsonb,
  'Each district provides food for the royal household.',
  'This key point best captures the emphasis of the chapter summary (1 Kings 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 4
    AND difficulty_stage = 3
    AND prompt = 'Which key point best summarizes what 1 Kings 4 emphasizes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  4,
  3,
  'Which line best explains why the events of 1 Kings 4 matter?',
  '["This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","His faithful service to David led to a position of great honor in the next generation.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty."]'::jsonb,
  'His faithful service to David led to a position of great honor in the next generation.',
  'This significance line best explains the chapter''s weight (1 Kings 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 4
    AND difficulty_stage = 3
    AND prompt = 'Which line best explains why the events of 1 Kings 4 matter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  4,
  3,
  'Which statement best captures the chapter''s main action in 1 Kings 4?',
  '["Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","In the reign of Solomon, Ahimaaz serves as a high-level official over a district."]'::jsonb,
  'In the reign of Solomon, Ahimaaz serves as a high-level official over a district.',
  'This summary best fits the chapter''s core movement (1 Kings 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 4
    AND difficulty_stage = 3
    AND prompt = 'Which statement best captures the chapter''s main action in 1 Kings 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  4,
  3,
  'Which statement best matches the leadership pressure in 1 Kings 4?',
  '["Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people.","The land enjoys peace under Solomon''s rule."]'::jsonb,
  'The land enjoys peace under Solomon''s rule.',
  'This statement best matches the chapter''s leadership pressure (1 Kings 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 4
    AND difficulty_stage = 3
    AND prompt = 'Which statement best matches the leadership pressure in 1 Kings 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  4,
  3,
  'Which summary statement best fits the movement of 1 Kings 4?',
  '["At Gibeon, Solomon asks God for a listening heart rather than riches, long life, or victory over enemies. God grants him unmatched wisdom along with wealth and honor because he asked for discernment to govern well. His first judgment between two women proves that the gift is real and that the people can trust his rule.","Solomon''s kingdom is organized through a wide network of officials, districts, and provisions that keep the royal court well supplied. Peace extends throughout the land, and the king''s wisdom surpasses that of the surrounding sages. His rule is marked by order, abundance, and a reputation that draws admiration from every direction.","As David grows old, Adonijah tries to seize the throne, but Nathan, Bathsheba, Zadok, and Benaiah move quickly to secure Solomon''s anointing. David publicly confirms Solomon as his chosen successor, and the people celebrate the new king. The chapter closes with Adonijah seeking mercy as Solomon begins his reign with legitimacy and peace.","David gives Solomon final instructions to walk faithfully, guard the kingdom, and deal wisely with unresolved matters in the court. Solomon secures his throne by removing threats from Adonijah, Abiathar, Joab, and Shimei. The chapter shows that the new king''s rule must be rooted in obedience, justice, and discernment."]'::jsonb,
  'Solomon''s kingdom is organized through a wide network of officials, districts, and provisions that keep the royal court well supplied. Peace extends throughout the land, and the king''s wisdom surpasses that of the surrounding sages. His rule is marked by order, abundance, and a reputation that draws admiration from every direction.',
  'This is the chapter summary for 1 Kings 4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 4
    AND difficulty_stage = 3
    AND prompt = 'Which summary statement best fits the movement of 1 Kings 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  4,
  3,
  'Which theme best interprets the events of 1 Kings 4?',
  '["Covenant legitimacy","Administrative order","Royal succession","David''s final days"]'::jsonb,
  'Administrative order',
  'Administrative order is the best thematic lens supplied in the notes (1 Kings 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 4
    AND difficulty_stage = 3
    AND prompt = 'Which theme best interprets the events of 1 Kings 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  4,
  4,
  'How does 1 Kings 4 function in the wider narrative of 1 Kings?',
  '["It contrasts self-exalting ambition with the kingly order David affirms.","It advances the temple-centered shape of worship and kingship in Israel.","It turns spoken warnings into visible judgment within the royal story.","It presents wise rule as foundational to the success of Solomon''s reign."]'::jsonb,
  'It presents wise rule as foundational to the success of Solomon''s reign.',
  'This option best fits the chapter''s narrative role within 1 Kings (1 Kings 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 4
    AND difficulty_stage = 4
    AND prompt = 'How does 1 Kings 4 function in the wider narrative of 1 Kings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  4,
  4,
  'Which claim best fits the chapter''s larger significance in 1 Kings 4?',
  '["As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","In the reign of Solomon, Ahimaaz serves as a high-level official over a district.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne."]'::jsonb,
  'In the reign of Solomon, Ahimaaz serves as a high-level official over a district.',
  'This claim best fits the chapter''s larger significance in context (1 Kings 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 4
    AND difficulty_stage = 4
    AND prompt = 'Which claim best fits the chapter''s larger significance in 1 Kings 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  4,
  4,
  'Which conclusion best matches the covenant pressure visible in 1 Kings 4?',
  '["The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter teaches that divine judgment is patient, but it does not fail to arrive."]'::jsonb,
  'The chapter teaches that discernment is a gift to be sought above status and advantage.',
  'This conclusion best matches the chapter''s covenant pressure (1 Kings 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 4
    AND difficulty_stage = 4
    AND prompt = 'Which conclusion best matches the covenant pressure visible in 1 Kings 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  4,
  4,
  'Which reading best connects the chapter''s facts and themes in 1 Kings 4?',
  '["This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","His faithful service to David led to a position of great honor in the next generation."]'::jsonb,
  'His faithful service to David led to a position of great honor in the next generation.',
  'This reading best connects the chapter''s verse-linked facts and its meaning (1 Kings 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 4
    AND difficulty_stage = 4
    AND prompt = 'Which reading best connects the chapter''s facts and themes in 1 Kings 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  4,
  4,
  'Which statement best explains the chapter''s contribution to the book in 1 Kings 4?',
  '["It turns spoken warnings into visible judgment within the royal story.","It presents wise rule as foundational to the success of Solomon''s reign.","It contrasts self-exalting ambition with the kingly order David affirms.","It advances the temple-centered shape of worship and kingship in Israel."]'::jsonb,
  'It presents wise rule as foundational to the success of Solomon''s reign.',
  'This statement best explains how the chapter contributes to the book''s flow (1 Kings 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 4
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains the chapter''s contribution to the book in 1 Kings 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  4,
  4,
  'Which statement best explains why the chapter is strategically important in 1 Kings 4?',
  '["It turns spoken warnings into visible judgment within the royal story.","It presents wise rule as foundational to the success of Solomon''s reign.","It contrasts self-exalting ambition with the kingly order David affirms.","It advances the temple-centered shape of worship and kingship in Israel."]'::jsonb,
  'It presents wise rule as foundational to the success of Solomon''s reign.',
  'This option best explains the chapter''s strategic importance in the book (1 Kings 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 4
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains why the chapter is strategically important in 1 Kings 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  4,
  4,
  'Which theological reading best fits 1 Kings 4?',
  '["The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force."]'::jsonb,
  'The chapter teaches that discernment is a gift to be sought above status and advantage.',
  'This theological reading best fits the chapter''s themes and developments (1 Kings 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 4
    AND difficulty_stage = 4
    AND prompt = 'Which theological reading best fits 1 Kings 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  4,
  5,
  'Which advanced synthesis best captures the theology of 1 Kings 4?',
  '["The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter teaches that discernment is a gift to be sought above status and advantage."]'::jsonb,
  'The chapter teaches that discernment is a gift to be sought above status and advantage.',
  'This is the strongest theological synthesis grounded in the chapter''s notes (1 Kings 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 4
    AND difficulty_stage = 5
    AND prompt = 'Which advanced synthesis best captures the theology of 1 Kings 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  4,
  5,
  'Which book-level synthesis best explains 1 Kings 4?',
  '["It advances the temple-centered shape of worship and kingship in Israel.","It turns spoken warnings into visible judgment within the royal story.","It presents wise rule as foundational to the success of Solomon''s reign.","It contrasts self-exalting ambition with the kingly order David affirms."]'::jsonb,
  'It presents wise rule as foundational to the success of Solomon''s reign.',
  'This is the best book-level synthesis of the chapter''s role (1 Kings 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 4
    AND difficulty_stage = 5
    AND prompt = 'Which book-level synthesis best explains 1 Kings 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  4,
  5,
  'Which high-level reading best explains why 1 Kings 4 is remembered?',
  '["This feast was a formal attempt to stage a coup against David''s intentions.","His faithful service to David led to a position of great honor in the next generation.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride."]'::jsonb,
  'His faithful service to David led to a position of great honor in the next generation.',
  'This high-level reading best explains why the chapter remains significant (1 Kings 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 4
    AND difficulty_stage = 5
    AND prompt = 'Which high-level reading best explains why 1 Kings 4 is remembered?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  4,
  5,
  'Which interpretive conclusion best fits the chapter''s place in 1 Kings 4?',
  '["It contrasts self-exalting ambition with the kingly order David affirms.","It advances the temple-centered shape of worship and kingship in Israel.","It turns spoken warnings into visible judgment within the royal story.","It presents wise rule as foundational to the success of Solomon''s reign."]'::jsonb,
  'It presents wise rule as foundational to the success of Solomon''s reign.',
  'This interpretive conclusion best fits the chapter''s place in the book (1 Kings 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 4
    AND difficulty_stage = 5
    AND prompt = 'Which interpretive conclusion best fits the chapter''s place in 1 Kings 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  4,
  5,
  'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 4?',
  '["The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force."]'::jsonb,
  'The chapter teaches that discernment is a gift to be sought above status and advantage.',
  'This statement best captures the chapter''s lasting theological pressure (1 Kings 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 4
    AND difficulty_stage = 5
    AND prompt = 'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  4,
  5,
  'Which statement best reflects the long-range force of 1 Kings 4?',
  '["This feast was a formal attempt to stage a coup against David''s intentions.","His faithful service to David led to a position of great honor in the next generation.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride."]'::jsonb,
  'His faithful service to David led to a position of great honor in the next generation.',
  'This statement best reflects the chapter''s long-range force within the narrative (1 Kings 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 4
    AND difficulty_stage = 5
    AND prompt = 'Which statement best reflects the long-range force of 1 Kings 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  4,
  5,
  'Which synthesis best joins the factual details and themes of 1 Kings 4?',
  '["The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter teaches that divine judgment is patient, but it does not fail to arrive."]'::jsonb,
  'The chapter teaches that discernment is a gift to be sought above status and advantage.',
  'This synthesis most successfully joins the chapter''s details and themes (1 Kings 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 4
    AND difficulty_stage = 5
    AND prompt = 'Which synthesis best joins the factual details and themes of 1 Kings 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  5,
  1,
  'What does Hiram send in 1 Kings 5?',
  '["Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Hiram sends his servants to Solomon after the coronation (1 Kings 5:1)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)"]'::jsonb,
  'Hiram sends his servants to Solomon after the coronation (1 Kings 5:1)',
  'This detail is directly tied to 1 Kings 5:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 5
    AND difficulty_stage = 1
    AND prompt = 'What does Hiram send in 1 Kings 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  5,
  1,
  'Why does Hiram rejoice in 1 Kings 5?',
  '["Hiram rejoices and blesses the Lord for giving David a wise son (1 Kings 5:7)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)"]'::jsonb,
  'Hiram rejoices and blesses the Lord for giving David a wise son (1 Kings 5:7)',
  'This event is part of the chapter''s verse-linked source material (1 Kings 5:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 5
    AND difficulty_stage = 1
    AND prompt = 'Why does Hiram rejoice in 1 Kings 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  5,
  1,
  'Who appears in 1 Kings 5?',
  '["Bathsheba","Solomon","David","Adonijah"]'::jsonb,
  'Solomon',
  'Solomon is listed among the key people for this chapter (1 Kings 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 5
    AND difficulty_stage = 1
    AND prompt = 'Who appears in 1 Kings 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  5,
  1,
  'Which verse is highlighted in 1 Kings 5?',
  '["1 Kings 5:3","1 Kings 1:5","1 Kings 1:11","1 Kings 1:29"]'::jsonb,
  '1 Kings 5:3',
  '1 Kings 5:3 is one of the chapter''s supporting verses.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 5
    AND difficulty_stage = 1
    AND prompt = 'Which verse is highlighted in 1 Kings 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  5,
  1,
  'What theme stands out in 1 Kings 5?',
  '["David''s final days","Covenant legitimacy","Peaceful cooperation","Royal succession"]'::jsonb,
  'Peaceful cooperation',
  'Peaceful cooperation is listed among the chapter themes (1 Kings 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 5
    AND difficulty_stage = 1
    AND prompt = 'What theme stands out in 1 Kings 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  5,
  1,
  'Which title best fits 1 Kings 5?',
  '["Solomon anointed amid succession crisis","David''s charge and Solomon''s first judgments","Solomon asks for wisdom","Temple preparations with Hiram"]'::jsonb,
  'Temple preparations with Hiram',
  'Temple preparations with Hiram is the chapter title in the commentary notes (1 Kings 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 5
    AND difficulty_stage = 1
    AND prompt = 'Which title best fits 1 Kings 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  5,
  1,
  'What does Solomon request in 1 Kings 5?',
  '["He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Solomon requests cedar and cypress timber from Lebanon (1 Kings 5:6)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)"]'::jsonb,
  'Solomon requests cedar and cypress timber from Lebanon (1 Kings 5:6)',
  'This verse-linked detail appears in the source notes for 1 Kings 5:6.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 5
    AND difficulty_stage = 1
    AND prompt = 'What does Solomon request in 1 Kings 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  5,
  2,
  'What happens in 1 Kings 5?',
  '["Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","They make a formal covenant of peace between the two nations (1 Kings 5:12)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)"]'::jsonb,
  'They make a formal covenant of peace between the two nations (1 Kings 5:12)',
  'This detail belongs to the chapter''s source notes (1 Kings 5:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 5
    AND difficulty_stage = 2
    AND prompt = 'What happens in 1 Kings 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  5,
  2,
  'What detail appears in 1 Kings 5?',
  '["Hiram''s men float the logs in rafts by sea to the port of Joppa (1 Kings 5:9)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)"]'::jsonb,
  'Hiram''s men float the logs in rafts by sea to the port of Joppa (1 Kings 5:9)',
  'The source material for 1 Kings 5:9 includes this detail.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 5
    AND difficulty_stage = 2
    AND prompt = 'What detail appears in 1 Kings 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  5,
  2,
  'Which phrase is used in 1 Kings 5?',
  '["the LORD gave him rest","Let Solomon my son reign","Zadok the priest","Nathan the prophet"]'::jsonb,
  'the LORD gave him rest',
  'This phrase appears among the chapter''s evidence phrases (1 Kings 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 5
    AND difficulty_stage = 2
    AND prompt = 'Which phrase is used in 1 Kings 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  5,
  2,
  'What does Hiram supply in 1 Kings 5?',
  '["Solomon is anointed king and proclaimed by the people.","Hiram supplies cedar and skilled labor.","Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows."]'::jsonb,
  'Hiram supplies cedar and skilled labor.',
  'This key point is part of the commentary notes for the chapter (1 Kings 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 5
    AND difficulty_stage = 2
    AND prompt = 'What does Hiram supply in 1 Kings 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  5,
  2,
  'What results from this in 1 Kings 5?',
  '["He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","His servants work alongside Solomon''s 30,000 laborers (1 Kings 5:13-14)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)"]'::jsonb,
  'His servants work alongside Solomon''s 30,000 laborers (1 Kings 5:13-14)',
  'This scene is tied to 1 Kings 5:13-14.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 5
    AND difficulty_stage = 2
    AND prompt = 'What results from this in 1 Kings 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  5,
  2,
  'What did Hiram provide in 1 Kings 5?',
  '["This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","Hiram provided the raw materials that were essential for the House of God.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty."]'::jsonb,
  'Hiram provided the raw materials that were essential for the House of God.',
  'This significance statement is attached to verse-linked material from this chapter (1 Kings 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 5
    AND difficulty_stage = 2
    AND prompt = 'What did Hiram provide in 1 Kings 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  5,
  2,
  'What does Upon Solomon''s accession, Hiram enter into in 1 Kings 5?',
  '["Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Upon Solomon''s accession, Hiram enters into a massive diplomatic and trade agreement for the Temple."]'::jsonb,
  'Upon Solomon''s accession, Hiram enters into a massive diplomatic and trade agreement for the Temple.',
  'This summary line comes from source material connected to 1 Kings 5:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 5
    AND difficulty_stage = 2
    AND prompt = 'What does Upon Solomon''s accession, Hiram enter into in 1 Kings 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  5,
  3,
  'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 5?',
  '["Nathan the prophet","there is no adversary","Let Solomon my son reign","Zadok the priest"]'::jsonb,
  'there is no adversary',
  'This phrase most directly reflects the chapter''s focal line (1 Kings 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 5
    AND difficulty_stage = 3
    AND prompt = 'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  5,
  3,
  'Which key point best summarizes what 1 Kings 5 emphasizes?',
  '["Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people.","Solomon organizes a large workforce for the project."]'::jsonb,
  'Solomon organizes a large workforce for the project.',
  'This key point best captures the emphasis of the chapter summary (1 Kings 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 5
    AND difficulty_stage = 3
    AND prompt = 'Which key point best summarizes what 1 Kings 5 emphasizes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  5,
  3,
  'Which line best explains why the events of 1 Kings 5 matter?',
  '["This feast was a formal attempt to stage a coup against David''s intentions.","Hiram provided the raw materials that were essential for the House of God.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride."]'::jsonb,
  'Hiram provided the raw materials that were essential for the House of God.',
  'This significance line best explains the chapter''s weight (1 Kings 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 5
    AND difficulty_stage = 3
    AND prompt = 'Which line best explains why the events of 1 Kings 5 matter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  5,
  3,
  'Which statement best captures the chapter''s main action in 1 Kings 5?',
  '["As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Upon Solomon''s accession, Hiram enters into a massive diplomatic and trade agreement for the Temple.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne."]'::jsonb,
  'Upon Solomon''s accession, Hiram enters into a massive diplomatic and trade agreement for the Temple.',
  'This summary best fits the chapter''s core movement (1 Kings 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 5
    AND difficulty_stage = 3
    AND prompt = 'Which statement best captures the chapter''s main action in 1 Kings 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  5,
  3,
  'Which statement best matches the leadership pressure in 1 Kings 5?',
  '["Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people.","The LORD gives Solomon rest on every side.","Adonijah attempts to claim the throne without David''s approval."]'::jsonb,
  'The LORD gives Solomon rest on every side.',
  'This statement best matches the chapter''s leadership pressure (1 Kings 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 5
    AND difficulty_stage = 3
    AND prompt = 'Which statement best matches the leadership pressure in 1 Kings 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  5,
  3,
  'Which summary statement best fits the movement of 1 Kings 5?',
  '["Solomon secures peace with Hiram of Tyre and begins gathering cedar, labor, and supplies for the temple. Israel and Lebanon cooperate so that a house for the LORD can be built without war or distraction. The chapter emphasizes orderly preparation and international partnership under God''s blessing.","As David grows old, Adonijah tries to seize the throne, but Nathan, Bathsheba, Zadok, and Benaiah move quickly to secure Solomon''s anointing. David publicly confirms Solomon as his chosen successor, and the people celebrate the new king. The chapter closes with Adonijah seeking mercy as Solomon begins his reign with legitimacy and peace.","David gives Solomon final instructions to walk faithfully, guard the kingdom, and deal wisely with unresolved matters in the court. Solomon secures his throne by removing threats from Adonijah, Abiathar, Joab, and Shimei. The chapter shows that the new king''s rule must be rooted in obedience, justice, and discernment.","At Gibeon, Solomon asks God for a listening heart rather than riches, long life, or victory over enemies. God grants him unmatched wisdom along with wealth and honor because he asked for discernment to govern well. His first judgment between two women proves that the gift is real and that the people can trust his rule."]'::jsonb,
  'Solomon secures peace with Hiram of Tyre and begins gathering cedar, labor, and supplies for the temple. Israel and Lebanon cooperate so that a house for the LORD can be built without war or distraction. The chapter emphasizes orderly preparation and international partnership under God''s blessing.',
  'This is the chapter summary for 1 Kings 5.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 5
    AND difficulty_stage = 3
    AND prompt = 'Which summary statement best fits the movement of 1 Kings 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  5,
  3,
  'Which theme best interprets the events of 1 Kings 5?',
  '["Peaceful cooperation","Royal succession","David''s final days","Covenant legitimacy"]'::jsonb,
  'Peaceful cooperation',
  'Peaceful cooperation is the best thematic lens supplied in the notes (1 Kings 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 5
    AND difficulty_stage = 3
    AND prompt = 'Which theme best interprets the events of 1 Kings 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  5,
  4,
  'How does 1 Kings 5 function in the wider narrative of 1 Kings?',
  '["It presents wise rule as foundational to the success of Solomon''s reign.","It turns spoken warnings into visible judgment within the royal story.","It advances the temple-centered shape of worship and kingship in Israel.","It contrasts self-exalting ambition with the kingly order David affirms."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This option best fits the chapter''s narrative role within 1 Kings (1 Kings 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 5
    AND difficulty_stage = 4
    AND prompt = 'How does 1 Kings 5 function in the wider narrative of 1 Kings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  5,
  4,
  'Which claim best fits the chapter''s larger significance in 1 Kings 5?',
  '["Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Upon Solomon''s accession, Hiram enters into a massive diplomatic and trade agreement for the Temple.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following."]'::jsonb,
  'Upon Solomon''s accession, Hiram enters into a massive diplomatic and trade agreement for the Temple.',
  'This claim best fits the chapter''s larger significance in context (1 Kings 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 5
    AND difficulty_stage = 4
    AND prompt = 'Which claim best fits the chapter''s larger significance in 1 Kings 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  5,
  4,
  'Which conclusion best matches the covenant pressure visible in 1 Kings 5?',
  '["The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This conclusion best matches the chapter''s covenant pressure (1 Kings 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 5
    AND difficulty_stage = 4
    AND prompt = 'Which conclusion best matches the covenant pressure visible in 1 Kings 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  5,
  4,
  'Which reading best connects the chapter''s facts and themes in 1 Kings 5?',
  '["This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","Hiram provided the raw materials that were essential for the House of God.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty."]'::jsonb,
  'Hiram provided the raw materials that were essential for the House of God.',
  'This reading best connects the chapter''s verse-linked facts and its meaning (1 Kings 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 5
    AND difficulty_stage = 4
    AND prompt = 'Which reading best connects the chapter''s facts and themes in 1 Kings 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  5,
  4,
  'Which statement best explains the chapter''s contribution to the book in 1 Kings 5?',
  '["It advances the temple-centered shape of worship and kingship in Israel.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It turns spoken warnings into visible judgment within the royal story."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This statement best explains how the chapter contributes to the book''s flow (1 Kings 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 5
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains the chapter''s contribution to the book in 1 Kings 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  5,
  4,
  'Which statement best explains why the chapter is strategically important in 1 Kings 5?',
  '["It advances the temple-centered shape of worship and kingship in Israel.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It turns spoken warnings into visible judgment within the royal story."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This option best explains the chapter''s strategic importance in the book (1 Kings 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 5
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains why the chapter is strategically important in 1 Kings 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  5,
  4,
  'Which theological reading best fits 1 Kings 5?',
  '["The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This theological reading best fits the chapter''s themes and developments (1 Kings 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 5
    AND difficulty_stage = 4
    AND prompt = 'Which theological reading best fits 1 Kings 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  5,
  5,
  'Which advanced synthesis best captures the theology of 1 Kings 5?',
  '["The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This is the strongest theological synthesis grounded in the chapter''s notes (1 Kings 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 5
    AND difficulty_stage = 5
    AND prompt = 'Which advanced synthesis best captures the theology of 1 Kings 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  5,
  5,
  'Which book-level synthesis best explains 1 Kings 5?',
  '["It turns spoken warnings into visible judgment within the royal story.","It advances the temple-centered shape of worship and kingship in Israel.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This is the best book-level synthesis of the chapter''s role (1 Kings 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 5
    AND difficulty_stage = 5
    AND prompt = 'Which book-level synthesis best explains 1 Kings 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  5,
  5,
  'Which high-level reading best explains why 1 Kings 5 is remembered?',
  '["Hiram provided the raw materials that were essential for the House of God.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions."]'::jsonb,
  'Hiram provided the raw materials that were essential for the House of God.',
  'This high-level reading best explains why the chapter remains significant (1 Kings 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 5
    AND difficulty_stage = 5
    AND prompt = 'Which high-level reading best explains why 1 Kings 5 is remembered?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  5,
  5,
  'Which interpretive conclusion best fits the chapter''s place in 1 Kings 5?',
  '["It presents wise rule as foundational to the success of Solomon''s reign.","It turns spoken warnings into visible judgment within the royal story.","It advances the temple-centered shape of worship and kingship in Israel.","It contrasts self-exalting ambition with the kingly order David affirms."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This interpretive conclusion best fits the chapter''s place in the book (1 Kings 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 5
    AND difficulty_stage = 5
    AND prompt = 'Which interpretive conclusion best fits the chapter''s place in 1 Kings 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  5,
  5,
  'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 5?',
  '["The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This statement best captures the chapter''s lasting theological pressure (1 Kings 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 5
    AND difficulty_stage = 5
    AND prompt = 'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  5,
  5,
  'Which statement best reflects the long-range force of 1 Kings 5?',
  '["Hiram provided the raw materials that were essential for the House of God.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions."]'::jsonb,
  'Hiram provided the raw materials that were essential for the House of God.',
  'This statement best reflects the chapter''s long-range force within the narrative (1 Kings 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 5
    AND difficulty_stage = 5
    AND prompt = 'Which statement best reflects the long-range force of 1 Kings 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  5,
  5,
  'Which synthesis best joins the factual details and themes of 1 Kings 5?',
  '["The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This synthesis most successfully joins the chapter''s details and themes (1 Kings 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 5
    AND difficulty_stage = 5
    AND prompt = 'Which synthesis best joins the factual details and themes of 1 Kings 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  6,
  1,
  'What does Solomon build in 1 Kings 6?',
  '["He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Solomon builds the Temple on Mount Moriah over seven years (1 Kings 6:38)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)"]'::jsonb,
  'Solomon builds the Temple on Mount Moriah over seven years (1 Kings 6:38)',
  'This detail is directly tied to 1 Kings 6:38.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 6
    AND difficulty_stage = 1
    AND prompt = 'What does Solomon build in 1 Kings 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  6,
  1,
  'What does Jerusalem become in 1 Kings 6?',
  '["Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Jerusalem becomes the destination for the three annual feasts of Israel (Deuteronomy 16:16)"]'::jsonb,
  'Jerusalem becomes the destination for the three annual feasts of Israel (Deuteronomy 16:16)',
  'This event is part of the chapter''s verse-linked source material (1 Kings 6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 6
    AND difficulty_stage = 1
    AND prompt = 'What does Jerusalem become in 1 Kings 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  6,
  1,
  'Who appears in 1 Kings 6?',
  '["Solomon","David","Adonijah","Bathsheba"]'::jsonb,
  'Solomon',
  'Solomon is listed among the key people for this chapter (1 Kings 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 6
    AND difficulty_stage = 1
    AND prompt = 'Who appears in 1 Kings 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  6,
  1,
  'Which verse is highlighted in 1 Kings 6?',
  '["1 Kings 1:5","1 Kings 1:11","1 Kings 1:29","1 Kings 6:1"]'::jsonb,
  '1 Kings 6:1',
  '1 Kings 6:1 is one of the chapter''s supporting verses.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 6
    AND difficulty_stage = 1
    AND prompt = 'Which verse is highlighted in 1 Kings 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  6,
  1,
  'What theme stands out in 1 Kings 6?',
  '["Covenant legitimacy","Holy architecture","Royal succession","David''s final days"]'::jsonb,
  'Holy architecture',
  'Holy architecture is listed among the chapter themes (1 Kings 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 6
    AND difficulty_stage = 1
    AND prompt = 'What theme stands out in 1 Kings 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  6,
  1,
  'Which title best fits 1 Kings 6?',
  '["David''s charge and Solomon''s first judgments","Solomon asks for wisdom","The temple takes shape","Solomon anointed amid succession crisis"]'::jsonb,
  'The temple takes shape',
  'The temple takes shape is the chapter title in the commentary notes (1 Kings 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 6
    AND difficulty_stage = 1
    AND prompt = 'Which title best fits 1 Kings 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  6,
  1,
  'What does the glory cloud fill in 1 Kings 6?',
  '["The glory cloud of the Lord fills the house at the dedication (1 Kings 8:10-11)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)"]'::jsonb,
  'The glory cloud of the Lord fills the house at the dedication (1 Kings 8:10-11)',
  'This verse-linked detail appears in the source notes for 1 Kings 8:10-11.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 6
    AND difficulty_stage = 1
    AND prompt = 'What does the glory cloud fill in 1 Kings 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  6,
  2,
  'What happens in 1 Kings 6?',
  '["He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","The city reaches its zenith of wealth and international fame (1 Kings 10:23-27)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)"]'::jsonb,
  'The city reaches its zenith of wealth and international fame (1 Kings 10:23-27)',
  'This detail belongs to the chapter''s source notes (1 Kings 10:23-27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 6
    AND difficulty_stage = 2
    AND prompt = 'What happens in 1 Kings 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  6,
  2,
  'What does the glory cloud fill in 1 Kings 6?',
  '["Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","The glory cloud of the Lord fills the house at the dedication (1 Kings 8:10-11)"]'::jsonb,
  'The glory cloud of the Lord fills the house at the dedication (1 Kings 8:10-11)',
  'The source material for 1 Kings 8:10-11 includes this detail.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 6
    AND difficulty_stage = 2
    AND prompt = 'What does the glory cloud fill in 1 Kings 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  6,
  2,
  'Which phrase is used in 1 Kings 6?',
  '["Let Solomon my son reign","Zadok the priest","Nathan the prophet","in the fourth year"]'::jsonb,
  'in the fourth year',
  'This phrase appears among the chapter''s evidence phrases (1 Kings 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 6
    AND difficulty_stage = 2
    AND prompt = 'Which phrase is used in 1 Kings 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  6,
  2,
  'How is the temple built in 1 Kings 6?',
  '["The temple is built according to exact measurements.","Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people."]'::jsonb,
  'The temple is built according to exact measurements.',
  'This key point is part of the commentary notes for the chapter (1 Kings 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 6
    AND difficulty_stage = 2
    AND prompt = 'How is the temple built in 1 Kings 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  6,
  2,
  'What does Solomon build in 1 Kings 6?',
  '["Solomon builds the Temple on Mount Moriah over seven years (1 Kings 6:38)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)"]'::jsonb,
  'Solomon builds the Temple on Mount Moriah over seven years (1 Kings 6:38)',
  'This scene is tied to 1 Kings 6:38.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 6
    AND difficulty_stage = 2
    AND prompt = 'What does Solomon build in 1 Kings 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  6,
  2,
  'Why does this matter in 1 Kings 6?',
  '["This feast was a formal attempt to stage a coup against David''s intentions.","Jerusalem was established as the literal dwelling place of God''s name.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride."]'::jsonb,
  'Jerusalem was established as the literal dwelling place of God''s name.',
  'This significance statement is attached to verse-linked material from this chapter (1 Kings 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 6
    AND difficulty_stage = 2
    AND prompt = 'Why does this matter in 1 Kings 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  6,
  2,
  'What does Solomon construct in 1 Kings 6?',
  '["As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Solomon constructs a permanent house for the presence of the Lord, making Jerusalem the center of global worship.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne."]'::jsonb,
  'Solomon constructs a permanent house for the presence of the Lord, making Jerusalem the center of global worship.',
  'This summary line comes from source material connected to 1 Kings 6:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 6
    AND difficulty_stage = 2
    AND prompt = 'What does Solomon construct in 1 Kings 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  6,
  3,
  'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 6?',
  '["the house, when it was in building","Let Solomon my son reign","Zadok the priest","Nathan the prophet"]'::jsonb,
  'the house, when it was in building',
  'This phrase most directly reflects the chapter''s focal line (1 Kings 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 6
    AND difficulty_stage = 3
    AND prompt = 'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  6,
  3,
  'Which key point best summarizes what 1 Kings 6 emphasizes?',
  '["Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people.","The inner sanctuary is set apart as the holiest place.","Adonijah attempts to claim the throne without David''s approval."]'::jsonb,
  'The inner sanctuary is set apart as the holiest place.',
  'This key point best captures the emphasis of the chapter summary (1 Kings 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 6
    AND difficulty_stage = 3
    AND prompt = 'Which key point best summarizes what 1 Kings 6 emphasizes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  6,
  3,
  'Which line best explains why the events of 1 Kings 6 matter?',
  '["Jerusalem was established as the literal dwelling place of God''s name.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions."]'::jsonb,
  'Jerusalem was established as the literal dwelling place of God''s name.',
  'This significance line best explains the chapter''s weight (1 Kings 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 6
    AND difficulty_stage = 3
    AND prompt = 'Which line best explains why the events of 1 Kings 6 matter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  6,
  3,
  'Which statement best captures the chapter''s main action in 1 Kings 6?',
  '["Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Solomon constructs a permanent house for the presence of the Lord, making Jerusalem the center of global worship.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following."]'::jsonb,
  'Solomon constructs a permanent house for the presence of the Lord, making Jerusalem the center of global worship.',
  'This summary best fits the chapter''s core movement (1 Kings 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 6
    AND difficulty_stage = 3
    AND prompt = 'Which statement best captures the chapter''s main action in 1 Kings 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  6,
  3,
  'Which statement best matches the leadership pressure in 1 Kings 6?',
  '["Solomon is anointed king and proclaimed by the people.","Stones are prepared quietly before they are set in place.","Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows."]'::jsonb,
  'Stones are prepared quietly before they are set in place.',
  'This statement best matches the chapter''s leadership pressure (1 Kings 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 6
    AND difficulty_stage = 3
    AND prompt = 'Which statement best matches the leadership pressure in 1 Kings 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  6,
  3,
  'Which summary statement best fits the movement of 1 Kings 6?',
  '["As David grows old, Adonijah tries to seize the throne, but Nathan, Bathsheba, Zadok, and Benaiah move quickly to secure Solomon''s anointing. David publicly confirms Solomon as his chosen successor, and the people celebrate the new king. The chapter closes with Adonijah seeking mercy as Solomon begins his reign with legitimacy and peace.","David gives Solomon final instructions to walk faithfully, guard the kingdom, and deal wisely with unresolved matters in the court. Solomon secures his throne by removing threats from Adonijah, Abiathar, Joab, and Shimei. The chapter shows that the new king''s rule must be rooted in obedience, justice, and discernment.","At Gibeon, Solomon asks God for a listening heart rather than riches, long life, or victory over enemies. God grants him unmatched wisdom along with wealth and honor because he asked for discernment to govern well. His first judgment between two women proves that the gift is real and that the people can trust his rule.","Solomon begins building the temple in careful obedience to the pattern he has received. The measurements, chambers, and inner structure stress holiness, precision, and permanence. The chapter presents the house of God as a place built with reverence and order from the foundation upward."]'::jsonb,
  'Solomon begins building the temple in careful obedience to the pattern he has received. The measurements, chambers, and inner structure stress holiness, precision, and permanence. The chapter presents the house of God as a place built with reverence and order from the foundation upward.',
  'This is the chapter summary for 1 Kings 6.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 6
    AND difficulty_stage = 3
    AND prompt = 'Which summary statement best fits the movement of 1 Kings 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  6,
  3,
  'Which theme best interprets the events of 1 Kings 6?',
  '["Royal succession","David''s final days","Covenant legitimacy","Holy architecture"]'::jsonb,
  'Holy architecture',
  'Holy architecture is the best thematic lens supplied in the notes (1 Kings 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 6
    AND difficulty_stage = 3
    AND prompt = 'Which theme best interprets the events of 1 Kings 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  6,
  4,
  'How does 1 Kings 6 function in the wider narrative of 1 Kings?',
  '["It turns spoken warnings into visible judgment within the royal story.","It advances the temple-centered shape of worship and kingship in Israel.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This option best fits the chapter''s narrative role within 1 Kings (1 Kings 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 6
    AND difficulty_stage = 4
    AND prompt = 'How does 1 Kings 6 function in the wider narrative of 1 Kings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  6,
  4,
  'Which claim best fits the chapter''s larger significance in 1 Kings 6?',
  '["Solomon constructs a permanent house for the presence of the Lord, making Jerusalem the center of global worship.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king."]'::jsonb,
  'Solomon constructs a permanent house for the presence of the Lord, making Jerusalem the center of global worship.',
  'This claim best fits the chapter''s larger significance in context (1 Kings 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 6
    AND difficulty_stage = 4
    AND prompt = 'Which claim best fits the chapter''s larger significance in 1 Kings 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  6,
  4,
  'Which conclusion best matches the covenant pressure visible in 1 Kings 6?',
  '["The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This conclusion best matches the chapter''s covenant pressure (1 Kings 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 6
    AND difficulty_stage = 4
    AND prompt = 'Which conclusion best matches the covenant pressure visible in 1 Kings 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  6,
  4,
  'Which reading best connects the chapter''s facts and themes in 1 Kings 6?',
  '["This feast was a formal attempt to stage a coup against David''s intentions.","Jerusalem was established as the literal dwelling place of God''s name.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride."]'::jsonb,
  'Jerusalem was established as the literal dwelling place of God''s name.',
  'This reading best connects the chapter''s verse-linked facts and its meaning (1 Kings 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 6
    AND difficulty_stage = 4
    AND prompt = 'Which reading best connects the chapter''s facts and themes in 1 Kings 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  6,
  4,
  'Which statement best explains the chapter''s contribution to the book in 1 Kings 6?',
  '["It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It turns spoken warnings into visible judgment within the royal story.","It advances the temple-centered shape of worship and kingship in Israel."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This statement best explains how the chapter contributes to the book''s flow (1 Kings 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 6
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains the chapter''s contribution to the book in 1 Kings 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  6,
  4,
  'Which statement best explains why the chapter is strategically important in 1 Kings 6?',
  '["It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It turns spoken warnings into visible judgment within the royal story.","It advances the temple-centered shape of worship and kingship in Israel."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This option best explains the chapter''s strategic importance in the book (1 Kings 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 6
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains why the chapter is strategically important in 1 Kings 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  6,
  4,
  'Which theological reading best fits 1 Kings 6?',
  '["The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter teaches that divine judgment is patient, but it does not fail to arrive."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This theological reading best fits the chapter''s themes and developments (1 Kings 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 6
    AND difficulty_stage = 4
    AND prompt = 'Which theological reading best fits 1 Kings 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  6,
  5,
  'Which advanced synthesis best captures the theology of 1 Kings 6?',
  '["The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This is the strongest theological synthesis grounded in the chapter''s notes (1 Kings 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 6
    AND difficulty_stage = 5
    AND prompt = 'Which advanced synthesis best captures the theology of 1 Kings 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  6,
  5,
  'Which book-level synthesis best explains 1 Kings 6?',
  '["It advances the temple-centered shape of worship and kingship in Israel.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It turns spoken warnings into visible judgment within the royal story."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This is the best book-level synthesis of the chapter''s role (1 Kings 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 6
    AND difficulty_stage = 5
    AND prompt = 'Which book-level synthesis best explains 1 Kings 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  6,
  5,
  'Which high-level reading best explains why 1 Kings 6 is remembered?',
  '["This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","Jerusalem was established as the literal dwelling place of God''s name."]'::jsonb,
  'Jerusalem was established as the literal dwelling place of God''s name.',
  'This high-level reading best explains why the chapter remains significant (1 Kings 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 6
    AND difficulty_stage = 5
    AND prompt = 'Which high-level reading best explains why 1 Kings 6 is remembered?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  6,
  5,
  'Which interpretive conclusion best fits the chapter''s place in 1 Kings 6?',
  '["It turns spoken warnings into visible judgment within the royal story.","It advances the temple-centered shape of worship and kingship in Israel.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This interpretive conclusion best fits the chapter''s place in the book (1 Kings 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 6
    AND difficulty_stage = 5
    AND prompt = 'Which interpretive conclusion best fits the chapter''s place in 1 Kings 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  6,
  5,
  'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 6?',
  '["The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter teaches that divine judgment is patient, but it does not fail to arrive."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This statement best captures the chapter''s lasting theological pressure (1 Kings 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 6
    AND difficulty_stage = 5
    AND prompt = 'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  6,
  5,
  'Which statement best reflects the long-range force of 1 Kings 6?',
  '["This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","Jerusalem was established as the literal dwelling place of God''s name."]'::jsonb,
  'Jerusalem was established as the literal dwelling place of God''s name.',
  'This statement best reflects the chapter''s long-range force within the narrative (1 Kings 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 6
    AND difficulty_stage = 5
    AND prompt = 'Which statement best reflects the long-range force of 1 Kings 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  6,
  5,
  'Which synthesis best joins the factual details and themes of 1 Kings 6?',
  '["The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This synthesis most successfully joins the chapter''s details and themes (1 Kings 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 6
    AND difficulty_stage = 5
    AND prompt = 'Which synthesis best joins the factual details and themes of 1 Kings 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  7,
  1,
  'What development clearly belongs to 1 Kings 7?',
  '["Two great bronze pillars are set up in the vestibule of the Temple (1 Kings 7:21)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)"]'::jsonb,
  'Two great bronze pillars are set up in the vestibule of the Temple (1 Kings 7:21)',
  'This detail is directly tied to 1 Kings 7:21.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 7
    AND difficulty_stage = 1
    AND prompt = 'What development clearly belongs to 1 Kings 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  7,
  1,
  'Which event is described in 1 Kings 7?',
  '["Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","The name is often interpreted to mean ''In Him is strength'' (1 Kings 7:21)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)"]'::jsonb,
  'The name is often interpreted to mean ''In Him is strength'' (1 Kings 7:21)',
  'This event is part of the chapter''s verse-linked source material (1 Kings 7:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 7
    AND difficulty_stage = 1
    AND prompt = 'Which event is described in 1 Kings 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  7,
  1,
  'Who appears in 1 Kings 7?',
  '["David","Adonijah","Bathsheba","Solomon"]'::jsonb,
  'Solomon',
  'Solomon is listed among the key people for this chapter (1 Kings 7:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 7
    AND difficulty_stage = 1
    AND prompt = 'Who appears in 1 Kings 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  7,
  1,
  'Which verse is highlighted in 1 Kings 7?',
  '["1 Kings 1:11","1 Kings 1:29","1 Kings 7:13","1 Kings 1:5"]'::jsonb,
  '1 Kings 7:13',
  '1 Kings 7:13 is one of the chapter''s supporting verses.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 7
    AND difficulty_stage = 1
    AND prompt = 'Which verse is highlighted in 1 Kings 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  7,
  1,
  'What theme stands out in 1 Kings 7?',
  '["Royal splendor","Royal succession","David''s final days","Covenant legitimacy"]'::jsonb,
  'Royal splendor',
  'Royal splendor is listed among the chapter themes (1 Kings 7:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 7
    AND difficulty_stage = 1
    AND prompt = 'What theme stands out in 1 Kings 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  7,
  1,
  'Which title best fits 1 Kings 7?',
  '["Solomon asks for wisdom","Palace work and temple furnishings","Solomon anointed amid succession crisis","David''s charge and Solomon''s first judgments"]'::jsonb,
  'Palace work and temple furnishings',
  'Palace work and temple furnishings is the chapter title in the commentary notes (1 Kings 7:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 7
    AND difficulty_stage = 1
    AND prompt = 'Which title best fits 1 Kings 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  7,
  1,
  'What is the pillar on the left named in 1 Kings 7?',
  '["Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","The pillar on the left is named Boaz (1 Kings 7:21)"]'::jsonb,
  'The pillar on the left is named Boaz (1 Kings 7:21)',
  'This verse-linked detail appears in the source notes for 1 Kings 7:21.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 7
    AND difficulty_stage = 1
    AND prompt = 'What is the pillar on the left named in 1 Kings 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  7,
  2,
  'What happens in 1 Kings 7?',
  '["The monument preserves his memory in the center of Israel''s worship (1 Kings 7:21)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)"]'::jsonb,
  'The monument preserves his memory in the center of Israel''s worship (1 Kings 7:21)',
  'This detail belongs to the chapter''s source notes (1 Kings 7:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 7
    AND difficulty_stage = 2
    AND prompt = 'What happens in 1 Kings 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  7,
  2,
  'What detail appears in 1 Kings 7?',
  '["Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","The craftsman was the son of a woman of the daughters of Dan and a Tyrian father (2 Chronicles 2:14)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)"]'::jsonb,
  'The craftsman was the son of a woman of the daughters of Dan and a Tyrian father (2 Chronicles 2:14)',
  'The source material for 1 Kings 7 includes this detail.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 7
    AND difficulty_stage = 2
    AND prompt = 'What detail appears in 1 Kings 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  7,
  2,
  'Which phrase is used in 1 Kings 7?',
  '["Zadok the priest","Nathan the prophet","bronze work","Let Solomon my son reign"]'::jsonb,
  'bronze work',
  'This phrase appears among the chapter''s evidence phrases (1 Kings 7:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 7
    AND difficulty_stage = 2
    AND prompt = 'Which phrase is used in 1 Kings 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  7,
  2,
  'What key point stands out in 1 Kings 7?',
  '["Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people.","Solomon''s palace complex takes much longer to describe than the temple furnishings."]'::jsonb,
  'Solomon''s palace complex takes much longer to describe than the temple furnishings.',
  'This key point is part of the commentary notes for the chapter (1 Kings 7:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 7
    AND difficulty_stage = 2
    AND prompt = 'What key point stands out in 1 Kings 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  7,
  2,
  'What does He send in 1 Kings 7?',
  '["Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","He sends Huram-abi, a man of great skill in gold, silver, and bronze (2 Chronicles 2:13-14)"]'::jsonb,
  'He sends Huram-abi, a man of great skill in gold, silver, and bronze (2 Chronicles 2:13-14)',
  'This scene is tied to 1 Kings 7.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 7
    AND difficulty_stage = 2
    AND prompt = 'What does He send in 1 Kings 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  7,
  2,
  'Why does this matter in 1 Kings 7?',
  '["Boaz became a symbol of the strength and stability of the kingdom.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions."]'::jsonb,
  'Boaz became a symbol of the strength and stability of the kingdom.',
  'This significance statement is attached to verse-linked material from this chapter (1 Kings 7:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 7
    AND difficulty_stage = 2
    AND prompt = 'Why does this matter in 1 Kings 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  7,
  2,
  'How does Solomon honor it in 1 Kings 7?',
  '["Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Solomon honors the name of his ancestor by naming one of the Temple pillars after him.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following."]'::jsonb,
  'Solomon honors the name of his ancestor by naming one of the Temple pillars after him.',
  'This summary line comes from source material connected to 1 Kings 7:13.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 7
    AND difficulty_stage = 2
    AND prompt = 'How does Solomon honor it in 1 Kings 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  7,
  3,
  'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 7?',
  '["Let Solomon my son reign","Zadok the priest","Nathan the prophet","the molten sea"]'::jsonb,
  'the molten sea',
  'This phrase most directly reflects the chapter''s focal line (1 Kings 7:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 7
    AND difficulty_stage = 3
    AND prompt = 'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  7,
  3,
  'Which key point best summarizes what 1 Kings 7 emphasizes?',
  '["Solomon is anointed king and proclaimed by the people.","Hiram fashions the bronze work for sacred use.","Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows."]'::jsonb,
  'Hiram fashions the bronze work for sacred use.',
  'This key point best captures the emphasis of the chapter summary (1 Kings 7:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 7
    AND difficulty_stage = 3
    AND prompt = 'Which key point best summarizes what 1 Kings 7 emphasizes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  7,
  3,
  'Which line best explains why the events of 1 Kings 7 matter?',
  '["This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","Boaz became a symbol of the strength and stability of the kingdom."]'::jsonb,
  'Boaz became a symbol of the strength and stability of the kingdom.',
  'This significance line best explains the chapter''s weight (1 Kings 7:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 7
    AND difficulty_stage = 3
    AND prompt = 'Which line best explains why the events of 1 Kings 7 matter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  7,
  3,
  'Which statement best captures the chapter''s main action in 1 Kings 7?',
  '["Solomon honors the name of his ancestor by naming one of the Temple pillars after him.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king."]'::jsonb,
  'Solomon honors the name of his ancestor by naming one of the Temple pillars after him.',
  'This summary best fits the chapter''s core movement (1 Kings 7:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 7
    AND difficulty_stage = 3
    AND prompt = 'Which statement best captures the chapter''s main action in 1 Kings 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  7,
  3,
  'Which statement best matches the leadership pressure in 1 Kings 7?',
  '["The temple is supplied with stands, basins, and vessels.","Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people."]'::jsonb,
  'The temple is supplied with stands, basins, and vessels.',
  'This statement best matches the chapter''s leadership pressure (1 Kings 7:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 7
    AND difficulty_stage = 3
    AND prompt = 'Which statement best matches the leadership pressure in 1 Kings 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  7,
  3,
  'Which summary statement best fits the movement of 1 Kings 7?',
  '["David gives Solomon final instructions to walk faithfully, guard the kingdom, and deal wisely with unresolved matters in the court. Solomon secures his throne by removing threats from Adonijah, Abiathar, Joab, and Shimei. The chapter shows that the new king''s rule must be rooted in obedience, justice, and discernment.","At Gibeon, Solomon asks God for a listening heart rather than riches, long life, or victory over enemies. God grants him unmatched wisdom along with wealth and honor because he asked for discernment to govern well. His first judgment between two women proves that the gift is real and that the people can trust his rule.","Solomon spends years building his own palace complex and then details the bronze artistry that equips the temple. Hiram''s work produces pillars, the bronze sea, stands, and vessels that make worship possible. The chapter highlights both royal magnificence and the careful furnishing of the sacred house.","As David grows old, Adonijah tries to seize the throne, but Nathan, Bathsheba, Zadok, and Benaiah move quickly to secure Solomon''s anointing. David publicly confirms Solomon as his chosen successor, and the people celebrate the new king. The chapter closes with Adonijah seeking mercy as Solomon begins his reign with legitimacy and peace."]'::jsonb,
  'Solomon spends years building his own palace complex and then details the bronze artistry that equips the temple. Hiram''s work produces pillars, the bronze sea, stands, and vessels that make worship possible. The chapter highlights both royal magnificence and the careful furnishing of the sacred house.',
  'This is the chapter summary for 1 Kings 7.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 7
    AND difficulty_stage = 3
    AND prompt = 'Which summary statement best fits the movement of 1 Kings 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  7,
  3,
  'Which theme best interprets the events of 1 Kings 7?',
  '["David''s final days","Covenant legitimacy","Royal splendor","Royal succession"]'::jsonb,
  'Royal splendor',
  'Royal splendor is the best thematic lens supplied in the notes (1 Kings 7:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 7
    AND difficulty_stage = 3
    AND prompt = 'Which theme best interprets the events of 1 Kings 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  7,
  4,
  'How does 1 Kings 7 function in the wider narrative of 1 Kings?',
  '["It advances the temple-centered shape of worship and kingship in Israel.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It turns spoken warnings into visible judgment within the royal story."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This option best fits the chapter''s narrative role within 1 Kings (1 Kings 7:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 7
    AND difficulty_stage = 4
    AND prompt = 'How does 1 Kings 7 function in the wider narrative of 1 Kings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  7,
  4,
  'Which claim best fits the chapter''s larger significance in 1 Kings 7?',
  '["Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Solomon honors the name of his ancestor by naming one of the Temple pillars after him."]'::jsonb,
  'Solomon honors the name of his ancestor by naming one of the Temple pillars after him.',
  'This claim best fits the chapter''s larger significance in context (1 Kings 7:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 7
    AND difficulty_stage = 4
    AND prompt = 'Which claim best fits the chapter''s larger significance in 1 Kings 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  7,
  4,
  'Which conclusion best matches the covenant pressure visible in 1 Kings 7?',
  '["The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This conclusion best matches the chapter''s covenant pressure (1 Kings 7:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 7
    AND difficulty_stage = 4
    AND prompt = 'Which conclusion best matches the covenant pressure visible in 1 Kings 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  7,
  4,
  'Which reading best connects the chapter''s facts and themes in 1 Kings 7?',
  '["Boaz became a symbol of the strength and stability of the kingdom.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions."]'::jsonb,
  'Boaz became a symbol of the strength and stability of the kingdom.',
  'This reading best connects the chapter''s verse-linked facts and its meaning (1 Kings 7:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 7
    AND difficulty_stage = 4
    AND prompt = 'Which reading best connects the chapter''s facts and themes in 1 Kings 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  7,
  4,
  'Which statement best explains the chapter''s contribution to the book in 1 Kings 7?',
  '["It presents wise rule as foundational to the success of Solomon''s reign.","It turns spoken warnings into visible judgment within the royal story.","It advances the temple-centered shape of worship and kingship in Israel.","It contrasts self-exalting ambition with the kingly order David affirms."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This statement best explains how the chapter contributes to the book''s flow (1 Kings 7:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 7
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains the chapter''s contribution to the book in 1 Kings 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  7,
  4,
  'Which statement best explains why the chapter is strategically important in 1 Kings 7?',
  '["It presents wise rule as foundational to the success of Solomon''s reign.","It turns spoken warnings into visible judgment within the royal story.","It advances the temple-centered shape of worship and kingship in Israel.","It contrasts self-exalting ambition with the kingly order David affirms."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This option best explains the chapter''s strategic importance in the book (1 Kings 7:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 7
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains why the chapter is strategically important in 1 Kings 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  7,
  4,
  'Which theological reading best fits 1 Kings 7?',
  '["The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This theological reading best fits the chapter''s themes and developments (1 Kings 7:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 7
    AND difficulty_stage = 4
    AND prompt = 'Which theological reading best fits 1 Kings 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  7,
  5,
  'Which advanced synthesis best captures the theology of 1 Kings 7?',
  '["The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter teaches that divine judgment is patient, but it does not fail to arrive."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This is the strongest theological synthesis grounded in the chapter''s notes (1 Kings 7:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 7
    AND difficulty_stage = 5
    AND prompt = 'Which advanced synthesis best captures the theology of 1 Kings 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  7,
  5,
  'Which book-level synthesis best explains 1 Kings 7?',
  '["It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It turns spoken warnings into visible judgment within the royal story.","It advances the temple-centered shape of worship and kingship in Israel."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This is the best book-level synthesis of the chapter''s role (1 Kings 7:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 7
    AND difficulty_stage = 5
    AND prompt = 'Which book-level synthesis best explains 1 Kings 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  7,
  5,
  'Which high-level reading best explains why 1 Kings 7 is remembered?',
  '["This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","Boaz became a symbol of the strength and stability of the kingdom.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty."]'::jsonb,
  'Boaz became a symbol of the strength and stability of the kingdom.',
  'This high-level reading best explains why the chapter remains significant (1 Kings 7:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 7
    AND difficulty_stage = 5
    AND prompt = 'Which high-level reading best explains why 1 Kings 7 is remembered?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  7,
  5,
  'Which interpretive conclusion best fits the chapter''s place in 1 Kings 7?',
  '["It advances the temple-centered shape of worship and kingship in Israel.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It turns spoken warnings into visible judgment within the royal story."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This interpretive conclusion best fits the chapter''s place in the book (1 Kings 7:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 7
    AND difficulty_stage = 5
    AND prompt = 'Which interpretive conclusion best fits the chapter''s place in 1 Kings 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  7,
  5,
  'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 7?',
  '["The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This statement best captures the chapter''s lasting theological pressure (1 Kings 7:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 7
    AND difficulty_stage = 5
    AND prompt = 'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  7,
  5,
  'Which statement best reflects the long-range force of 1 Kings 7?',
  '["This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","Boaz became a symbol of the strength and stability of the kingdom.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty."]'::jsonb,
  'Boaz became a symbol of the strength and stability of the kingdom.',
  'This statement best reflects the chapter''s long-range force within the narrative (1 Kings 7:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 7
    AND difficulty_stage = 5
    AND prompt = 'Which statement best reflects the long-range force of 1 Kings 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  7,
  5,
  'Which synthesis best joins the factual details and themes of 1 Kings 7?',
  '["The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This synthesis most successfully joins the chapter''s details and themes (1 Kings 7:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 7
    AND difficulty_stage = 5
    AND prompt = 'Which synthesis best joins the factual details and themes of 1 Kings 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  8,
  1,
  'What does He mention in 1 Kings 8?',
  '["Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","He mentions the foreigner who comes from a far country for God''s name (1 Kings 8:41)"]'::jsonb,
  'He mentions the foreigner who comes from a far country for God''s name (1 Kings 8:41)',
  'This detail is directly tied to 1 Kings 8:41.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 8
    AND difficulty_stage = 1
    AND prompt = 'What does He mention in 1 Kings 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  8,
  1,
  'Which event is described in 1 Kings 8?',
  '["He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","The goal is that all peoples of the earth may know God''s name (1 Kings 8:43)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)"]'::jsonb,
  'The goal is that all peoples of the earth may know God''s name (1 Kings 8:43)',
  'This event is part of the chapter''s verse-linked source material (1 Kings 8:43).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 8
    AND difficulty_stage = 1
    AND prompt = 'Which event is described in 1 Kings 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  8,
  1,
  'Who appears in 1 Kings 8?',
  '["Adonijah","Bathsheba","Solomon","David"]'::jsonb,
  'Solomon',
  'Solomon is listed among the key people for this chapter (1 Kings 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 8
    AND difficulty_stage = 1
    AND prompt = 'Who appears in 1 Kings 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  8,
  1,
  'Which verse is highlighted in 1 Kings 8?',
  '["1 Kings 1:29","1 Kings 8:1","1 Kings 1:5","1 Kings 1:11"]'::jsonb,
  '1 Kings 8:1',
  '1 Kings 8:1 is one of the chapter''s supporting verses.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 8
    AND difficulty_stage = 1
    AND prompt = 'Which verse is highlighted in 1 Kings 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  8,
  1,
  'What theme stands out in 1 Kings 8?',
  '["Royal succession","David''s final days","Covenant legitimacy","Ark and presence"]'::jsonb,
  'Ark and presence',
  'Ark and presence is listed among the chapter themes (1 Kings 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 8
    AND difficulty_stage = 1
    AND prompt = 'What theme stands out in 1 Kings 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  8,
  1,
  'Which title best fits 1 Kings 8?',
  '["Ark brought in and temple dedicated","Solomon anointed amid succession crisis","David''s charge and Solomon''s first judgments","Solomon asks for wisdom"]'::jsonb,
  'Ark brought in and temple dedicated',
  'Ark brought in and temple dedicated is the chapter title in the commentary notes (1 Kings 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 8
    AND difficulty_stage = 1
    AND prompt = 'Which title best fits 1 Kings 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  8,
  1,
  'What does He ask God to hear in 1 Kings 8?',
  '["Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","He asks God to hear the foreigner''s prayer (1 Kings 8:43)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)"]'::jsonb,
  'He asks God to hear the foreigner''s prayer (1 Kings 8:43)',
  'This verse-linked detail appears in the source notes for 1 Kings 8:43.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 8
    AND difficulty_stage = 1
    AND prompt = 'What does He ask God to hear in 1 Kings 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  8,
  2,
  'What is the Temple intended to be in 1 Kings 8?',
  '["Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","The Temple is intended to be a ''house of prayer for all peoples'' (Isaiah 56:7)"]'::jsonb,
  'The Temple is intended to be a ''house of prayer for all peoples'' (Isaiah 56:7)',
  'This detail belongs to the chapter''s source notes (1 Kings 8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 8
    AND difficulty_stage = 2
    AND prompt = 'What is the Temple intended to be in 1 Kings 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  8,
  2,
  'Where is the Ark placed in 1 Kings 8?',
  '["He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","The Ark is placed in a tent David pitched for it on the hill (2 Samuel 6:17)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)"]'::jsonb,
  'The Ark is placed in a tent David pitched for it on the hill (2 Samuel 6:17)',
  'The source material for 1 Kings 8 includes this detail.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 8
    AND difficulty_stage = 2
    AND prompt = 'Where is the Ark placed in 1 Kings 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  8,
  2,
  'Which phrase is used in 1 Kings 8?',
  '["Nathan the prophet","the ark of the covenant","Let Solomon my son reign","Zadok the priest"]'::jsonb,
  'the ark of the covenant',
  'This phrase appears among the chapter''s evidence phrases (1 Kings 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 8
    AND difficulty_stage = 2
    AND prompt = 'Which phrase is used in 1 Kings 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  8,
  2,
  'Where is the ark placed in 1 Kings 8?',
  '["Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people.","The ark is placed in the most holy place.","Adonijah attempts to claim the throne without David''s approval."]'::jsonb,
  'The ark is placed in the most holy place.',
  'This key point is part of the commentary notes for the chapter (1 Kings 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 8
    AND difficulty_stage = 2
    AND prompt = 'Where is the ark placed in 1 Kings 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  8,
  2,
  'What scene appears in 1 Kings 8?',
  '["Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","David brings the Ark of the Covenant to Zion with great joy (2 Samuel 6:12)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)"]'::jsonb,
  'David brings the Ark of the Covenant to Zion with great joy (2 Samuel 6:12)',
  'This scene is tied to 1 Kings 8.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 8
    AND difficulty_stage = 2
    AND prompt = 'What scene appears in 1 Kings 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  8,
  2,
  'Why does this matter in 1 Kings 8?',
  '["This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","The Temple was established with a global, missional vision."]'::jsonb,
  'The Temple was established with a global, missional vision.',
  'This significance statement is attached to verse-linked material from this chapter (1 Kings 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 8
    AND difficulty_stage = 2
    AND prompt = 'Why does this matter in 1 Kings 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  8,
  2,
  'What happens during the Temple dedication in 1 Kings 8?',
  '["During the Temple dedication, Solomon prays specifically for the prayers of foreigners.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king."]'::jsonb,
  'During the Temple dedication, Solomon prays specifically for the prayers of foreigners.',
  'This summary line comes from source material connected to 1 Kings 8:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 8
    AND difficulty_stage = 2
    AND prompt = 'What happens during the Temple dedication in 1 Kings 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  8,
  3,
  'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 8?',
  '["Zadok the priest","Nathan the prophet","the glory of the LORD","Let Solomon my son reign"]'::jsonb,
  'the glory of the LORD',
  'This phrase most directly reflects the chapter''s focal line (1 Kings 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 8
    AND difficulty_stage = 3
    AND prompt = 'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  8,
  3,
  'Which key point best summarizes what 1 Kings 8 emphasizes?',
  '["Solomon blesses the assembly and recalls God''s faithfulness.","Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people."]'::jsonb,
  'Solomon blesses the assembly and recalls God''s faithfulness.',
  'This key point best captures the emphasis of the chapter summary (1 Kings 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 8
    AND difficulty_stage = 3
    AND prompt = 'Which key point best summarizes what 1 Kings 8 emphasizes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  8,
  3,
  'Which line best explains why the events of 1 Kings 8 matter?',
  '["This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","The Temple was established with a global, missional vision.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty."]'::jsonb,
  'The Temple was established with a global, missional vision.',
  'This significance line best explains the chapter''s weight (1 Kings 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 8
    AND difficulty_stage = 3
    AND prompt = 'Which line best explains why the events of 1 Kings 8 matter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  8,
  3,
  'Which statement best captures the chapter''s main action in 1 Kings 8?',
  '["Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","During the Temple dedication, Solomon prays specifically for the prayers of foreigners."]'::jsonb,
  'During the Temple dedication, Solomon prays specifically for the prayers of foreigners.',
  'This summary best fits the chapter''s core movement (1 Kings 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 8
    AND difficulty_stage = 3
    AND prompt = 'Which statement best captures the chapter''s main action in 1 Kings 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  8,
  3,
  'Which statement best matches the leadership pressure in 1 Kings 8?',
  '["Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people.","He prays that God will hear from heaven and forgive."]'::jsonb,
  'He prays that God will hear from heaven and forgive.',
  'This statement best matches the chapter''s leadership pressure (1 Kings 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 8
    AND difficulty_stage = 3
    AND prompt = 'Which statement best matches the leadership pressure in 1 Kings 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  8,
  3,
  'Which summary statement best fits the movement of 1 Kings 8?',
  '["At Gibeon, Solomon asks God for a listening heart rather than riches, long life, or victory over enemies. God grants him unmatched wisdom along with wealth and honor because he asked for discernment to govern well. His first judgment between two women proves that the gift is real and that the people can trust his rule.","The ark is brought into the completed temple with sacrifice, singing, and a solemn procession of priests. Solomon then prays that God will hear from heaven in every kind of distress and forgive his people when they turn toward this house. The chapter climaxes with the glory of the LORD filling the temple and confirming his presence among Israel.","As David grows old, Adonijah tries to seize the throne, but Nathan, Bathsheba, Zadok, and Benaiah move quickly to secure Solomon''s anointing. David publicly confirms Solomon as his chosen successor, and the people celebrate the new king. The chapter closes with Adonijah seeking mercy as Solomon begins his reign with legitimacy and peace.","David gives Solomon final instructions to walk faithfully, guard the kingdom, and deal wisely with unresolved matters in the court. Solomon secures his throne by removing threats from Adonijah, Abiathar, Joab, and Shimei. The chapter shows that the new king''s rule must be rooted in obedience, justice, and discernment."]'::jsonb,
  'The ark is brought into the completed temple with sacrifice, singing, and a solemn procession of priests. Solomon then prays that God will hear from heaven in every kind of distress and forgive his people when they turn toward this house. The chapter climaxes with the glory of the LORD filling the temple and confirming his presence among Israel.',
  'This is the chapter summary for 1 Kings 8.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 8
    AND difficulty_stage = 3
    AND prompt = 'Which summary statement best fits the movement of 1 Kings 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  8,
  3,
  'Which theme best interprets the events of 1 Kings 8?',
  '["Covenant legitimacy","Ark and presence","Royal succession","David''s final days"]'::jsonb,
  'Ark and presence',
  'Ark and presence is the best thematic lens supplied in the notes (1 Kings 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 8
    AND difficulty_stage = 3
    AND prompt = 'Which theme best interprets the events of 1 Kings 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  8,
  4,
  'How does 1 Kings 8 function in the wider narrative of 1 Kings?',
  '["It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It turns spoken warnings into visible judgment within the royal story.","It advances the temple-centered shape of worship and kingship in Israel."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This option best fits the chapter''s narrative role within 1 Kings (1 Kings 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 8
    AND difficulty_stage = 4
    AND prompt = 'How does 1 Kings 8 function in the wider narrative of 1 Kings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  8,
  4,
  'Which claim best fits the chapter''s larger significance in 1 Kings 8?',
  '["As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","During the Temple dedication, Solomon prays specifically for the prayers of foreigners.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne."]'::jsonb,
  'During the Temple dedication, Solomon prays specifically for the prayers of foreigners.',
  'This claim best fits the chapter''s larger significance in context (1 Kings 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 8
    AND difficulty_stage = 4
    AND prompt = 'Which claim best fits the chapter''s larger significance in 1 Kings 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  8,
  4,
  'Which conclusion best matches the covenant pressure visible in 1 Kings 8?',
  '["The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter teaches that divine judgment is patient, but it does not fail to arrive."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This conclusion best matches the chapter''s covenant pressure (1 Kings 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 8
    AND difficulty_stage = 4
    AND prompt = 'Which conclusion best matches the covenant pressure visible in 1 Kings 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  8,
  4,
  'Which reading best connects the chapter''s facts and themes in 1 Kings 8?',
  '["This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","The Temple was established with a global, missional vision."]'::jsonb,
  'The Temple was established with a global, missional vision.',
  'This reading best connects the chapter''s verse-linked facts and its meaning (1 Kings 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 8
    AND difficulty_stage = 4
    AND prompt = 'Which reading best connects the chapter''s facts and themes in 1 Kings 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  8,
  4,
  'Which statement best explains the chapter''s contribution to the book in 1 Kings 8?',
  '["It turns spoken warnings into visible judgment within the royal story.","It advances the temple-centered shape of worship and kingship in Israel.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This statement best explains how the chapter contributes to the book''s flow (1 Kings 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 8
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains the chapter''s contribution to the book in 1 Kings 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  8,
  4,
  'Which statement best explains why the chapter is strategically important in 1 Kings 8?',
  '["It turns spoken warnings into visible judgment within the royal story.","It advances the temple-centered shape of worship and kingship in Israel.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This option best explains the chapter''s strategic importance in the book (1 Kings 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 8
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains why the chapter is strategically important in 1 Kings 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  8,
  4,
  'Which theological reading best fits 1 Kings 8?',
  '["The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This theological reading best fits the chapter''s themes and developments (1 Kings 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 8
    AND difficulty_stage = 4
    AND prompt = 'Which theological reading best fits 1 Kings 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  8,
  5,
  'Which advanced synthesis best captures the theology of 1 Kings 8?',
  '["The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This is the strongest theological synthesis grounded in the chapter''s notes (1 Kings 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 8
    AND difficulty_stage = 5
    AND prompt = 'Which advanced synthesis best captures the theology of 1 Kings 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  8,
  5,
  'Which book-level synthesis best explains 1 Kings 8?',
  '["It presents wise rule as foundational to the success of Solomon''s reign.","It turns spoken warnings into visible judgment within the royal story.","It advances the temple-centered shape of worship and kingship in Israel.","It contrasts self-exalting ambition with the kingly order David affirms."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This is the best book-level synthesis of the chapter''s role (1 Kings 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 8
    AND difficulty_stage = 5
    AND prompt = 'Which book-level synthesis best explains 1 Kings 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  8,
  5,
  'Which high-level reading best explains why 1 Kings 8 is remembered?',
  '["This feast was a formal attempt to stage a coup against David''s intentions.","The Temple was established with a global, missional vision.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride."]'::jsonb,
  'The Temple was established with a global, missional vision.',
  'This high-level reading best explains why the chapter remains significant (1 Kings 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 8
    AND difficulty_stage = 5
    AND prompt = 'Which high-level reading best explains why 1 Kings 8 is remembered?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  8,
  5,
  'Which interpretive conclusion best fits the chapter''s place in 1 Kings 8?',
  '["It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It turns spoken warnings into visible judgment within the royal story.","It advances the temple-centered shape of worship and kingship in Israel."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This interpretive conclusion best fits the chapter''s place in the book (1 Kings 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 8
    AND difficulty_stage = 5
    AND prompt = 'Which interpretive conclusion best fits the chapter''s place in 1 Kings 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  8,
  5,
  'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 8?',
  '["The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This statement best captures the chapter''s lasting theological pressure (1 Kings 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 8
    AND difficulty_stage = 5
    AND prompt = 'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  8,
  5,
  'Which statement best reflects the long-range force of 1 Kings 8?',
  '["This feast was a formal attempt to stage a coup against David''s intentions.","The Temple was established with a global, missional vision.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride."]'::jsonb,
  'The Temple was established with a global, missional vision.',
  'This statement best reflects the chapter''s long-range force within the narrative (1 Kings 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 8
    AND difficulty_stage = 5
    AND prompt = 'Which statement best reflects the long-range force of 1 Kings 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  8,
  5,
  'Which synthesis best joins the factual details and themes of 1 Kings 8?',
  '["The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter teaches that divine judgment is patient, but it does not fail to arrive."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This synthesis most successfully joins the chapter''s details and themes (1 Kings 8:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 8
    AND difficulty_stage = 5
    AND prompt = 'Which synthesis best joins the factual details and themes of 1 Kings 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  9,
  1,
  'What does Solomon give in 1 Kings 9?',
  '["Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Solomon gives Hiram twenty cities in the land of Galilee (1 Kings 9:11)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)"]'::jsonb,
  'Solomon gives Hiram twenty cities in the land of Galilee (1 Kings 9:11)',
  'This detail is directly tied to 1 Kings 9:11.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 9
    AND difficulty_stage = 1
    AND prompt = 'What does Solomon give in 1 Kings 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  9,
  1,
  'What does He ask in 1 Kings 9?',
  '["He asks, ''What kind of cities are these that you have given me, my brother?'' (1 Kings 9:13)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)"]'::jsonb,
  'He asks, ''What kind of cities are these that you have given me, my brother?'' (1 Kings 9:13)',
  'This event is part of the chapter''s verse-linked source material (1 Kings 9:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 9
    AND difficulty_stage = 1
    AND prompt = 'What does He ask in 1 Kings 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  9,
  1,
  'Who appears in 1 Kings 9?',
  '["Bathsheba","Solomon","David","Adonijah"]'::jsonb,
  'Solomon',
  'Solomon is listed among the key people for this chapter (1 Kings 9:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 9
    AND difficulty_stage = 1
    AND prompt = 'Who appears in 1 Kings 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  9,
  1,
  'Which verse is highlighted in 1 Kings 9?',
  '["1 Kings 9:3","1 Kings 1:5","1 Kings 1:11","1 Kings 1:29"]'::jsonb,
  '1 Kings 9:3',
  '1 Kings 9:3 is one of the chapter''s supporting verses.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 9
    AND difficulty_stage = 1
    AND prompt = 'Which verse is highlighted in 1 Kings 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  9,
  1,
  'What theme stands out in 1 Kings 9?',
  '["David''s final days","Covenant legitimacy","Covenant warning","Royal succession"]'::jsonb,
  'Covenant warning',
  'Covenant warning is listed among the chapter themes (1 Kings 9:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 9
    AND difficulty_stage = 1
    AND prompt = 'What theme stands out in 1 Kings 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  9,
  1,
  'Which title best fits 1 Kings 9?',
  '["Solomon anointed amid succession crisis","David''s charge and Solomon''s first judgments","Solomon asks for wisdom","God''s warning and Solomon''s building works"]'::jsonb,
  'God''s warning and Solomon''s building works',
  'God''s warning and Solomon''s building works is the chapter title in the commentary notes (1 Kings 9:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 9
    AND difficulty_stage = 1
    AND prompt = 'Which title best fits 1 Kings 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  9,
  1,
  'Which verse-linked detail appears in 1 Kings 9?',
  '["He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Hiram goes to inspect the cities and is not pleased with them (1 Kings 9:12)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)"]'::jsonb,
  'Hiram goes to inspect the cities and is not pleased with them (1 Kings 9:12)',
  'This verse-linked detail appears in the source notes for 1 Kings 9:12.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 9
    AND difficulty_stage = 1
    AND prompt = 'Which verse-linked detail appears in 1 Kings 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  9,
  2,
  'What does He name in 1 Kings 9?',
  '["Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","He names the region the ''Land of Cabul'' (meaning ''good for nothing'') (1 Kings 9:13)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)"]'::jsonb,
  'He names the region the ''Land of Cabul'' (meaning ''good for nothing'') (1 Kings 9:13)',
  'This detail belongs to the chapter''s source notes (1 Kings 9:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 9
    AND difficulty_stage = 2
    AND prompt = 'What does He name in 1 Kings 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  9,
  2,
  'What detail appears in 1 Kings 9?',
  '["They sail to Ophir and bring back 420 talents of gold (1 Kings 9:28)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)"]'::jsonb,
  'They sail to Ophir and bring back 420 talents of gold (1 Kings 9:28)',
  'The source material for 1 Kings 9:28 includes this detail.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 9
    AND difficulty_stage = 2
    AND prompt = 'What detail appears in 1 Kings 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  9,
  2,
  'Which phrase is used in 1 Kings 9?',
  '["I have heard your prayer","Let Solomon my son reign","Zadok the priest","Nathan the prophet"]'::jsonb,
  'I have heard your prayer',
  'This phrase appears among the chapter''s evidence phrases (1 Kings 9:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 9
    AND difficulty_stage = 2
    AND prompt = 'Which phrase is used in 1 Kings 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  9,
  2,
  'What key point stands out in 1 Kings 9?',
  '["Solomon is anointed king and proclaimed by the people.","God again appears to Solomon and speaks plainly about obedience.","Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows."]'::jsonb,
  'God again appears to Solomon and speaks plainly about obedience.',
  'This key point is part of the commentary notes for the chapter (1 Kings 9:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 9
    AND difficulty_stage = 2
    AND prompt = 'What key point stands out in 1 Kings 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  9,
  2,
  'What does Hiram send in 1 Kings 9?',
  '["He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Hiram sends experienced sailors to serve in Solomon''s fleet (1 Kings 9:27)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)"]'::jsonb,
  'Hiram sends experienced sailors to serve in Solomon''s fleet (1 Kings 9:27)',
  'This scene is tied to 1 Kings 9:27.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 9
    AND difficulty_stage = 2
    AND prompt = 'What does Hiram send in 1 Kings 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  9,
  2,
  'What does this mean in 1 Kings 9?',
  '["This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","This incident shows the candid and familial nature of the two kings'' relationship.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty."]'::jsonb,
  'This incident shows the candid and familial nature of the two kings'' relationship.',
  'This significance statement is attached to verse-linked material from this chapter (1 Kings 9:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 9
    AND difficulty_stage = 2
    AND prompt = 'What does this mean in 1 Kings 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  9,
  2,
  'Which summary best fits 1 Kings 9?',
  '["Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Solomon attempts to pay Hiram with territory, but the Tyrian king is disappointed with the gift."]'::jsonb,
  'Solomon attempts to pay Hiram with territory, but the Tyrian king is disappointed with the gift.',
  'This summary line comes from source material connected to 1 Kings 9:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 9
    AND difficulty_stage = 2
    AND prompt = 'Which summary best fits 1 Kings 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  9,
  3,
  'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 9?',
  '["Nathan the prophet","if you shall walk before me","Let Solomon my son reign","Zadok the priest"]'::jsonb,
  'if you shall walk before me',
  'This phrase most directly reflects the chapter''s focal line (1 Kings 9:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 9
    AND difficulty_stage = 3
    AND prompt = 'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  9,
  3,
  'Which key point best summarizes what 1 Kings 9 emphasizes?',
  '["Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people.","Solomon completes major building projects."]'::jsonb,
  'Solomon completes major building projects.',
  'This key point best captures the emphasis of the chapter summary (1 Kings 9:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 9
    AND difficulty_stage = 3
    AND prompt = 'Which key point best summarizes what 1 Kings 9 emphasizes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  9,
  3,
  'Which line best explains why the events of 1 Kings 9 matter?',
  '["This feast was a formal attempt to stage a coup against David''s intentions.","This incident shows the candid and familial nature of the two kings'' relationship.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride."]'::jsonb,
  'This incident shows the candid and familial nature of the two kings'' relationship.',
  'This significance line best explains the chapter''s weight (1 Kings 9:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 9
    AND difficulty_stage = 3
    AND prompt = 'Which line best explains why the events of 1 Kings 9 matter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  9,
  3,
  'Which statement best captures the chapter''s main action in 1 Kings 9?',
  '["As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Solomon attempts to pay Hiram with territory, but the Tyrian king is disappointed with the gift.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne."]'::jsonb,
  'Solomon attempts to pay Hiram with territory, but the Tyrian king is disappointed with the gift.',
  'This summary best fits the chapter''s core movement (1 Kings 9:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 9
    AND difficulty_stage = 3
    AND prompt = 'Which statement best captures the chapter''s main action in 1 Kings 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  9,
  3,
  'Which statement best matches the leadership pressure in 1 Kings 9?',
  '["Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people.","Trade and labor extend his influence widely.","Adonijah attempts to claim the throne without David''s approval."]'::jsonb,
  'Trade and labor extend his influence widely.',
  'This statement best matches the chapter''s leadership pressure (1 Kings 9:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 9
    AND difficulty_stage = 3
    AND prompt = 'Which statement best matches the leadership pressure in 1 Kings 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  9,
  3,
  'Which summary statement best fits the movement of 1 Kings 9?',
  '["The LORD appears to Solomon again, confirming blessing for obedience and warning of judgment if the king or his descendants turn aside. Solomon''s other building projects, trade routes, and labor systems show the scale of his power. The chapter balances privilege with warning, reminding Israel that success cannot replace covenant faithfulness.","As David grows old, Adonijah tries to seize the throne, but Nathan, Bathsheba, Zadok, and Benaiah move quickly to secure Solomon''s anointing. David publicly confirms Solomon as his chosen successor, and the people celebrate the new king. The chapter closes with Adonijah seeking mercy as Solomon begins his reign with legitimacy and peace.","David gives Solomon final instructions to walk faithfully, guard the kingdom, and deal wisely with unresolved matters in the court. Solomon secures his throne by removing threats from Adonijah, Abiathar, Joab, and Shimei. The chapter shows that the new king''s rule must be rooted in obedience, justice, and discernment.","At Gibeon, Solomon asks God for a listening heart rather than riches, long life, or victory over enemies. God grants him unmatched wisdom along with wealth and honor because he asked for discernment to govern well. His first judgment between two women proves that the gift is real and that the people can trust his rule."]'::jsonb,
  'The LORD appears to Solomon again, confirming blessing for obedience and warning of judgment if the king or his descendants turn aside. Solomon''s other building projects, trade routes, and labor systems show the scale of his power. The chapter balances privilege with warning, reminding Israel that success cannot replace covenant faithfulness.',
  'This is the chapter summary for 1 Kings 9.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 9
    AND difficulty_stage = 3
    AND prompt = 'Which summary statement best fits the movement of 1 Kings 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  9,
  3,
  'Which theme best interprets the events of 1 Kings 9?',
  '["Covenant warning","Royal succession","David''s final days","Covenant legitimacy"]'::jsonb,
  'Covenant warning',
  'Covenant warning is the best thematic lens supplied in the notes (1 Kings 9:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 9
    AND difficulty_stage = 3
    AND prompt = 'Which theme best interprets the events of 1 Kings 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  9,
  4,
  'How does 1 Kings 9 function in the wider narrative of 1 Kings?',
  '["It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel.","It turns spoken warnings into visible judgment within the royal story.","It contrasts self-exalting ambition with the kingly order David affirms."]'::jsonb,
  'It turns spoken warnings into visible judgment within the royal story.',
  'This option best fits the chapter''s narrative role within 1 Kings (1 Kings 9:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 9
    AND difficulty_stage = 4
    AND prompt = 'How does 1 Kings 9 function in the wider narrative of 1 Kings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  9,
  4,
  'Which claim best fits the chapter''s larger significance in 1 Kings 9?',
  '["Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Solomon attempts to pay Hiram with territory, but the Tyrian king is disappointed with the gift.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following."]'::jsonb,
  'Solomon attempts to pay Hiram with territory, but the Tyrian king is disappointed with the gift.',
  'This claim best fits the chapter''s larger significance in context (1 Kings 9:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 9
    AND difficulty_stage = 4
    AND prompt = 'Which claim best fits the chapter''s larger significance in 1 Kings 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  9,
  4,
  'Which conclusion best matches the covenant pressure visible in 1 Kings 9?',
  '["The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter teaches that divine judgment is patient, but it does not fail to arrive."]'::jsonb,
  'The chapter teaches that divine judgment is patient, but it does not fail to arrive.',
  'This conclusion best matches the chapter''s covenant pressure (1 Kings 9:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 9
    AND difficulty_stage = 4
    AND prompt = 'Which conclusion best matches the covenant pressure visible in 1 Kings 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  9,
  4,
  'Which reading best connects the chapter''s facts and themes in 1 Kings 9?',
  '["This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","This incident shows the candid and familial nature of the two kings'' relationship.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty."]'::jsonb,
  'This incident shows the candid and familial nature of the two kings'' relationship.',
  'This reading best connects the chapter''s verse-linked facts and its meaning (1 Kings 9:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 9
    AND difficulty_stage = 4
    AND prompt = 'Which reading best connects the chapter''s facts and themes in 1 Kings 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  9,
  4,
  'Which statement best explains the chapter''s contribution to the book in 1 Kings 9?',
  '["It turns spoken warnings into visible judgment within the royal story.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel."]'::jsonb,
  'It turns spoken warnings into visible judgment within the royal story.',
  'This statement best explains how the chapter contributes to the book''s flow (1 Kings 9:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 9
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains the chapter''s contribution to the book in 1 Kings 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  9,
  4,
  'Which statement best explains why the chapter is strategically important in 1 Kings 9?',
  '["It turns spoken warnings into visible judgment within the royal story.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel."]'::jsonb,
  'It turns spoken warnings into visible judgment within the royal story.',
  'This option best explains the chapter''s strategic importance in the book (1 Kings 9:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 9
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains why the chapter is strategically important in 1 Kings 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  9,
  4,
  'Which theological reading best fits 1 Kings 9?',
  '["The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage."]'::jsonb,
  'The chapter teaches that divine judgment is patient, but it does not fail to arrive.',
  'This theological reading best fits the chapter''s themes and developments (1 Kings 9:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 9
    AND difficulty_stage = 4
    AND prompt = 'Which theological reading best fits 1 Kings 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  9,
  5,
  'Which advanced synthesis best captures the theology of 1 Kings 9?',
  '["The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force."]'::jsonb,
  'The chapter teaches that divine judgment is patient, but it does not fail to arrive.',
  'This is the strongest theological synthesis grounded in the chapter''s notes (1 Kings 9:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 9
    AND difficulty_stage = 5
    AND prompt = 'Which advanced synthesis best captures the theology of 1 Kings 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  9,
  5,
  'Which book-level synthesis best explains 1 Kings 9?',
  '["It advances the temple-centered shape of worship and kingship in Israel.","It turns spoken warnings into visible judgment within the royal story.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign."]'::jsonb,
  'It turns spoken warnings into visible judgment within the royal story.',
  'This is the best book-level synthesis of the chapter''s role (1 Kings 9:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 9
    AND difficulty_stage = 5
    AND prompt = 'Which book-level synthesis best explains 1 Kings 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  9,
  5,
  'Which high-level reading best explains why 1 Kings 9 is remembered?',
  '["This incident shows the candid and familial nature of the two kings'' relationship.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions."]'::jsonb,
  'This incident shows the candid and familial nature of the two kings'' relationship.',
  'This high-level reading best explains why the chapter remains significant (1 Kings 9:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 9
    AND difficulty_stage = 5
    AND prompt = 'Which high-level reading best explains why 1 Kings 9 is remembered?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  9,
  5,
  'Which interpretive conclusion best fits the chapter''s place in 1 Kings 9?',
  '["It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel.","It turns spoken warnings into visible judgment within the royal story.","It contrasts self-exalting ambition with the kingly order David affirms."]'::jsonb,
  'It turns spoken warnings into visible judgment within the royal story.',
  'This interpretive conclusion best fits the chapter''s place in the book (1 Kings 9:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 9
    AND difficulty_stage = 5
    AND prompt = 'Which interpretive conclusion best fits the chapter''s place in 1 Kings 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  9,
  5,
  'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 9?',
  '["The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage."]'::jsonb,
  'The chapter teaches that divine judgment is patient, but it does not fail to arrive.',
  'This statement best captures the chapter''s lasting theological pressure (1 Kings 9:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 9
    AND difficulty_stage = 5
    AND prompt = 'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  9,
  5,
  'Which statement best reflects the long-range force of 1 Kings 9?',
  '["This incident shows the candid and familial nature of the two kings'' relationship.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions."]'::jsonb,
  'This incident shows the candid and familial nature of the two kings'' relationship.',
  'This statement best reflects the chapter''s long-range force within the narrative (1 Kings 9:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 9
    AND difficulty_stage = 5
    AND prompt = 'Which statement best reflects the long-range force of 1 Kings 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  9,
  5,
  'Which synthesis best joins the factual details and themes of 1 Kings 9?',
  '["The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter teaches that divine judgment is patient, but it does not fail to arrive."]'::jsonb,
  'The chapter teaches that divine judgment is patient, but it does not fail to arrive.',
  'This synthesis most successfully joins the chapter''s details and themes (1 Kings 9:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 9
    AND difficulty_stage = 5
    AND prompt = 'Which synthesis best joins the factual details and themes of 1 Kings 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  10,
  1,
  'What development clearly belongs to 1 Kings 10?',
  '["He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Solomon receives tribute from the kings of Arabia (1 Kings 10:15)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)"]'::jsonb,
  'Solomon receives tribute from the kings of Arabia (1 Kings 10:15)',
  'This detail is directly tied to 1 Kings 10:15.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 10
    AND difficulty_stage = 1
    AND prompt = 'What development clearly belongs to 1 Kings 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  10,
  1,
  'Which event is described in 1 Kings 10?',
  '["Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","The Queen of Sheba likely traveled from southern Arabia to Jerusalem (1 Kings 10:1-2)"]'::jsonb,
  'The Queen of Sheba likely traveled from southern Arabia to Jerusalem (1 Kings 10:1-2)',
  'This event is part of the chapter''s verse-linked source material (1 Kings 10:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 10
    AND difficulty_stage = 1
    AND prompt = 'Which event is described in 1 Kings 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  10,
  1,
  'Who appears in 1 Kings 10?',
  '["Solomon","David","Adonijah","Bathsheba"]'::jsonb,
  'Solomon',
  'Solomon is listed among the key people for this chapter (1 Kings 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 10
    AND difficulty_stage = 1
    AND prompt = 'Who appears in 1 Kings 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  10,
  1,
  'Which verse is highlighted in 1 Kings 10?',
  '["1 Kings 1:5","1 Kings 1:11","1 Kings 1:29","1 Kings 10:1"]'::jsonb,
  '1 Kings 10:1',
  '1 Kings 10:1 is one of the chapter''s supporting verses.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 10
    AND difficulty_stage = 1
    AND prompt = 'Which verse is highlighted in 1 Kings 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  10,
  1,
  'What theme stands out in 1 Kings 10?',
  '["Covenant legitimacy","Wisdom tested","Royal succession","David''s final days"]'::jsonb,
  'Wisdom tested',
  'Wisdom tested is listed among the chapter themes (1 Kings 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 10
    AND difficulty_stage = 1
    AND prompt = 'What theme stands out in 1 Kings 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  10,
  1,
  'Which title best fits 1 Kings 10?',
  '["David''s charge and Solomon''s first judgments","Solomon asks for wisdom","The queen of Sheba visits Solomon","Solomon anointed amid succession crisis"]'::jsonb,
  'The queen of Sheba visits Solomon',
  'The queen of Sheba visits Solomon is the chapter title in the commentary notes (1 Kings 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 10
    AND difficulty_stage = 1
    AND prompt = 'Which title best fits 1 Kings 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  10,
  1,
  'Which verse-linked detail appears in 1 Kings 10?',
  '["Arabian merchants import spices, gold, and precious stones (2 Chronicles 9:14)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)"]'::jsonb,
  'Arabian merchants import spices, gold, and precious stones (2 Chronicles 9:14)',
  'This verse-linked detail appears in the source notes for 1 Kings 10.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 10
    AND difficulty_stage = 1
    AND prompt = 'Which verse-linked detail appears in 1 Kings 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  10,
  2,
  'What happens in 1 Kings 10?',
  '["He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Arabia was the primary source of luxury goods for the royal court (1 Kings 10:14-15)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)"]'::jsonb,
  'Arabia was the primary source of luxury goods for the royal court (1 Kings 10:14-15)',
  'This detail belongs to the chapter''s source notes (1 Kings 10:14-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 10
    AND difficulty_stage = 2
    AND prompt = 'What happens in 1 Kings 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  10,
  2,
  'What detail appears in 1 Kings 10?',
  '["Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Jerusalem is established as the national capital (2 Samuel 5:6-9)"]'::jsonb,
  'Jerusalem is established as the national capital (2 Samuel 5:6-9)',
  'The source material for 1 Kings 10 includes this detail.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 10
    AND difficulty_stage = 2
    AND prompt = 'What detail appears in 1 Kings 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  10,
  2,
  'Which phrase is used in 1 Kings 10?',
  '["Let Solomon my son reign","Zadok the priest","Nathan the prophet","the report that I heard"]'::jsonb,
  'the report that I heard',
  'This phrase appears among the chapter''s evidence phrases (1 Kings 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 10
    AND difficulty_stage = 2
    AND prompt = 'Which phrase is used in 1 Kings 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  10,
  2,
  'What key point stands out in 1 Kings 10?',
  '["The queen comes with difficult questions.","Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people."]'::jsonb,
  'The queen comes with difficult questions.',
  'This key point is part of the commentary notes for the chapter (1 Kings 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 10
    AND difficulty_stage = 2
    AND prompt = 'What key point stands out in 1 Kings 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  10,
  2,
  'What scene appears in 1 Kings 10?',
  '["All the tribes unite under David at Hebron (2 Samuel 5:1-3)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)"]'::jsonb,
  'All the tribes unite under David at Hebron (2 Samuel 5:1-3)',
  'This scene is tied to 1 Kings 10.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 10
    AND difficulty_stage = 2
    AND prompt = 'What scene appears in 1 Kings 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  10,
  2,
  'Why does this matter in 1 Kings 10?',
  '["This feast was a formal attempt to stage a coup against David''s intentions.","Arabia was the commercial partner that fueled the prosperity of Solomon''s era.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride."]'::jsonb,
  'Arabia was the commercial partner that fueled the prosperity of Solomon''s era.',
  'This significance statement is attached to verse-linked material from this chapter (1 Kings 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 10
    AND difficulty_stage = 2
    AND prompt = 'Why does this matter in 1 Kings 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  10,
  2,
  'Which summary best fits 1 Kings 10?',
  '["As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Arabian kings and merchants provide immense wealth to the Kingdom of Israel.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne."]'::jsonb,
  'Arabian kings and merchants provide immense wealth to the Kingdom of Israel.',
  'This summary line comes from source material connected to 1 Kings 10:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 10
    AND difficulty_stage = 2
    AND prompt = 'Which summary best fits 1 Kings 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  10,
  3,
  'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 10?',
  '["there was no more spirit in her","Let Solomon my son reign","Zadok the priest","Nathan the prophet"]'::jsonb,
  'there was no more spirit in her',
  'This phrase most directly reflects the chapter''s focal line (1 Kings 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 10
    AND difficulty_stage = 3
    AND prompt = 'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  10,
  3,
  'Which key point best summarizes what 1 Kings 10 emphasizes?',
  '["Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people.","Solomon answers all her questions.","Adonijah attempts to claim the throne without David''s approval."]'::jsonb,
  'Solomon answers all her questions.',
  'This key point best captures the emphasis of the chapter summary (1 Kings 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 10
    AND difficulty_stage = 3
    AND prompt = 'Which key point best summarizes what 1 Kings 10 emphasizes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  10,
  3,
  'Which line best explains why the events of 1 Kings 10 matter?',
  '["Arabia was the commercial partner that fueled the prosperity of Solomon''s era.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions."]'::jsonb,
  'Arabia was the commercial partner that fueled the prosperity of Solomon''s era.',
  'This significance line best explains the chapter''s weight (1 Kings 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 10
    AND difficulty_stage = 3
    AND prompt = 'Which line best explains why the events of 1 Kings 10 matter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  10,
  3,
  'Which statement best captures the chapter''s main action in 1 Kings 10?',
  '["Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Arabian kings and merchants provide immense wealth to the Kingdom of Israel.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following."]'::jsonb,
  'Arabian kings and merchants provide immense wealth to the Kingdom of Israel.',
  'This summary best fits the chapter''s core movement (1 Kings 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 10
    AND difficulty_stage = 3
    AND prompt = 'Which statement best captures the chapter''s main action in 1 Kings 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  10,
  3,
  'Which statement best matches the leadership pressure in 1 Kings 10?',
  '["Solomon is anointed king and proclaimed by the people.","She recognizes that God has delighted in Solomon.","Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows."]'::jsonb,
  'She recognizes that God has delighted in Solomon.',
  'This statement best matches the chapter''s leadership pressure (1 Kings 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 10
    AND difficulty_stage = 3
    AND prompt = 'Which statement best matches the leadership pressure in 1 Kings 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  10,
  3,
  'Which summary statement best fits the movement of 1 Kings 10?',
  '["As David grows old, Adonijah tries to seize the throne, but Nathan, Bathsheba, Zadok, and Benaiah move quickly to secure Solomon''s anointing. David publicly confirms Solomon as his chosen successor, and the people celebrate the new king. The chapter closes with Adonijah seeking mercy as Solomon begins his reign with legitimacy and peace.","David gives Solomon final instructions to walk faithfully, guard the kingdom, and deal wisely with unresolved matters in the court. Solomon secures his throne by removing threats from Adonijah, Abiathar, Joab, and Shimei. The chapter shows that the new king''s rule must be rooted in obedience, justice, and discernment.","At Gibeon, Solomon asks God for a listening heart rather than riches, long life, or victory over enemies. God grants him unmatched wisdom along with wealth and honor because he asked for discernment to govern well. His first judgment between two women proves that the gift is real and that the people can trust his rule.","The queen of Sheba comes to test Solomon with hard questions and leaves convinced that his wisdom and prosperity exceed every report. She praises the God who has set him on the throne and observes the order and abundance of his court. The chapter celebrates Solomon''s international fame while also showing the splendor of his kingdom."]'::jsonb,
  'The queen of Sheba comes to test Solomon with hard questions and leaves convinced that his wisdom and prosperity exceed every report. She praises the God who has set him on the throne and observes the order and abundance of his court. The chapter celebrates Solomon''s international fame while also showing the splendor of his kingdom.',
  'This is the chapter summary for 1 Kings 10.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 10
    AND difficulty_stage = 3
    AND prompt = 'Which summary statement best fits the movement of 1 Kings 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  10,
  3,
  'Which theme best interprets the events of 1 Kings 10?',
  '["Royal succession","David''s final days","Covenant legitimacy","Wisdom tested"]'::jsonb,
  'Wisdom tested',
  'Wisdom tested is the best thematic lens supplied in the notes (1 Kings 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 10
    AND difficulty_stage = 3
    AND prompt = 'Which theme best interprets the events of 1 Kings 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  10,
  4,
  'How does 1 Kings 10 function in the wider narrative of 1 Kings?',
  '["It turns spoken warnings into visible judgment within the royal story.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel."]'::jsonb,
  'It contrasts self-exalting ambition with the kingly order David affirms.',
  'This option best fits the chapter''s narrative role within 1 Kings (1 Kings 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 10
    AND difficulty_stage = 4
    AND prompt = 'How does 1 Kings 10 function in the wider narrative of 1 Kings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  10,
  4,
  'Which claim best fits the chapter''s larger significance in 1 Kings 10?',
  '["Arabian kings and merchants provide immense wealth to the Kingdom of Israel.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king."]'::jsonb,
  'Arabian kings and merchants provide immense wealth to the Kingdom of Israel.',
  'This claim best fits the chapter''s larger significance in context (1 Kings 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 10
    AND difficulty_stage = 4
    AND prompt = 'Which claim best fits the chapter''s larger significance in 1 Kings 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  10,
  4,
  'Which conclusion best matches the covenant pressure visible in 1 Kings 10?',
  '["The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage."]'::jsonb,
  'The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.',
  'This conclusion best matches the chapter''s covenant pressure (1 Kings 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 10
    AND difficulty_stage = 4
    AND prompt = 'Which conclusion best matches the covenant pressure visible in 1 Kings 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  10,
  4,
  'Which reading best connects the chapter''s facts and themes in 1 Kings 10?',
  '["This feast was a formal attempt to stage a coup against David''s intentions.","Arabia was the commercial partner that fueled the prosperity of Solomon''s era.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride."]'::jsonb,
  'Arabia was the commercial partner that fueled the prosperity of Solomon''s era.',
  'This reading best connects the chapter''s verse-linked facts and its meaning (1 Kings 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 10
    AND difficulty_stage = 4
    AND prompt = 'Which reading best connects the chapter''s facts and themes in 1 Kings 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  10,
  4,
  'Which statement best explains the chapter''s contribution to the book in 1 Kings 10?',
  '["It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel.","It turns spoken warnings into visible judgment within the royal story.","It contrasts self-exalting ambition with the kingly order David affirms."]'::jsonb,
  'It contrasts self-exalting ambition with the kingly order David affirms.',
  'This statement best explains how the chapter contributes to the book''s flow (1 Kings 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 10
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains the chapter''s contribution to the book in 1 Kings 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  10,
  4,
  'Which statement best explains why the chapter is strategically important in 1 Kings 10?',
  '["It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel.","It turns spoken warnings into visible judgment within the royal story.","It contrasts self-exalting ambition with the kingly order David affirms."]'::jsonb,
  'It contrasts self-exalting ambition with the kingly order David affirms.',
  'This option best explains the chapter''s strategic importance in the book (1 Kings 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 10
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains why the chapter is strategically important in 1 Kings 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  10,
  4,
  'Which theological reading best fits 1 Kings 10?',
  '["The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter teaches that divine judgment is patient, but it does not fail to arrive."]'::jsonb,
  'The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.',
  'This theological reading best fits the chapter''s themes and developments (1 Kings 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 10
    AND difficulty_stage = 4
    AND prompt = 'Which theological reading best fits 1 Kings 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  10,
  5,
  'Which advanced synthesis best captures the theology of 1 Kings 10?',
  '["The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people."]'::jsonb,
  'The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.',
  'This is the strongest theological synthesis grounded in the chapter''s notes (1 Kings 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 10
    AND difficulty_stage = 5
    AND prompt = 'Which advanced synthesis best captures the theology of 1 Kings 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  10,
  5,
  'Which book-level synthesis best explains 1 Kings 10?',
  '["It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel.","It turns spoken warnings into visible judgment within the royal story."]'::jsonb,
  'It contrasts self-exalting ambition with the kingly order David affirms.',
  'This is the best book-level synthesis of the chapter''s role (1 Kings 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 10
    AND difficulty_stage = 5
    AND prompt = 'Which book-level synthesis best explains 1 Kings 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  10,
  5,
  'Which high-level reading best explains why 1 Kings 10 is remembered?',
  '["This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","Arabia was the commercial partner that fueled the prosperity of Solomon''s era."]'::jsonb,
  'Arabia was the commercial partner that fueled the prosperity of Solomon''s era.',
  'This high-level reading best explains why the chapter remains significant (1 Kings 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 10
    AND difficulty_stage = 5
    AND prompt = 'Which high-level reading best explains why 1 Kings 10 is remembered?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  10,
  5,
  'Which interpretive conclusion best fits the chapter''s place in 1 Kings 10?',
  '["It turns spoken warnings into visible judgment within the royal story.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel."]'::jsonb,
  'It contrasts self-exalting ambition with the kingly order David affirms.',
  'This interpretive conclusion best fits the chapter''s place in the book (1 Kings 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 10
    AND difficulty_stage = 5
    AND prompt = 'Which interpretive conclusion best fits the chapter''s place in 1 Kings 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  10,
  5,
  'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 10?',
  '["The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter teaches that divine judgment is patient, but it does not fail to arrive."]'::jsonb,
  'The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.',
  'This statement best captures the chapter''s lasting theological pressure (1 Kings 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 10
    AND difficulty_stage = 5
    AND prompt = 'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  10,
  5,
  'Which statement best reflects the long-range force of 1 Kings 10?',
  '["This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","Arabia was the commercial partner that fueled the prosperity of Solomon''s era."]'::jsonb,
  'Arabia was the commercial partner that fueled the prosperity of Solomon''s era.',
  'This statement best reflects the chapter''s long-range force within the narrative (1 Kings 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 10
    AND difficulty_stage = 5
    AND prompt = 'Which statement best reflects the long-range force of 1 Kings 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  10,
  5,
  'Which synthesis best joins the factual details and themes of 1 Kings 10?',
  '["The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage."]'::jsonb,
  'The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.',
  'This synthesis most successfully joins the chapter''s details and themes (1 Kings 10:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 10
    AND difficulty_stage = 5
    AND prompt = 'Which synthesis best joins the factual details and themes of 1 Kings 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  11,
  1,
  'What development clearly belongs to 1 Kings 11?',
  '["Ahijah finds Jeroboam on the road outside Jerusalem (1 Kings 11:29)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)"]'::jsonb,
  'Ahijah finds Jeroboam on the road outside Jerusalem (1 Kings 11:29)',
  'This detail is directly tied to 1 Kings 11:29.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 11
    AND difficulty_stage = 1
    AND prompt = 'What development clearly belongs to 1 Kings 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  11,
  1,
  'What happens in 1 Kings 11?',
  '["Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","He tells Jeroboam to take ten pieces for himself (1 Kings 11:31)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)"]'::jsonb,
  'He tells Jeroboam to take ten pieces for himself (1 Kings 11:31)',
  'This event is part of the chapter''s verse-linked source material (1 Kings 11:31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 11
    AND difficulty_stage = 1
    AND prompt = 'What happens in 1 Kings 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  11,
  1,
  'Who appears in 1 Kings 11?',
  '["David","Adonijah","Bathsheba","Solomon"]'::jsonb,
  'Solomon',
  'Solomon is listed among the key people for this chapter (1 Kings 11:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 11
    AND difficulty_stage = 1
    AND prompt = 'Who appears in 1 Kings 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  11,
  1,
  'Which verse is highlighted in 1 Kings 11?',
  '["1 Kings 1:11","1 Kings 1:29","1 Kings 11:4","1 Kings 1:5"]'::jsonb,
  '1 Kings 11:4',
  '1 Kings 11:4 is one of the chapter''s supporting verses.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 11
    AND difficulty_stage = 1
    AND prompt = 'Which verse is highlighted in 1 Kings 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  11,
  1,
  'What theme stands out in 1 Kings 11?',
  '["Idolatry","Royal succession","David''s final days","Covenant legitimacy"]'::jsonb,
  'Idolatry',
  'Idolatry is listed among the chapter themes (1 Kings 11:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 11
    AND difficulty_stage = 1
    AND prompt = 'What theme stands out in 1 Kings 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  11,
  1,
  'Which title best fits 1 Kings 11?',
  '["Solomon asks for wisdom","Solomon''s heart turns after other gods","Solomon anointed amid succession crisis","David''s charge and Solomon''s first judgments"]'::jsonb,
  'Solomon''s heart turns after other gods',
  'Solomon''s heart turns after other gods is the chapter title in the commentary notes (1 Kings 11:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 11
    AND difficulty_stage = 1
    AND prompt = 'Which title best fits 1 Kings 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  11,
  1,
  'What happens in 1 Kings 11?',
  '["Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","He is wearing a new garment which he tears into twelve pieces (1 Kings 11:30)"]'::jsonb,
  'He is wearing a new garment which he tears into twelve pieces (1 Kings 11:30)',
  'This verse-linked detail appears in the source notes for 1 Kings 11:30.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 11
    AND difficulty_stage = 1
    AND prompt = 'What happens in 1 Kings 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  11,
  2,
  'What happens in 1 Kings 11?',
  '["He explains that God is tearing the kingdom from Solomon''s hand (1 Kings 11:31)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)"]'::jsonb,
  'He explains that God is tearing the kingdom from Solomon''s hand (1 Kings 11:31)',
  'This detail belongs to the chapter''s source notes (1 Kings 11:31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 11
    AND difficulty_stage = 2
    AND prompt = 'What happens in 1 Kings 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  11,
  2,
  'What detail appears in 1 Kings 11?',
  '["Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","God offers to be with him if he walks in His ways (1 Kings 11:38)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)"]'::jsonb,
  'God offers to be with him if he walks in His ways (1 Kings 11:38)',
  'The source material for 1 Kings 11:38 includes this detail.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 11
    AND difficulty_stage = 2
    AND prompt = 'What detail appears in 1 Kings 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  11,
  2,
  'Which phrase is used in 1 Kings 11?',
  '["Zadok the priest","Nathan the prophet","his wives turned away his heart","Let Solomon my son reign"]'::jsonb,
  'his wives turned away his heart',
  'This phrase appears among the chapter''s evidence phrases (1 Kings 11:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 11
    AND difficulty_stage = 2
    AND prompt = 'Which phrase is used in 1 Kings 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  11,
  2,
  'What key point stands out in 1 Kings 11?',
  '["Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people.","Solomon''s many wives turn his heart after other gods."]'::jsonb,
  'Solomon''s many wives turn his heart after other gods.',
  'This key point is part of the commentary notes for the chapter (1 Kings 11:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 11
    AND difficulty_stage = 2
    AND prompt = 'What key point stands out in 1 Kings 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  11,
  2,
  'What scene appears in 1 Kings 11?',
  '["Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Ahijah promises that Jeroboam will reign over all he desires (1 Kings 11:37)"]'::jsonb,
  'Ahijah promises that Jeroboam will reign over all he desires (1 Kings 11:37)',
  'This scene is tied to 1 Kings 11:37.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 11
    AND difficulty_stage = 2
    AND prompt = 'What scene appears in 1 Kings 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  11,
  2,
  'What does this mean in 1 Kings 11?',
  '["This act provides the theological justification for the northern kingdom''s existence.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions."]'::jsonb,
  'This act provides the theological justification for the northern kingdom''s existence.',
  'This significance statement is attached to verse-linked material from this chapter (1 Kings 11:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 11
    AND difficulty_stage = 2
    AND prompt = 'What does this mean in 1 Kings 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  11,
  2,
  'Which summary best fits 1 Kings 11?',
  '["Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Ahijah delivers the foundational prophecy that the kingdom of Israel will be split.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following."]'::jsonb,
  'Ahijah delivers the foundational prophecy that the kingdom of Israel will be split.',
  'This summary line comes from source material connected to 1 Kings 11:4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 11
    AND difficulty_stage = 2
    AND prompt = 'Which summary best fits 1 Kings 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  11,
  3,
  'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 11?',
  '["Let Solomon my son reign","Zadok the priest","Nathan the prophet","the LORD was angry with Solomon"]'::jsonb,
  'the LORD was angry with Solomon',
  'This phrase most directly reflects the chapter''s focal line (1 Kings 11:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 11
    AND difficulty_stage = 3
    AND prompt = 'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  11,
  3,
  'Which key point best summarizes what 1 Kings 11 emphasizes?',
  '["Solomon is anointed king and proclaimed by the people.","The LORD announces judgment on the kingdom.","Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows."]'::jsonb,
  'The LORD announces judgment on the kingdom.',
  'This key point best captures the emphasis of the chapter summary (1 Kings 11:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 11
    AND difficulty_stage = 3
    AND prompt = 'Which key point best summarizes what 1 Kings 11 emphasizes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  11,
  3,
  'Which line best explains why the events of 1 Kings 11 matter?',
  '["This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","This act provides the theological justification for the northern kingdom''s existence."]'::jsonb,
  'This act provides the theological justification for the northern kingdom''s existence.',
  'This significance line best explains the chapter''s weight (1 Kings 11:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 11
    AND difficulty_stage = 3
    AND prompt = 'Which line best explains why the events of 1 Kings 11 matter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  11,
  3,
  'Which statement best captures the chapter''s main action in 1 Kings 11?',
  '["Ahijah delivers the foundational prophecy that the kingdom of Israel will be split.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king."]'::jsonb,
  'Ahijah delivers the foundational prophecy that the kingdom of Israel will be split.',
  'This summary best fits the chapter''s core movement (1 Kings 11:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 11
    AND difficulty_stage = 3
    AND prompt = 'Which statement best captures the chapter''s main action in 1 Kings 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  11,
  3,
  'Which statement best matches the leadership pressure in 1 Kings 11?',
  '["Adversaries rise up against Solomon in his later years.","Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people."]'::jsonb,
  'Adversaries rise up against Solomon in his later years.',
  'This statement best matches the chapter''s leadership pressure (1 Kings 11:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 11
    AND difficulty_stage = 3
    AND prompt = 'Which statement best matches the leadership pressure in 1 Kings 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  11,
  3,
  'Which summary statement best fits the movement of 1 Kings 11?',
  '["David gives Solomon final instructions to walk faithfully, guard the kingdom, and deal wisely with unresolved matters in the court. Solomon secures his throne by removing threats from Adonijah, Abiathar, Joab, and Shimei. The chapter shows that the new king''s rule must be rooted in obedience, justice, and discernment.","At Gibeon, Solomon asks God for a listening heart rather than riches, long life, or victory over enemies. God grants him unmatched wisdom along with wealth and honor because he asked for discernment to govern well. His first judgment between two women proves that the gift is real and that the people can trust his rule.","Solomon''s foreign marriages lead his heart away from exclusive loyalty to the LORD, and he begins to serve the gods of his wives. Because of this compromise, God raises adversaries against him and announces that the kingdom will be torn from his house. The chapter shows how a gifted king can still fall when covenant loyalty is neglected.","As David grows old, Adonijah tries to seize the throne, but Nathan, Bathsheba, Zadok, and Benaiah move quickly to secure Solomon''s anointing. David publicly confirms Solomon as his chosen successor, and the people celebrate the new king. The chapter closes with Adonijah seeking mercy as Solomon begins his reign with legitimacy and peace."]'::jsonb,
  'Solomon''s foreign marriages lead his heart away from exclusive loyalty to the LORD, and he begins to serve the gods of his wives. Because of this compromise, God raises adversaries against him and announces that the kingdom will be torn from his house. The chapter shows how a gifted king can still fall when covenant loyalty is neglected.',
  'This is the chapter summary for 1 Kings 11.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 11
    AND difficulty_stage = 3
    AND prompt = 'Which summary statement best fits the movement of 1 Kings 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  11,
  3,
  'Which theme best interprets the events of 1 Kings 11?',
  '["David''s final days","Covenant legitimacy","Idolatry","Royal succession"]'::jsonb,
  'Idolatry',
  'Idolatry is the best thematic lens supplied in the notes (1 Kings 11:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 11
    AND difficulty_stage = 3
    AND prompt = 'Which theme best interprets the events of 1 Kings 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  11,
  4,
  'How does 1 Kings 11 function in the wider narrative of 1 Kings?',
  '["It advances the temple-centered shape of worship and kingship in Israel.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It turns spoken warnings into visible judgment within the royal story."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This option best fits the chapter''s narrative role within 1 Kings (1 Kings 11:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 11
    AND difficulty_stage = 4
    AND prompt = 'How does 1 Kings 11 function in the wider narrative of 1 Kings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  11,
  4,
  'Which claim best fits the chapter''s larger significance in 1 Kings 11?',
  '["Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Ahijah delivers the foundational prophecy that the kingdom of Israel will be split."]'::jsonb,
  'Ahijah delivers the foundational prophecy that the kingdom of Israel will be split.',
  'This claim best fits the chapter''s larger significance in context (1 Kings 11:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 11
    AND difficulty_stage = 4
    AND prompt = 'Which claim best fits the chapter''s larger significance in 1 Kings 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  11,
  4,
  'Which conclusion best matches the covenant pressure visible in 1 Kings 11?',
  '["The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This conclusion best matches the chapter''s covenant pressure (1 Kings 11:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 11
    AND difficulty_stage = 4
    AND prompt = 'Which conclusion best matches the covenant pressure visible in 1 Kings 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  11,
  4,
  'Which reading best connects the chapter''s facts and themes in 1 Kings 11?',
  '["This act provides the theological justification for the northern kingdom''s existence.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions."]'::jsonb,
  'This act provides the theological justification for the northern kingdom''s existence.',
  'This reading best connects the chapter''s verse-linked facts and its meaning (1 Kings 11:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 11
    AND difficulty_stage = 4
    AND prompt = 'Which reading best connects the chapter''s facts and themes in 1 Kings 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  11,
  4,
  'Which statement best explains the chapter''s contribution to the book in 1 Kings 11?',
  '["It presents wise rule as foundational to the success of Solomon''s reign.","It turns spoken warnings into visible judgment within the royal story.","It advances the temple-centered shape of worship and kingship in Israel.","It contrasts self-exalting ambition with the kingly order David affirms."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This statement best explains how the chapter contributes to the book''s flow (1 Kings 11:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 11
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains the chapter''s contribution to the book in 1 Kings 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  11,
  4,
  'Which statement best explains why the chapter is strategically important in 1 Kings 11?',
  '["It presents wise rule as foundational to the success of Solomon''s reign.","It turns spoken warnings into visible judgment within the royal story.","It advances the temple-centered shape of worship and kingship in Israel.","It contrasts self-exalting ambition with the kingly order David affirms."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This option best explains the chapter''s strategic importance in the book (1 Kings 11:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 11
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains why the chapter is strategically important in 1 Kings 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  11,
  4,
  'Which theological reading best fits 1 Kings 11?',
  '["The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This theological reading best fits the chapter''s themes and developments (1 Kings 11:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 11
    AND difficulty_stage = 4
    AND prompt = 'Which theological reading best fits 1 Kings 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  11,
  5,
  'Which advanced synthesis best captures the theology of 1 Kings 11?',
  '["The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter teaches that divine judgment is patient, but it does not fail to arrive."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This is the strongest theological synthesis grounded in the chapter''s notes (1 Kings 11:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 11
    AND difficulty_stage = 5
    AND prompt = 'Which advanced synthesis best captures the theology of 1 Kings 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  11,
  5,
  'Which book-level synthesis best explains 1 Kings 11?',
  '["It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It turns spoken warnings into visible judgment within the royal story.","It advances the temple-centered shape of worship and kingship in Israel."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This is the best book-level synthesis of the chapter''s role (1 Kings 11:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 11
    AND difficulty_stage = 5
    AND prompt = 'Which book-level synthesis best explains 1 Kings 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  11,
  5,
  'Which high-level reading best explains why 1 Kings 11 is remembered?',
  '["This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","This act provides the theological justification for the northern kingdom''s existence.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty."]'::jsonb,
  'This act provides the theological justification for the northern kingdom''s existence.',
  'This high-level reading best explains why the chapter remains significant (1 Kings 11:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 11
    AND difficulty_stage = 5
    AND prompt = 'Which high-level reading best explains why 1 Kings 11 is remembered?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  11,
  5,
  'Which interpretive conclusion best fits the chapter''s place in 1 Kings 11?',
  '["It advances the temple-centered shape of worship and kingship in Israel.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It turns spoken warnings into visible judgment within the royal story."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This interpretive conclusion best fits the chapter''s place in the book (1 Kings 11:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 11
    AND difficulty_stage = 5
    AND prompt = 'Which interpretive conclusion best fits the chapter''s place in 1 Kings 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  11,
  5,
  'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 11?',
  '["The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This statement best captures the chapter''s lasting theological pressure (1 Kings 11:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 11
    AND difficulty_stage = 5
    AND prompt = 'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  11,
  5,
  'Which statement best reflects the long-range force of 1 Kings 11?',
  '["This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","This act provides the theological justification for the northern kingdom''s existence.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty."]'::jsonb,
  'This act provides the theological justification for the northern kingdom''s existence.',
  'This statement best reflects the chapter''s long-range force within the narrative (1 Kings 11:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 11
    AND difficulty_stage = 5
    AND prompt = 'Which statement best reflects the long-range force of 1 Kings 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  11,
  5,
  'Which synthesis best joins the factual details and themes of 1 Kings 11?',
  '["The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This synthesis most successfully joins the chapter''s details and themes (1 Kings 11:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 11
    AND difficulty_stage = 5
    AND prompt = 'Which synthesis best joins the factual details and themes of 1 Kings 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  12,
  1,
  'What development clearly belongs to 1 Kings 12?',
  '["Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Jeroboam leads the northern rebellion (1 Kings 12:20)"]'::jsonb,
  'Jeroboam leads the northern rebellion (1 Kings 12:20)',
  'This detail is directly tied to 1 Kings 12:20.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 12
    AND difficulty_stage = 1
    AND prompt = 'What development clearly belongs to 1 Kings 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  12,
  1,
  'Which event is described in 1 Kings 12?',
  '["He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","They form the southern Kingdom of Judah (1 Kings 12:21-24)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)"]'::jsonb,
  'They form the southern Kingdom of Judah (1 Kings 12:21-24)',
  'This event is part of the chapter''s verse-linked source material (1 Kings 12:21-24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 12
    AND difficulty_stage = 1
    AND prompt = 'Which event is described in 1 Kings 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  12,
  1,
  'Who appears in 1 Kings 12?',
  '["Solomon","Adonijah","Rehoboam","David"]'::jsonb,
  'Rehoboam',
  'Rehoboam is listed among the key people for this chapter (1 Kings 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 12
    AND difficulty_stage = 1
    AND prompt = 'Who appears in 1 Kings 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  12,
  1,
  'Which verse is highlighted in 1 Kings 12?',
  '["1 Kings 1:29","1 Kings 12:4","1 Kings 1:5","1 Kings 1:11"]'::jsonb,
  '1 Kings 12:4',
  '1 Kings 12:4 is one of the chapter''s supporting verses.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 12
    AND difficulty_stage = 1
    AND prompt = 'Which verse is highlighted in 1 Kings 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  12,
  1,
  'What theme stands out in 1 Kings 12?',
  '["Royal succession","David''s final days","Covenant legitimacy","Prideful leadership"]'::jsonb,
  'Prideful leadership',
  'Prideful leadership is listed among the chapter themes (1 Kings 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 12
    AND difficulty_stage = 1
    AND prompt = 'What theme stands out in 1 Kings 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  12,
  1,
  'Which title best fits 1 Kings 12?',
  '["The kingdom divides under Rehoboam","Solomon anointed amid succession crisis","David''s charge and Solomon''s first judgments","Solomon asks for wisdom"]'::jsonb,
  'The kingdom divides under Rehoboam',
  'The kingdom divides under Rehoboam is the chapter title in the commentary notes (1 Kings 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 12
    AND difficulty_stage = 1
    AND prompt = 'Which title best fits 1 Kings 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  12,
  1,
  'Which verse-linked detail appears in 1 Kings 12?',
  '["Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","The tribe of Benjamin stays with the tribe of Judah under Rehoboam (1 Kings 12:21)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)"]'::jsonb,
  'The tribe of Benjamin stays with the tribe of Judah under Rehoboam (1 Kings 12:21)',
  'This verse-linked detail appears in the source notes for 1 Kings 12:21.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 12
    AND difficulty_stage = 1
    AND prompt = 'Which verse-linked detail appears in 1 Kings 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  12,
  2,
  'What happens in 1 Kings 12?',
  '["Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Their territory includes the strategic city of Jerusalem (Joshua 18:28)"]'::jsonb,
  'Their territory includes the strategic city of Jerusalem (Joshua 18:28)',
  'This detail belongs to the chapter''s source notes (1 Kings 12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 12
    AND difficulty_stage = 2
    AND prompt = 'What happens in 1 Kings 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  12,
  2,
  'What happens in 1 Kings 12?',
  '["He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","He sets one calf in Bethel and the other in Dan (1 Kings 12:29)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)"]'::jsonb,
  'He sets one calf in Bethel and the other in Dan (1 Kings 12:29)',
  'The source material for 1 Kings 12:29 includes this detail.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 12
    AND difficulty_stage = 2
    AND prompt = 'What happens in 1 Kings 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  12,
  2,
  'Which phrase is used in 1 Kings 12?',
  '["Nathan the prophet","my little finger is thicker","Let Solomon my son reign","Zadok the priest"]'::jsonb,
  'my little finger is thicker',
  'This phrase appears among the chapter''s evidence phrases (1 Kings 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 12
    AND difficulty_stage = 2
    AND prompt = 'Which phrase is used in 1 Kings 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  12,
  2,
  'What key point stands out in 1 Kings 12?',
  '["Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people.","Rehoboam refuses wise counsel from the elders.","Adonijah attempts to claim the throne without David''s approval."]'::jsonb,
  'Rehoboam refuses wise counsel from the elders.',
  'This key point is part of the commentary notes for the chapter (1 Kings 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 12
    AND difficulty_stage = 2
    AND prompt = 'What key point stands out in 1 Kings 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  12,
  2,
  'What does Jeroboam make in 1 Kings 12?',
  '["Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Jeroboam makes two golden calves to keep the people from Jerusalem (1 Kings 12:28)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)"]'::jsonb,
  'Jeroboam makes two golden calves to keep the people from Jerusalem (1 Kings 12:28)',
  'This scene is tied to 1 Kings 12:28.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 12
    AND difficulty_stage = 2
    AND prompt = 'What does Jeroboam make in 1 Kings 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  12,
  2,
  'Why does this matter in 1 Kings 12?',
  '["This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","Benjamin''s loyalty ensured the survival and strategic defensibility of the Davidic kingdom."]'::jsonb,
  'Benjamin''s loyalty ensured the survival and strategic defensibility of the Davidic kingdom.',
  'This significance statement is attached to verse-linked material from this chapter (1 Kings 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 12
    AND difficulty_stage = 2
    AND prompt = 'Why does this matter in 1 Kings 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  12,
  2,
  'Which summary best fits 1 Kings 12?',
  '["When the ten northern tribes rebel, Benjamin remains loyal to the house of David.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king."]'::jsonb,
  'When the ten northern tribes rebel, Benjamin remains loyal to the house of David.',
  'This summary line comes from source material connected to 1 Kings 12:4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 12
    AND difficulty_stage = 2
    AND prompt = 'Which summary best fits 1 Kings 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  12,
  3,
  'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 12?',
  '["Zadok the priest","Nathan the prophet","what portion have we in David?","Let Solomon my son reign"]'::jsonb,
  'what portion have we in David?',
  'This phrase most directly reflects the chapter''s focal line (1 Kings 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 12
    AND difficulty_stage = 3
    AND prompt = 'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  12,
  3,
  'Which key point best summarizes what 1 Kings 12 emphasizes?',
  '["The people reject the house of David''s harsh reply.","Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people."]'::jsonb,
  'The people reject the house of David''s harsh reply.',
  'This key point best captures the emphasis of the chapter summary (1 Kings 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 12
    AND difficulty_stage = 3
    AND prompt = 'Which key point best summarizes what 1 Kings 12 emphasizes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  12,
  3,
  'Which line best explains why the events of 1 Kings 12 matter?',
  '["This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","Benjamin''s loyalty ensured the survival and strategic defensibility of the Davidic kingdom.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty."]'::jsonb,
  'Benjamin''s loyalty ensured the survival and strategic defensibility of the Davidic kingdom.',
  'This significance line best explains the chapter''s weight (1 Kings 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 12
    AND difficulty_stage = 3
    AND prompt = 'Which line best explains why the events of 1 Kings 12 matter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  12,
  3,
  'Which statement best captures the chapter''s main action in 1 Kings 12?',
  '["Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","When the ten northern tribes rebel, Benjamin remains loyal to the house of David."]'::jsonb,
  'When the ten northern tribes rebel, Benjamin remains loyal to the house of David.',
  'This summary best fits the chapter''s core movement (1 Kings 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 12
    AND difficulty_stage = 3
    AND prompt = 'Which statement best captures the chapter''s main action in 1 Kings 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  12,
  3,
  'Which statement best matches the leadership pressure in 1 Kings 12?',
  '["Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people.","Jeroboam becomes king over the northern tribes."]'::jsonb,
  'Jeroboam becomes king over the northern tribes.',
  'This statement best matches the chapter''s leadership pressure (1 Kings 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 12
    AND difficulty_stage = 3
    AND prompt = 'Which statement best matches the leadership pressure in 1 Kings 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  12,
  3,
  'Which summary statement best fits the movement of 1 Kings 12?',
  '["At Gibeon, Solomon asks God for a listening heart rather than riches, long life, or victory over enemies. God grants him unmatched wisdom along with wealth and honor because he asked for discernment to govern well. His first judgment between two women proves that the gift is real and that the people can trust his rule.","Rehoboam rejects the elders'' counsel and answers the people with harsher demands than his father had imposed. The northern tribes rebel, crowning Jeroboam and breaking the united kingdom in two. The chapter marks the turning point from Solomon''s glory to long division between Israel and Judah.","As David grows old, Adonijah tries to seize the throne, but Nathan, Bathsheba, Zadok, and Benaiah move quickly to secure Solomon''s anointing. David publicly confirms Solomon as his chosen successor, and the people celebrate the new king. The chapter closes with Adonijah seeking mercy as Solomon begins his reign with legitimacy and peace.","David gives Solomon final instructions to walk faithfully, guard the kingdom, and deal wisely with unresolved matters in the court. Solomon secures his throne by removing threats from Adonijah, Abiathar, Joab, and Shimei. The chapter shows that the new king''s rule must be rooted in obedience, justice, and discernment."]'::jsonb,
  'Rehoboam rejects the elders'' counsel and answers the people with harsher demands than his father had imposed. The northern tribes rebel, crowning Jeroboam and breaking the united kingdom in two. The chapter marks the turning point from Solomon''s glory to long division between Israel and Judah.',
  'This is the chapter summary for 1 Kings 12.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 12
    AND difficulty_stage = 3
    AND prompt = 'Which summary statement best fits the movement of 1 Kings 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  12,
  3,
  'Which theme best interprets the events of 1 Kings 12?',
  '["Covenant legitimacy","Prideful leadership","Royal succession","David''s final days"]'::jsonb,
  'Prideful leadership',
  'Prideful leadership is the best thematic lens supplied in the notes (1 Kings 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 12
    AND difficulty_stage = 3
    AND prompt = 'Which theme best interprets the events of 1 Kings 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  12,
  4,
  'How does 1 Kings 12 function in the wider narrative of 1 Kings?',
  '["It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It turns spoken warnings into visible judgment within the royal story.","It advances the temple-centered shape of worship and kingship in Israel."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This option best fits the chapter''s narrative role within 1 Kings (1 Kings 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 12
    AND difficulty_stage = 4
    AND prompt = 'How does 1 Kings 12 function in the wider narrative of 1 Kings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  12,
  4,
  'Which claim best fits the chapter''s larger significance in 1 Kings 12?',
  '["As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","When the ten northern tribes rebel, Benjamin remains loyal to the house of David.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne."]'::jsonb,
  'When the ten northern tribes rebel, Benjamin remains loyal to the house of David.',
  'This claim best fits the chapter''s larger significance in context (1 Kings 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 12
    AND difficulty_stage = 4
    AND prompt = 'Which claim best fits the chapter''s larger significance in 1 Kings 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  12,
  4,
  'Which conclusion best matches the covenant pressure visible in 1 Kings 12?',
  '["The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter teaches that divine judgment is patient, but it does not fail to arrive."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This conclusion best matches the chapter''s covenant pressure (1 Kings 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 12
    AND difficulty_stage = 4
    AND prompt = 'Which conclusion best matches the covenant pressure visible in 1 Kings 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  12,
  4,
  'Which reading best connects the chapter''s facts and themes in 1 Kings 12?',
  '["This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","Benjamin''s loyalty ensured the survival and strategic defensibility of the Davidic kingdom."]'::jsonb,
  'Benjamin''s loyalty ensured the survival and strategic defensibility of the Davidic kingdom.',
  'This reading best connects the chapter''s verse-linked facts and its meaning (1 Kings 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 12
    AND difficulty_stage = 4
    AND prompt = 'Which reading best connects the chapter''s facts and themes in 1 Kings 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  12,
  4,
  'Which statement best explains the chapter''s contribution to the book in 1 Kings 12?',
  '["It turns spoken warnings into visible judgment within the royal story.","It advances the temple-centered shape of worship and kingship in Israel.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This statement best explains how the chapter contributes to the book''s flow (1 Kings 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 12
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains the chapter''s contribution to the book in 1 Kings 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  12,
  4,
  'Which statement best explains why the chapter is strategically important in 1 Kings 12?',
  '["It turns spoken warnings into visible judgment within the royal story.","It advances the temple-centered shape of worship and kingship in Israel.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This option best explains the chapter''s strategic importance in the book (1 Kings 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 12
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains why the chapter is strategically important in 1 Kings 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  12,
  4,
  'Which theological reading best fits 1 Kings 12?',
  '["The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This theological reading best fits the chapter''s themes and developments (1 Kings 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 12
    AND difficulty_stage = 4
    AND prompt = 'Which theological reading best fits 1 Kings 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  12,
  5,
  'Which advanced synthesis best captures the theology of 1 Kings 12?',
  '["The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This is the strongest theological synthesis grounded in the chapter''s notes (1 Kings 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 12
    AND difficulty_stage = 5
    AND prompt = 'Which advanced synthesis best captures the theology of 1 Kings 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  12,
  5,
  'Which book-level synthesis best explains 1 Kings 12?',
  '["It presents wise rule as foundational to the success of Solomon''s reign.","It turns spoken warnings into visible judgment within the royal story.","It advances the temple-centered shape of worship and kingship in Israel.","It contrasts self-exalting ambition with the kingly order David affirms."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This is the best book-level synthesis of the chapter''s role (1 Kings 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 12
    AND difficulty_stage = 5
    AND prompt = 'Which book-level synthesis best explains 1 Kings 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  12,
  5,
  'Which high-level reading best explains why 1 Kings 12 is remembered?',
  '["This feast was a formal attempt to stage a coup against David''s intentions.","Benjamin''s loyalty ensured the survival and strategic defensibility of the Davidic kingdom.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride."]'::jsonb,
  'Benjamin''s loyalty ensured the survival and strategic defensibility of the Davidic kingdom.',
  'This high-level reading best explains why the chapter remains significant (1 Kings 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 12
    AND difficulty_stage = 5
    AND prompt = 'Which high-level reading best explains why 1 Kings 12 is remembered?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  12,
  5,
  'Which interpretive conclusion best fits the chapter''s place in 1 Kings 12?',
  '["It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It turns spoken warnings into visible judgment within the royal story.","It advances the temple-centered shape of worship and kingship in Israel."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This interpretive conclusion best fits the chapter''s place in the book (1 Kings 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 12
    AND difficulty_stage = 5
    AND prompt = 'Which interpretive conclusion best fits the chapter''s place in 1 Kings 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  12,
  5,
  'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 12?',
  '["The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This statement best captures the chapter''s lasting theological pressure (1 Kings 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 12
    AND difficulty_stage = 5
    AND prompt = 'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  12,
  5,
  'Which statement best reflects the long-range force of 1 Kings 12?',
  '["This feast was a formal attempt to stage a coup against David''s intentions.","Benjamin''s loyalty ensured the survival and strategic defensibility of the Davidic kingdom.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride."]'::jsonb,
  'Benjamin''s loyalty ensured the survival and strategic defensibility of the Davidic kingdom.',
  'This statement best reflects the chapter''s long-range force within the narrative (1 Kings 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 12
    AND difficulty_stage = 5
    AND prompt = 'Which statement best reflects the long-range force of 1 Kings 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  12,
  5,
  'Which synthesis best joins the factual details and themes of 1 Kings 12?',
  '["The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter teaches that divine judgment is patient, but it does not fail to arrive."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This synthesis most successfully joins the chapter''s details and themes (1 Kings 12:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 12
    AND difficulty_stage = 5
    AND prompt = 'Which synthesis best joins the factual details and themes of 1 Kings 12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  13,
  1,
  'What does The prophet cries out against the altar and name in 1 Kings 13?',
  '["Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","The prophet cries out against the altar and names King Josiah as its future destroyer (1 Kings 13:2)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)"]'::jsonb,
  'The prophet cries out against the altar and names King Josiah as its future destroyer (1 Kings 13:2)',
  'This detail is directly tied to 1 Kings 13:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 13
    AND difficulty_stage = 1
    AND prompt = 'What does The prophet cries out against the altar and name in 1 Kings 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  13,
  1,
  'Which event is described in 1 Kings 13?',
  '["Jeroboam''s hand is paralyzed when he tries to arrest the prophet (1 Kings 13:4)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)"]'::jsonb,
  'Jeroboam''s hand is paralyzed when he tries to arrest the prophet (1 Kings 13:4)',
  'This event is part of the chapter''s verse-linked source material (1 Kings 13:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 13
    AND difficulty_stage = 1
    AND prompt = 'Which event is described in 1 Kings 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  13,
  1,
  'Who appears in 1 Kings 13?',
  '["Adonijah","Jeroboam","David","Solomon"]'::jsonb,
  'Jeroboam',
  'Jeroboam is listed among the key people for this chapter (1 Kings 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 13
    AND difficulty_stage = 1
    AND prompt = 'Who appears in 1 Kings 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  13,
  1,
  'Which verse is highlighted in 1 Kings 13?',
  '["1 Kings 13:2","1 Kings 1:5","1 Kings 1:11","1 Kings 1:29"]'::jsonb,
  '1 Kings 13:2',
  '1 Kings 13:2 is one of the chapter''s supporting verses.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 13
    AND difficulty_stage = 1
    AND prompt = 'Which verse is highlighted in 1 Kings 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  13,
  1,
  'What theme stands out in 1 Kings 13?',
  '["David''s final days","Covenant legitimacy","Prophetic warning","Royal succession"]'::jsonb,
  'Prophetic warning',
  'Prophetic warning is listed among the chapter themes (1 Kings 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 13
    AND difficulty_stage = 1
    AND prompt = 'What theme stands out in 1 Kings 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  13,
  1,
  'Which title best fits 1 Kings 13?',
  '["Solomon anointed amid succession crisis","David''s charge and Solomon''s first judgments","Solomon asks for wisdom","A prophet confronts Bethel''s altar"]'::jsonb,
  'A prophet confronts Bethel''s altar',
  'A prophet confronts Bethel''s altar is the chapter title in the commentary notes (1 Kings 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 13
    AND difficulty_stage = 1
    AND prompt = 'Which title best fits 1 Kings 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  13,
  1,
  'What happens to the altar in 1 Kings 13?',
  '["He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","The altar is miraculously split apart and the ashes poured out (1 Kings 13:3-5)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)"]'::jsonb,
  'The altar is miraculously split apart and the ashes poured out (1 Kings 13:3-5)',
  'This verse-linked detail appears in the source notes for 1 Kings 13:3-5.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 13
    AND difficulty_stage = 1
    AND prompt = 'What happens to the altar in 1 Kings 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  13,
  2,
  'What happens in 1 Kings 13?',
  '["Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","The king begs the prophet to intercede and his hand is restored (1 Kings 13:6)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)"]'::jsonb,
  'The king begs the prophet to intercede and his hand is restored (1 Kings 13:6)',
  'This detail belongs to the chapter''s source notes (1 Kings 13:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 13
    AND difficulty_stage = 2
    AND prompt = 'What happens in 1 Kings 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  13,
  2,
  'What detail appears in 1 Kings 13?',
  '["The altar is miraculously split apart and the ashes poured out (1 Kings 13:3-5)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)"]'::jsonb,
  'The altar is miraculously split apart and the ashes poured out (1 Kings 13:3-5)',
  'The source material for 1 Kings 13:3-5 includes this detail.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 13
    AND difficulty_stage = 2
    AND prompt = 'What detail appears in 1 Kings 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  13,
  2,
  'Which phrase is used in 1 Kings 13?',
  '["altar, altar","Let Solomon my son reign","Zadok the priest","Nathan the prophet"]'::jsonb,
  'altar, altar',
  'This phrase appears among the chapter''s evidence phrases (1 Kings 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 13
    AND difficulty_stage = 2
    AND prompt = 'Which phrase is used in 1 Kings 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  13,
  2,
  'What key point stands out in 1 Kings 13?',
  '["Solomon is anointed king and proclaimed by the people.","The man of God condemns the altar at Bethel.","Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows."]'::jsonb,
  'The man of God condemns the altar at Bethel.',
  'This key point is part of the commentary notes for the chapter (1 Kings 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 13
    AND difficulty_stage = 2
    AND prompt = 'What key point stands out in 1 Kings 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  13,
  2,
  'What does The prophet cries out against the altar and name in 1 Kings 13?',
  '["He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","The prophet cries out against the altar and names King Josiah as its future destroyer (1 Kings 13:2)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)"]'::jsonb,
  'The prophet cries out against the altar and names King Josiah as its future destroyer (1 Kings 13:2)',
  'This scene is tied to 1 Kings 13:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 13
    AND difficulty_stage = 2
    AND prompt = 'What does The prophet cries out against the altar and name in 1 Kings 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  13,
  2,
  'What does this mean in 1 Kings 13?',
  '["This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","This demonstration proved that Jeroboam''s new religion was under divine judgment.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty."]'::jsonb,
  'This demonstration proved that Jeroboam''s new religion was under divine judgment.',
  'This significance statement is attached to verse-linked material from this chapter (1 Kings 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 13
    AND difficulty_stage = 2
    AND prompt = 'What does this mean in 1 Kings 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  13,
  2,
  'Which summary best fits 1 Kings 13?',
  '["Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","A man of God from Judah confronts Jeroboam as he is burning incense at the Bethel altar."]'::jsonb,
  'A man of God from Judah confronts Jeroboam as he is burning incense at the Bethel altar.',
  'This summary line comes from source material connected to 1 Kings 13:2.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 13
    AND difficulty_stage = 2
    AND prompt = 'Which summary best fits 1 Kings 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  13,
  3,
  'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 13?',
  '["Nathan the prophet","the altar was split apart","Let Solomon my son reign","Zadok the priest"]'::jsonb,
  'the altar was split apart',
  'This phrase most directly reflects the chapter''s focal line (1 Kings 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 13
    AND difficulty_stage = 3
    AND prompt = 'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  13,
  3,
  'Which key point best summarizes what 1 Kings 13 emphasizes?',
  '["Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people.","A sign confirms the truth of the prophecy."]'::jsonb,
  'A sign confirms the truth of the prophecy.',
  'This key point best captures the emphasis of the chapter summary (1 Kings 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 13
    AND difficulty_stage = 3
    AND prompt = 'Which key point best summarizes what 1 Kings 13 emphasizes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  13,
  3,
  'Which line best explains why the events of 1 Kings 13 matter?',
  '["This feast was a formal attempt to stage a coup against David''s intentions.","This demonstration proved that Jeroboam''s new religion was under divine judgment.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride."]'::jsonb,
  'This demonstration proved that Jeroboam''s new religion was under divine judgment.',
  'This significance line best explains the chapter''s weight (1 Kings 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 13
    AND difficulty_stage = 3
    AND prompt = 'Which line best explains why the events of 1 Kings 13 matter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  13,
  3,
  'Which statement best captures the chapter''s main action in 1 Kings 13?',
  '["As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","A man of God from Judah confronts Jeroboam as he is burning incense at the Bethel altar.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne."]'::jsonb,
  'A man of God from Judah confronts Jeroboam as he is burning incense at the Bethel altar.',
  'This summary best fits the chapter''s core movement (1 Kings 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 13
    AND difficulty_stage = 3
    AND prompt = 'Which statement best captures the chapter''s main action in 1 Kings 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  13,
  3,
  'Which statement best matches the leadership pressure in 1 Kings 13?',
  '["Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people.","Jeroboam''s hand is restored only after appeal.","Adonijah attempts to claim the throne without David''s approval."]'::jsonb,
  'Jeroboam''s hand is restored only after appeal.',
  'This statement best matches the chapter''s leadership pressure (1 Kings 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 13
    AND difficulty_stage = 3
    AND prompt = 'Which statement best matches the leadership pressure in 1 Kings 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  13,
  3,
  'Which summary statement best fits the movement of 1 Kings 13?',
  '["A man of God from Judah confronts Jeroboam''s altar at Bethel and announces that idolatrous worship will be judged. The sign of the broken altar and the withered hand confirms that God''s word stands above royal religion. Jeroboam''s stubbornness begins a pattern of resistance that will haunt the northern kingdom.","As David grows old, Adonijah tries to seize the throne, but Nathan, Bathsheba, Zadok, and Benaiah move quickly to secure Solomon''s anointing. David publicly confirms Solomon as his chosen successor, and the people celebrate the new king. The chapter closes with Adonijah seeking mercy as Solomon begins his reign with legitimacy and peace.","David gives Solomon final instructions to walk faithfully, guard the kingdom, and deal wisely with unresolved matters in the court. Solomon secures his throne by removing threats from Adonijah, Abiathar, Joab, and Shimei. The chapter shows that the new king''s rule must be rooted in obedience, justice, and discernment.","At Gibeon, Solomon asks God for a listening heart rather than riches, long life, or victory over enemies. God grants him unmatched wisdom along with wealth and honor because he asked for discernment to govern well. His first judgment between two women proves that the gift is real and that the people can trust his rule."]'::jsonb,
  'A man of God from Judah confronts Jeroboam''s altar at Bethel and announces that idolatrous worship will be judged. The sign of the broken altar and the withered hand confirms that God''s word stands above royal religion. Jeroboam''s stubbornness begins a pattern of resistance that will haunt the northern kingdom.',
  'This is the chapter summary for 1 Kings 13.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 13
    AND difficulty_stage = 3
    AND prompt = 'Which summary statement best fits the movement of 1 Kings 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  13,
  3,
  'Which theme best interprets the events of 1 Kings 13?',
  '["Prophetic warning","Royal succession","David''s final days","Covenant legitimacy"]'::jsonb,
  'Prophetic warning',
  'Prophetic warning is the best thematic lens supplied in the notes (1 Kings 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 13
    AND difficulty_stage = 3
    AND prompt = 'Which theme best interprets the events of 1 Kings 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  13,
  4,
  'How does 1 Kings 13 function in the wider narrative of 1 Kings?',
  '["It presents wise rule as foundational to the success of Solomon''s reign.","It turns spoken warnings into visible judgment within the royal story.","It advances the temple-centered shape of worship and kingship in Israel.","It contrasts self-exalting ambition with the kingly order David affirms."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This option best fits the chapter''s narrative role within 1 Kings (1 Kings 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 13
    AND difficulty_stage = 4
    AND prompt = 'How does 1 Kings 13 function in the wider narrative of 1 Kings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  13,
  4,
  'Which claim best fits the chapter''s larger significance in 1 Kings 13?',
  '["Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","A man of God from Judah confronts Jeroboam as he is burning incense at the Bethel altar.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following."]'::jsonb,
  'A man of God from Judah confronts Jeroboam as he is burning incense at the Bethel altar.',
  'This claim best fits the chapter''s larger significance in context (1 Kings 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 13
    AND difficulty_stage = 4
    AND prompt = 'Which claim best fits the chapter''s larger significance in 1 Kings 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  13,
  4,
  'Which conclusion best matches the covenant pressure visible in 1 Kings 13?',
  '["The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This conclusion best matches the chapter''s covenant pressure (1 Kings 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 13
    AND difficulty_stage = 4
    AND prompt = 'Which conclusion best matches the covenant pressure visible in 1 Kings 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  13,
  4,
  'Which reading best connects the chapter''s facts and themes in 1 Kings 13?',
  '["This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","This demonstration proved that Jeroboam''s new religion was under divine judgment.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty."]'::jsonb,
  'This demonstration proved that Jeroboam''s new religion was under divine judgment.',
  'This reading best connects the chapter''s verse-linked facts and its meaning (1 Kings 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 13
    AND difficulty_stage = 4
    AND prompt = 'Which reading best connects the chapter''s facts and themes in 1 Kings 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  13,
  4,
  'Which statement best explains the chapter''s contribution to the book in 1 Kings 13?',
  '["It advances the temple-centered shape of worship and kingship in Israel.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It turns spoken warnings into visible judgment within the royal story."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This statement best explains how the chapter contributes to the book''s flow (1 Kings 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 13
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains the chapter''s contribution to the book in 1 Kings 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  13,
  4,
  'Which statement best explains why the chapter is strategically important in 1 Kings 13?',
  '["It advances the temple-centered shape of worship and kingship in Israel.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It turns spoken warnings into visible judgment within the royal story."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This option best explains the chapter''s strategic importance in the book (1 Kings 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 13
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains why the chapter is strategically important in 1 Kings 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  13,
  4,
  'Which theological reading best fits 1 Kings 13?',
  '["The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This theological reading best fits the chapter''s themes and developments (1 Kings 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 13
    AND difficulty_stage = 4
    AND prompt = 'Which theological reading best fits 1 Kings 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  13,
  5,
  'Which advanced synthesis best captures the theology of 1 Kings 13?',
  '["The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This is the strongest theological synthesis grounded in the chapter''s notes (1 Kings 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 13
    AND difficulty_stage = 5
    AND prompt = 'Which advanced synthesis best captures the theology of 1 Kings 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  13,
  5,
  'Which book-level synthesis best explains 1 Kings 13?',
  '["It turns spoken warnings into visible judgment within the royal story.","It advances the temple-centered shape of worship and kingship in Israel.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This is the best book-level synthesis of the chapter''s role (1 Kings 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 13
    AND difficulty_stage = 5
    AND prompt = 'Which book-level synthesis best explains 1 Kings 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  13,
  5,
  'Which high-level reading best explains why 1 Kings 13 is remembered?',
  '["This demonstration proved that Jeroboam''s new religion was under divine judgment.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions."]'::jsonb,
  'This demonstration proved that Jeroboam''s new religion was under divine judgment.',
  'This high-level reading best explains why the chapter remains significant (1 Kings 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 13
    AND difficulty_stage = 5
    AND prompt = 'Which high-level reading best explains why 1 Kings 13 is remembered?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  13,
  5,
  'Which interpretive conclusion best fits the chapter''s place in 1 Kings 13?',
  '["It presents wise rule as foundational to the success of Solomon''s reign.","It turns spoken warnings into visible judgment within the royal story.","It advances the temple-centered shape of worship and kingship in Israel.","It contrasts self-exalting ambition with the kingly order David affirms."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This interpretive conclusion best fits the chapter''s place in the book (1 Kings 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 13
    AND difficulty_stage = 5
    AND prompt = 'Which interpretive conclusion best fits the chapter''s place in 1 Kings 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  13,
  5,
  'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 13?',
  '["The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This statement best captures the chapter''s lasting theological pressure (1 Kings 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 13
    AND difficulty_stage = 5
    AND prompt = 'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  13,
  5,
  'Which statement best reflects the long-range force of 1 Kings 13?',
  '["This demonstration proved that Jeroboam''s new religion was under divine judgment.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions."]'::jsonb,
  'This demonstration proved that Jeroboam''s new religion was under divine judgment.',
  'This statement best reflects the chapter''s long-range force within the narrative (1 Kings 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 13
    AND difficulty_stage = 5
    AND prompt = 'Which statement best reflects the long-range force of 1 Kings 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  13,
  5,
  'Which synthesis best joins the factual details and themes of 1 Kings 13?',
  '["The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This synthesis most successfully joins the chapter''s details and themes (1 Kings 13:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 13
    AND difficulty_stage = 5
    AND prompt = 'Which synthesis best joins the factual details and themes of 1 Kings 13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  14,
  1,
  'What results from this in 1 Kings 14?',
  '["He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","His father is Rehoboam, the first king of Judah (1 Kings 14:31)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)"]'::jsonb,
  'His father is Rehoboam, the first king of Judah (1 Kings 14:31)',
  'This detail is directly tied to 1 Kings 14:31.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 14
    AND difficulty_stage = 1
    AND prompt = 'What results from this in 1 Kings 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  14,
  1,
  'What happens in 1 Kings 14?',
  '["Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","He is designated as the heir early in his father''s life (2 Chronicles 11:22)"]'::jsonb,
  'He is designated as the heir early in his father''s life (2 Chronicles 11:22)',
  'This event is part of the chapter''s verse-linked source material (1 Kings 14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 14
    AND difficulty_stage = 1
    AND prompt = 'What happens in 1 Kings 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  14,
  1,
  'Who appears in 1 Kings 14?',
  '["Jeroboam","David","Solomon","Adonijah"]'::jsonb,
  'Jeroboam',
  'Jeroboam is listed among the key people for this chapter (1 Kings 14:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 14
    AND difficulty_stage = 1
    AND prompt = 'Who appears in 1 Kings 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  14,
  1,
  'Which verse is highlighted in 1 Kings 14?',
  '["1 Kings 1:5","1 Kings 1:11","1 Kings 1:29","1 Kings 14:10"]'::jsonb,
  '1 Kings 14:10',
  '1 Kings 14:10 is one of the chapter''s supporting verses.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 14
    AND difficulty_stage = 1
    AND prompt = 'Which verse is highlighted in 1 Kings 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  14,
  1,
  'What theme stands out in 1 Kings 14?',
  '["Covenant legitimacy","Dynastic judgment","Royal succession","David''s final days"]'::jsonb,
  'Dynastic judgment',
  'Dynastic judgment is listed among the chapter themes (1 Kings 14:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 14
    AND difficulty_stage = 1
    AND prompt = 'What theme stands out in 1 Kings 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  14,
  1,
  'Which title best fits 1 Kings 14?',
  '["David''s charge and Solomon''s first judgments","Solomon asks for wisdom","Judgment on Jeroboam''s house","Solomon anointed amid succession crisis"]'::jsonb,
  'Judgment on Jeroboam''s house',
  'Judgment on Jeroboam''s house is the chapter title in the commentary notes (1 Kings 14:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 14
    AND difficulty_stage = 1
    AND prompt = 'Which title best fits 1 Kings 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  14,
  1,
  'What results from this in 1 Kings 14?',
  '["His mother Maakah was Rehoboam''s favorite wife (2 Chronicles 11:21)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)"]'::jsonb,
  'His mother Maakah was Rehoboam''s favorite wife (2 Chronicles 11:21)',
  'This verse-linked detail appears in the source notes for 1 Kings 14.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 14
    AND difficulty_stage = 1
    AND prompt = 'What results from this in 1 Kings 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  14,
  2,
  'What happens in 1 Kings 14?',
  '["He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","He grows up during the initial split of the United Monarchy (1 Kings 14:31)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)"]'::jsonb,
  'He grows up during the initial split of the United Monarchy (1 Kings 14:31)',
  'This detail belongs to the chapter''s source notes (1 Kings 14:31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 14
    AND difficulty_stage = 2
    AND prompt = 'What happens in 1 Kings 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  14,
  2,
  'What results from this in 1 Kings 14?',
  '["Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","His mother is identified as Maakah the daughter of Abishalom (1 Kings 15:2)"]'::jsonb,
  'His mother is identified as Maakah the daughter of Abishalom (1 Kings 15:2)',
  'The source material for 1 Kings 15:2 includes this detail.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 14
    AND difficulty_stage = 2
    AND prompt = 'What results from this in 1 Kings 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  14,
  2,
  'Which phrase is used in 1 Kings 14?',
  '["Let Solomon my son reign","Zadok the priest","Nathan the prophet","I will cut off"]'::jsonb,
  'I will cut off',
  'This phrase appears among the chapter''s evidence phrases (1 Kings 14:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 14
    AND difficulty_stage = 2
    AND prompt = 'Which phrase is used in 1 Kings 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  14,
  2,
  'What key point stands out in 1 Kings 14?',
  '["Ahijah announces the fall of Jeroboam''s house.","Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people."]'::jsonb,
  'Ahijah announces the fall of Jeroboam''s house.',
  'This key point is part of the commentary notes for the chapter (1 Kings 14:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 14
    AND difficulty_stage = 2
    AND prompt = 'What key point stands out in 1 Kings 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  14,
  2,
  'What happens in 1 Kings 14?',
  '["He begins his reign in the eighteenth year of Jeroboam (1 Kings 15:1)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)"]'::jsonb,
  'He begins his reign in the eighteenth year of Jeroboam (1 Kings 15:1)',
  'This scene is tied to 1 Kings 15:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 14
    AND difficulty_stage = 2
    AND prompt = 'What happens in 1 Kings 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  14,
  2,
  'What results from this in 1 Kings 14?',
  '["This feast was a formal attempt to stage a coup against David''s intentions.","His royal position was solidified by his father''s favor despite having many brothers.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride."]'::jsonb,
  'His royal position was solidified by his father''s favor despite having many brothers.',
  'This significance statement is attached to verse-linked material from this chapter (1 Kings 14:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 14
    AND difficulty_stage = 2
    AND prompt = 'What results from this in 1 Kings 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  14,
  2,
  'Which summary best fits 1 Kings 14?',
  '["As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Abijah is born to King Rehoboam and Maakah, a granddaughter of Absalom.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne."]'::jsonb,
  'Abijah is born to King Rehoboam and Maakah, a granddaughter of Absalom.',
  'This summary line comes from source material connected to 1 Kings 14:10.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 14
    AND difficulty_stage = 2
    AND prompt = 'Which summary best fits 1 Kings 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  14,
  3,
  'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 14?',
  '["because you have done evil","Let Solomon my son reign","Zadok the priest","Nathan the prophet"]'::jsonb,
  'because you have done evil',
  'This phrase most directly reflects the chapter''s focal line (1 Kings 14:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 14
    AND difficulty_stage = 3
    AND prompt = 'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  14,
  3,
  'Which key point best summarizes what 1 Kings 14 emphasizes?',
  '["Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people.","Jeroboam''s son Abijah dies as foretold.","Adonijah attempts to claim the throne without David''s approval."]'::jsonb,
  'Jeroboam''s son Abijah dies as foretold.',
  'This key point best captures the emphasis of the chapter summary (1 Kings 14:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 14
    AND difficulty_stage = 3
    AND prompt = 'Which key point best summarizes what 1 Kings 14 emphasizes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  14,
  3,
  'Which line best explains why the events of 1 Kings 14 matter?',
  '["His royal position was solidified by his father''s favor despite having many brothers.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions."]'::jsonb,
  'His royal position was solidified by his father''s favor despite having many brothers.',
  'This significance line best explains the chapter''s weight (1 Kings 14:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 14
    AND difficulty_stage = 3
    AND prompt = 'Which line best explains why the events of 1 Kings 14 matter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  14,
  3,
  'Which statement best captures the chapter''s main action in 1 Kings 14?',
  '["Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Abijah is born to King Rehoboam and Maakah, a granddaughter of Absalom.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following."]'::jsonb,
  'Abijah is born to King Rehoboam and Maakah, a granddaughter of Absalom.',
  'This summary best fits the chapter''s core movement (1 Kings 14:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 14
    AND difficulty_stage = 3
    AND prompt = 'Which statement best captures the chapter''s main action in 1 Kings 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  14,
  3,
  'Which statement best matches the leadership pressure in 1 Kings 14?',
  '["Solomon is anointed king and proclaimed by the people.","Rehoboam also leads Judah into sin.","Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows."]'::jsonb,
  'Rehoboam also leads Judah into sin.',
  'This statement best matches the chapter''s leadership pressure (1 Kings 14:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 14
    AND difficulty_stage = 3
    AND prompt = 'Which statement best matches the leadership pressure in 1 Kings 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  14,
  3,
  'Which summary statement best fits the movement of 1 Kings 14?',
  '["As David grows old, Adonijah tries to seize the throne, but Nathan, Bathsheba, Zadok, and Benaiah move quickly to secure Solomon''s anointing. David publicly confirms Solomon as his chosen successor, and the people celebrate the new king. The chapter closes with Adonijah seeking mercy as Solomon begins his reign with legitimacy and peace.","David gives Solomon final instructions to walk faithfully, guard the kingdom, and deal wisely with unresolved matters in the court. Solomon secures his throne by removing threats from Adonijah, Abiathar, Joab, and Shimei. The chapter shows that the new king''s rule must be rooted in obedience, justice, and discernment.","At Gibeon, Solomon asks God for a listening heart rather than riches, long life, or victory over enemies. God grants him unmatched wisdom along with wealth and honor because he asked for discernment to govern well. His first judgment between two women proves that the gift is real and that the people can trust his rule.","Jeroboam sends his wife to Ahijah, but the prophet announces that their dynasty will be cut off because Jeroboam led Israel into sin. In Judah, Rehoboam''s reign is also marked by evil and spiritual decline. The chapter makes clear that both kingdoms are already bearing the cost of unfaithfulness."]'::jsonb,
  'Jeroboam sends his wife to Ahijah, but the prophet announces that their dynasty will be cut off because Jeroboam led Israel into sin. In Judah, Rehoboam''s reign is also marked by evil and spiritual decline. The chapter makes clear that both kingdoms are already bearing the cost of unfaithfulness.',
  'This is the chapter summary for 1 Kings 14.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 14
    AND difficulty_stage = 3
    AND prompt = 'Which summary statement best fits the movement of 1 Kings 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  14,
  3,
  'Which theme best interprets the events of 1 Kings 14?',
  '["Royal succession","David''s final days","Covenant legitimacy","Dynastic judgment"]'::jsonb,
  'Dynastic judgment',
  'Dynastic judgment is the best thematic lens supplied in the notes (1 Kings 14:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 14
    AND difficulty_stage = 3
    AND prompt = 'Which theme best interprets the events of 1 Kings 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  14,
  4,
  'How does 1 Kings 14 function in the wider narrative of 1 Kings?',
  '["It turns spoken warnings into visible judgment within the royal story.","It advances the temple-centered shape of worship and kingship in Israel.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This option best fits the chapter''s narrative role within 1 Kings (1 Kings 14:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 14
    AND difficulty_stage = 4
    AND prompt = 'How does 1 Kings 14 function in the wider narrative of 1 Kings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  14,
  4,
  'Which claim best fits the chapter''s larger significance in 1 Kings 14?',
  '["Abijah is born to King Rehoboam and Maakah, a granddaughter of Absalom.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king."]'::jsonb,
  'Abijah is born to King Rehoboam and Maakah, a granddaughter of Absalom.',
  'This claim best fits the chapter''s larger significance in context (1 Kings 14:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 14
    AND difficulty_stage = 4
    AND prompt = 'Which claim best fits the chapter''s larger significance in 1 Kings 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  14,
  4,
  'Which conclusion best matches the covenant pressure visible in 1 Kings 14?',
  '["The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This conclusion best matches the chapter''s covenant pressure (1 Kings 14:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 14
    AND difficulty_stage = 4
    AND prompt = 'Which conclusion best matches the covenant pressure visible in 1 Kings 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  14,
  4,
  'Which reading best connects the chapter''s facts and themes in 1 Kings 14?',
  '["This feast was a formal attempt to stage a coup against David''s intentions.","His royal position was solidified by his father''s favor despite having many brothers.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride."]'::jsonb,
  'His royal position was solidified by his father''s favor despite having many brothers.',
  'This reading best connects the chapter''s verse-linked facts and its meaning (1 Kings 14:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 14
    AND difficulty_stage = 4
    AND prompt = 'Which reading best connects the chapter''s facts and themes in 1 Kings 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  14,
  4,
  'Which statement best explains the chapter''s contribution to the book in 1 Kings 14?',
  '["It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It turns spoken warnings into visible judgment within the royal story.","It advances the temple-centered shape of worship and kingship in Israel."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This statement best explains how the chapter contributes to the book''s flow (1 Kings 14:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 14
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains the chapter''s contribution to the book in 1 Kings 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  14,
  4,
  'Which statement best explains why the chapter is strategically important in 1 Kings 14?',
  '["It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It turns spoken warnings into visible judgment within the royal story.","It advances the temple-centered shape of worship and kingship in Israel."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This option best explains the chapter''s strategic importance in the book (1 Kings 14:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 14
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains why the chapter is strategically important in 1 Kings 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  14,
  4,
  'Which theological reading best fits 1 Kings 14?',
  '["The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter teaches that divine judgment is patient, but it does not fail to arrive."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This theological reading best fits the chapter''s themes and developments (1 Kings 14:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 14
    AND difficulty_stage = 4
    AND prompt = 'Which theological reading best fits 1 Kings 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  14,
  5,
  'Which advanced synthesis best captures the theology of 1 Kings 14?',
  '["The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This is the strongest theological synthesis grounded in the chapter''s notes (1 Kings 14:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 14
    AND difficulty_stage = 5
    AND prompt = 'Which advanced synthesis best captures the theology of 1 Kings 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  14,
  5,
  'Which book-level synthesis best explains 1 Kings 14?',
  '["It advances the temple-centered shape of worship and kingship in Israel.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It turns spoken warnings into visible judgment within the royal story."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This is the best book-level synthesis of the chapter''s role (1 Kings 14:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 14
    AND difficulty_stage = 5
    AND prompt = 'Which book-level synthesis best explains 1 Kings 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  14,
  5,
  'Which high-level reading best explains why 1 Kings 14 is remembered?',
  '["This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","His royal position was solidified by his father''s favor despite having many brothers."]'::jsonb,
  'His royal position was solidified by his father''s favor despite having many brothers.',
  'This high-level reading best explains why the chapter remains significant (1 Kings 14:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 14
    AND difficulty_stage = 5
    AND prompt = 'Which high-level reading best explains why 1 Kings 14 is remembered?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  14,
  5,
  'Which interpretive conclusion best fits the chapter''s place in 1 Kings 14?',
  '["It turns spoken warnings into visible judgment within the royal story.","It advances the temple-centered shape of worship and kingship in Israel.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This interpretive conclusion best fits the chapter''s place in the book (1 Kings 14:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 14
    AND difficulty_stage = 5
    AND prompt = 'Which interpretive conclusion best fits the chapter''s place in 1 Kings 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  14,
  5,
  'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 14?',
  '["The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter teaches that divine judgment is patient, but it does not fail to arrive."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This statement best captures the chapter''s lasting theological pressure (1 Kings 14:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 14
    AND difficulty_stage = 5
    AND prompt = 'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  14,
  5,
  'Which statement best reflects the long-range force of 1 Kings 14?',
  '["This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","His royal position was solidified by his father''s favor despite having many brothers."]'::jsonb,
  'His royal position was solidified by his father''s favor despite having many brothers.',
  'This statement best reflects the chapter''s long-range force within the narrative (1 Kings 14:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 14
    AND difficulty_stage = 5
    AND prompt = 'Which statement best reflects the long-range force of 1 Kings 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  14,
  5,
  'Which synthesis best joins the factual details and themes of 1 Kings 14?',
  '["The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This synthesis most successfully joins the chapter''s details and themes (1 Kings 14:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 14
    AND difficulty_stage = 5
    AND prompt = 'Which synthesis best joins the factual details and themes of 1 Kings 14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  15,
  1,
  'What happens in 1 Kings 15?',
  '["He walked in all the sins that his father did before him (1 Kings 15:3)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)"]'::jsonb,
  'He walked in all the sins that his father did before him (1 Kings 15:3)',
  'This detail is directly tied to 1 Kings 15:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 15
    AND difficulty_stage = 1
    AND prompt = 'What happens in 1 Kings 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  15,
  1,
  'What happens in 1 Kings 15?',
  '["Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","He failed to reach the standard set by David (1 Kings 15:3)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)"]'::jsonb,
  'He failed to reach the standard set by David (1 Kings 15:3)',
  'This event is part of the chapter''s verse-linked source material (1 Kings 15:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 15
    AND difficulty_stage = 1
    AND prompt = 'What happens in 1 Kings 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  15,
  1,
  'Who appears in 1 Kings 15?',
  '["David","Solomon","Adonijah","Asa"]'::jsonb,
  'Asa',
  'Asa is listed among the key people for this chapter (1 Kings 15:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 15
    AND difficulty_stage = 1
    AND prompt = 'Who appears in 1 Kings 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  15,
  1,
  'Which verse is highlighted in 1 Kings 15?',
  '["1 Kings 1:11","1 Kings 1:29","1 Kings 15:11","1 Kings 1:5"]'::jsonb,
  '1 Kings 15:11',
  '1 Kings 15:11 is one of the chapter''s supporting verses.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 15
    AND difficulty_stage = 1
    AND prompt = 'Which verse is highlighted in 1 Kings 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  15,
  1,
  'What theme stands out in 1 Kings 15?',
  '["Partial reform","Royal succession","David''s final days","Covenant legitimacy"]'::jsonb,
  'Partial reform',
  'Partial reform is listed among the chapter themes (1 Kings 15:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 15
    AND difficulty_stage = 1
    AND prompt = 'What theme stands out in 1 Kings 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  15,
  1,
  'Which title best fits 1 Kings 15?',
  '["Solomon asks for wisdom","Asa reforms Judah","Solomon anointed amid succession crisis","David''s charge and Solomon''s first judgments"]'::jsonb,
  'Asa reforms Judah',
  'Asa reforms Judah is the chapter title in the commentary notes (1 Kings 15:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 15
    AND difficulty_stage = 1
    AND prompt = 'Which title best fits 1 Kings 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  15,
  1,
  'What results from this in 1 Kings 15?',
  '["Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","His heart was not wholly true to the Lord his God (1 Kings 15:3)"]'::jsonb,
  'His heart was not wholly true to the Lord his God (1 Kings 15:3)',
  'This verse-linked detail appears in the source notes for 1 Kings 15:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 15
    AND difficulty_stage = 1
    AND prompt = 'What results from this in 1 Kings 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  15,
  2,
  'What happens in 1 Kings 15?',
  '["God preserved Jerusalem only for the sake of David (1 Kings 15:4)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)"]'::jsonb,
  'God preserved Jerusalem only for the sake of David (1 Kings 15:4)',
  'This detail belongs to the chapter''s source notes (1 Kings 15:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 15
    AND difficulty_stage = 2
    AND prompt = 'What happens in 1 Kings 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  15,
  2,
  'What happens in 1 Kings 15?',
  '["Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","He is buried in the City of David (1 Kings 15:8)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)"]'::jsonb,
  'He is buried in the City of David (1 Kings 15:8)',
  'The source material for 1 Kings 15:8 includes this detail.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 15
    AND difficulty_stage = 2
    AND prompt = 'What happens in 1 Kings 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  15,
  2,
  'Which phrase is used in 1 Kings 15?',
  '["Zadok the priest","Nathan the prophet","Asa did what was right","Let Solomon my son reign"]'::jsonb,
  'Asa did what was right',
  'This phrase appears among the chapter''s evidence phrases (1 Kings 15:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 15
    AND difficulty_stage = 2
    AND prompt = 'Which phrase is used in 1 Kings 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  15,
  2,
  'What key point stands out in 1 Kings 15?',
  '["Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people.","Abijam continues the sins of his father."]'::jsonb,
  'Abijam continues the sins of his father.',
  'This key point is part of the commentary notes for the chapter (1 Kings 15:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 15
    AND difficulty_stage = 2
    AND prompt = 'What key point stands out in 1 Kings 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  15,
  2,
  'What scene appears in 1 Kings 15?',
  '["Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Abijah sleeps with his fathers (1 Kings 15:8)"]'::jsonb,
  'Abijah sleeps with his fathers (1 Kings 15:8)',
  'This scene is tied to 1 Kings 15:8.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 15
    AND difficulty_stage = 2
    AND prompt = 'What scene appears in 1 Kings 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  15,
  2,
  'What does this mean in 1 Kings 15?',
  '["This warns that external success does not always equal internal righteousness.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions."]'::jsonb,
  'This warns that external success does not always equal internal righteousness.',
  'This significance statement is attached to verse-linked material from this chapter (1 Kings 15:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 15
    AND difficulty_stage = 2
    AND prompt = 'What does this mean in 1 Kings 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  15,
  2,
  'What does Despite his military success, the Book of Kings give in 1 Kings 15?',
  '["Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Despite his military success, the Book of Kings gives a negative spiritual evaluation of his life.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following."]'::jsonb,
  'Despite his military success, the Book of Kings gives a negative spiritual evaluation of his life.',
  'This summary line comes from source material connected to 1 Kings 15:11.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 15
    AND difficulty_stage = 2
    AND prompt = 'What does Despite his military success, the Book of Kings give in 1 Kings 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  15,
  3,
  'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 15?',
  '["Let Solomon my son reign","Zadok the priest","Nathan the prophet","removed the idols"]'::jsonb,
  'removed the idols',
  'This phrase most directly reflects the chapter''s focal line (1 Kings 15:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 15
    AND difficulty_stage = 3
    AND prompt = 'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  15,
  3,
  'Which key point best summarizes what 1 Kings 15 emphasizes?',
  '["Solomon is anointed king and proclaimed by the people.","Asa removes idols and seeks the LORD.","Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows."]'::jsonb,
  'Asa removes idols and seeks the LORD.',
  'This key point best captures the emphasis of the chapter summary (1 Kings 15:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 15
    AND difficulty_stage = 3
    AND prompt = 'Which key point best summarizes what 1 Kings 15 emphasizes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  15,
  3,
  'Which line best explains why the events of 1 Kings 15 matter?',
  '["This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","This warns that external success does not always equal internal righteousness."]'::jsonb,
  'This warns that external success does not always equal internal righteousness.',
  'This significance line best explains the chapter''s weight (1 Kings 15:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 15
    AND difficulty_stage = 3
    AND prompt = 'Which line best explains why the events of 1 Kings 15 matter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  15,
  3,
  'Which statement best captures the chapter''s main action in 1 Kings 15?',
  '["Despite his military success, the Book of Kings gives a negative spiritual evaluation of his life.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king."]'::jsonb,
  'Despite his military success, the Book of Kings gives a negative spiritual evaluation of his life.',
  'This summary best fits the chapter''s core movement (1 Kings 15:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 15
    AND difficulty_stage = 3
    AND prompt = 'Which statement best captures the chapter''s main action in 1 Kings 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  15,
  3,
  'Which statement best matches the leadership pressure in 1 Kings 15?',
  '["Judah and Israel remain in conflict.","Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people."]'::jsonb,
  'Judah and Israel remain in conflict.',
  'This statement best matches the chapter''s leadership pressure (1 Kings 15:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 15
    AND difficulty_stage = 3
    AND prompt = 'Which statement best matches the leadership pressure in 1 Kings 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  15,
  3,
  'Which summary statement best fits the movement of 1 Kings 15?',
  '["David gives Solomon final instructions to walk faithfully, guard the kingdom, and deal wisely with unresolved matters in the court. Solomon secures his throne by removing threats from Adonijah, Abiathar, Joab, and Shimei. The chapter shows that the new king''s rule must be rooted in obedience, justice, and discernment.","At Gibeon, Solomon asks God for a listening heart rather than riches, long life, or victory over enemies. God grants him unmatched wisdom along with wealth and honor because he asked for discernment to govern well. His first judgment between two women proves that the gift is real and that the people can trust his rule.","Abijam follows the pattern of his father, but Asa brings a measure of reform by removing idols and strengthening Judah. He seeks the LORD in his trouble and is given victory and stability. The chapter contrasts fragile monarchy with the blessing that comes from covenant renewal.","As David grows old, Adonijah tries to seize the throne, but Nathan, Bathsheba, Zadok, and Benaiah move quickly to secure Solomon''s anointing. David publicly confirms Solomon as his chosen successor, and the people celebrate the new king. The chapter closes with Adonijah seeking mercy as Solomon begins his reign with legitimacy and peace."]'::jsonb,
  'Abijam follows the pattern of his father, but Asa brings a measure of reform by removing idols and strengthening Judah. He seeks the LORD in his trouble and is given victory and stability. The chapter contrasts fragile monarchy with the blessing that comes from covenant renewal.',
  'This is the chapter summary for 1 Kings 15.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 15
    AND difficulty_stage = 3
    AND prompt = 'Which summary statement best fits the movement of 1 Kings 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  15,
  3,
  'Which theme best interprets the events of 1 Kings 15?',
  '["David''s final days","Covenant legitimacy","Partial reform","Royal succession"]'::jsonb,
  'Partial reform',
  'Partial reform is the best thematic lens supplied in the notes (1 Kings 15:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 15
    AND difficulty_stage = 3
    AND prompt = 'Which theme best interprets the events of 1 Kings 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  15,
  4,
  'How does 1 Kings 15 function in the wider narrative of 1 Kings?',
  '["It develops partial reform as a defining pressure within Asa reforms Judah.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel."]'::jsonb,
  'It develops partial reform as a defining pressure within Asa reforms Judah.',
  'This option best fits the chapter''s narrative role within 1 Kings (1 Kings 15:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 15
    AND difficulty_stage = 4
    AND prompt = 'How does 1 Kings 15 function in the wider narrative of 1 Kings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  15,
  4,
  'Which claim best fits the chapter''s larger significance in 1 Kings 15?',
  '["Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Despite his military success, the Book of Kings gives a negative spiritual evaluation of his life."]'::jsonb,
  'Despite his military success, the Book of Kings gives a negative spiritual evaluation of his life.',
  'This claim best fits the chapter''s larger significance in context (1 Kings 15:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 15
    AND difficulty_stage = 4
    AND prompt = 'Which claim best fits the chapter''s larger significance in 1 Kings 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  15,
  4,
  'Which conclusion best matches the covenant pressure visible in 1 Kings 15?',
  '["The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that abijam continues the sins of his father.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage."]'::jsonb,
  'The chapter shows that abijam continues the sins of his father.',
  'This conclusion best matches the chapter''s covenant pressure (1 Kings 15:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 15
    AND difficulty_stage = 4
    AND prompt = 'Which conclusion best matches the covenant pressure visible in 1 Kings 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  15,
  4,
  'Which reading best connects the chapter''s facts and themes in 1 Kings 15?',
  '["This warns that external success does not always equal internal righteousness.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions."]'::jsonb,
  'This warns that external success does not always equal internal righteousness.',
  'This reading best connects the chapter''s verse-linked facts and its meaning (1 Kings 15:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 15
    AND difficulty_stage = 4
    AND prompt = 'Which reading best connects the chapter''s facts and themes in 1 Kings 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  15,
  4,
  'Which statement best explains the chapter''s contribution to the book in 1 Kings 15?',
  '["It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel.","It develops partial reform as a defining pressure within Asa reforms Judah.","It contrasts self-exalting ambition with the kingly order David affirms."]'::jsonb,
  'It develops partial reform as a defining pressure within Asa reforms Judah.',
  'This statement best explains how the chapter contributes to the book''s flow (1 Kings 15:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 15
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains the chapter''s contribution to the book in 1 Kings 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  15,
  4,
  'Which statement best explains why the chapter is strategically important in 1 Kings 15?',
  '["It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel.","It develops partial reform as a defining pressure within Asa reforms Judah.","It contrasts self-exalting ambition with the kingly order David affirms."]'::jsonb,
  'It develops partial reform as a defining pressure within Asa reforms Judah.',
  'This option best explains the chapter''s strategic importance in the book (1 Kings 15:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 15
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains why the chapter is strategically important in 1 Kings 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  15,
  4,
  'Which theological reading best fits 1 Kings 15?',
  '["The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that abijam continues the sins of his father."]'::jsonb,
  'The chapter shows that abijam continues the sins of his father.',
  'This theological reading best fits the chapter''s themes and developments (1 Kings 15:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 15
    AND difficulty_stage = 4
    AND prompt = 'Which theological reading best fits 1 Kings 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  15,
  5,
  'Which advanced synthesis best captures the theology of 1 Kings 15?',
  '["The chapter shows that abijam continues the sins of his father.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people."]'::jsonb,
  'The chapter shows that abijam continues the sins of his father.',
  'This is the strongest theological synthesis grounded in the chapter''s notes (1 Kings 15:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 15
    AND difficulty_stage = 5
    AND prompt = 'Which advanced synthesis best captures the theology of 1 Kings 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  15,
  5,
  'Which book-level synthesis best explains 1 Kings 15?',
  '["It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel.","It develops partial reform as a defining pressure within Asa reforms Judah."]'::jsonb,
  'It develops partial reform as a defining pressure within Asa reforms Judah.',
  'This is the best book-level synthesis of the chapter''s role (1 Kings 15:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 15
    AND difficulty_stage = 5
    AND prompt = 'Which book-level synthesis best explains 1 Kings 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  15,
  5,
  'Which high-level reading best explains why 1 Kings 15 is remembered?',
  '["This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","This warns that external success does not always equal internal righteousness.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty."]'::jsonb,
  'This warns that external success does not always equal internal righteousness.',
  'This high-level reading best explains why the chapter remains significant (1 Kings 15:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 15
    AND difficulty_stage = 5
    AND prompt = 'Which high-level reading best explains why 1 Kings 15 is remembered?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  15,
  5,
  'Which interpretive conclusion best fits the chapter''s place in 1 Kings 15?',
  '["It develops partial reform as a defining pressure within Asa reforms Judah.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel."]'::jsonb,
  'It develops partial reform as a defining pressure within Asa reforms Judah.',
  'This interpretive conclusion best fits the chapter''s place in the book (1 Kings 15:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 15
    AND difficulty_stage = 5
    AND prompt = 'Which interpretive conclusion best fits the chapter''s place in 1 Kings 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  15,
  5,
  'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 15?',
  '["The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that abijam continues the sins of his father."]'::jsonb,
  'The chapter shows that abijam continues the sins of his father.',
  'This statement best captures the chapter''s lasting theological pressure (1 Kings 15:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 15
    AND difficulty_stage = 5
    AND prompt = 'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  15,
  5,
  'Which statement best reflects the long-range force of 1 Kings 15?',
  '["This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","This warns that external success does not always equal internal righteousness.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty."]'::jsonb,
  'This warns that external success does not always equal internal righteousness.',
  'This statement best reflects the chapter''s long-range force within the narrative (1 Kings 15:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 15
    AND difficulty_stage = 5
    AND prompt = 'Which statement best reflects the long-range force of 1 Kings 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  15,
  5,
  'Which synthesis best joins the factual details and themes of 1 Kings 15?',
  '["The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that abijam continues the sins of his father.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage."]'::jsonb,
  'The chapter shows that abijam continues the sins of his father.',
  'This synthesis most successfully joins the chapter''s details and themes (1 Kings 15:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 15
    AND difficulty_stage = 5
    AND prompt = 'Which synthesis best joins the factual details and themes of 1 Kings 15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  16,
  1,
  'What does He become in 1 Kings 16?',
  '["Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","He becomes king in the thirty-eighth year of Asa of Judah (1 Kings 16:29)"]'::jsonb,
  'He becomes king in the thirty-eighth year of Asa of Judah (1 Kings 16:29)',
  'This detail is directly tied to 1 Kings 16:29.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 16
    AND difficulty_stage = 1
    AND prompt = 'What does He become in 1 Kings 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  16,
  1,
  'What does He build in 1 Kings 16?',
  '["He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","He builds a temple and an altar for Baal in Samaria (1 Kings 16:32)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)"]'::jsonb,
  'He builds a temple and an altar for Baal in Samaria (1 Kings 16:32)',
  'This event is part of the chapter''s verse-linked source material (1 Kings 16:32).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 16
    AND difficulty_stage = 1
    AND prompt = 'What does He build in 1 Kings 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  16,
  1,
  'Who appears in 1 Kings 16?',
  '["Solomon","Adonijah","Baasha","David"]'::jsonb,
  'Baasha',
  'Baasha is listed among the key people for this chapter (1 Kings 16:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 16
    AND difficulty_stage = 1
    AND prompt = 'Who appears in 1 Kings 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  16,
  1,
  'Which verse is highlighted in 1 Kings 16?',
  '["1 Kings 1:29","1 Kings 16:3","1 Kings 1:5","1 Kings 1:11"]'::jsonb,
  '1 Kings 16:3',
  '1 Kings 16:3 is one of the chapter''s supporting verses.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 16
    AND difficulty_stage = 1
    AND prompt = 'Which verse is highlighted in 1 Kings 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  16,
  1,
  'What theme stands out in 1 Kings 16?',
  '["Royal succession","David''s final days","Covenant legitimacy","Political instability"]'::jsonb,
  'Political instability',
  'Political instability is listed among the chapter themes (1 Kings 16:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 16
    AND difficulty_stage = 1
    AND prompt = 'What theme stands out in 1 Kings 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  16,
  1,
  'Which title best fits 1 Kings 16?',
  '["Israel''s unstable kings","Solomon anointed amid succession crisis","David''s charge and Solomon''s first judgments","Solomon asks for wisdom"]'::jsonb,
  'Israel''s unstable kings',
  'Israel''s unstable kings is the chapter title in the commentary notes (1 Kings 16:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 16
    AND difficulty_stage = 1
    AND prompt = 'Which title best fits 1 Kings 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  16,
  1,
  'Whom does He marry in 1 Kings 16?',
  '["Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","He marries Jezebel, daughter of Ethbaal, king of the Sidonians (1 Kings 16:31)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)"]'::jsonb,
  'He marries Jezebel, daughter of Ethbaal, king of the Sidonians (1 Kings 16:31)',
  'This verse-linked detail appears in the source notes for 1 Kings 16:31.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 16
    AND difficulty_stage = 1
    AND prompt = 'Whom does He marry in 1 Kings 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  16,
  2,
  'What happens in 1 Kings 16?',
  '["Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","The text says he did more to provoke the Lord than all kings before him (1 Kings 16:33)"]'::jsonb,
  'The text says he did more to provoke the Lord than all kings before him (1 Kings 16:33)',
  'This detail belongs to the chapter''s source notes (1 Kings 16:33).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 16
    AND difficulty_stage = 2
    AND prompt = 'What happens in 1 Kings 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  16,
  2,
  'What happens in 1 Kings 16?',
  '["He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","He erects an altar for Baal within the temple (1 Kings 16:32)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)"]'::jsonb,
  'He erects an altar for Baal within the temple (1 Kings 16:32)',
  'The source material for 1 Kings 16:32 includes this detail.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 16
    AND difficulty_stage = 2
    AND prompt = 'What happens in 1 Kings 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  16,
  2,
  'Which phrase is used in 1 Kings 16?',
  '["Nathan the prophet","did evil in the sight of the LORD","Let Solomon my son reign","Zadok the priest"]'::jsonb,
  'did evil in the sight of the LORD',
  'This phrase appears among the chapter''s evidence phrases (1 Kings 16:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 16
    AND difficulty_stage = 2
    AND prompt = 'Which phrase is used in 1 Kings 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  16,
  2,
  'What key point stands out in 1 Kings 16?',
  '["Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people.","Baasha''s house is judged for sin.","Adonijah attempts to claim the throne without David''s approval."]'::jsonb,
  'Baasha''s house is judged for sin.',
  'This key point is part of the commentary notes for the chapter (1 Kings 16:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 16
    AND difficulty_stage = 2
    AND prompt = 'What key point stands out in 1 Kings 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  16,
  2,
  'What does Ahab build in 1 Kings 16?',
  '["Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Ahab builds a temple for Baal in Samaria (1 Kings 16:32)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)"]'::jsonb,
  'Ahab builds a temple for Baal in Samaria (1 Kings 16:32)',
  'This scene is tied to 1 Kings 16:32.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 16
    AND difficulty_stage = 2
    AND prompt = 'What does Ahab build in 1 Kings 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  16,
  2,
  'What results from this in 1 Kings 16?',
  '["This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","His marriage was a political success but a spiritual catastrophe for Israel."]'::jsonb,
  'His marriage was a political success but a spiritual catastrophe for Israel.',
  'This significance statement is attached to verse-linked material from this chapter (1 Kings 16:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 16
    AND difficulty_stage = 2
    AND prompt = 'What results from this in 1 Kings 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  16,
  2,
  'What does Ahab begins his 22-year reign and enter into in 1 Kings 16?',
  '["Ahab begins his 22-year reign and enters into a disastrous alliance with the Phoenicians.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king."]'::jsonb,
  'Ahab begins his 22-year reign and enters into a disastrous alliance with the Phoenicians.',
  'This summary line comes from source material connected to 1 Kings 16:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 16
    AND difficulty_stage = 2
    AND prompt = 'What does Ahab begins his 22-year reign and enter into in 1 Kings 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  16,
  3,
  'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 16?',
  '["Zadok the priest","Nathan the prophet","Zimri conspired","Let Solomon my son reign"]'::jsonb,
  'Zimri conspired',
  'This phrase most directly reflects the chapter''s focal line (1 Kings 16:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 16
    AND difficulty_stage = 3
    AND prompt = 'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  16,
  3,
  'Which key point best summarizes what 1 Kings 16 emphasizes?',
  '["Zimri''s brief reign ends in self-destruction.","Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people."]'::jsonb,
  'Zimri''s brief reign ends in self-destruction.',
  'This key point best captures the emphasis of the chapter summary (1 Kings 16:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 16
    AND difficulty_stage = 3
    AND prompt = 'Which key point best summarizes what 1 Kings 16 emphasizes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  16,
  3,
  'Which line best explains why the events of 1 Kings 16 matter?',
  '["This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","His marriage was a political success but a spiritual catastrophe for Israel.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty."]'::jsonb,
  'His marriage was a political success but a spiritual catastrophe for Israel.',
  'This significance line best explains the chapter''s weight (1 Kings 16:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 16
    AND difficulty_stage = 3
    AND prompt = 'Which line best explains why the events of 1 Kings 16 matter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  16,
  3,
  'Which statement best captures the chapter''s main action in 1 Kings 16?',
  '["Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Ahab begins his 22-year reign and enters into a disastrous alliance with the Phoenicians."]'::jsonb,
  'Ahab begins his 22-year reign and enters into a disastrous alliance with the Phoenicians.',
  'This summary best fits the chapter''s core movement (1 Kings 16:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 16
    AND difficulty_stage = 3
    AND prompt = 'Which statement best captures the chapter''s main action in 1 Kings 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  16,
  3,
  'Which statement best matches the leadership pressure in 1 Kings 16?',
  '["Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people.","Omri stabilizes the throne through force."]'::jsonb,
  'Omri stabilizes the throne through force.',
  'This statement best matches the chapter''s leadership pressure (1 Kings 16:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 16
    AND difficulty_stage = 3
    AND prompt = 'Which statement best matches the leadership pressure in 1 Kings 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  16,
  3,
  'Which summary statement best fits the movement of 1 Kings 16?',
  '["At Gibeon, Solomon asks God for a listening heart rather than riches, long life, or victory over enemies. God grants him unmatched wisdom along with wealth and honor because he asked for discernment to govern well. His first judgment between two women proves that the gift is real and that the people can trust his rule.","Baasha, Elah, Zimri, Omri, and Ahab rise and fall in quick succession, showing the instability of the northern throne. The LORD''s word against Baasha is fulfilled, and Ahab''s reign introduces even deeper idolatry. Political success cannot hide the spiritual collapse that is taking hold in Israel.","As David grows old, Adonijah tries to seize the throne, but Nathan, Bathsheba, Zadok, and Benaiah move quickly to secure Solomon''s anointing. David publicly confirms Solomon as his chosen successor, and the people celebrate the new king. The chapter closes with Adonijah seeking mercy as Solomon begins his reign with legitimacy and peace.","David gives Solomon final instructions to walk faithfully, guard the kingdom, and deal wisely with unresolved matters in the court. Solomon secures his throne by removing threats from Adonijah, Abiathar, Joab, and Shimei. The chapter shows that the new king''s rule must be rooted in obedience, justice, and discernment."]'::jsonb,
  'Baasha, Elah, Zimri, Omri, and Ahab rise and fall in quick succession, showing the instability of the northern throne. The LORD''s word against Baasha is fulfilled, and Ahab''s reign introduces even deeper idolatry. Political success cannot hide the spiritual collapse that is taking hold in Israel.',
  'This is the chapter summary for 1 Kings 16.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 16
    AND difficulty_stage = 3
    AND prompt = 'Which summary statement best fits the movement of 1 Kings 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  16,
  3,
  'Which theme best interprets the events of 1 Kings 16?',
  '["Covenant legitimacy","Political instability","Royal succession","David''s final days"]'::jsonb,
  'Political instability',
  'Political instability is the best thematic lens supplied in the notes (1 Kings 16:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 16
    AND difficulty_stage = 3
    AND prompt = 'Which theme best interprets the events of 1 Kings 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  16,
  4,
  'How does 1 Kings 16 function in the wider narrative of 1 Kings?',
  '["It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel.","It turns spoken warnings into visible judgment within the royal story.","It contrasts self-exalting ambition with the kingly order David affirms."]'::jsonb,
  'It contrasts self-exalting ambition with the kingly order David affirms.',
  'This option best fits the chapter''s narrative role within 1 Kings (1 Kings 16:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 16
    AND difficulty_stage = 4
    AND prompt = 'How does 1 Kings 16 function in the wider narrative of 1 Kings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  16,
  4,
  'Which claim best fits the chapter''s larger significance in 1 Kings 16?',
  '["As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Ahab begins his 22-year reign and enters into a disastrous alliance with the Phoenicians.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne."]'::jsonb,
  'Ahab begins his 22-year reign and enters into a disastrous alliance with the Phoenicians.',
  'This claim best fits the chapter''s larger significance in context (1 Kings 16:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 16
    AND difficulty_stage = 4
    AND prompt = 'Which claim best fits the chapter''s larger significance in 1 Kings 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  16,
  4,
  'Which conclusion best matches the covenant pressure visible in 1 Kings 16?',
  '["The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter teaches that divine judgment is patient, but it does not fail to arrive."]'::jsonb,
  'The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.',
  'This conclusion best matches the chapter''s covenant pressure (1 Kings 16:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 16
    AND difficulty_stage = 4
    AND prompt = 'Which conclusion best matches the covenant pressure visible in 1 Kings 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  16,
  4,
  'Which reading best connects the chapter''s facts and themes in 1 Kings 16?',
  '["This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","His marriage was a political success but a spiritual catastrophe for Israel."]'::jsonb,
  'His marriage was a political success but a spiritual catastrophe for Israel.',
  'This reading best connects the chapter''s verse-linked facts and its meaning (1 Kings 16:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 16
    AND difficulty_stage = 4
    AND prompt = 'Which reading best connects the chapter''s facts and themes in 1 Kings 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  16,
  4,
  'Which statement best explains the chapter''s contribution to the book in 1 Kings 16?',
  '["It turns spoken warnings into visible judgment within the royal story.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel."]'::jsonb,
  'It contrasts self-exalting ambition with the kingly order David affirms.',
  'This statement best explains how the chapter contributes to the book''s flow (1 Kings 16:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 16
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains the chapter''s contribution to the book in 1 Kings 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  16,
  4,
  'Which statement best explains why the chapter is strategically important in 1 Kings 16?',
  '["It turns spoken warnings into visible judgment within the royal story.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel."]'::jsonb,
  'It contrasts self-exalting ambition with the kingly order David affirms.',
  'This option best explains the chapter''s strategic importance in the book (1 Kings 16:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 16
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains why the chapter is strategically important in 1 Kings 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  16,
  4,
  'Which theological reading best fits 1 Kings 16?',
  '["The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage."]'::jsonb,
  'The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.',
  'This theological reading best fits the chapter''s themes and developments (1 Kings 16:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 16
    AND difficulty_stage = 4
    AND prompt = 'Which theological reading best fits 1 Kings 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  16,
  5,
  'Which advanced synthesis best captures the theology of 1 Kings 16?',
  '["The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force."]'::jsonb,
  'The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.',
  'This is the strongest theological synthesis grounded in the chapter''s notes (1 Kings 16:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 16
    AND difficulty_stage = 5
    AND prompt = 'Which advanced synthesis best captures the theology of 1 Kings 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  16,
  5,
  'Which book-level synthesis best explains 1 Kings 16?',
  '["It advances the temple-centered shape of worship and kingship in Israel.","It turns spoken warnings into visible judgment within the royal story.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign."]'::jsonb,
  'It contrasts self-exalting ambition with the kingly order David affirms.',
  'This is the best book-level synthesis of the chapter''s role (1 Kings 16:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 16
    AND difficulty_stage = 5
    AND prompt = 'Which book-level synthesis best explains 1 Kings 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  16,
  5,
  'Which high-level reading best explains why 1 Kings 16 is remembered?',
  '["This feast was a formal attempt to stage a coup against David''s intentions.","His marriage was a political success but a spiritual catastrophe for Israel.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride."]'::jsonb,
  'His marriage was a political success but a spiritual catastrophe for Israel.',
  'This high-level reading best explains why the chapter remains significant (1 Kings 16:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 16
    AND difficulty_stage = 5
    AND prompt = 'Which high-level reading best explains why 1 Kings 16 is remembered?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  16,
  5,
  'Which interpretive conclusion best fits the chapter''s place in 1 Kings 16?',
  '["It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel.","It turns spoken warnings into visible judgment within the royal story.","It contrasts self-exalting ambition with the kingly order David affirms."]'::jsonb,
  'It contrasts self-exalting ambition with the kingly order David affirms.',
  'This interpretive conclusion best fits the chapter''s place in the book (1 Kings 16:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 16
    AND difficulty_stage = 5
    AND prompt = 'Which interpretive conclusion best fits the chapter''s place in 1 Kings 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  16,
  5,
  'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 16?',
  '["The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage."]'::jsonb,
  'The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.',
  'This statement best captures the chapter''s lasting theological pressure (1 Kings 16:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 16
    AND difficulty_stage = 5
    AND prompt = 'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  16,
  5,
  'Which statement best reflects the long-range force of 1 Kings 16?',
  '["This feast was a formal attempt to stage a coup against David''s intentions.","His marriage was a political success but a spiritual catastrophe for Israel.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride."]'::jsonb,
  'His marriage was a political success but a spiritual catastrophe for Israel.',
  'This statement best reflects the chapter''s long-range force within the narrative (1 Kings 16:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 16
    AND difficulty_stage = 5
    AND prompt = 'Which statement best reflects the long-range force of 1 Kings 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  16,
  5,
  'Which synthesis best joins the factual details and themes of 1 Kings 16?',
  '["The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter teaches that divine judgment is patient, but it does not fail to arrive."]'::jsonb,
  'The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.',
  'This synthesis most successfully joins the chapter''s details and themes (1 Kings 16:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 16
    AND difficulty_stage = 5
    AND prompt = 'Which synthesis best joins the factual details and themes of 1 Kings 16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  17,
  1,
  'What development clearly belongs to 1 Kings 17?',
  '["Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Elijah tells Ahab there will be no dew or rain for years (1 Kings 17:1)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)"]'::jsonb,
  'Elijah tells Ahab there will be no dew or rain for years (1 Kings 17:1)',
  'This detail is directly tied to 1 Kings 17:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 17
    AND difficulty_stage = 1
    AND prompt = 'What development clearly belongs to 1 Kings 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  17,
  1,
  'Whom does Ahab call in 1 Kings 17?',
  '["Ahab calls Elijah the ''troubler of Israel'' (1 Kings 18:17)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)"]'::jsonb,
  'Ahab calls Elijah the ''troubler of Israel'' (1 Kings 18:17)',
  'This event is part of the chapter''s verse-linked source material (1 Kings 18:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 17
    AND difficulty_stage = 1
    AND prompt = 'Whom does Ahab call in 1 Kings 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  17,
  1,
  'Who appears in 1 Kings 17?',
  '["Adonijah","Elijah","David","Solomon"]'::jsonb,
  'Elijah',
  'Elijah is listed among the key people for this chapter (1 Kings 17:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 17
    AND difficulty_stage = 1
    AND prompt = 'Who appears in 1 Kings 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  17,
  1,
  'Which verse is highlighted in 1 Kings 17?',
  '["1 Kings 17:1","1 Kings 1:5","1 Kings 1:11","1 Kings 1:29"]'::jsonb,
  '1 Kings 17:1',
  '1 Kings 17:1 is one of the chapter''s supporting verses.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 17
    AND difficulty_stage = 1
    AND prompt = 'Which verse is highlighted in 1 Kings 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  17,
  1,
  'What theme stands out in 1 Kings 17?',
  '["David''s final days","Covenant legitimacy","Divine provision","Royal succession"]'::jsonb,
  'Divine provision',
  'Divine provision is listed among the chapter themes (1 Kings 17:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 17
    AND difficulty_stage = 1
    AND prompt = 'What theme stands out in 1 Kings 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  17,
  1,
  'Which title best fits 1 Kings 17?',
  '["Solomon anointed amid succession crisis","David''s charge and Solomon''s first judgments","Solomon asks for wisdom","Elijah fed by ravens and widow''s oil"]'::jsonb,
  'Elijah fed by ravens and widow''s oil',
  'Elijah fed by ravens and widow''s oil is the chapter title in the commentary notes (1 Kings 17:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 17
    AND difficulty_stage = 1
    AND prompt = 'Which title best fits 1 Kings 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  17,
  1,
  'Which verse-linked detail appears in 1 Kings 17?',
  '["He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Ahab searches the land for Elijah while the famine worsens (1 Kings 18:10)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)"]'::jsonb,
  'Ahab searches the land for Elijah while the famine worsens (1 Kings 18:10)',
  'This verse-linked detail appears in the source notes for 1 Kings 18:10.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 17
    AND difficulty_stage = 1
    AND prompt = 'Which verse-linked detail appears in 1 Kings 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  17,
  2,
  'What happens in 1 Kings 17?',
  '["Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Elijah challenges Ahab to gather the prophets of Baal at Mount Carmel (1 Kings 18:19)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)"]'::jsonb,
  'Elijah challenges Ahab to gather the prophets of Baal at Mount Carmel (1 Kings 18:19)',
  'This detail belongs to the chapter''s source notes (1 Kings 18:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 17
    AND difficulty_stage = 2
    AND prompt = 'What happens in 1 Kings 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  17,
  2,
  'What happens in 1 Kings 17?',
  '["He declares there shall be no dew or rain except by his word (1 Kings 17:1)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)"]'::jsonb,
  'He declares there shall be no dew or rain except by his word (1 Kings 17:1)',
  'The source material for 1 Kings 17:1 includes this detail.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 17
    AND difficulty_stage = 2
    AND prompt = 'What happens in 1 Kings 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  17,
  2,
  'Which phrase is used in 1 Kings 17?',
  '["ravens brought him bread","Let Solomon my son reign","Zadok the priest","Nathan the prophet"]'::jsonb,
  'ravens brought him bread',
  'This phrase appears among the chapter''s evidence phrases (1 Kings 17:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 17
    AND difficulty_stage = 2
    AND prompt = 'Which phrase is used in 1 Kings 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  17,
  2,
  'What key point stands out in 1 Kings 17?',
  '["Solomon is anointed king and proclaimed by the people.","Elijah is sustained by ravens at the brook Cherith.","Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows."]'::jsonb,
  'Elijah is sustained by ravens at the brook Cherith.',
  'This key point is part of the commentary notes for the chapter (1 Kings 17:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 17
    AND difficulty_stage = 2
    AND prompt = 'What key point stands out in 1 Kings 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  17,
  2,
  'What happens in 1 Kings 17?',
  '["He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","He is identified as Elijah the Tishbite, of the settlers in Gilead (1 Kings 17:1)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)"]'::jsonb,
  'He is identified as Elijah the Tishbite, of the settlers in Gilead (1 Kings 17:1)',
  'This scene is tied to 1 Kings 17:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 17
    AND difficulty_stage = 2
    AND prompt = 'What happens in 1 Kings 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  17,
  2,
  'Why does this matter in 1 Kings 17?',
  '["This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","The drought proved that the God of Israel, not Baal, controlled the elements.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty."]'::jsonb,
  'The drought proved that the God of Israel, not Baal, controlled the elements.',
  'This significance statement is attached to verse-linked material from this chapter (1 Kings 17:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 17
    AND difficulty_stage = 2
    AND prompt = 'Why does this matter in 1 Kings 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  17,
  2,
  'Which summary best fits 1 Kings 17?',
  '["Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Elijah announces a supernatural drought to challenge Ahab''s reliance on Baal."]'::jsonb,
  'Elijah announces a supernatural drought to challenge Ahab''s reliance on Baal.',
  'This summary line comes from source material connected to 1 Kings 17:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 17
    AND difficulty_stage = 2
    AND prompt = 'Which summary best fits 1 Kings 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  17,
  3,
  'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 17?',
  '["Nathan the prophet","the jar of meal did not waste","Let Solomon my son reign","Zadok the priest"]'::jsonb,
  'the jar of meal did not waste',
  'This phrase most directly reflects the chapter''s focal line (1 Kings 17:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 17
    AND difficulty_stage = 3
    AND prompt = 'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  17,
  3,
  'Which key point best summarizes what 1 Kings 17 emphasizes?',
  '["Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people.","A widow in Zarephath feeds Elijah by God''s word."]'::jsonb,
  'A widow in Zarephath feeds Elijah by God''s word.',
  'This key point best captures the emphasis of the chapter summary (1 Kings 17:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 17
    AND difficulty_stage = 3
    AND prompt = 'Which key point best summarizes what 1 Kings 17 emphasizes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  17,
  3,
  'Which line best explains why the events of 1 Kings 17 matter?',
  '["This feast was a formal attempt to stage a coup against David''s intentions.","The drought proved that the God of Israel, not Baal, controlled the elements.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride."]'::jsonb,
  'The drought proved that the God of Israel, not Baal, controlled the elements.',
  'This significance line best explains the chapter''s weight (1 Kings 17:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 17
    AND difficulty_stage = 3
    AND prompt = 'Which line best explains why the events of 1 Kings 17 matter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  17,
  3,
  'Which statement best captures the chapter''s main action in 1 Kings 17?',
  '["As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Elijah announces a supernatural drought to challenge Ahab''s reliance on Baal.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne."]'::jsonb,
  'Elijah announces a supernatural drought to challenge Ahab''s reliance on Baal.',
  'This summary best fits the chapter''s core movement (1 Kings 17:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 17
    AND difficulty_stage = 3
    AND prompt = 'Which statement best captures the chapter''s main action in 1 Kings 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  17,
  3,
  'Which statement best matches the leadership pressure in 1 Kings 17?',
  '["Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people.","Her flour and oil are miraculously preserved.","Adonijah attempts to claim the throne without David''s approval."]'::jsonb,
  'Her flour and oil are miraculously preserved.',
  'This statement best matches the chapter''s leadership pressure (1 Kings 17:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 17
    AND difficulty_stage = 3
    AND prompt = 'Which statement best matches the leadership pressure in 1 Kings 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  17,
  3,
  'Which summary statement best fits the movement of 1 Kings 17?',
  '["Elijah suddenly appears during a drought and is sustained first by ravens and then by a widow in Zarephath whose flour and oil do not fail. When her son dies, Elijah prays and God restores the child to life. The chapter proves that the LORD can preserve life and provide for his servant even in famine and death.","As David grows old, Adonijah tries to seize the throne, but Nathan, Bathsheba, Zadok, and Benaiah move quickly to secure Solomon''s anointing. David publicly confirms Solomon as his chosen successor, and the people celebrate the new king. The chapter closes with Adonijah seeking mercy as Solomon begins his reign with legitimacy and peace.","David gives Solomon final instructions to walk faithfully, guard the kingdom, and deal wisely with unresolved matters in the court. Solomon secures his throne by removing threats from Adonijah, Abiathar, Joab, and Shimei. The chapter shows that the new king''s rule must be rooted in obedience, justice, and discernment.","At Gibeon, Solomon asks God for a listening heart rather than riches, long life, or victory over enemies. God grants him unmatched wisdom along with wealth and honor because he asked for discernment to govern well. His first judgment between two women proves that the gift is real and that the people can trust his rule."]'::jsonb,
  'Elijah suddenly appears during a drought and is sustained first by ravens and then by a widow in Zarephath whose flour and oil do not fail. When her son dies, Elijah prays and God restores the child to life. The chapter proves that the LORD can preserve life and provide for his servant even in famine and death.',
  'This is the chapter summary for 1 Kings 17.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 17
    AND difficulty_stage = 3
    AND prompt = 'Which summary statement best fits the movement of 1 Kings 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  17,
  3,
  'Which theme best interprets the events of 1 Kings 17?',
  '["Divine provision","Royal succession","David''s final days","Covenant legitimacy"]'::jsonb,
  'Divine provision',
  'Divine provision is the best thematic lens supplied in the notes (1 Kings 17:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 17
    AND difficulty_stage = 3
    AND prompt = 'Which theme best interprets the events of 1 Kings 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  17,
  4,
  'How does 1 Kings 17 function in the wider narrative of 1 Kings?',
  '["It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel.","It drives the conflict between the prophetic word of the LORD and idolatrous power.","It contrasts self-exalting ambition with the kingly order David affirms."]'::jsonb,
  'It drives the conflict between the prophetic word of the LORD and idolatrous power.',
  'This option best fits the chapter''s narrative role within 1 Kings (1 Kings 17:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 17
    AND difficulty_stage = 4
    AND prompt = 'How does 1 Kings 17 function in the wider narrative of 1 Kings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  17,
  4,
  'Which claim best fits the chapter''s larger significance in 1 Kings 17?',
  '["Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Elijah announces a supernatural drought to challenge Ahab''s reliance on Baal.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following."]'::jsonb,
  'Elijah announces a supernatural drought to challenge Ahab''s reliance on Baal.',
  'This claim best fits the chapter''s larger significance in context (1 Kings 17:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 17
    AND difficulty_stage = 4
    AND prompt = 'Which claim best fits the chapter''s larger significance in 1 Kings 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  17,
  4,
  'Which conclusion best matches the covenant pressure visible in 1 Kings 17?',
  '["The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the LORD alone answers, judges, and vindicates his word."]'::jsonb,
  'The chapter shows that the LORD alone answers, judges, and vindicates his word.',
  'This conclusion best matches the chapter''s covenant pressure (1 Kings 17:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 17
    AND difficulty_stage = 4
    AND prompt = 'Which conclusion best matches the covenant pressure visible in 1 Kings 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  17,
  4,
  'Which reading best connects the chapter''s facts and themes in 1 Kings 17?',
  '["This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","The drought proved that the God of Israel, not Baal, controlled the elements.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty."]'::jsonb,
  'The drought proved that the God of Israel, not Baal, controlled the elements.',
  'This reading best connects the chapter''s verse-linked facts and its meaning (1 Kings 17:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 17
    AND difficulty_stage = 4
    AND prompt = 'Which reading best connects the chapter''s facts and themes in 1 Kings 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  17,
  4,
  'Which statement best explains the chapter''s contribution to the book in 1 Kings 17?',
  '["It drives the conflict between the prophetic word of the LORD and idolatrous power.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel."]'::jsonb,
  'It drives the conflict between the prophetic word of the LORD and idolatrous power.',
  'This statement best explains how the chapter contributes to the book''s flow (1 Kings 17:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 17
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains the chapter''s contribution to the book in 1 Kings 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  17,
  4,
  'Which statement best explains why the chapter is strategically important in 1 Kings 17?',
  '["It drives the conflict between the prophetic word of the LORD and idolatrous power.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel."]'::jsonb,
  'It drives the conflict between the prophetic word of the LORD and idolatrous power.',
  'This option best explains the chapter''s strategic importance in the book (1 Kings 17:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 17
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains why the chapter is strategically important in 1 Kings 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  17,
  4,
  'Which theological reading best fits 1 Kings 17?',
  '["The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the LORD alone answers, judges, and vindicates his word.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage."]'::jsonb,
  'The chapter shows that the LORD alone answers, judges, and vindicates his word.',
  'This theological reading best fits the chapter''s themes and developments (1 Kings 17:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 17
    AND difficulty_stage = 4
    AND prompt = 'Which theological reading best fits 1 Kings 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  17,
  5,
  'Which advanced synthesis best captures the theology of 1 Kings 17?',
  '["The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the LORD alone answers, judges, and vindicates his word.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force."]'::jsonb,
  'The chapter shows that the LORD alone answers, judges, and vindicates his word.',
  'This is the strongest theological synthesis grounded in the chapter''s notes (1 Kings 17:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 17
    AND difficulty_stage = 5
    AND prompt = 'Which advanced synthesis best captures the theology of 1 Kings 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  17,
  5,
  'Which book-level synthesis best explains 1 Kings 17?',
  '["It advances the temple-centered shape of worship and kingship in Israel.","It drives the conflict between the prophetic word of the LORD and idolatrous power.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign."]'::jsonb,
  'It drives the conflict between the prophetic word of the LORD and idolatrous power.',
  'This is the best book-level synthesis of the chapter''s role (1 Kings 17:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 17
    AND difficulty_stage = 5
    AND prompt = 'Which book-level synthesis best explains 1 Kings 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  17,
  5,
  'Which high-level reading best explains why 1 Kings 17 is remembered?',
  '["The drought proved that the God of Israel, not Baal, controlled the elements.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions."]'::jsonb,
  'The drought proved that the God of Israel, not Baal, controlled the elements.',
  'This high-level reading best explains why the chapter remains significant (1 Kings 17:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 17
    AND difficulty_stage = 5
    AND prompt = 'Which high-level reading best explains why 1 Kings 17 is remembered?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  17,
  5,
  'Which interpretive conclusion best fits the chapter''s place in 1 Kings 17?',
  '["It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel.","It drives the conflict between the prophetic word of the LORD and idolatrous power.","It contrasts self-exalting ambition with the kingly order David affirms."]'::jsonb,
  'It drives the conflict between the prophetic word of the LORD and idolatrous power.',
  'This interpretive conclusion best fits the chapter''s place in the book (1 Kings 17:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 17
    AND difficulty_stage = 5
    AND prompt = 'Which interpretive conclusion best fits the chapter''s place in 1 Kings 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  17,
  5,
  'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 17?',
  '["The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the LORD alone answers, judges, and vindicates his word.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage."]'::jsonb,
  'The chapter shows that the LORD alone answers, judges, and vindicates his word.',
  'This statement best captures the chapter''s lasting theological pressure (1 Kings 17:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 17
    AND difficulty_stage = 5
    AND prompt = 'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  17,
  5,
  'Which statement best reflects the long-range force of 1 Kings 17?',
  '["The drought proved that the God of Israel, not Baal, controlled the elements.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions."]'::jsonb,
  'The drought proved that the God of Israel, not Baal, controlled the elements.',
  'This statement best reflects the chapter''s long-range force within the narrative (1 Kings 17:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 17
    AND difficulty_stage = 5
    AND prompt = 'Which statement best reflects the long-range force of 1 Kings 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  17,
  5,
  'Which synthesis best joins the factual details and themes of 1 Kings 17?',
  '["The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the LORD alone answers, judges, and vindicates his word."]'::jsonb,
  'The chapter shows that the LORD alone answers, judges, and vindicates his word.',
  'This synthesis most successfully joins the chapter''s details and themes (1 Kings 17:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 17
    AND difficulty_stage = 5
    AND prompt = 'Which synthesis best joins the factual details and themes of 1 Kings 17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  18,
  1,
  'What development clearly belongs to 1 Kings 18?',
  '["He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Ahab watches as the prophets of Baal fail to call down fire (1 Kings 18:26-29)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)"]'::jsonb,
  'Ahab watches as the prophets of Baal fail to call down fire (1 Kings 18:26-29)',
  'This detail is directly tied to 1 Kings 18:26-29.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 18
    AND difficulty_stage = 1
    AND prompt = 'What development clearly belongs to 1 Kings 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  18,
  1,
  'Which event is described in 1 Kings 18?',
  '["Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","The 450 prophets of Baal are executed at the brook Kishon (1 Kings 18:40)"]'::jsonb,
  'The 450 prophets of Baal are executed at the brook Kishon (1 Kings 18:40)',
  'This event is part of the chapter''s verse-linked source material (1 Kings 18:40).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 18
    AND difficulty_stage = 1
    AND prompt = 'Which event is described in 1 Kings 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  18,
  1,
  'Who appears in 1 Kings 18?',
  '["Elijah","David","Solomon","Adonijah"]'::jsonb,
  'Elijah',
  'Elijah is listed among the key people for this chapter (1 Kings 18:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 18
    AND difficulty_stage = 1
    AND prompt = 'Who appears in 1 Kings 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  18,
  1,
  'Which verse is highlighted in 1 Kings 18?',
  '["1 Kings 1:5","1 Kings 1:11","1 Kings 1:29","1 Kings 18:1"]'::jsonb,
  '1 Kings 18:1',
  '1 Kings 18:1 is one of the chapter''s supporting verses.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 18
    AND difficulty_stage = 1
    AND prompt = 'Which verse is highlighted in 1 Kings 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  18,
  1,
  'What theme stands out in 1 Kings 18?',
  '["Covenant legitimacy","Exclusive worship","Royal succession","David''s final days"]'::jsonb,
  'Exclusive worship',
  'Exclusive worship is listed among the chapter themes (1 Kings 18:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 18
    AND difficulty_stage = 1
    AND prompt = 'What theme stands out in 1 Kings 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  18,
  1,
  'Which title best fits 1 Kings 18?',
  '["David''s charge and Solomon''s first judgments","Solomon asks for wisdom","Fire on Carmel and rain returns","Solomon anointed amid succession crisis"]'::jsonb,
  'Fire on Carmel and rain returns',
  'Fire on Carmel and rain returns is the chapter title in the commentary notes (1 Kings 18:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 18
    AND difficulty_stage = 1
    AND prompt = 'Which title best fits 1 Kings 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  18,
  1,
  'What happens in 1 Kings 18?',
  '["He sees fire consume Elijah''s water-soaked sacrifice (1 Kings 18:38)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)"]'::jsonb,
  'He sees fire consume Elijah''s water-soaked sacrifice (1 Kings 18:38)',
  'This verse-linked detail appears in the source notes for 1 Kings 18:38.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 18
    AND difficulty_stage = 1
    AND prompt = 'What happens in 1 Kings 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  18,
  2,
  'What happens in 1 Kings 18?',
  '["He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Ahab rides back to Jezreel as the rain finally returns (1 Kings 18:45)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)"]'::jsonb,
  'Ahab rides back to Jezreel as the rain finally returns (1 Kings 18:45)',
  'This detail belongs to the chapter''s source notes (1 Kings 18:45).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 18
    AND difficulty_stage = 2
    AND prompt = 'What happens in 1 Kings 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  18,
  2,
  'What detail appears in 1 Kings 18?',
  '["Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Elijah mocks them, suggesting Baal is sleeping or on a journey (1 Kings 18:27)"]'::jsonb,
  'Elijah mocks them, suggesting Baal is sleeping or on a journey (1 Kings 18:27)',
  'The source material for 1 Kings 18:27 includes this detail.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 18
    AND difficulty_stage = 2
    AND prompt = 'What detail appears in 1 Kings 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  18,
  2,
  'Which phrase is used in 1 Kings 18?',
  '["Let Solomon my son reign","Zadok the priest","Nathan the prophet","How long will you waver"]'::jsonb,
  'How long will you waver',
  'This phrase appears among the chapter''s evidence phrases (1 Kings 18:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 18
    AND difficulty_stage = 2
    AND prompt = 'Which phrase is used in 1 Kings 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  18,
  2,
  'Whom does Elijah call in 1 Kings 18?',
  '["Elijah calls Israel to choose between the LORD and Baal.","Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people."]'::jsonb,
  'Elijah calls Israel to choose between the LORD and Baal.',
  'This key point is part of the commentary notes for the chapter (1 Kings 18:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 18
    AND difficulty_stage = 2
    AND prompt = 'Whom does Elijah call in 1 Kings 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  18,
  2,
  'What scene appears in 1 Kings 18?',
  '["The prophets of Baal cry out and cut themselves from morning until evening (1 Kings 18:26-29)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)"]'::jsonb,
  'The prophets of Baal cry out and cut themselves from morning until evening (1 Kings 18:26-29)',
  'This scene is tied to 1 Kings 18:26-29.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 18
    AND difficulty_stage = 2
    AND prompt = 'What scene appears in 1 Kings 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  18,
  2,
  'Why does this matter in 1 Kings 18?',
  '["This feast was a formal attempt to stage a coup against David''s intentions.","Ahab was given an undeniable sign of God''s power but remained influenced by Jezebel.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride."]'::jsonb,
  'Ahab was given an undeniable sign of God''s power but remained influenced by Jezebel.',
  'This significance statement is attached to verse-linked material from this chapter (1 Kings 18:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 18
    AND difficulty_stage = 2
    AND prompt = 'Why does this matter in 1 Kings 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  18,
  2,
  'Which summary best fits 1 Kings 18?',
  '["As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Ahab witnesses the dramatic fire from heaven that confirms the true God.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne."]'::jsonb,
  'Ahab witnesses the dramatic fire from heaven that confirms the true God.',
  'This summary line comes from source material connected to 1 Kings 18:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 18
    AND difficulty_stage = 2
    AND prompt = 'Which summary best fits 1 Kings 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  18,
  3,
  'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 18?',
  '["the LORD, he is God","Let Solomon my son reign","Zadok the priest","Nathan the prophet"]'::jsonb,
  'the LORD, he is God',
  'This phrase most directly reflects the chapter''s focal line (1 Kings 18:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 18
    AND difficulty_stage = 3
    AND prompt = 'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  18,
  3,
  'Which key point best summarizes what 1 Kings 18 emphasizes?',
  '["Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people.","Baal does not answer, but the LORD sends fire.","Adonijah attempts to claim the throne without David''s approval."]'::jsonb,
  'Baal does not answer, but the LORD sends fire.',
  'This key point best captures the emphasis of the chapter summary (1 Kings 18:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 18
    AND difficulty_stage = 3
    AND prompt = 'Which key point best summarizes what 1 Kings 18 emphasizes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  18,
  3,
  'Which line best explains why the events of 1 Kings 18 matter?',
  '["Ahab was given an undeniable sign of God''s power but remained influenced by Jezebel.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions."]'::jsonb,
  'Ahab was given an undeniable sign of God''s power but remained influenced by Jezebel.',
  'This significance line best explains the chapter''s weight (1 Kings 18:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 18
    AND difficulty_stage = 3
    AND prompt = 'Which line best explains why the events of 1 Kings 18 matter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  18,
  3,
  'Which statement best captures the chapter''s main action in 1 Kings 18?',
  '["Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Ahab witnesses the dramatic fire from heaven that confirms the true God.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following."]'::jsonb,
  'Ahab witnesses the dramatic fire from heaven that confirms the true God.',
  'This summary best fits the chapter''s core movement (1 Kings 18:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 18
    AND difficulty_stage = 3
    AND prompt = 'Which statement best captures the chapter''s main action in 1 Kings 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  18,
  3,
  'Which statement best matches the leadership pressure in 1 Kings 18?',
  '["Solomon is anointed king and proclaimed by the people.","The people confess that the LORD is God.","Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows."]'::jsonb,
  'The people confess that the LORD is God.',
  'This statement best matches the chapter''s leadership pressure (1 Kings 18:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 18
    AND difficulty_stage = 3
    AND prompt = 'Which statement best matches the leadership pressure in 1 Kings 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  18,
  3,
  'Which summary statement best fits the movement of 1 Kings 18?',
  '["As David grows old, Adonijah tries to seize the throne, but Nathan, Bathsheba, Zadok, and Benaiah move quickly to secure Solomon''s anointing. David publicly confirms Solomon as his chosen successor, and the people celebrate the new king. The chapter closes with Adonijah seeking mercy as Solomon begins his reign with legitimacy and peace.","David gives Solomon final instructions to walk faithfully, guard the kingdom, and deal wisely with unresolved matters in the court. Solomon secures his throne by removing threats from Adonijah, Abiathar, Joab, and Shimei. The chapter shows that the new king''s rule must be rooted in obedience, justice, and discernment.","At Gibeon, Solomon asks God for a listening heart rather than riches, long life, or victory over enemies. God grants him unmatched wisdom along with wealth and honor because he asked for discernment to govern well. His first judgment between two women proves that the gift is real and that the people can trust his rule.","Elijah confronts Ahab, gathers Israel at Carmel, and exposes the futility of Baal worship. The LORD answers Elijah with fire, and then the prophet prays until the long drought breaks in a rushing rainstorm. The chapter shows that covenant loyalty belongs to the LORD alone and that he alone brings life to a dry land."]'::jsonb,
  'Elijah confronts Ahab, gathers Israel at Carmel, and exposes the futility of Baal worship. The LORD answers Elijah with fire, and then the prophet prays until the long drought breaks in a rushing rainstorm. The chapter shows that covenant loyalty belongs to the LORD alone and that he alone brings life to a dry land.',
  'This is the chapter summary for 1 Kings 18.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 18
    AND difficulty_stage = 3
    AND prompt = 'Which summary statement best fits the movement of 1 Kings 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  18,
  3,
  'Which theme best interprets the events of 1 Kings 18?',
  '["Royal succession","David''s final days","Covenant legitimacy","Exclusive worship"]'::jsonb,
  'Exclusive worship',
  'Exclusive worship is the best thematic lens supplied in the notes (1 Kings 18:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 18
    AND difficulty_stage = 3
    AND prompt = 'Which theme best interprets the events of 1 Kings 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  18,
  4,
  'How does 1 Kings 18 function in the wider narrative of 1 Kings?',
  '["It advances the temple-centered shape of worship and kingship in Israel.","It drives the conflict between the prophetic word of the LORD and idolatrous power.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign."]'::jsonb,
  'It drives the conflict between the prophetic word of the LORD and idolatrous power.',
  'This option best fits the chapter''s narrative role within 1 Kings (1 Kings 18:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 18
    AND difficulty_stage = 4
    AND prompt = 'How does 1 Kings 18 function in the wider narrative of 1 Kings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  18,
  4,
  'Which claim best fits the chapter''s larger significance in 1 Kings 18?',
  '["Ahab witnesses the dramatic fire from heaven that confirms the true God.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king."]'::jsonb,
  'Ahab witnesses the dramatic fire from heaven that confirms the true God.',
  'This claim best fits the chapter''s larger significance in context (1 Kings 18:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 18
    AND difficulty_stage = 4
    AND prompt = 'Which claim best fits the chapter''s larger significance in 1 Kings 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  18,
  4,
  'Which conclusion best matches the covenant pressure visible in 1 Kings 18?',
  '["The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the LORD alone answers, judges, and vindicates his word.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force."]'::jsonb,
  'The chapter shows that the LORD alone answers, judges, and vindicates his word.',
  'This conclusion best matches the chapter''s covenant pressure (1 Kings 18:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 18
    AND difficulty_stage = 4
    AND prompt = 'Which conclusion best matches the covenant pressure visible in 1 Kings 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  18,
  4,
  'Which reading best connects the chapter''s facts and themes in 1 Kings 18?',
  '["This feast was a formal attempt to stage a coup against David''s intentions.","Ahab was given an undeniable sign of God''s power but remained influenced by Jezebel.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride."]'::jsonb,
  'Ahab was given an undeniable sign of God''s power but remained influenced by Jezebel.',
  'This reading best connects the chapter''s verse-linked facts and its meaning (1 Kings 18:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 18
    AND difficulty_stage = 4
    AND prompt = 'Which reading best connects the chapter''s facts and themes in 1 Kings 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  18,
  4,
  'Which statement best explains the chapter''s contribution to the book in 1 Kings 18?',
  '["It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel.","It drives the conflict between the prophetic word of the LORD and idolatrous power."]'::jsonb,
  'It drives the conflict between the prophetic word of the LORD and idolatrous power.',
  'This statement best explains how the chapter contributes to the book''s flow (1 Kings 18:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 18
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains the chapter''s contribution to the book in 1 Kings 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  18,
  4,
  'Which statement best explains why the chapter is strategically important in 1 Kings 18?',
  '["It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel.","It drives the conflict between the prophetic word of the LORD and idolatrous power."]'::jsonb,
  'It drives the conflict between the prophetic word of the LORD and idolatrous power.',
  'This option best explains the chapter''s strategic importance in the book (1 Kings 18:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 18
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains why the chapter is strategically important in 1 Kings 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  18,
  4,
  'Which theological reading best fits 1 Kings 18?',
  '["The chapter shows that the LORD alone answers, judges, and vindicates his word.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people."]'::jsonb,
  'The chapter shows that the LORD alone answers, judges, and vindicates his word.',
  'This theological reading best fits the chapter''s themes and developments (1 Kings 18:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 18
    AND difficulty_stage = 4
    AND prompt = 'Which theological reading best fits 1 Kings 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  18,
  5,
  'Which advanced synthesis best captures the theology of 1 Kings 18?',
  '["The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the LORD alone answers, judges, and vindicates his word.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage."]'::jsonb,
  'The chapter shows that the LORD alone answers, judges, and vindicates his word.',
  'This is the strongest theological synthesis grounded in the chapter''s notes (1 Kings 18:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 18
    AND difficulty_stage = 5
    AND prompt = 'Which advanced synthesis best captures the theology of 1 Kings 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  18,
  5,
  'Which book-level synthesis best explains 1 Kings 18?',
  '["It drives the conflict between the prophetic word of the LORD and idolatrous power.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel."]'::jsonb,
  'It drives the conflict between the prophetic word of the LORD and idolatrous power.',
  'This is the best book-level synthesis of the chapter''s role (1 Kings 18:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 18
    AND difficulty_stage = 5
    AND prompt = 'Which book-level synthesis best explains 1 Kings 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  18,
  5,
  'Which high-level reading best explains why 1 Kings 18 is remembered?',
  '["This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","Ahab was given an undeniable sign of God''s power but remained influenced by Jezebel."]'::jsonb,
  'Ahab was given an undeniable sign of God''s power but remained influenced by Jezebel.',
  'This high-level reading best explains why the chapter remains significant (1 Kings 18:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 18
    AND difficulty_stage = 5
    AND prompt = 'Which high-level reading best explains why 1 Kings 18 is remembered?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  18,
  5,
  'Which interpretive conclusion best fits the chapter''s place in 1 Kings 18?',
  '["It advances the temple-centered shape of worship and kingship in Israel.","It drives the conflict between the prophetic word of the LORD and idolatrous power.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign."]'::jsonb,
  'It drives the conflict between the prophetic word of the LORD and idolatrous power.',
  'This interpretive conclusion best fits the chapter''s place in the book (1 Kings 18:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 18
    AND difficulty_stage = 5
    AND prompt = 'Which interpretive conclusion best fits the chapter''s place in 1 Kings 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  18,
  5,
  'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 18?',
  '["The chapter shows that the LORD alone answers, judges, and vindicates his word.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people."]'::jsonb,
  'The chapter shows that the LORD alone answers, judges, and vindicates his word.',
  'This statement best captures the chapter''s lasting theological pressure (1 Kings 18:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 18
    AND difficulty_stage = 5
    AND prompt = 'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  18,
  5,
  'Which statement best reflects the long-range force of 1 Kings 18?',
  '["This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","Ahab was given an undeniable sign of God''s power but remained influenced by Jezebel."]'::jsonb,
  'Ahab was given an undeniable sign of God''s power but remained influenced by Jezebel.',
  'This statement best reflects the chapter''s long-range force within the narrative (1 Kings 18:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 18
    AND difficulty_stage = 5
    AND prompt = 'Which statement best reflects the long-range force of 1 Kings 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  18,
  5,
  'Which synthesis best joins the factual details and themes of 1 Kings 18?',
  '["The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the LORD alone answers, judges, and vindicates his word.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force."]'::jsonb,
  'The chapter shows that the LORD alone answers, judges, and vindicates his word.',
  'This synthesis most successfully joins the chapter''s details and themes (1 Kings 18:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 18
    AND difficulty_stage = 5
    AND prompt = 'Which synthesis best joins the factual details and themes of 1 Kings 18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  19,
  1,
  'What happens in 1 Kings 19?',
  '["He sits under a broom tree and asks God to take his life (1 Kings 19:4)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)"]'::jsonb,
  'He sits under a broom tree and asks God to take his life (1 Kings 19:4)',
  'This detail is directly tied to 1 Kings 19:4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 19
    AND difficulty_stage = 1
    AND prompt = 'What happens in 1 Kings 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  19,
  1,
  'Which event is described in 1 Kings 19?',
  '["Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Elijah tells God he is the only faithful prophet left (1 Kings 19:10)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)"]'::jsonb,
  'Elijah tells God he is the only faithful prophet left (1 Kings 19:10)',
  'This event is part of the chapter''s verse-linked source material (1 Kings 19:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 19
    AND difficulty_stage = 1
    AND prompt = 'Which event is described in 1 Kings 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  19,
  1,
  'Who appears in 1 Kings 19?',
  '["David","Solomon","Adonijah","Elijah"]'::jsonb,
  'Elijah',
  'Elijah is listed among the key people for this chapter (1 Kings 19:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 19
    AND difficulty_stage = 1
    AND prompt = 'Who appears in 1 Kings 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  19,
  1,
  'Which verse is highlighted in 1 Kings 19?',
  '["1 Kings 1:11","1 Kings 1:29","1 Kings 19:4","1 Kings 1:5"]'::jsonb,
  '1 Kings 19:4',
  '1 Kings 19:4 is one of the chapter''s supporting verses.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 19
    AND difficulty_stage = 1
    AND prompt = 'Which verse is highlighted in 1 Kings 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  19,
  1,
  'What theme stands out in 1 Kings 19?',
  '["Prophetic exhaustion","Royal succession","David''s final days","Covenant legitimacy"]'::jsonb,
  'Prophetic exhaustion',
  'Prophetic exhaustion is listed among the chapter themes (1 Kings 19:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 19
    AND difficulty_stage = 1
    AND prompt = 'What theme stands out in 1 Kings 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  19,
  1,
  'Which title best fits 1 Kings 19?',
  '["Solomon asks for wisdom","Elijah at Horeb","Solomon anointed amid succession crisis","David''s charge and Solomon''s first judgments"]'::jsonb,
  'Elijah at Horeb',
  'Elijah at Horeb is the chapter title in the commentary notes (1 Kings 19:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 19
    AND difficulty_stage = 1
    AND prompt = 'Which title best fits 1 Kings 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  19,
  1,
  'Which verse-linked detail appears in 1 Kings 19?',
  '["Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","An angel feeds him for a forty-day journey to Mount Horeb (1 Kings 19:5-8)"]'::jsonb,
  'An angel feeds him for a forty-day journey to Mount Horeb (1 Kings 19:5-8)',
  'This verse-linked detail appears in the source notes for 1 Kings 19:5-8.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 19
    AND difficulty_stage = 1
    AND prompt = 'Which verse-linked detail appears in 1 Kings 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  19,
  2,
  'What happens in 1 Kings 19?',
  '["God speaks to him not in wind, earthquake, or fire, but in a ''low whisper'' (1 Kings 19:11-13)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)"]'::jsonb,
  'God speaks to him not in wind, earthquake, or fire, but in a ''low whisper'' (1 Kings 19:11-13)',
  'This detail belongs to the chapter''s source notes (1 Kings 19:11-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 19
    AND difficulty_stage = 2
    AND prompt = 'What happens in 1 Kings 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  19,
  2,
  'What happens in 1 Kings 19?',
  '["Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","He is commanded to anoint Elisha as prophet in his place (1 Kings 19:16)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)"]'::jsonb,
  'He is commanded to anoint Elisha as prophet in his place (1 Kings 19:16)',
  'The source material for 1 Kings 19:16 includes this detail.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 19
    AND difficulty_stage = 2
    AND prompt = 'What happens in 1 Kings 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  19,
  2,
  'Which phrase is used in 1 Kings 19?',
  '["Zadok the priest","Nathan the prophet","a still small voice","Let Solomon my son reign"]'::jsonb,
  'a still small voice',
  'This phrase appears among the chapter''s evidence phrases (1 Kings 19:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 19
    AND difficulty_stage = 2
    AND prompt = 'Which phrase is used in 1 Kings 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  19,
  2,
  'What key point stands out in 1 Kings 19?',
  '["Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people.","Elijah collapses under fear and fatigue."]'::jsonb,
  'Elijah collapses under fear and fatigue.',
  'This key point is part of the commentary notes for the chapter (1 Kings 19:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 19
    AND difficulty_stage = 2
    AND prompt = 'What key point stands out in 1 Kings 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  19,
  2,
  'What happens in 1 Kings 19?',
  '["Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","He is told to anoint Hazael as king of Syria and Jehu as king of Israel (1 Kings 19:15-16)"]'::jsonb,
  'He is told to anoint Hazael as king of Syria and Jehu as king of Israel (1 Kings 19:15-16)',
  'This scene is tied to 1 Kings 19:15-16.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 19
    AND difficulty_stage = 2
    AND prompt = 'What happens in 1 Kings 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  19,
  2,
  'What does this mean in 1 Kings 19?',
  '["This encounter taught Elijah that God''s work continues even in quietness and through others.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions."]'::jsonb,
  'This encounter taught Elijah that God''s work continues even in quietness and through others.',
  'This significance statement is attached to verse-linked material from this chapter (1 Kings 19:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 19
    AND difficulty_stage = 2
    AND prompt = 'What does this mean in 1 Kings 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  19,
  2,
  'Which summary best fits 1 Kings 19?',
  '["Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Threatened by Jezebel, Elijah flees into the wilderness and experiences a deep emotional collapse.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following."]'::jsonb,
  'Threatened by Jezebel, Elijah flees into the wilderness and experiences a deep emotional collapse.',
  'This summary line comes from source material connected to 1 Kings 19:4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 19
    AND difficulty_stage = 2
    AND prompt = 'Which summary best fits 1 Kings 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  19,
  3,
  'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 19?',
  '["Let Solomon my son reign","Zadok the priest","Nathan the prophet","What are you doing here, Elijah?"]'::jsonb,
  'What are you doing here, Elijah?',
  'This phrase most directly reflects the chapter''s focal line (1 Kings 19:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 19
    AND difficulty_stage = 3
    AND prompt = 'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  19,
  3,
  'Which key point best summarizes what 1 Kings 19 emphasizes?',
  '["Solomon is anointed king and proclaimed by the people.","God strengthens him for the journey to Horeb.","Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows."]'::jsonb,
  'God strengthens him for the journey to Horeb.',
  'This key point best captures the emphasis of the chapter summary (1 Kings 19:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 19
    AND difficulty_stage = 3
    AND prompt = 'Which key point best summarizes what 1 Kings 19 emphasizes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  19,
  3,
  'Which line best explains why the events of 1 Kings 19 matter?',
  '["This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","This encounter taught Elijah that God''s work continues even in quietness and through others."]'::jsonb,
  'This encounter taught Elijah that God''s work continues even in quietness and through others.',
  'This significance line best explains the chapter''s weight (1 Kings 19:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 19
    AND difficulty_stage = 3
    AND prompt = 'Which line best explains why the events of 1 Kings 19 matter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  19,
  3,
  'Which statement best captures the chapter''s main action in 1 Kings 19?',
  '["Threatened by Jezebel, Elijah flees into the wilderness and experiences a deep emotional collapse.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king."]'::jsonb,
  'Threatened by Jezebel, Elijah flees into the wilderness and experiences a deep emotional collapse.',
  'This summary best fits the chapter''s core movement (1 Kings 19:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 19
    AND difficulty_stage = 3
    AND prompt = 'Which statement best captures the chapter''s main action in 1 Kings 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  19,
  3,
  'Which statement best matches the leadership pressure in 1 Kings 19?',
  '["The LORD speaks in a gentle voice, not in the storm.","Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people."]'::jsonb,
  'The LORD speaks in a gentle voice, not in the storm.',
  'This statement best matches the chapter''s leadership pressure (1 Kings 19:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 19
    AND difficulty_stage = 3
    AND prompt = 'Which statement best matches the leadership pressure in 1 Kings 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  19,
  3,
  'Which summary statement best fits the movement of 1 Kings 19?',
  '["David gives Solomon final instructions to walk faithfully, guard the kingdom, and deal wisely with unresolved matters in the court. Solomon secures his throne by removing threats from Adonijah, Abiathar, Joab, and Shimei. The chapter shows that the new king''s rule must be rooted in obedience, justice, and discernment.","At Gibeon, Solomon asks God for a listening heart rather than riches, long life, or victory over enemies. God grants him unmatched wisdom along with wealth and honor because he asked for discernment to govern well. His first judgment between two women proves that the gift is real and that the people can trust his rule.","After Jezebel''s threat, Elijah flees in exhaustion and despair, but God meets him in wilderness provision and quiet speech. At Horeb the LORD recommissions Elijah and reveals that he is not alone, preserving a faithful remnant and appointing future leaders. The chapter moves from fear to renewed purpose under God''s gentle yet sovereign care.","As David grows old, Adonijah tries to seize the throne, but Nathan, Bathsheba, Zadok, and Benaiah move quickly to secure Solomon''s anointing. David publicly confirms Solomon as his chosen successor, and the people celebrate the new king. The chapter closes with Adonijah seeking mercy as Solomon begins his reign with legitimacy and peace."]'::jsonb,
  'After Jezebel''s threat, Elijah flees in exhaustion and despair, but God meets him in wilderness provision and quiet speech. At Horeb the LORD recommissions Elijah and reveals that he is not alone, preserving a faithful remnant and appointing future leaders. The chapter moves from fear to renewed purpose under God''s gentle yet sovereign care.',
  'This is the chapter summary for 1 Kings 19.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 19
    AND difficulty_stage = 3
    AND prompt = 'Which summary statement best fits the movement of 1 Kings 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  19,
  3,
  'Which theme best interprets the events of 1 Kings 19?',
  '["David''s final days","Covenant legitimacy","Prophetic exhaustion","Royal succession"]'::jsonb,
  'Prophetic exhaustion',
  'Prophetic exhaustion is the best thematic lens supplied in the notes (1 Kings 19:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 19
    AND difficulty_stage = 3
    AND prompt = 'Which theme best interprets the events of 1 Kings 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  19,
  4,
  'How does 1 Kings 19 function in the wider narrative of 1 Kings?',
  '["It drives the conflict between the prophetic word of the LORD and idolatrous power.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel."]'::jsonb,
  'It drives the conflict between the prophetic word of the LORD and idolatrous power.',
  'This option best fits the chapter''s narrative role within 1 Kings (1 Kings 19:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 19
    AND difficulty_stage = 4
    AND prompt = 'How does 1 Kings 19 function in the wider narrative of 1 Kings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  19,
  4,
  'Which claim best fits the chapter''s larger significance in 1 Kings 19?',
  '["Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Threatened by Jezebel, Elijah flees into the wilderness and experiences a deep emotional collapse."]'::jsonb,
  'Threatened by Jezebel, Elijah flees into the wilderness and experiences a deep emotional collapse.',
  'This claim best fits the chapter''s larger significance in context (1 Kings 19:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 19
    AND difficulty_stage = 4
    AND prompt = 'Which claim best fits the chapter''s larger significance in 1 Kings 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  19,
  4,
  'Which conclusion best matches the covenant pressure visible in 1 Kings 19?',
  '["The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the LORD alone answers, judges, and vindicates his word.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage."]'::jsonb,
  'The chapter shows that the LORD alone answers, judges, and vindicates his word.',
  'This conclusion best matches the chapter''s covenant pressure (1 Kings 19:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 19
    AND difficulty_stage = 4
    AND prompt = 'Which conclusion best matches the covenant pressure visible in 1 Kings 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  19,
  4,
  'Which reading best connects the chapter''s facts and themes in 1 Kings 19?',
  '["This encounter taught Elijah that God''s work continues even in quietness and through others.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions."]'::jsonb,
  'This encounter taught Elijah that God''s work continues even in quietness and through others.',
  'This reading best connects the chapter''s verse-linked facts and its meaning (1 Kings 19:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 19
    AND difficulty_stage = 4
    AND prompt = 'Which reading best connects the chapter''s facts and themes in 1 Kings 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  19,
  4,
  'Which statement best explains the chapter''s contribution to the book in 1 Kings 19?',
  '["It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel.","It drives the conflict between the prophetic word of the LORD and idolatrous power.","It contrasts self-exalting ambition with the kingly order David affirms."]'::jsonb,
  'It drives the conflict between the prophetic word of the LORD and idolatrous power.',
  'This statement best explains how the chapter contributes to the book''s flow (1 Kings 19:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 19
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains the chapter''s contribution to the book in 1 Kings 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  19,
  4,
  'Which statement best explains why the chapter is strategically important in 1 Kings 19?',
  '["It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel.","It drives the conflict between the prophetic word of the LORD and idolatrous power.","It contrasts self-exalting ambition with the kingly order David affirms."]'::jsonb,
  'It drives the conflict between the prophetic word of the LORD and idolatrous power.',
  'This option best explains the chapter''s strategic importance in the book (1 Kings 19:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 19
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains why the chapter is strategically important in 1 Kings 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  19,
  4,
  'Which theological reading best fits 1 Kings 19?',
  '["The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the LORD alone answers, judges, and vindicates his word."]'::jsonb,
  'The chapter shows that the LORD alone answers, judges, and vindicates his word.',
  'This theological reading best fits the chapter''s themes and developments (1 Kings 19:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 19
    AND difficulty_stage = 4
    AND prompt = 'Which theological reading best fits 1 Kings 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  19,
  5,
  'Which advanced synthesis best captures the theology of 1 Kings 19?',
  '["The chapter shows that the LORD alone answers, judges, and vindicates his word.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people."]'::jsonb,
  'The chapter shows that the LORD alone answers, judges, and vindicates his word.',
  'This is the strongest theological synthesis grounded in the chapter''s notes (1 Kings 19:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 19
    AND difficulty_stage = 5
    AND prompt = 'Which advanced synthesis best captures the theology of 1 Kings 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  19,
  5,
  'Which book-level synthesis best explains 1 Kings 19?',
  '["It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel.","It drives the conflict between the prophetic word of the LORD and idolatrous power."]'::jsonb,
  'It drives the conflict between the prophetic word of the LORD and idolatrous power.',
  'This is the best book-level synthesis of the chapter''s role (1 Kings 19:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 19
    AND difficulty_stage = 5
    AND prompt = 'Which book-level synthesis best explains 1 Kings 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  19,
  5,
  'Which high-level reading best explains why 1 Kings 19 is remembered?',
  '["This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","This encounter taught Elijah that God''s work continues even in quietness and through others.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty."]'::jsonb,
  'This encounter taught Elijah that God''s work continues even in quietness and through others.',
  'This high-level reading best explains why the chapter remains significant (1 Kings 19:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 19
    AND difficulty_stage = 5
    AND prompt = 'Which high-level reading best explains why 1 Kings 19 is remembered?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  19,
  5,
  'Which interpretive conclusion best fits the chapter''s place in 1 Kings 19?',
  '["It drives the conflict between the prophetic word of the LORD and idolatrous power.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel."]'::jsonb,
  'It drives the conflict between the prophetic word of the LORD and idolatrous power.',
  'This interpretive conclusion best fits the chapter''s place in the book (1 Kings 19:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 19
    AND difficulty_stage = 5
    AND prompt = 'Which interpretive conclusion best fits the chapter''s place in 1 Kings 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  19,
  5,
  'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 19?',
  '["The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the LORD alone answers, judges, and vindicates his word."]'::jsonb,
  'The chapter shows that the LORD alone answers, judges, and vindicates his word.',
  'This statement best captures the chapter''s lasting theological pressure (1 Kings 19:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 19
    AND difficulty_stage = 5
    AND prompt = 'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  19,
  5,
  'Which statement best reflects the long-range force of 1 Kings 19?',
  '["This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","This encounter taught Elijah that God''s work continues even in quietness and through others.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty."]'::jsonb,
  'This encounter taught Elijah that God''s work continues even in quietness and through others.',
  'This statement best reflects the chapter''s long-range force within the narrative (1 Kings 19:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 19
    AND difficulty_stage = 5
    AND prompt = 'Which statement best reflects the long-range force of 1 Kings 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  19,
  5,
  'Which synthesis best joins the factual details and themes of 1 Kings 19?',
  '["The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the LORD alone answers, judges, and vindicates his word.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage."]'::jsonb,
  'The chapter shows that the LORD alone answers, judges, and vindicates his word.',
  'This synthesis most successfully joins the chapter''s details and themes (1 Kings 19:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 19
    AND difficulty_stage = 5
    AND prompt = 'Which synthesis best joins the factual details and themes of 1 Kings 19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  20,
  1,
  'What development clearly belongs to 1 Kings 20?',
  '["Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Ben-hadad of Syria besieges Samaria with thirty-two kings (1 Kings 20:1)"]'::jsonb,
  'Ben-hadad of Syria besieges Samaria with thirty-two kings (1 Kings 20:1)',
  'This detail is directly tied to 1 Kings 20:1.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 20
    AND difficulty_stage = 1
    AND prompt = 'What development clearly belongs to 1 Kings 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  20,
  1,
  'Which event is described in 1 Kings 20?',
  '["He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Ahab''s forces win two decisive battles against the Syrians (1 Kings 20:20-21, 29)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)"]'::jsonb,
  'Ahab''s forces win two decisive battles against the Syrians (1 Kings 20:20-21, 29)',
  'This event is part of the chapter''s verse-linked source material (1 Kings 20:20-21,).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 20
    AND difficulty_stage = 1
    AND prompt = 'Which event is described in 1 Kings 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  20,
  1,
  'Who appears in 1 Kings 20?',
  '["Solomon","Adonijah","Ahab","David"]'::jsonb,
  'Ahab',
  'Ahab is listed among the key people for this chapter (1 Kings 20:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 20
    AND difficulty_stage = 1
    AND prompt = 'Who appears in 1 Kings 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  20,
  1,
  'Which verse is highlighted in 1 Kings 20?',
  '["1 Kings 1:29","1 Kings 20:13","1 Kings 1:5","1 Kings 1:11"]'::jsonb,
  '1 Kings 20:13',
  '1 Kings 20:13 is one of the chapter''s supporting verses.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 20
    AND difficulty_stage = 1
    AND prompt = 'Which verse is highlighted in 1 Kings 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  20,
  1,
  'What theme stands out in 1 Kings 20?',
  '["Royal succession","David''s final days","Covenant legitimacy","Divine deliverance"]'::jsonb,
  'Divine deliverance',
  'Divine deliverance is listed among the chapter themes (1 Kings 20:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 20
    AND difficulty_stage = 1
    AND prompt = 'What theme stands out in 1 Kings 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  20,
  1,
  'Which title best fits 1 Kings 20?',
  '["Ahab and Ben-hadad","Solomon anointed amid succession crisis","David''s charge and Solomon''s first judgments","Solomon asks for wisdom"]'::jsonb,
  'Ahab and Ben-hadad',
  'Ahab and Ben-hadad is the chapter title in the commentary notes (1 Kings 20:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 20
    AND difficulty_stage = 1
    AND prompt = 'Which title best fits 1 Kings 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  20,
  1,
  'Which verse-linked detail appears in 1 Kings 20?',
  '["Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","A prophet tells Ahab that God will deliver the multitude into his hand (1 Kings 20:13)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)"]'::jsonb,
  'A prophet tells Ahab that God will deliver the multitude into his hand (1 Kings 20:13)',
  'This verse-linked detail appears in the source notes for 1 Kings 20:13.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 20
    AND difficulty_stage = 1
    AND prompt = 'Which verse-linked detail appears in 1 Kings 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  20,
  2,
  'What does Ahab make in 1 Kings 20?',
  '["Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Ahab makes a treaty with Ben-hadad instead of killing him (1 Kings 20:34)"]'::jsonb,
  'Ahab makes a treaty with Ben-hadad instead of killing him (1 Kings 20:34)',
  'This detail belongs to the chapter''s source notes (1 Kings 20:34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 20
    AND difficulty_stage = 2
    AND prompt = 'What does Ahab make in 1 Kings 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  20,
  2,
  'What detail appears in 1 Kings 20?',
  '["He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Ahab initially complies but refuses a second, more intrusive demand (1 Kings 20:4-9)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)"]'::jsonb,
  'Ahab initially complies but refuses a second, more intrusive demand (1 Kings 20:4-9)',
  'The source material for 1 Kings 20:4-9 includes this detail.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 20
    AND difficulty_stage = 2
    AND prompt = 'What detail appears in 1 Kings 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  20,
  2,
  'Which phrase is used in 1 Kings 20?',
  '["Nathan the prophet","I will deliver it into your hand","Let Solomon my son reign","Zadok the priest"]'::jsonb,
  'I will deliver it into your hand',
  'This phrase appears among the chapter''s evidence phrases (1 Kings 20:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 20
    AND difficulty_stage = 2
    AND prompt = 'Which phrase is used in 1 Kings 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  20,
  2,
  'What does The LORD give in 1 Kings 20?',
  '["Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people.","The LORD gives victory over a superior enemy.","Adonijah attempts to claim the throne without David''s approval."]'::jsonb,
  'The LORD gives victory over a superior enemy.',
  'This key point is part of the commentary notes for the chapter (1 Kings 20:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 20
    AND difficulty_stage = 2
    AND prompt = 'What does The LORD give in 1 Kings 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  20,
  2,
  'What happens in 1 Kings 20?',
  '["Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","He demands Ahab''s silver, gold, wives, and children (1 Kings 20:3)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)"]'::jsonb,
  'He demands Ahab''s silver, gold, wives, and children (1 Kings 20:3)',
  'This scene is tied to 1 Kings 20:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 20
    AND difficulty_stage = 2
    AND prompt = 'What happens in 1 Kings 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  20,
  2,
  'Why does this matter in 1 Kings 20?',
  '["This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","Ahab''s leniency toward a condemned enemy brought a sentence of death upon himself."]'::jsonb,
  'Ahab''s leniency toward a condemned enemy brought a sentence of death upon himself.',
  'This significance statement is attached to verse-linked material from this chapter (1 Kings 20:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 20
    AND difficulty_stage = 2
    AND prompt = 'Why does this matter in 1 Kings 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  20,
  2,
  'Which summary best fits 1 Kings 20?',
  '["Despite his wickedness, God grants Ahab military victories over the Syrians to prove His power.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king."]'::jsonb,
  'Despite his wickedness, God grants Ahab military victories over the Syrians to prove His power.',
  'This summary line comes from source material connected to 1 Kings 20:13.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 20
    AND difficulty_stage = 2
    AND prompt = 'Which summary best fits 1 Kings 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  20,
  3,
  'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 20?',
  '["Zadok the priest","Nathan the prophet","the LORD is a God of the hills","Let Solomon my son reign"]'::jsonb,
  'the LORD is a God of the hills',
  'This phrase most directly reflects the chapter''s focal line (1 Kings 20:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 20
    AND difficulty_stage = 3
    AND prompt = 'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  20,
  3,
  'Which key point best summarizes what 1 Kings 20 emphasizes?',
  '["Ahab spares the enemy king against God''s command.","Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people."]'::jsonb,
  'Ahab spares the enemy king against God''s command.',
  'This key point best captures the emphasis of the chapter summary (1 Kings 20:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 20
    AND difficulty_stage = 3
    AND prompt = 'Which key point best summarizes what 1 Kings 20 emphasizes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  20,
  3,
  'Which line best explains why the events of 1 Kings 20 matter?',
  '["This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","Ahab''s leniency toward a condemned enemy brought a sentence of death upon himself.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty."]'::jsonb,
  'Ahab''s leniency toward a condemned enemy brought a sentence of death upon himself.',
  'This significance line best explains the chapter''s weight (1 Kings 20:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 20
    AND difficulty_stage = 3
    AND prompt = 'Which line best explains why the events of 1 Kings 20 matter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  20,
  3,
  'Which statement best captures the chapter''s main action in 1 Kings 20?',
  '["Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Despite his wickedness, God grants Ahab military victories over the Syrians to prove His power."]'::jsonb,
  'Despite his wickedness, God grants Ahab military victories over the Syrians to prove His power.',
  'This summary best fits the chapter''s core movement (1 Kings 20:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 20
    AND difficulty_stage = 3
    AND prompt = 'Which statement best captures the chapter''s main action in 1 Kings 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  20,
  3,
  'Which statement best matches the leadership pressure in 1 Kings 20?',
  '["Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people.","The prophet exposes the king''s disobedience."]'::jsonb,
  'The prophet exposes the king''s disobedience.',
  'This statement best matches the chapter''s leadership pressure (1 Kings 20:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 20
    AND difficulty_stage = 3
    AND prompt = 'Which statement best matches the leadership pressure in 1 Kings 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  20,
  3,
  'Which summary statement best fits the movement of 1 Kings 20?',
  '["At Gibeon, Solomon asks God for a listening heart rather than riches, long life, or victory over enemies. God grants him unmatched wisdom along with wealth and honor because he asked for discernment to govern well. His first judgment between two women proves that the gift is real and that the people can trust his rule.","Ben-hadad attacks Israel, but God delivers the Syrians into Ahab''s hand twice, showing mercy to a flawed king. Ahab then spares Ben-hadad contrary to God''s word, and a prophet announces judgment for that disobedience. The chapter warns that victory means little when obedience is neglected.","As David grows old, Adonijah tries to seize the throne, but Nathan, Bathsheba, Zadok, and Benaiah move quickly to secure Solomon''s anointing. David publicly confirms Solomon as his chosen successor, and the people celebrate the new king. The chapter closes with Adonijah seeking mercy as Solomon begins his reign with legitimacy and peace.","David gives Solomon final instructions to walk faithfully, guard the kingdom, and deal wisely with unresolved matters in the court. Solomon secures his throne by removing threats from Adonijah, Abiathar, Joab, and Shimei. The chapter shows that the new king''s rule must be rooted in obedience, justice, and discernment."]'::jsonb,
  'Ben-hadad attacks Israel, but God delivers the Syrians into Ahab''s hand twice, showing mercy to a flawed king. Ahab then spares Ben-hadad contrary to God''s word, and a prophet announces judgment for that disobedience. The chapter warns that victory means little when obedience is neglected.',
  'This is the chapter summary for 1 Kings 20.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 20
    AND difficulty_stage = 3
    AND prompt = 'Which summary statement best fits the movement of 1 Kings 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  20,
  3,
  'Which theme best interprets the events of 1 Kings 20?',
  '["Covenant legitimacy","Divine deliverance","Royal succession","David''s final days"]'::jsonb,
  'Divine deliverance',
  'Divine deliverance is the best thematic lens supplied in the notes (1 Kings 20:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 20
    AND difficulty_stage = 3
    AND prompt = 'Which theme best interprets the events of 1 Kings 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  20,
  4,
  'How does 1 Kings 20 function in the wider narrative of 1 Kings?',
  '["It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel.","It drives the conflict between the prophetic word of the LORD and idolatrous power."]'::jsonb,
  'It drives the conflict between the prophetic word of the LORD and idolatrous power.',
  'This option best fits the chapter''s narrative role within 1 Kings (1 Kings 20:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 20
    AND difficulty_stage = 4
    AND prompt = 'How does 1 Kings 20 function in the wider narrative of 1 Kings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  20,
  4,
  'Which claim best fits the chapter''s larger significance in 1 Kings 20?',
  '["As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Despite his wickedness, God grants Ahab military victories over the Syrians to prove His power.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne."]'::jsonb,
  'Despite his wickedness, God grants Ahab military victories over the Syrians to prove His power.',
  'This claim best fits the chapter''s larger significance in context (1 Kings 20:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 20
    AND difficulty_stage = 4
    AND prompt = 'Which claim best fits the chapter''s larger significance in 1 Kings 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  20,
  4,
  'Which conclusion best matches the covenant pressure visible in 1 Kings 20?',
  '["The chapter shows that the LORD alone answers, judges, and vindicates his word.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people."]'::jsonb,
  'The chapter shows that the LORD alone answers, judges, and vindicates his word.',
  'This conclusion best matches the chapter''s covenant pressure (1 Kings 20:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 20
    AND difficulty_stage = 4
    AND prompt = 'Which conclusion best matches the covenant pressure visible in 1 Kings 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  20,
  4,
  'Which reading best connects the chapter''s facts and themes in 1 Kings 20?',
  '["This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","Ahab''s leniency toward a condemned enemy brought a sentence of death upon himself."]'::jsonb,
  'Ahab''s leniency toward a condemned enemy brought a sentence of death upon himself.',
  'This reading best connects the chapter''s verse-linked facts and its meaning (1 Kings 20:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 20
    AND difficulty_stage = 4
    AND prompt = 'Which reading best connects the chapter''s facts and themes in 1 Kings 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  20,
  4,
  'Which statement best explains the chapter''s contribution to the book in 1 Kings 20?',
  '["It advances the temple-centered shape of worship and kingship in Israel.","It drives the conflict between the prophetic word of the LORD and idolatrous power.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign."]'::jsonb,
  'It drives the conflict between the prophetic word of the LORD and idolatrous power.',
  'This statement best explains how the chapter contributes to the book''s flow (1 Kings 20:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 20
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains the chapter''s contribution to the book in 1 Kings 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  20,
  4,
  'Which statement best explains why the chapter is strategically important in 1 Kings 20?',
  '["It advances the temple-centered shape of worship and kingship in Israel.","It drives the conflict between the prophetic word of the LORD and idolatrous power.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign."]'::jsonb,
  'It drives the conflict between the prophetic word of the LORD and idolatrous power.',
  'This option best explains the chapter''s strategic importance in the book (1 Kings 20:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 20
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains why the chapter is strategically important in 1 Kings 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  20,
  4,
  'Which theological reading best fits 1 Kings 20?',
  '["The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the LORD alone answers, judges, and vindicates his word.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force."]'::jsonb,
  'The chapter shows that the LORD alone answers, judges, and vindicates his word.',
  'This theological reading best fits the chapter''s themes and developments (1 Kings 20:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 20
    AND difficulty_stage = 4
    AND prompt = 'Which theological reading best fits 1 Kings 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  20,
  5,
  'Which advanced synthesis best captures the theology of 1 Kings 20?',
  '["The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the LORD alone answers, judges, and vindicates his word."]'::jsonb,
  'The chapter shows that the LORD alone answers, judges, and vindicates his word.',
  'This is the strongest theological synthesis grounded in the chapter''s notes (1 Kings 20:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 20
    AND difficulty_stage = 5
    AND prompt = 'Which advanced synthesis best captures the theology of 1 Kings 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  20,
  5,
  'Which book-level synthesis best explains 1 Kings 20?',
  '["It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel.","It drives the conflict between the prophetic word of the LORD and idolatrous power.","It contrasts self-exalting ambition with the kingly order David affirms."]'::jsonb,
  'It drives the conflict between the prophetic word of the LORD and idolatrous power.',
  'This is the best book-level synthesis of the chapter''s role (1 Kings 20:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 20
    AND difficulty_stage = 5
    AND prompt = 'Which book-level synthesis best explains 1 Kings 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  20,
  5,
  'Which high-level reading best explains why 1 Kings 20 is remembered?',
  '["This feast was a formal attempt to stage a coup against David''s intentions.","Ahab''s leniency toward a condemned enemy brought a sentence of death upon himself.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride."]'::jsonb,
  'Ahab''s leniency toward a condemned enemy brought a sentence of death upon himself.',
  'This high-level reading best explains why the chapter remains significant (1 Kings 20:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 20
    AND difficulty_stage = 5
    AND prompt = 'Which high-level reading best explains why 1 Kings 20 is remembered?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  20,
  5,
  'Which interpretive conclusion best fits the chapter''s place in 1 Kings 20?',
  '["It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel.","It drives the conflict between the prophetic word of the LORD and idolatrous power."]'::jsonb,
  'It drives the conflict between the prophetic word of the LORD and idolatrous power.',
  'This interpretive conclusion best fits the chapter''s place in the book (1 Kings 20:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 20
    AND difficulty_stage = 5
    AND prompt = 'Which interpretive conclusion best fits the chapter''s place in 1 Kings 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  20,
  5,
  'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 20?',
  '["The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the LORD alone answers, judges, and vindicates his word.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force."]'::jsonb,
  'The chapter shows that the LORD alone answers, judges, and vindicates his word.',
  'This statement best captures the chapter''s lasting theological pressure (1 Kings 20:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 20
    AND difficulty_stage = 5
    AND prompt = 'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  20,
  5,
  'Which statement best reflects the long-range force of 1 Kings 20?',
  '["This feast was a formal attempt to stage a coup against David''s intentions.","Ahab''s leniency toward a condemned enemy brought a sentence of death upon himself.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride."]'::jsonb,
  'Ahab''s leniency toward a condemned enemy brought a sentence of death upon himself.',
  'This statement best reflects the chapter''s long-range force within the narrative (1 Kings 20:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 20
    AND difficulty_stage = 5
    AND prompt = 'Which statement best reflects the long-range force of 1 Kings 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  20,
  5,
  'Which synthesis best joins the factual details and themes of 1 Kings 20?',
  '["The chapter shows that the LORD alone answers, judges, and vindicates his word.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people."]'::jsonb,
  'The chapter shows that the LORD alone answers, judges, and vindicates his word.',
  'This synthesis most successfully joins the chapter''s details and themes (1 Kings 20:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 20
    AND difficulty_stage = 5
    AND prompt = 'Which synthesis best joins the factual details and themes of 1 Kings 20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  21,
  1,
  'What development clearly belongs to 1 Kings 21?',
  '["Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Ahab tries to buy Naboth''s vineyard but is refused based on the Law (1 Kings 21:1-3)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)"]'::jsonb,
  'Ahab tries to buy Naboth''s vineyard but is refused based on the Law (1 Kings 21:1-3)',
  'This detail is directly tied to 1 Kings 21:1-3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 21
    AND difficulty_stage = 1
    AND prompt = 'What development clearly belongs to 1 Kings 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  21,
  1,
  'Which event is described in 1 Kings 21?',
  '["Naboth is stoned to death, and Ahab takes possession of the land (1 Kings 21:14-16)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)"]'::jsonb,
  'Naboth is stoned to death, and Ahab takes possession of the land (1 Kings 21:14-16)',
  'This event is part of the chapter''s verse-linked source material (1 Kings 21:14-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 21
    AND difficulty_stage = 1
    AND prompt = 'Which event is described in 1 Kings 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  21,
  1,
  'Who appears in 1 Kings 21?',
  '["Adonijah","Ahab","David","Solomon"]'::jsonb,
  'Ahab',
  'Ahab is listed among the key people for this chapter (1 Kings 21:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 21
    AND difficulty_stage = 1
    AND prompt = 'Who appears in 1 Kings 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  21,
  1,
  'Which verse is highlighted in 1 Kings 21?',
  '["1 Kings 21:3","1 Kings 1:5","1 Kings 1:11","1 Kings 1:29"]'::jsonb,
  '1 Kings 21:3',
  '1 Kings 21:3 is one of the chapter''s supporting verses.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 21
    AND difficulty_stage = 1
    AND prompt = 'Which verse is highlighted in 1 Kings 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  21,
  1,
  'What theme stands out in 1 Kings 21?',
  '["David''s final days","Covenant legitimacy","Covetousness","Royal succession"]'::jsonb,
  'Covetousness',
  'Covetousness is listed among the chapter themes (1 Kings 21:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 21
    AND difficulty_stage = 1
    AND prompt = 'What theme stands out in 1 Kings 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  21,
  1,
  'Which title best fits 1 Kings 21?',
  '["Solomon anointed amid succession crisis","David''s charge and Solomon''s first judgments","Solomon asks for wisdom","Naboth''s vineyard and Ahab''s guilt"]'::jsonb,
  'Naboth''s vineyard and Ahab''s guilt',
  'Naboth''s vineyard and Ahab''s guilt is the chapter title in the commentary notes (1 Kings 21:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 21
    AND difficulty_stage = 1
    AND prompt = 'Which title best fits 1 Kings 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  21,
  1,
  'Which verse-linked detail appears in 1 Kings 21?',
  '["He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Jezebel orchestrates a false accusation of blasphemy against Naboth (1 Kings 21:8-10)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)"]'::jsonb,
  'Jezebel orchestrates a false accusation of blasphemy against Naboth (1 Kings 21:8-10)',
  'This verse-linked detail appears in the source notes for 1 Kings 21:8-10.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 21
    AND difficulty_stage = 1
    AND prompt = 'Which verse-linked detail appears in 1 Kings 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  21,
  2,
  'What happens in 1 Kings 21?',
  '["Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Elijah meets Ahab in the vineyard to pronounce God''s judgment (1 Kings 21:17-19)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)"]'::jsonb,
  'Elijah meets Ahab in the vineyard to pronounce God''s judgment (1 Kings 21:17-19)',
  'This detail belongs to the chapter''s source notes (1 Kings 21:17-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 21
    AND difficulty_stage = 2
    AND prompt = 'What happens in 1 Kings 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  21,
  2,
  'What detail appears in 1 Kings 21?',
  '["God notes this humility to Elijah (1 Kings 21:28-29)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)"]'::jsonb,
  'God notes this humility to Elijah (1 Kings 21:28-29)',
  'The source material for 1 Kings 21:28-29 includes this detail.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 21
    AND difficulty_stage = 2
    AND prompt = 'What detail appears in 1 Kings 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  21,
  2,
  'Which phrase is used in 1 Kings 21?',
  '["Naboth''s vineyard","Let Solomon my son reign","Zadok the priest","Nathan the prophet"]'::jsonb,
  'Naboth''s vineyard',
  'This phrase appears among the chapter''s evidence phrases (1 Kings 21:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 21
    AND difficulty_stage = 2
    AND prompt = 'Which phrase is used in 1 Kings 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  21,
  2,
  'What key point stands out in 1 Kings 21?',
  '["Solomon is anointed king and proclaimed by the people.","Ahab wants Naboth''s vineyard for himself.","Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows."]'::jsonb,
  'Ahab wants Naboth''s vineyard for himself.',
  'This key point is part of the commentary notes for the chapter (1 Kings 21:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 21
    AND difficulty_stage = 2
    AND prompt = 'What key point stands out in 1 Kings 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  21,
  2,
  'What scene appears in 1 Kings 21?',
  '["He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Ahab tears his clothes, puts on sackcloth, and fasts (1 Kings 21:27)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)"]'::jsonb,
  'Ahab tears his clothes, puts on sackcloth, and fasts (1 Kings 21:27)',
  'This scene is tied to 1 Kings 21:27.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 21
    AND difficulty_stage = 2
    AND prompt = 'What scene appears in 1 Kings 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  21,
  2,
  'What does this mean in 1 Kings 21?',
  '["This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","This incident remains the definitive example of Ahab''s abuse of royal power.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty."]'::jsonb,
  'This incident remains the definitive example of Ahab''s abuse of royal power.',
  'This significance statement is attached to verse-linked material from this chapter (1 Kings 21:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 21
    AND difficulty_stage = 2
    AND prompt = 'What does this mean in 1 Kings 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  21,
  2,
  'Which summary best fits 1 Kings 21?',
  '["Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Ahab''s covetousness leads to the judicial murder of an innocent man."]'::jsonb,
  'Ahab''s covetousness leads to the judicial murder of an innocent man.',
  'This summary line comes from source material connected to 1 Kings 21:3.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 21
    AND difficulty_stage = 2
    AND prompt = 'Which summary best fits 1 Kings 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  21,
  3,
  'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 21?',
  '["Nathan the prophet","You have killed and also taken possession","Let Solomon my son reign","Zadok the priest"]'::jsonb,
  'You have killed and also taken possession',
  'This phrase most directly reflects the chapter''s focal line (1 Kings 21:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 21
    AND difficulty_stage = 3
    AND prompt = 'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  21,
  3,
  'Which key point best summarizes what 1 Kings 21 emphasizes?',
  '["Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people.","Jezebel engineers Naboth''s death."]'::jsonb,
  'Jezebel engineers Naboth''s death.',
  'This key point best captures the emphasis of the chapter summary (1 Kings 21:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 21
    AND difficulty_stage = 3
    AND prompt = 'Which key point best summarizes what 1 Kings 21 emphasizes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  21,
  3,
  'Which line best explains why the events of 1 Kings 21 matter?',
  '["This feast was a formal attempt to stage a coup against David''s intentions.","This incident remains the definitive example of Ahab''s abuse of royal power.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride."]'::jsonb,
  'This incident remains the definitive example of Ahab''s abuse of royal power.',
  'This significance line best explains the chapter''s weight (1 Kings 21:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 21
    AND difficulty_stage = 3
    AND prompt = 'Which line best explains why the events of 1 Kings 21 matter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  21,
  3,
  'Which statement best captures the chapter''s main action in 1 Kings 21?',
  '["As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Ahab''s covetousness leads to the judicial murder of an innocent man.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne."]'::jsonb,
  'Ahab''s covetousness leads to the judicial murder of an innocent man.',
  'This summary best fits the chapter''s core movement (1 Kings 21:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 21
    AND difficulty_stage = 3
    AND prompt = 'Which statement best captures the chapter''s main action in 1 Kings 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  21,
  3,
  'Which statement best matches the leadership pressure in 1 Kings 21?',
  '["Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people.","Elijah announces judgment on Ahab''s house.","Adonijah attempts to claim the throne without David''s approval."]'::jsonb,
  'Elijah announces judgment on Ahab''s house.',
  'This statement best matches the chapter''s leadership pressure (1 Kings 21:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 21
    AND difficulty_stage = 3
    AND prompt = 'Which statement best matches the leadership pressure in 1 Kings 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  21,
  3,
  'Which summary statement best fits the movement of 1 Kings 21?',
  '["Ahab covets Naboth''s vineyard, and Jezebel arranges Naboth''s murder so the king can seize it. Elijah confronts Ahab with a sentence of doom on both the king and his house, yet Ahab humbles himself enough to delay immediate disaster. The chapter exposes how greed and abuse of power invite the judgment of God.","As David grows old, Adonijah tries to seize the throne, but Nathan, Bathsheba, Zadok, and Benaiah move quickly to secure Solomon''s anointing. David publicly confirms Solomon as his chosen successor, and the people celebrate the new king. The chapter closes with Adonijah seeking mercy as Solomon begins his reign with legitimacy and peace.","David gives Solomon final instructions to walk faithfully, guard the kingdom, and deal wisely with unresolved matters in the court. Solomon secures his throne by removing threats from Adonijah, Abiathar, Joab, and Shimei. The chapter shows that the new king''s rule must be rooted in obedience, justice, and discernment.","At Gibeon, Solomon asks God for a listening heart rather than riches, long life, or victory over enemies. God grants him unmatched wisdom along with wealth and honor because he asked for discernment to govern well. His first judgment between two women proves that the gift is real and that the people can trust his rule."]'::jsonb,
  'Ahab covets Naboth''s vineyard, and Jezebel arranges Naboth''s murder so the king can seize it. Elijah confronts Ahab with a sentence of doom on both the king and his house, yet Ahab humbles himself enough to delay immediate disaster. The chapter exposes how greed and abuse of power invite the judgment of God.',
  'This is the chapter summary for 1 Kings 21.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 21
    AND difficulty_stage = 3
    AND prompt = 'Which summary statement best fits the movement of 1 Kings 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  21,
  3,
  'Which theme best interprets the events of 1 Kings 21?',
  '["Covetousness","Royal succession","David''s final days","Covenant legitimacy"]'::jsonb,
  'Covetousness',
  'Covetousness is the best thematic lens supplied in the notes (1 Kings 21:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 21
    AND difficulty_stage = 3
    AND prompt = 'Which theme best interprets the events of 1 Kings 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  21,
  4,
  'How does 1 Kings 21 function in the wider narrative of 1 Kings?',
  '["It presents wise rule as foundational to the success of Solomon''s reign.","It turns spoken warnings into visible judgment within the royal story.","It advances the temple-centered shape of worship and kingship in Israel.","It contrasts self-exalting ambition with the kingly order David affirms."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This option best fits the chapter''s narrative role within 1 Kings (1 Kings 21:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 21
    AND difficulty_stage = 4
    AND prompt = 'How does 1 Kings 21 function in the wider narrative of 1 Kings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  21,
  4,
  'Which claim best fits the chapter''s larger significance in 1 Kings 21?',
  '["Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Ahab''s covetousness leads to the judicial murder of an innocent man.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following."]'::jsonb,
  'Ahab''s covetousness leads to the judicial murder of an innocent man.',
  'This claim best fits the chapter''s larger significance in context (1 Kings 21:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 21
    AND difficulty_stage = 4
    AND prompt = 'Which claim best fits the chapter''s larger significance in 1 Kings 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  21,
  4,
  'Which conclusion best matches the covenant pressure visible in 1 Kings 21?',
  '["The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This conclusion best matches the chapter''s covenant pressure (1 Kings 21:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 21
    AND difficulty_stage = 4
    AND prompt = 'Which conclusion best matches the covenant pressure visible in 1 Kings 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  21,
  4,
  'Which reading best connects the chapter''s facts and themes in 1 Kings 21?',
  '["This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","This incident remains the definitive example of Ahab''s abuse of royal power.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty."]'::jsonb,
  'This incident remains the definitive example of Ahab''s abuse of royal power.',
  'This reading best connects the chapter''s verse-linked facts and its meaning (1 Kings 21:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 21
    AND difficulty_stage = 4
    AND prompt = 'Which reading best connects the chapter''s facts and themes in 1 Kings 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  21,
  4,
  'Which statement best explains the chapter''s contribution to the book in 1 Kings 21?',
  '["It advances the temple-centered shape of worship and kingship in Israel.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It turns spoken warnings into visible judgment within the royal story."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This statement best explains how the chapter contributes to the book''s flow (1 Kings 21:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 21
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains the chapter''s contribution to the book in 1 Kings 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  21,
  4,
  'Which statement best explains why the chapter is strategically important in 1 Kings 21?',
  '["It advances the temple-centered shape of worship and kingship in Israel.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It turns spoken warnings into visible judgment within the royal story."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This option best explains the chapter''s strategic importance in the book (1 Kings 21:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 21
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains why the chapter is strategically important in 1 Kings 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  21,
  4,
  'Which theological reading best fits 1 Kings 21?',
  '["The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This theological reading best fits the chapter''s themes and developments (1 Kings 21:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 21
    AND difficulty_stage = 4
    AND prompt = 'Which theological reading best fits 1 Kings 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  21,
  5,
  'Which advanced synthesis best captures the theology of 1 Kings 21?',
  '["The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This is the strongest theological synthesis grounded in the chapter''s notes (1 Kings 21:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 21
    AND difficulty_stage = 5
    AND prompt = 'Which advanced synthesis best captures the theology of 1 Kings 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  21,
  5,
  'Which book-level synthesis best explains 1 Kings 21?',
  '["It turns spoken warnings into visible judgment within the royal story.","It advances the temple-centered shape of worship and kingship in Israel.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This is the best book-level synthesis of the chapter''s role (1 Kings 21:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 21
    AND difficulty_stage = 5
    AND prompt = 'Which book-level synthesis best explains 1 Kings 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  21,
  5,
  'Which high-level reading best explains why 1 Kings 21 is remembered?',
  '["This incident remains the definitive example of Ahab''s abuse of royal power.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions."]'::jsonb,
  'This incident remains the definitive example of Ahab''s abuse of royal power.',
  'This high-level reading best explains why the chapter remains significant (1 Kings 21:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 21
    AND difficulty_stage = 5
    AND prompt = 'Which high-level reading best explains why 1 Kings 21 is remembered?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  21,
  5,
  'Which interpretive conclusion best fits the chapter''s place in 1 Kings 21?',
  '["It presents wise rule as foundational to the success of Solomon''s reign.","It turns spoken warnings into visible judgment within the royal story.","It advances the temple-centered shape of worship and kingship in Israel.","It contrasts self-exalting ambition with the kingly order David affirms."]'::jsonb,
  'It advances the temple-centered shape of worship and kingship in Israel.',
  'This interpretive conclusion best fits the chapter''s place in the book (1 Kings 21:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 21
    AND difficulty_stage = 5
    AND prompt = 'Which interpretive conclusion best fits the chapter''s place in 1 Kings 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  21,
  5,
  'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 21?',
  '["The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This statement best captures the chapter''s lasting theological pressure (1 Kings 21:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 21
    AND difficulty_stage = 5
    AND prompt = 'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  21,
  5,
  'Which statement best reflects the long-range force of 1 Kings 21?',
  '["This incident remains the definitive example of Ahab''s abuse of royal power.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions."]'::jsonb,
  'This incident remains the definitive example of Ahab''s abuse of royal power.',
  'This statement best reflects the chapter''s long-range force within the narrative (1 Kings 21:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 21
    AND difficulty_stage = 5
    AND prompt = 'Which statement best reflects the long-range force of 1 Kings 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  21,
  5,
  'Which synthesis best joins the factual details and themes of 1 Kings 21?',
  '["The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people."]'::jsonb,
  'The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.',
  'This synthesis most successfully joins the chapter''s details and themes (1 Kings 21:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 21
    AND difficulty_stage = 5
    AND prompt = 'Which synthesis best joins the factual details and themes of 1 Kings 21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  22,
  1,
  'What development clearly belongs to 1 Kings 22?',
  '["He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Ahab allies with Jehoshaphat of Judah (1 Kings 22:4)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)"]'::jsonb,
  'Ahab allies with Jehoshaphat of Judah (1 Kings 22:4)',
  'This detail is directly tied to 1 Kings 22:4.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 22
    AND difficulty_stage = 1
    AND prompt = 'What development clearly belongs to 1 Kings 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  22,
  1,
  'Which event is described in 1 Kings 22?',
  '["Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","Ahab disguises himself in battle to avoid being targeted (1 Kings 22:30)"]'::jsonb,
  'Ahab disguises himself in battle to avoid being targeted (1 Kings 22:30)',
  'This event is part of the chapter''s verse-linked source material (1 Kings 22:30).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 22
    AND difficulty_stage = 1
    AND prompt = 'Which event is described in 1 Kings 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  22,
  1,
  'Who appears in 1 Kings 22?',
  '["Ahab","David","Solomon","Adonijah"]'::jsonb,
  'Ahab',
  'Ahab is listed among the key people for this chapter (1 Kings 22:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 22
    AND difficulty_stage = 1
    AND prompt = 'Who appears in 1 Kings 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  22,
  1,
  'Which verse is highlighted in 1 Kings 22?',
  '["1 Kings 1:5","1 Kings 1:11","1 Kings 1:29","1 Kings 22:5"]'::jsonb,
  '1 Kings 22:5',
  '1 Kings 22:5 is one of the chapter''s supporting verses.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 22
    AND difficulty_stage = 1
    AND prompt = 'Which verse is highlighted in 1 Kings 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  22,
  1,
  'What theme stands out in 1 Kings 22?',
  '["Covenant legitimacy","True prophecy","Royal succession","David''s final days"]'::jsonb,
  'True prophecy',
  'True prophecy is listed among the chapter themes (1 Kings 22:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 22
    AND difficulty_stage = 1
    AND prompt = 'What theme stands out in 1 Kings 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  22,
  1,
  'Which title best fits 1 Kings 22?',
  '["David''s charge and Solomon''s first judgments","Solomon asks for wisdom","Micaiah''s warning and Ahab''s death","Solomon anointed amid succession crisis"]'::jsonb,
  'Micaiah''s warning and Ahab''s death',
  'Micaiah''s warning and Ahab''s death is the chapter title in the commentary notes (1 Kings 22:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 22
    AND difficulty_stage = 1
    AND prompt = 'Which title best fits 1 Kings 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  22,
  1,
  'Which verse-linked detail appears in 1 Kings 22?',
  '["Micaiah warns that he saw Israel scattered like sheep without a shepherd (1 Kings 22:17)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)"]'::jsonb,
  'Micaiah warns that he saw Israel scattered like sheep without a shepherd (1 Kings 22:17)',
  'This verse-linked detail appears in the source notes for 1 Kings 22:17.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 22
    AND difficulty_stage = 1
    AND prompt = 'Which verse-linked detail appears in 1 Kings 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  22,
  2,
  'What happens in 1 Kings 22?',
  '["He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","A ''random'' arrow strikes Ahab between the joints of his armor (1 Kings 22:34)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)"]'::jsonb,
  'A ''random'' arrow strikes Ahab between the joints of his armor (1 Kings 22:34)',
  'This detail belongs to the chapter''s source notes (1 Kings 22:34).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 22
    AND difficulty_stage = 2
    AND prompt = 'What happens in 1 Kings 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  22,
  2,
  'What detail appears in 1 Kings 22?',
  '["Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)","The chariot is washed at the pool of Samaria (1 Kings 22:38)"]'::jsonb,
  'The chariot is washed at the pool of Samaria (1 Kings 22:38)',
  'The source material for 1 Kings 22:38 includes this detail.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 22
    AND difficulty_stage = 2
    AND prompt = 'What detail appears in 1 Kings 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  22,
  2,
  'Which phrase is used in 1 Kings 22?',
  '["Let Solomon my son reign","Zadok the priest","Nathan the prophet","I saw all Israel scattered"]'::jsonb,
  'I saw all Israel scattered',
  'This phrase appears among the chapter''s evidence phrases (1 Kings 22:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 22
    AND difficulty_stage = 2
    AND prompt = 'Which phrase is used in 1 Kings 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  22,
  2,
  'What key point stands out in 1 Kings 22?',
  '["Micaiah warns that defeat is certain.","Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people."]'::jsonb,
  'Micaiah warns that defeat is certain.',
  'This key point is part of the commentary notes for the chapter (1 Kings 22:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 22
    AND difficulty_stage = 2
    AND prompt = 'What key point stands out in 1 Kings 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  22,
  2,
  'What scene appears in 1 Kings 22?',
  '["Ahab bleeds out in his chariot as the battle rages (1 Kings 22:35)","Adonijah confers with Joab and Abiathar the priest (1 Kings 1:7)","Abiathar gives his help and support to the rebellion (1 Kings 1:7)","He attends the feast where Adonijah is proclaimed king (1 Kings 1:25)"]'::jsonb,
  'Ahab bleeds out in his chariot as the battle rages (1 Kings 22:35)',
  'This scene is tied to 1 Kings 22:35.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 22
    AND difficulty_stage = 2
    AND prompt = 'What scene appears in 1 Kings 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  22,
  2,
  'What results from this in 1 Kings 22?',
  '["This feast was a formal attempt to stage a coup against David''s intentions.","His death illustrates the impossibility of hiding from divine judgment.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride."]'::jsonb,
  'His death illustrates the impossibility of hiding from divine judgment.',
  'This significance statement is attached to verse-linked material from this chapter (1 Kings 22:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 22
    AND difficulty_stage = 2
    AND prompt = 'What results from this in 1 Kings 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  22,
  2,
  'Which summary best fits 1 Kings 22?',
  '["As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Ahab ignores the warning of the prophet Micaiah and goes to war at Ramoth-gilead.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne."]'::jsonb,
  'Ahab ignores the warning of the prophet Micaiah and goes to war at Ramoth-gilead.',
  'This summary line comes from source material connected to 1 Kings 22:5.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 22
    AND difficulty_stage = 2
    AND prompt = 'Which summary best fits 1 Kings 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  22,
  3,
  'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 22?',
  '["the LORD has spoken evil","Let Solomon my son reign","Zadok the priest","Nathan the prophet"]'::jsonb,
  'the LORD has spoken evil',
  'This phrase most directly reflects the chapter''s focal line (1 Kings 22:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 22
    AND difficulty_stage = 3
    AND prompt = 'Which evidence phrase best reflects the chapter''s focal line in 1 Kings 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  22,
  3,
  'Which key point best summarizes what 1 Kings 22 emphasizes?',
  '["Nathan and Bathsheba appeal to David to act before the crisis grows.","Solomon is anointed king and proclaimed by the people.","Ahab ignores the prophecy and goes to battle.","Adonijah attempts to claim the throne without David''s approval."]'::jsonb,
  'Ahab ignores the prophecy and goes to battle.',
  'This key point best captures the emphasis of the chapter summary (1 Kings 22:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 22
    AND difficulty_stage = 3
    AND prompt = 'Which key point best summarizes what 1 Kings 22 emphasizes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  22,
  3,
  'Which line best explains why the events of 1 Kings 22 matter?',
  '["His death illustrates the impossibility of hiding from divine judgment.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions."]'::jsonb,
  'His death illustrates the impossibility of hiding from divine judgment.',
  'This significance line best explains the chapter''s weight (1 Kings 22:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 22
    AND difficulty_stage = 3
    AND prompt = 'Which line best explains why the events of 1 Kings 22 matter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  22,
  3,
  'Which statement best captures the chapter''s main action in 1 Kings 22?',
  '["Adonijah organizes a massive banquet at En-rogel to proclaim himself king.","Ahab ignores the warning of the prophet Micaiah and goes to war at Ramoth-gilead.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following."]'::jsonb,
  'Ahab ignores the warning of the prophet Micaiah and goes to war at Ramoth-gilead.',
  'This summary best fits the chapter''s core movement (1 Kings 22:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 22
    AND difficulty_stage = 3
    AND prompt = 'Which statement best captures the chapter''s main action in 1 Kings 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  22,
  3,
  'Which statement best matches the leadership pressure in 1 Kings 22?',
  '["Solomon is anointed king and proclaimed by the people.","An arrow strikes Ahab despite his disguise.","Adonijah attempts to claim the throne without David''s approval.","Nathan and Bathsheba appeal to David to act before the crisis grows."]'::jsonb,
  'An arrow strikes Ahab despite his disguise.',
  'This statement best matches the chapter''s leadership pressure (1 Kings 22:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 22
    AND difficulty_stage = 3
    AND prompt = 'Which statement best matches the leadership pressure in 1 Kings 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  22,
  3,
  'Which summary statement best fits the movement of 1 Kings 22?',
  '["As David grows old, Adonijah tries to seize the throne, but Nathan, Bathsheba, Zadok, and Benaiah move quickly to secure Solomon''s anointing. David publicly confirms Solomon as his chosen successor, and the people celebrate the new king. The chapter closes with Adonijah seeking mercy as Solomon begins his reign with legitimacy and peace.","David gives Solomon final instructions to walk faithfully, guard the kingdom, and deal wisely with unresolved matters in the court. Solomon secures his throne by removing threats from Adonijah, Abiathar, Joab, and Shimei. The chapter shows that the new king''s rule must be rooted in obedience, justice, and discernment.","At Gibeon, Solomon asks God for a listening heart rather than riches, long life, or victory over enemies. God grants him unmatched wisdom along with wealth and honor because he asked for discernment to govern well. His first judgment between two women proves that the gift is real and that the people can trust his rule.","Jehoshaphat joins Ahab in battle, but Micaiah alone speaks the truth that the campaign will fail. Ahab disguises himself, yet a random arrow fulfills God''s word and the king dies in the fight. The closing summary leaves Israel and Judah still entangled in compromise, but God''s word has not failed."]'::jsonb,
  'Jehoshaphat joins Ahab in battle, but Micaiah alone speaks the truth that the campaign will fail. Ahab disguises himself, yet a random arrow fulfills God''s word and the king dies in the fight. The closing summary leaves Israel and Judah still entangled in compromise, but God''s word has not failed.',
  'This is the chapter summary for 1 Kings 22.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 22
    AND difficulty_stage = 3
    AND prompt = 'Which summary statement best fits the movement of 1 Kings 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  22,
  3,
  'Which theme best interprets the events of 1 Kings 22?',
  '["Royal succession","David''s final days","Covenant legitimacy","True prophecy"]'::jsonb,
  'True prophecy',
  'True prophecy is the best thematic lens supplied in the notes (1 Kings 22:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 22
    AND difficulty_stage = 3
    AND prompt = 'Which theme best interprets the events of 1 Kings 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  22,
  4,
  'How does 1 Kings 22 function in the wider narrative of 1 Kings?',
  '["It advances the temple-centered shape of worship and kingship in Israel.","It turns spoken warnings into visible judgment within the royal story.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign."]'::jsonb,
  'It turns spoken warnings into visible judgment within the royal story.',
  'This option best fits the chapter''s narrative role within 1 Kings (1 Kings 22:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 22
    AND difficulty_stage = 4
    AND prompt = 'How does 1 Kings 22 function in the wider narrative of 1 Kings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  22,
  4,
  'Which claim best fits the chapter''s larger significance in 1 Kings 22?',
  '["Ahab ignores the warning of the prophet Micaiah and goes to war at Ramoth-gilead.","Abiathar makes a fatal political error by supporting Adonijah''s claim to the throne.","As David ages, Adonijah begins to act like a king and builds a personal following.","Adonijah organizes a massive banquet at En-rogel to proclaim himself king."]'::jsonb,
  'Ahab ignores the warning of the prophet Micaiah and goes to war at Ramoth-gilead.',
  'This claim best fits the chapter''s larger significance in context (1 Kings 22:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 22
    AND difficulty_stage = 4
    AND prompt = 'Which claim best fits the chapter''s larger significance in 1 Kings 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  22,
  4,
  'Which conclusion best matches the covenant pressure visible in 1 Kings 22?',
  '["The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force."]'::jsonb,
  'The chapter teaches that divine judgment is patient, but it does not fail to arrive.',
  'This conclusion best matches the chapter''s covenant pressure (1 Kings 22:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 22
    AND difficulty_stage = 4
    AND prompt = 'Which conclusion best matches the covenant pressure visible in 1 Kings 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  22,
  4,
  'Which reading best connects the chapter''s facts and themes in 1 Kings 22?',
  '["This feast was a formal attempt to stage a coup against David''s intentions.","His death illustrates the impossibility of hiding from divine judgment.","This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride."]'::jsonb,
  'His death illustrates the impossibility of hiding from divine judgment.',
  'This reading best connects the chapter''s verse-linked facts and its meaning (1 Kings 22:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 22
    AND difficulty_stage = 4
    AND prompt = 'Which reading best connects the chapter''s facts and themes in 1 Kings 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  22,
  4,
  'Which statement best explains the chapter''s contribution to the book in 1 Kings 22?',
  '["It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel.","It turns spoken warnings into visible judgment within the royal story."]'::jsonb,
  'It turns spoken warnings into visible judgment within the royal story.',
  'This statement best explains how the chapter contributes to the book''s flow (1 Kings 22:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 22
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains the chapter''s contribution to the book in 1 Kings 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  22,
  4,
  'Which statement best explains why the chapter is strategically important in 1 Kings 22?',
  '["It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel.","It turns spoken warnings into visible judgment within the royal story."]'::jsonb,
  'It turns spoken warnings into visible judgment within the royal story.',
  'This option best explains the chapter''s strategic importance in the book (1 Kings 22:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 22
    AND difficulty_stage = 4
    AND prompt = 'Which statement best explains why the chapter is strategically important in 1 Kings 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  22,
  4,
  'Which theological reading best fits 1 Kings 22?',
  '["The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people."]'::jsonb,
  'The chapter teaches that divine judgment is patient, but it does not fail to arrive.',
  'This theological reading best fits the chapter''s themes and developments (1 Kings 22:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 22
    AND difficulty_stage = 4
    AND prompt = 'Which theological reading best fits 1 Kings 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  22,
  5,
  'Which advanced synthesis best captures the theology of 1 Kings 22?',
  '["The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage."]'::jsonb,
  'The chapter teaches that divine judgment is patient, but it does not fail to arrive.',
  'This is the strongest theological synthesis grounded in the chapter''s notes (1 Kings 22:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 22
    AND difficulty_stage = 5
    AND prompt = 'Which advanced synthesis best captures the theology of 1 Kings 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  22,
  5,
  'Which book-level synthesis best explains 1 Kings 22?',
  '["It turns spoken warnings into visible judgment within the royal story.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign.","It advances the temple-centered shape of worship and kingship in Israel."]'::jsonb,
  'It turns spoken warnings into visible judgment within the royal story.',
  'This is the best book-level synthesis of the chapter''s role (1 Kings 22:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 22
    AND difficulty_stage = 5
    AND prompt = 'Which book-level synthesis best explains 1 Kings 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  22,
  5,
  'Which high-level reading best explains why 1 Kings 22 is remembered?',
  '["This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","His death illustrates the impossibility of hiding from divine judgment."]'::jsonb,
  'His death illustrates the impossibility of hiding from divine judgment.',
  'This high-level reading best explains why the chapter remains significant (1 Kings 22:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 22
    AND difficulty_stage = 5
    AND prompt = 'Which high-level reading best explains why 1 Kings 22 is remembered?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  22,
  5,
  'Which interpretive conclusion best fits the chapter''s place in 1 Kings 22?',
  '["It advances the temple-centered shape of worship and kingship in Israel.","It turns spoken warnings into visible judgment within the royal story.","It contrasts self-exalting ambition with the kingly order David affirms.","It presents wise rule as foundational to the success of Solomon''s reign."]'::jsonb,
  'It turns spoken warnings into visible judgment within the royal story.',
  'This interpretive conclusion best fits the chapter''s place in the book (1 Kings 22:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 22
    AND difficulty_stage = 5
    AND prompt = 'Which interpretive conclusion best fits the chapter''s place in 1 Kings 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  22,
  5,
  'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 22?',
  '["The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force.","The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people."]'::jsonb,
  'The chapter teaches that divine judgment is patient, but it does not fail to arrive.',
  'This statement best captures the chapter''s lasting theological pressure (1 Kings 22:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 22
    AND difficulty_stage = 5
    AND prompt = 'Which statement best captures the chapter''s lasting theological pressure in 1 Kings 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  22,
  5,
  'Which statement best reflects the long-range force of 1 Kings 22?',
  '["This betrayal of David''s chosen successor, Solomon, undoes decades of loyalty.","This shows the lack of parental restraint that contributed to his pride.","This feast was a formal attempt to stage a coup against David''s intentions.","His death illustrates the impossibility of hiding from divine judgment."]'::jsonb,
  'His death illustrates the impossibility of hiding from divine judgment.',
  'This statement best reflects the chapter''s long-range force within the narrative (1 Kings 22:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 22
    AND difficulty_stage = 5
    AND prompt = 'Which statement best reflects the long-range force of 1 Kings 22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  11,
  22,
  5,
  'Which synthesis best joins the factual details and themes of 1 Kings 22?',
  '["The chapter teaches that discernment is a gift to be sought above status and advantage.","The chapter ties holy space to reverence, obedience, and God''s dwelling among his people.","The chapter teaches that divine judgment is patient, but it does not fail to arrive.","The chapter shows that the throne''s stability depends on God''s chosen order, not mere force."]'::jsonb,
  'The chapter teaches that divine judgment is patient, but it does not fail to arrive.',
  'This synthesis most successfully joins the chapter''s details and themes (1 Kings 22:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 11
    AND chapter = 22
    AND difficulty_stage = 5
    AND prompt = 'Which synthesis best joins the factual details and themes of 1 Kings 22?'
);

