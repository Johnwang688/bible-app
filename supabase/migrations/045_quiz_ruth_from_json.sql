-- Auto-generated from quiz-questions/ruth.json
-- Book: Ruth (book_number 8)

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  1,
  1,
  'In Ruth 1, where did Elimelech move with his family during the famine?',
  '["Moab", "Bethlehem", "Jericho", "Hebron"]'::jsonb,
  'Moab',
  'Elimelech went from Bethlehem in Judah to live in the country of Moab because of the famine (Ruth 1:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'In Ruth 1, where did Elimelech move with his family during the famine?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  1,
  1,
  'What nationality were Ruth and Orpah?',
  '["Moabite", "Israelite", "Ammonite", "Philistine"]'::jsonb,
  'Moabite',
  'Ruth and Orpah are identified as women of Moab (Ruth 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'What nationality were Ruth and Orpah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  1,
  1,
  'What new name did Naomi ask the women of Bethlehem to call her?',
  '["Mara", "Hannah", "Tirzah", "Deborah"]'::jsonb,
  'Mara',
  'Naomi said, ''Don''t call me Naomi. Call me Mara,'' because the Almighty had dealt bitterly with her (Ruth 1:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'What new name did Naomi ask the women of Bethlehem to call her?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  1,
  1,
  'What was the name of Elimelech''s wife?',
  '["Naomi", "Ruth", "Orpah", "Mara"]'::jsonb,
  'Naomi',
  'Elimelech''s wife is named Naomi at the start of the book (Ruth 1:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'What was the name of Elimelech''s wife?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  1,
  1,
  'What were the names of Naomi''s two sons?',
  '["Mahlon and Chilion", "Boaz and Obed", "Perez and Zerah", "Joash and Jachin"]'::jsonb,
  'Mahlon and Chilion',
  'Naomi''s sons were Mahlon and Chilion (Ruth 1:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'What were the names of Naomi''s two sons?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  1,
  1,
  'Which daughter-in-law stayed with Naomi on the road to Judah?',
  '["Ruth", "Orpah", "Naamah", "Tamar"]'::jsonb,
  'Ruth',
  'Orpah returned, but Ruth clung to Naomi (Ruth 1:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'Which daughter-in-law stayed with Naomi on the road to Judah?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  1,
  1,
  'Who decided to return from Moab to Judah after hearing the LORD had visited His people?',
  '["Naomi", "Ruth", "Orpah", "Boaz"]'::jsonb,
  'Naomi',
  'Naomi arose to return because she heard the LORD had given bread to His people (Ruth 1:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 1
    AND difficulty_stage = 1
    AND prompt = 'Who decided to return from Moab to Judah after hearing the LORD had visited His people?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  1,
  2,
  'At the start of what harvest did Naomi and Ruth arrive in Bethlehem?',
  '["Barley harvest", "Wheat harvest", "Grape harvest", "Olive harvest"]'::jsonb,
  'Barley harvest',
  'Their return to Bethlehem came at the beginning of barley harvest (Ruth 1:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'At the start of what harvest did Naomi and Ruth arrive in Bethlehem?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  1,
  2,
  'How did Naomi describe the way she left and returned?',
  '["She went out full and came back empty", "She left poor and came back rich", "She went out sick and came back healed", "She left fearful and came back honored"]'::jsonb,
  'She went out full and came back empty',
  'Naomi said she went out full, and the LORD brought her home again empty (Ruth 1:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'How did Naomi describe the way she left and returned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  1,
  2,
  'What did Ruth say about Naomi''s God?',
  '["He would be her God", "He had judged Moab", "He lived only in Judah", "He had abandoned Bethlehem"]'::jsonb,
  'He would be her God',
  'Ruth declared, ''Your God my God'' (Ruth 1:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'What did Ruth say about Naomi''s God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  1,
  2,
  'What did Ruth say about Naomi''s people?',
  '["They would be her people", "They had forgotten God", "They should stay in Moab", "They were stronger than Moab"]'::jsonb,
  'They would be her people',
  'Ruth told Naomi, ''Your people shall be my people'' (Ruth 1:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'What did Ruth say about Naomi''s people?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  1,
  2,
  'What did Ruth say she would do wherever Naomi lodged?',
  '["Lodge there too", "Build a new house", "Return to Moab", "Wait in the fields"]'::jsonb,
  'Lodge there too',
  'Ruth said, ''Where you lodge, I will lodge'' (Ruth 1:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'What did Ruth say she would do wherever Naomi lodged?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  1,
  2,
  'What was the town''s reaction when Naomi arrived in Bethlehem?',
  '["The whole city was stirred", "No one recognized her", "The elders shut the gate", "They held a feast for Boaz"]'::jsonb,
  'The whole city was stirred',
  'When Naomi came back, all the city was moved about them (Ruth 1:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'What was the town''s reaction when Naomi arrived in Bethlehem?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  1,
  2,
  'Why did Naomi first urge her daughters-in-law to return to their mothers'' houses?',
  '["She believed she could not provide them husbands", "She was angry with them", "She wanted to stay in Moab", "She feared Bethlehem"]'::jsonb,
  'She believed she could not provide them husbands',
  'Naomi argued that she had no more sons to offer them and could not provide future husbands (Ruth 1:11-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 1
    AND difficulty_stage = 2
    AND prompt = 'Why did Naomi first urge her daughters-in-law to return to their mothers'' houses?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  1,
  3,
  'What contrast drives Naomi''s speech about being full and empty?',
  '["Her former household security versus her present loss", "Her youth versus old age alone", "Moabite customs versus Israelite law", "Private grief versus public power"]'::jsonb,
  'Her former household security versus her present loss',
  'Naomi contrasts leaving with family and returning bereaved (Ruth 1:20-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'What contrast drives Naomi''s speech about being full and empty?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  1,
  3,
  'What does Ruth''s refusal to leave Naomi show about her commitment?',
  '["She bound herself to Naomi''s future and covenant life", "She wanted control over Bethlehem", "She hoped to rule Moab", "She was looking for quick wealth"]'::jsonb,
  'She bound herself to Naomi''s future and covenant life',
  'Ruth''s pledge joins her life, people, land, and God to Naomi''s path (Ruth 1:16-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'What does Ruth''s refusal to leave Naomi show about her commitment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  1,
  3,
  'What does Ruth''s vow suggest about the source of her new identity?',
  '["It is tied to Naomi''s people and Naomi''s God", "It depends on marrying a wealthy man", "It comes from Moab''s protection", "It rests on Bethlehem''s elders"]'::jsonb,
  'It is tied to Naomi''s people and Naomi''s God',
  'Ruth frames her future in relation to Naomi''s people and the LORD (Ruth 1:16-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'What does Ruth''s vow suggest about the source of her new identity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  1,
  3,
  'What is emphasized when Ruth says, ''Where you die, I will die''?',
  '["A lifelong loyalty that lasts to death", "A wish to return to Moab later", "A plan to leave Bethlehem soon", "A promise to stay only through harvest"]'::jsonb,
  'A lifelong loyalty that lasts to death',
  'Ruth''s vow extends beyond convenience to death and burial (Ruth 1:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'What is emphasized when Ruth says, ''Where you die, I will die''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  1,
  3,
  'What larger turning point is suggested by the note that they arrived at barley harvest?',
  '["Need and loss are meeting the moment of God''s provision", "Moab is preparing for war", "Naomi is about to return home again", "The judges are gathering in Bethlehem"]'::jsonb,
  'Need and loss are meeting the moment of God''s provision',
  'The timing sets the stage for food, fieldwork, and eventual redemption (Ruth 1:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'What larger turning point is suggested by the note that they arrived at barley harvest?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  1,
  3,
  'Why does Orpah''s departure sharpen Ruth''s decision?',
  '["It shows Ruth stayed when a natural exit was still open", "It proves Orpah hated Naomi", "It means Ruth feared the road home", "It reveals Bethlehem had sent for Ruth"]'::jsonb,
  'It shows Ruth stayed when a natural exit was still open',
  'Orpah returned to her people, but Ruth deliberately chose the harder path with Naomi (Ruth 1:14-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'Why does Orpah''s departure sharpen Ruth''s decision?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  1,
  3,
  'Why is Naomi''s request to be called Mara significant in Ruth 1?',
  '["It highlights her sense of bitterness under God''s providence", "It announces a royal title", "It marks her vow to leave Israel", "It means she has forgotten Bethlehem"]'::jsonb,
  'It highlights her sense of bitterness under God''s providence',
  'Naomi links the name Mara with the Almighty dealing bitterly with her (Ruth 1:20-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 1
    AND difficulty_stage = 3
    AND prompt = 'Why is Naomi''s request to be called Mara significant in Ruth 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  1,
  4,
  'How do Ruth and Naomi together embody the chapter''s movement?',
  '["They move from bereavement in Moab toward hopeful return in Judah", "They move from power in Judah to exile in Egypt", "They move from harvest to famine inside Bethlehem", "They move from kingship to priesthood"]'::jsonb,
  'They move from bereavement in Moab toward hopeful return in Judah',
  'The chapter traces loss in Moab and a return to Bethlehem timed with harvest (Ruth 1:1-22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'How do Ruth and Naomi together embody the chapter''s movement?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  1,
  4,
  'How does Ruth 1 turn a family tragedy into the beginning of a redemption story?',
  '["It moves Naomi and Ruth back to Bethlehem at harvest time", "It ends with Ruth returning to Moab alone", "It places Boaz in Moab as a refugee", "It closes with Israel crowning a judge"]'::jsonb,
  'It moves Naomi and Ruth back to Bethlehem at harvest time',
  'The chapter ends with return to Bethlehem at the beginning of barley harvest, opening the way for provision (Ruth 1:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'How does Ruth 1 turn a family tragedy into the beginning of a redemption story?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  1,
  4,
  'How does Ruth''s pledge prepare for the book''s theme of redemption?',
  '["It shows faithful love before legal redemption appears", "It replaces the need for a redeemer", "It cancels Naomi''s inheritance rights", "It transfers the story to Moab permanently"]'::jsonb,
  'It shows faithful love before legal redemption appears',
  'Ruth''s steadfast love to Naomi comes before Boaz''s formal redeeming role enters the story (Ruth 1:16-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'How does Ruth''s pledge prepare for the book''s theme of redemption?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  1,
  4,
  'What does Naomi''s speech reveal about how the book treats God''s providence?',
  '["Human suffering is described honestly while God''s rule is still assumed", "God is absent from the story entirely", "Only chance controls the story", "The book rejects God''s involvement in loss"]'::jsonb,
  'Human suffering is described honestly while God''s rule is still assumed',
  'Naomi speaks openly of affliction yet still refers to the Almighty''s hand and the LORD''s action (Ruth 1:13, 20-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'What does Naomi''s speech reveal about how the book treats God''s providence?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  1,
  4,
  'What does Ruth 1 suggest about covenant belonging before any formal legal act occurs?',
  '["Belonging is already expressed through pledged loyalty and shared faith", "Belonging depends only on wealth and land", "Belonging cannot extend to outsiders at all", "Belonging comes only through military victory"]'::jsonb,
  'Belonging is already expressed through pledged loyalty and shared faith',
  'Ruth''s vow joins her to Naomi''s people and God before any legal redemption scene occurs (Ruth 1:16-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'What does Ruth 1 suggest about covenant belonging before any formal legal act occurs?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  1,
  4,
  'What role does Naomi''s emptiness play in the narrative structure of Ruth?',
  '["It creates the central need the rest of the book answers", "It proves the covenant has failed", "It removes Ruth from the story", "It explains why Bethlehem rejects them"]'::jsonb,
  'It creates the central need the rest of the book answers',
  'Naomi''s emptiness frames the problem of the book, which later moves toward fullness and restoration (Ruth 1:20-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'What role does Naomi''s emptiness play in the narrative structure of Ruth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  1,
  4,
  'Why is Bethlehem a meaningful destination in the first chapter?',
  '["It is the place where lost household life may be restored", "It is where Ruth expects to meet the king immediately", "It is the safest city from famine forever", "It is where Moabite widows were required to live"]'::jsonb,
  'It is the place where lost household life may be restored',
  'Naomi returns to her own people and land, where provision and family restoration can begin (Ruth 1:6, 19, 22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 1
    AND difficulty_stage = 4
    AND prompt = 'Why is Bethlehem a meaningful destination in the first chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  1,
  5,
  'How does Naomi''s bitterness speech contribute to the book''s later resolution?',
  '["It establishes emptiness that the ending will answer with fullness", "It removes all hope from the story permanently", "It shifts the focus away from family inheritance", "It proves Bethlehem cannot receive foreigners"]'::jsonb,
  'It establishes emptiness that the ending will answer with fullness',
  'Naomi describes herself as empty in chapter 1, while the close of the book celebrates restoration through Obed (Ruth 1:21; 4:14-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'How does Naomi''s bitterness speech contribute to the book''s later resolution?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  1,
  5,
  'How does Ruth''s vow in chapter 1 anticipate the book''s theology of hesed?',
  '["It presents steadfast covenant-like loyalty before the term is praised later", "It denies any duty to family obligations", "It shows a temporary emotional reaction only", "It proves Naomi has already been redeemed"]'::jsonb,
  'It presents steadfast covenant-like loyalty before the term is praised later',
  'Ruth''s self-binding loyalty in 1:16-17 embodies the faithful love later recognized in the book (Ruth 1:16-17; 3:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'How does Ruth''s vow in chapter 1 anticipate the book''s theology of hesed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  1,
  5,
  'How does chapter 1 balance divine sovereignty and human pain?',
  '["It lets Naomi name her grief while still speaking of the LORD''s hand", "It explains suffering as meaningless chance alone", "It says human choices have no importance", "It hides all references to God from the dialogue"]'::jsonb,
  'It lets Naomi name her grief while still speaking of the LORD''s hand',
  'Naomi describes bitter affliction yet does so in explicitly theological language (Ruth 1:13, 20-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'How does chapter 1 balance divine sovereignty and human pain?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  1,
  5,
  'What is the significance of burial language in Ruth''s oath?',
  '["It binds Ruth''s future permanently to Naomi''s people and land", "It predicts immediate death in Bethlehem", "It announces a priestly office for Ruth", "It signals that Ruth will return to Moab after Naomi dies"]'::jsonb,
  'It binds Ruth''s future permanently to Naomi''s people and land',
  'Ruth says where Naomi dies and is buried, there she will die and be buried also (Ruth 1:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'What is the significance of burial language in Ruth''s oath?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  1,
  5,
  'What narrative function does Orpah serve in chapter 1?',
  '["She provides the alternative Ruth declines, making Ruth''s loyalty clearer", "She acts as the legal redeemer for Naomi", "She becomes Boaz''s wife in Bethlehem", "She restores Elimelech''s land"]'::jsonb,
  'She provides the alternative Ruth declines, making Ruth''s loyalty clearer',
  'Orpah''s return to Moab highlights that Ruth''s commitment was chosen, not forced (Ruth 1:14-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'What narrative function does Orpah serve in chapter 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  1,
  5,
  'Why is Ruth''s adoption of Naomi''s God theologically weighty in the opening chapter?',
  '["It ties her migration to faith, not merely family attachment", "It shows she intended to found a new religion", "It means Naomi stopped worshiping the LORD", "It replaces Israel''s covenant with Moab''s gods"]'::jsonb,
  'It ties her migration to faith, not merely family attachment',
  'Ruth''s confession includes both people and God, showing more than social loyalty (Ruth 1:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'Why is Ruth''s adoption of Naomi''s God theologically weighty in the opening chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  1,
  5,
  'Why is the phrase ''the LORD had visited his people in giving them bread'' important for reading chapter 1?',
  '["It frames the return to Bethlehem as providential rather than accidental", "It means Moab had defeated Judah", "It explains why Ruth inherited Elimelech''s field immediately", "It shows Naomi no longer believed in the LORD"]'::jsonb,
  'It frames the return to Bethlehem as providential rather than accidental',
  'Naomi''s decision to return is triggered by news that the LORD had given bread to His people (Ruth 1:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 1
    AND difficulty_stage = 5
    AND prompt = 'Why is the phrase ''the LORD had visited his people in giving them bread'' important for reading chapter 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  2,
  1,
  'From what place did Boaz come when he arrived at the field?',
  '["Bethlehem", "Moab", "Jericho", "Hebron"]'::jsonb,
  'Bethlehem',
  'Boaz came from Bethlehem and greeted the reapers (Ruth 2:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 2
    AND difficulty_stage = 1
    AND prompt = 'From what place did Boaz come when he arrived at the field?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  2,
  1,
  'How did Boaz greet his reapers?',
  '["The LORD be with you", "Peace to Moab", "Work harder today", "Go in safety"]'::jsonb,
  'The LORD be with you',
  'Boaz said to the reapers, ''The LORD be with you'' (Ruth 2:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 2
    AND difficulty_stage = 1
    AND prompt = 'How did Boaz greet his reapers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  2,
  1,
  'What did Boaz invite Ruth to drink when she was thirsty?',
  '["Water the young men had drawn", "New wine from Bethlehem", "Milk from Naomi''s house", "Oil from the press"]'::jsonb,
  'Water the young men had drawn',
  'Boaz told Ruth to drink from what the young men had drawn (Ruth 2:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 2
    AND difficulty_stage = 1
    AND prompt = 'What did Boaz invite Ruth to drink when she was thirsty?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  2,
  1,
  'What did Ruth ask permission to do in the field?',
  '["Glean after the reapers", "Buy grain at the gate", "Measure the barley", "Water the animals"]'::jsonb,
  'Glean after the reapers',
  'Ruth asked Naomi to let her go glean among the ears of grain after the reapers (Ruth 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 2
    AND difficulty_stage = 1
    AND prompt = 'What did Ruth ask permission to do in the field?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  2,
  1,
  'What was the name of Naomi''s relative who owned the field Ruth entered?',
  '["Boaz", "Obed", "Elimelech", "Mahlon"]'::jsonb,
  'Boaz',
  'Boaz is introduced as a mighty man of wealth from Elimelech''s family (Ruth 2:1, 3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 2
    AND difficulty_stage = 1
    AND prompt = 'What was the name of Naomi''s relative who owned the field Ruth entered?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  2,
  1,
  'Where did Boaz tell Ruth not to go glean?',
  '["Another field", "Bethlehem''s streets", "Naomi''s house", "The threshing floor"]'::jsonb,
  'Another field',
  'Boaz told Ruth not to go glean in another field and not to leave his area (Ruth 2:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 2
    AND difficulty_stage = 1
    AND prompt = 'Where did Boaz tell Ruth not to go glean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  2,
  1,
  'Whose young woman did Boaz ask about when he noticed Ruth?',
  '["The one set over the reapers", "The town elders", "Naomi herself", "The owner of the next field"]'::jsonb,
  'The one set over the reapers',
  'Boaz asked the servant who was set over the reapers whose young lady Ruth was (Ruth 2:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 2
    AND difficulty_stage = 1
    AND prompt = 'Whose young woman did Boaz ask about when he noticed Ruth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  2,
  2,
  'About how much barley did Ruth glean by evening?',
  '["About an ephah", "About a homer", "About a seah", "About a bath"]'::jsonb,
  'About an ephah',
  'Ruth beat out what she had gleaned, and it was about an ephah of barley (Ruth 2:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 2
    AND difficulty_stage = 2
    AND prompt = 'About how much barley did Ruth glean by evening?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  2,
  2,
  'Under whose wings did Boaz say Ruth had come to take refuge?',
  '["The LORD''s", "Naomi''s", "Bethlehem''s", "Israel''s army''s"]'::jsonb,
  'The LORD''s',
  'Boaz blessed Ruth because she had come to trust under the LORD''s wings (Ruth 2:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 2
    AND difficulty_stage = 2
    AND prompt = 'Under whose wings did Boaz say Ruth had come to take refuge?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  2,
  2,
  'What did Boaz tell his men to pull out for Ruth on purpose?',
  '["Some handfuls", "Fresh grapes", "New sandals", "Bundles of flax"]'::jsonb,
  'Some handfuls',
  'Boaz instructed them to pull out some handfuls on purpose for Ruth and leave them (Ruth 2:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 2
    AND difficulty_stage = 2
    AND prompt = 'What did Boaz tell his men to pull out for Ruth on purpose?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  2,
  2,
  'What did Boaz tell his young men to do for Ruth among the sheaves?',
  '["Let her glean and do not reproach her", "Send her away quickly", "Charge her for each bundle", "Keep her from the well"]'::jsonb,
  'Let her glean and do not reproach her',
  'Boaz commanded the young men to let Ruth glean even among the sheaves and not shame her (Ruth 2:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 2
    AND difficulty_stage = 2
    AND prompt = 'What did Boaz tell his young men to do for Ruth among the sheaves?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  2,
  2,
  'What did Ruth dip her morsel in at mealtime?',
  '["Vinegar", "Oil", "Milk", "Honey"]'::jsonb,
  'Vinegar',
  'At mealtime Boaz told Ruth to dip her bread in the vinegar (Ruth 2:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 2
    AND difficulty_stage = 2
    AND prompt = 'What did Ruth dip her morsel in at mealtime?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  2,
  2,
  'Where did Boaz tell Ruth to eat at mealtime?',
  '["Beside the reapers", "At the city gate", "Inside Naomi''s house", "Under the olive trees"]'::jsonb,
  'Beside the reapers',
  'Boaz invited Ruth to come and eat bread with the reapers (Ruth 2:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 2
    AND difficulty_stage = 2
    AND prompt = 'Where did Boaz tell Ruth to eat at mealtime?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  2,
  2,
  'Why did Boaz show Ruth special favor in the field?',
  '["He had heard of her loyalty to Naomi", "She had already paid him", "She was from Bethlehem", "She owned the field"]'::jsonb,
  'He had heard of her loyalty to Naomi',
  'Boaz said he knew what Ruth had done for Naomi after her husband''s death (Ruth 2:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 2
    AND difficulty_stage = 2
    AND prompt = 'Why did Boaz show Ruth special favor in the field?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  2,
  3,
  'How does Naomi interpret Boaz''s kindness when Ruth returns?',
  '["As a sign that the LORD has not forsaken His kindness", "As a warning to leave Bethlehem", "As proof Boaz dislikes strangers", "As a reason to sell Elimelech''s land"]'::jsonb,
  'As a sign that the LORD has not forsaken His kindness',
  'Naomi blesses Boaz and says the LORD has not forsaken His kindness to the living and the dead (Ruth 2:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 2
    AND difficulty_stage = 3
    AND prompt = 'How does Naomi interpret Boaz''s kindness when Ruth returns?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  2,
  3,
  'What does Boaz''s knowledge of Ruth''s story show about Bethlehem''s social world?',
  '["Her quiet faithfulness had become publicly known", "No one in Bethlehem knew Naomi", "Only foreign workers noticed her", "The elders kept all widows hidden"]'::jsonb,
  'Her quiet faithfulness had become publicly known',
  'Boaz already knew what Ruth had done for Naomi, showing her actions were known in the community (Ruth 2:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 2
    AND difficulty_stage = 3
    AND prompt = 'What does Boaz''s knowledge of Ruth''s story show about Bethlehem''s social world?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  2,
  3,
  'What does Boaz''s meal invitation communicate beyond basic charity?',
  '["He gives Ruth a place of welcome among his workers", "He tests whether she can pay him back", "He separates her from the reapers", "He warns her to leave after lunch"]'::jsonb,
  'He gives Ruth a place of welcome among his workers',
  'Ruth is invited to eat with the reapers, not treated as an outsider kept at a distance (Ruth 2:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 2
    AND difficulty_stage = 3
    AND prompt = 'What does Boaz''s meal invitation communicate beyond basic charity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  2,
  3,
  'What does Ruth''s labor from morning until evening emphasize?',
  '["Her diligence in seeking provision for Naomi and herself", "Her desire to avoid speaking with Boaz", "Her attempt to impress Bethlehem''s elders", "Her plan to buy the field soon"]'::jsonb,
  'Her diligence in seeking provision for Naomi and herself',
  'The overseer notes Ruth has continued steadily from morning, with only a brief rest (Ruth 2:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 2
    AND difficulty_stage = 3
    AND prompt = 'What does Ruth''s labor from morning until evening emphasize?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  2,
  3,
  'What does the command to leave extra grain for Ruth reveal about Boaz''s generosity?',
  '["He goes beyond the minimum requirement of gleaning law", "He is secretly taking grain from another man", "He wants Ruth to stop working quickly", "He is avoiding Naomi''s questions"]'::jsonb,
  'He goes beyond the minimum requirement of gleaning law',
  'Boaz not only permits gleaning but orders deliberate provision through handfuls left on purpose (Ruth 2:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 2
    AND difficulty_stage = 3
    AND prompt = 'What does the command to leave extra grain for Ruth reveal about Boaz''s generosity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  2,
  3,
  'Why does Ruth ask why she has found favor in Boaz''s eyes?',
  '["She knows she is a foreigner and does not presume on kindness", "She is demanding a legal right to the field", "She doubts Naomi is really from Bethlehem", "She wants to leave for another field"]'::jsonb,
  'She knows she is a foreigner and does not presume on kindness',
  'Ruth asks this because she is a foreigner and is surprised by such favor (Ruth 2:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 2
    AND difficulty_stage = 3
    AND prompt = 'Why does Ruth ask why she has found favor in Boaz''s eyes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  2,
  3,
  'Why is the image of taking refuge under the LORD''s wings important here?',
  '["It presents Ruth''s gleaning as part of God''s sheltering care", "It suggests Ruth should flee back to Moab", "It describes the reapers'' clothing", "It refers only to temple sacrifices"]'::jsonb,
  'It presents Ruth''s gleaning as part of God''s sheltering care',
  'Boaz interprets Ruth''s coming to Israel as seeking refuge in the LORD, and his generosity becomes part of that care (Ruth 2:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 2
    AND difficulty_stage = 3
    AND prompt = 'Why is the image of taking refuge under the LORD''s wings important here?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  2,
  4,
  'How does Ruth 2 develop the book''s theme of redemption before the formal legal scene?',
  '["Provision in the field begins to answer the emptiness named in chapter 1", "It resolves the inheritance case at the city gate", "It removes Naomi from the story''s need", "It replaces covenant faithfulness with mere luck"]'::jsonb,
  'Provision in the field begins to answer the emptiness named in chapter 1',
  'Ruth''s gleaning and Boaz''s favor begin to fill the want Naomi described earlier (Ruth 2:2, 17-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 2
    AND difficulty_stage = 4
    AND prompt = 'How does Ruth 2 develop the book''s theme of redemption before the formal legal scene?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  2,
  4,
  'How does Ruth 2 reverse the mood of the previous chapter?',
  '["Bitter emptiness gives way to visible provision and hope", "Bethlehem becomes more hostile than Moab", "Naomi loses the last of her resources", "Ruth decides to abandon Naomi"]'::jsonb,
  'Bitter emptiness gives way to visible provision and hope',
  'The chapter moves from the loss emphasized in Ruth 1 to food, favor, and a named redeemer in view (Ruth 2:17-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 2
    AND difficulty_stage = 4
    AND prompt = 'How does Ruth 2 reverse the mood of the previous chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  2,
  4,
  'How does the chapter connect human kindness with divine action?',
  '["Boaz''s favor is portrayed as part of the LORD''s care for Ruth", "Human kindness replaces the need for God", "God acts only apart from ordinary people", "Naomi denies the LORD''s involvement altogether"]'::jsonb,
  'Boaz''s favor is portrayed as part of the LORD''s care for Ruth',
  'Boaz blesses Ruth in the LORD''s name, and Naomi later sees the LORD''s kindness in what has happened (Ruth 2:12, 20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 2
    AND difficulty_stage = 4
    AND prompt = 'How does the chapter connect human kindness with divine action?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  2,
  4,
  'What does the mealtime scene add to Ruth''s status in the story?',
  '["She is treated with dignity, not merely tolerated as a scavenger", "She is turned into a household servant immediately", "She is publicly accused by the reapers", "She is sent away because of her Moabite background"]'::jsonb,
  'She is treated with dignity, not merely tolerated as a scavenger',
  'Boaz seats Ruth with the reapers and serves her roasted grain until she is satisfied (Ruth 2:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 2
    AND difficulty_stage = 4
    AND prompt = 'What does the mealtime scene add to Ruth''s status in the story?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  2,
  4,
  'What is the narrative effect of saying Ruth ''happened'' to come to Boaz''s field?',
  '["It highlights providence working through ordinary events", "It means the story rejects God''s guidance", "It proves Ruth ignored Naomi''s advice", "It shows Boaz had planned the meeting long before"]'::jsonb,
  'It highlights providence working through ordinary events',
  'The wording sounds ordinary, yet the chapter shows this meeting is significant for the book''s unfolding redemption (Ruth 2:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 2
    AND difficulty_stage = 4
    AND prompt = 'What is the narrative effect of saying Ruth ''happened'' to come to Boaz''s field?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  2,
  4,
  'Why is Boaz''s behavior significant within Israel''s covenant life?',
  '["He embodies generous obedience rather than bare legal minimalism", "He ignores the poor laws to protect profit", "He acts only because Ruth threatens him", "He separates Ruth from any share in Israel''s fields"]'::jsonb,
  'He embodies generous obedience rather than bare legal minimalism',
  'Boaz exceeds the basic allowance for gleaning and treats Ruth with protective generosity (Ruth 2:8-9, 15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 2
    AND difficulty_stage = 4
    AND prompt = 'Why is Boaz''s behavior significant within Israel''s covenant life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  2,
  4,
  'Why is Naomi''s recognition of Boaz as a close relative important?',
  '["It links daily provision with the possibility of family redemption", "It proves Boaz is already Ruth''s husband", "It shows the legal case is already complete", "It means Ruth no longer needs to glean"]'::jsonb,
  'It links daily provision with the possibility of family redemption',
  'Naomi identifies Boaz as one of their near kinsmen, moving the story toward redemption (Ruth 2:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 2
    AND difficulty_stage = 4
    AND prompt = 'Why is Naomi''s recognition of Boaz as a close relative important?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  2,
  5,
  'How does Boaz''s first appearance distinguish him within the book?',
  '["He combines covenant speech, social power, and practical generosity", "He appears as a silent judge leading troops", "He avoids the workers and speaks only to Naomi", "He is introduced as an enemy landowner"]'::jsonb,
  'He combines covenant speech, social power, and practical generosity',
  'Boaz greets workers in the LORD''s name, has authority in the field, and acts generously toward Ruth (Ruth 2:4, 8-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 2
    AND difficulty_stage = 5
    AND prompt = 'How does Boaz''s first appearance distinguish him within the book?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  2,
  5,
  'How does the chapter portray Ruth''s foreignness?',
  '["It remains visible, yet it does not prevent covenant kindness", "It disappears because Ruth hides her identity", "It is treated as a reason for legal exclusion from the field", "It matters only to the town women, not to Boaz"]'::jsonb,
  'It remains visible, yet it does not prevent covenant kindness',
  'Ruth calls herself a foreigner, and Boaz still blesses and protects her (Ruth 2:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 2
    AND difficulty_stage = 5
    AND prompt = 'How does the chapter portray Ruth''s foreignness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  2,
  5,
  'What does Ruth 2 contribute to the book''s treatment of redemption?',
  '["It shows redemption beginning as daily care before it is completed as a legal act", "It finishes the redemption process without witnesses", "It turns redemption into a private feeling only", "It shifts the story away from household restoration"]'::jsonb,
  'It shows redemption beginning as daily care before it is completed as a legal act',
  'Before the gate scene of chapter 4, Boaz is already functioning as a source of protection and provision (Ruth 2:8-16, 20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 2
    AND difficulty_stage = 5
    AND prompt = 'What does Ruth 2 contribute to the book''s treatment of redemption?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  2,
  5,
  'What does Ruth 2 suggest about the relationship between Torah provision and personal character?',
  '["The law opens space for mercy, and Boaz''s character fills that space generously", "The law prevents any generosity beyond the minimum", "Personal character makes covenant law unnecessary", "The chapter treats gleaning as accidental and lawless"]'::jsonb,
  'The law opens space for mercy, and Boaz''s character fills that space generously',
  'Ruth gleans under Israel''s provision for the poor, but Boaz goes beyond the minimum in how he treats her (Ruth 2:2, 15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 2
    AND difficulty_stage = 5
    AND prompt = 'What does Ruth 2 suggest about the relationship between Torah provision and personal character?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  2,
  5,
  'What narrative pattern is strengthened by Ruth''s return home with grain and leftovers?',
  '["Hidden providence is becoming concrete provision", "Naomi''s bitterness is growing into rebellion", "Boaz is withdrawing his support", "Bethlehem is heading into famine again"]'::jsonb,
  'Hidden providence is becoming concrete provision',
  'Ruth returns with an ephah of barley and leftover food, turning hope into tangible supply (Ruth 2:17-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 2
    AND difficulty_stage = 5
    AND prompt = 'What narrative pattern is strengthened by Ruth''s return home with grain and leftovers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  2,
  5,
  'Why is Boaz''s blessing about refuge under the LORD''s wings especially significant in light of the book''s later imagery?',
  '["It foreshadows that God''s shelter will come through Boaz''s own protective role", "It means Ruth should avoid Boaz from then on", "It predicts immediate prosperity without any mediator", "It refers only to worship at Shiloh"]'::jsonb,
  'It foreshadows that God''s shelter will come through Boaz''s own protective role',
  'Boaz names the LORD''s wings in chapter 2, and Ruth later asks Boaz himself to spread his skirt over her as redeemer (Ruth 2:12; 3:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 2
    AND difficulty_stage = 5
    AND prompt = 'Why is Boaz''s blessing about refuge under the LORD''s wings especially significant in light of the book''s later imagery?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  2,
  5,
  'Why is Naomi''s statement about kindness to ''the living and the dead'' theologically important?',
  '["It sees present provision as tied to God''s ongoing care for the family line", "It means the dead have returned physically to Bethlehem", "It denies that inheritance matters anymore", "It limits Boaz''s role to a one-day gift"]'::jsonb,
  'It sees present provision as tied to God''s ongoing care for the family line',
  'Naomi reads Boaz''s favor not just as food for the living but as mercy touching the household marked by loss (Ruth 2:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 2
    AND difficulty_stage = 5
    AND prompt = 'Why is Naomi''s statement about kindness to ''the living and the dead'' theologically important?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  3,
  1,
  'How much barley did Boaz send home with Ruth before morning?',
  '["Six measures of barley", "One ephah of barley", "Three sheaves", "Seven baskets"]'::jsonb,
  'Six measures of barley',
  'Boaz measured six portions of barley and laid it on Ruth before she returned (Ruth 3:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 3
    AND difficulty_stage = 1
    AND prompt = 'How much barley did Boaz send home with Ruth before morning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  3,
  1,
  'What did Boaz ask when he awoke at midnight?',
  '["Who are you?", "Why is the gate open?", "Where is Naomi?", "Has the harvest ended?"]'::jsonb,
  'Who are you?',
  'When Boaz awoke startled at midnight, he asked, ''Who are you?'' (Ruth 3:8-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 3
    AND difficulty_stage = 1
    AND prompt = 'What did Boaz ask when he awoke at midnight?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  3,
  1,
  'What did Naomi seek for Ruth in Ruth 3?',
  '["Rest", "A larger field", "A trip to Moab", "A new cloak"]'::jsonb,
  'Rest',
  'Naomi said she wanted to seek rest for Ruth so that it might be well with her (Ruth 3:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 3
    AND difficulty_stage = 1
    AND prompt = 'What did Naomi seek for Ruth in Ruth 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  3,
  1,
  'What did Naomi tell Ruth to do before going to Boaz?',
  '["Wash, anoint herself, and put on her cloak", "Gather more barley", "Take Naomi along", "Call the elders first"]'::jsonb,
  'Wash, anoint herself, and put on her cloak',
  'Naomi instructed Ruth to wash herself, anoint herself, and put on her mantle before going (Ruth 3:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 3
    AND difficulty_stage = 1
    AND prompt = 'What did Naomi tell Ruth to do before going to Boaz?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  3,
  1,
  'What did Ruth ask Boaz to spread over her?',
  '["His skirt", "His field", "His staff", "His garment belt"]'::jsonb,
  'His skirt',
  'Ruth asked Boaz to spread his skirt over his handmaid, for he was a near kinsman (Ruth 3:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 3
    AND difficulty_stage = 1
    AND prompt = 'What did Ruth ask Boaz to spread over her?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  3,
  1,
  'Where did Ruth lie down after Boaz had eaten and drunk?',
  '["At his feet", "Beside the grain heap", "At the doorway", "Near the olive press"]'::jsonb,
  'At his feet',
  'Ruth uncovered Boaz''s feet and lay down there as Naomi had instructed (Ruth 3:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 3
    AND difficulty_stage = 1
    AND prompt = 'Where did Ruth lie down after Boaz had eaten and drunk?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  3,
  1,
  'Where was Boaz winnowing barley that night?',
  '["At the threshing floor", "At the city gate", "In Naomi''s house", "By the village well"]'::jsonb,
  'At the threshing floor',
  'Naomi said Boaz would be winnowing barley at the threshing floor that night (Ruth 3:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 3
    AND difficulty_stage = 1
    AND prompt = 'Where was Boaz winnowing barley that night?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  3,
  2,
  'How did Ruth identify herself when Boaz asked who she was?',
  '["As Ruth, his handmaid", "As Naomi''s daughter", "As a widow of Bethlehem", "As a servant of the reapers"]'::jsonb,
  'As Ruth, his handmaid',
  'Ruth answered, ''I am Ruth, your handmaid'' (Ruth 3:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 3
    AND difficulty_stage = 2
    AND prompt = 'How did Ruth identify herself when Boaz asked who she was?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  3,
  2,
  'What reason did Boaz give for not fearing to act for Ruth?',
  '["All the city knew she was a worthy woman", "Naomi had already arranged the marriage", "The harvest was complete", "The other redeemer had died"]'::jsonb,
  'All the city knew she was a worthy woman',
  'Boaz said all the gate of his people knew Ruth was a worthy woman (Ruth 3:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 3
    AND difficulty_stage = 2
    AND prompt = 'What reason did Boaz give for not fearing to act for Ruth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  3,
  2,
  'Why could Boaz not settle the matter immediately that night?',
  '["There was a redeemer nearer than he", "The elders were outside the land", "Naomi had not agreed yet", "Ruth still needed to glean longer"]'::jsonb,
  'There was a redeemer nearer than he',
  'Boaz explained that although he was a redeemer, there was one nearer than he (Ruth 3:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 3
    AND difficulty_stage = 2
    AND prompt = 'Why could Boaz not settle the matter immediately that night?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  3,
  2,
  'Why did Boaz praise Ruth''s kindness at the threshing floor?',
  '["She had not gone after young men, whether poor or rich", "She had gathered more grain than anyone", "She had spoken before the elders", "She had returned to Moab for Naomi"]'::jsonb,
  'She had not gone after young men, whether poor or rich',
  'Boaz said Ruth''s latter kindness was greater because she did not pursue younger men, poor or rich (Ruth 3:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 3
    AND difficulty_stage = 2
    AND prompt = 'Why did Boaz praise Ruth''s kindness at the threshing floor?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  3,
  2,
  'Why did Boaz tell Ruth to leave before one could recognize another?',
  '["He wanted to protect her reputation", "He wanted her back in the field early", "He feared the men would steal the grain", "He needed to travel to Moab at dawn"]'::jsonb,
  'He wanted to protect her reputation',
  'Boaz sent Ruth away before daylight and said it must not be known a woman came to the threshing floor (Ruth 3:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 3
    AND difficulty_stage = 2
    AND prompt = 'Why did Boaz tell Ruth to leave before one could recognize another?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  3,
  2,
  'Why did Naomi think Boaz could provide rest for Ruth?',
  '["He was a close relative and potential redeemer", "He had already bought the land", "He was Bethlehem''s judge", "He planned to move to Moab"]'::jsonb,
  'He was a close relative and potential redeemer',
  'Naomi identifies Boaz as a near kinsman, which is why she directs Ruth toward him (Ruth 3:1-2; 2:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 3
    AND difficulty_stage = 2
    AND prompt = 'Why did Naomi think Boaz could provide rest for Ruth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  3,
  2,
  'Why did Ruth wait until Boaz had finished eating and drinking before approaching him?',
  '["Naomi told her to note the place and approach quietly afterward", "Boaz had forbidden her to speak earlier", "The reapers were still in the field", "She first needed the elders'' permission"]'::jsonb,
  'Naomi told her to note the place and approach quietly afterward',
  'Naomi instructed Ruth to observe where Boaz lay down and then go in afterward (Ruth 3:3-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 3
    AND difficulty_stage = 2
    AND prompt = 'Why did Ruth wait until Boaz had finished eating and drinking before approaching him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  3,
  3,
  'How does Ruth respond to Naomi''s plan at the start of the chapter?',
  '["With simple obedience", "With fear and refusal", "With a demand for witnesses", "With a plan to consult Boaz first"]'::jsonb,
  'With simple obedience',
  'Ruth says, ''All that you say I will do,'' and follows Naomi''s instructions (Ruth 3:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 3
    AND difficulty_stage = 3
    AND prompt = 'How does Ruth respond to Naomi''s plan at the start of the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  3,
  3,
  'What does Boaz''s concern for secrecy imply about the situation?',
  '["He wants to guard Ruth from shame while acting honorably", "He intends to deny helping her later", "He is ashamed of Naomi''s family", "He wants the nearer redeemer to hear a false report"]'::jsonb,
  'He wants to guard Ruth from shame while acting honorably',
  'Boaz protects Ruth''s reputation and still pledges to pursue the matter rightly (Ruth 3:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 3
    AND difficulty_stage = 3
    AND prompt = 'What does Boaz''s concern for secrecy imply about the situation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  3,
  3,
  'What does Ruth''s request for Boaz to spread his skirt over her signify?',
  '["A request for covenant protection through redemption", "A demand for immediate wealth", "A command for Boaz to hide her", "A protest against Naomi''s plan"]'::jsonb,
  'A request for covenant protection through redemption',
  'Ruth ties the covering image to Boaz''s role as near kinsman, asking for redeeming protection (Ruth 3:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 3
    AND difficulty_stage = 3
    AND prompt = 'What does Ruth''s request for Boaz to spread his skirt over her signify?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  3,
  3,
  'What does the mention of a nearer redeemer add to the story?',
  '["It places righteousness and legal order ahead of personal desire", "It proves Boaz is unwilling to help Ruth", "It means Naomi''s plan has completely failed", "It shows Ruth approached the wrong man by mistake"]'::jsonb,
  'It places righteousness and legal order ahead of personal desire',
  'Boaz is willing to act, but he will do so lawfully because another redeemer has prior claim (Ruth 3:12-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 3
    AND difficulty_stage = 3
    AND prompt = 'What does the mention of a nearer redeemer add to the story?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  3,
  3,
  'What does the six measures of barley communicate within the chapter?',
  '["Boaz''s promise is backed by tangible provision for Naomi''s household", "Boaz is paying Ruth wages for field work", "Ruth is required to return the grain at the gate", "The nearer redeemer has already surrendered his claim"]'::jsonb,
  'Boaz''s promise is backed by tangible provision for Naomi''s household',
  'Boaz does not send Ruth away empty but gives grain as the matter moves toward resolution (Ruth 3:15-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 3
    AND difficulty_stage = 3
    AND prompt = 'What does the six measures of barley communicate within the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  3,
  3,
  'Why does Boaz call Ruth''s action a greater kindness than the first?',
  '["She seeks faithful household redemption rather than a merely advantageous match", "She offers to repay all Naomi''s debts herself", "She brings the largest harvest gift yet", "She agrees to leave Bethlehem forever"]'::jsonb,
  'She seeks faithful household redemption rather than a merely advantageous match',
  'Boaz sees Ruth''s approach as loyal love aimed at family redemption, not self-serving pursuit (Ruth 3:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 3
    AND difficulty_stage = 3
    AND prompt = 'Why does Boaz call Ruth''s action a greater kindness than the first?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  3,
  3,
  'Why is Ruth told to remain until morning after Boaz''s promise?',
  '["His pledge gives safety while the matter waits for legal resolution", "Naomi ordered her never to leave at night", "The threshing floor was closed until sunrise", "The reapers needed her help at dawn"]'::jsonb,
  'His pledge gives safety while the matter waits for legal resolution',
  'Boaz tells Ruth to stay the night and promises to act in the morning regarding redemption (Ruth 3:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 3
    AND difficulty_stage = 3
    AND prompt = 'Why is Ruth told to remain until morning after Boaz''s promise?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  3,
  4,
  'How does Ruth 3 move the story from generous provision to formal redemption?',
  '["It turns the question of kindness in the field into a direct appeal for redeeming action", "It removes Boaz from the role of redeemer", "It closes the possibility of restoring Naomi''s house", "It shifts the story back to famine in Bethlehem"]'::jsonb,
  'It turns the question of kindness in the field into a direct appeal for redeeming action',
  'Ruth no longer merely gleans; she asks Boaz to act as redeemer, moving the story toward legal resolution (Ruth 3:9-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 3
    AND difficulty_stage = 4
    AND prompt = 'How does Ruth 3 move the story from generous provision to formal redemption?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  3,
  4,
  'How does chapter 3 sustain tension without losing hope?',
  '["A nearer redeemer complicates the plan, but Boaz clearly commits himself", "Boaz rejects Ruth and sends her away empty", "Naomi loses confidence and ends the plan", "Ruth decides never to return to the threshing floor"]'::jsonb,
  'A nearer redeemer complicates the plan, but Boaz clearly commits himself',
  'The obstacle appears in verse 12, yet Boaz promises to settle the matter if the nearer man will not (Ruth 3:12-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 3
    AND difficulty_stage = 4
    AND prompt = 'How does chapter 3 sustain tension without losing hope?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  3,
  4,
  'How does the chapter echo earlier imagery from Ruth 2?',
  '["Ruth asks Boaz for covering after Boaz spoke of refuge under the LORD''s wings", "The city women rename Ruth as Mara", "Boaz repeats the gleaning laws to the elders", "Naomi returns to Bethlehem a second time"]'::jsonb,
  'Ruth asks Boaz for covering after Boaz spoke of refuge under the LORD''s wings',
  'The shelter image deepens as Ruth asks Boaz to spread his covering over her (Ruth 2:12; 3:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 3
    AND difficulty_stage = 4
    AND prompt = 'How does the chapter echo earlier imagery from Ruth 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  3,
  4,
  'What does the chapter imply about true rest for Ruth and Naomi?',
  '["It requires both provision and a secure redeemed future", "It comes only from leaving Bethlehem", "It depends on keeping Ruth hidden forever", "It is found only in a larger harvest"]'::jsonb,
  'It requires both provision and a secure redeemed future',
  'Naomi seeks rest for Ruth, and the chapter ties that rest to redemption, not just daily food (Ruth 3:1, 9-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 3
    AND difficulty_stage = 4
    AND prompt = 'What does the chapter imply about true rest for Ruth and Naomi?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  3,
  4,
  'What role does Naomi play at the end of the chapter?',
  '["She interprets events confidently and waits for the matter to be finished", "She tells Ruth to return to Moab immediately", "She rebukes Boaz for delaying", "She takes the barley to the city gate herself"]'::jsonb,
  'She interprets events confidently and waits for the matter to be finished',
  'Naomi says the man will not rest until he has finished the thing that day (Ruth 3:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 3
    AND difficulty_stage = 4
    AND prompt = 'What role does Naomi play at the end of the chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  3,
  4,
  'Why is Boaz''s promise in chapter 3 morally significant?',
  '["He combines compassion with careful submission to rightful process", "He ignores the nearer kinsman''s claim for speed", "He delays because he doubts Ruth''s worth", "He agrees only after being bribed with grain"]'::jsonb,
  'He combines compassion with careful submission to rightful process',
  'Boaz vows to act but insists the nearer redeemer must be addressed first (Ruth 3:12-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 3
    AND difficulty_stage = 4
    AND prompt = 'Why is Boaz''s promise in chapter 3 morally significant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  3,
  4,
  'Why is Ruth''s reputation as a worthy woman important in this scene?',
  '["It makes her request honorable rather than manipulative", "It gives her immediate ownership of the field", "It removes the need for witnesses altogether", "It explains why the nearer redeemer is absent"]'::jsonb,
  'It makes her request honorable rather than manipulative',
  'Boaz''s words frame Ruth''s midnight approach within recognized virtue, not scandal (Ruth 3:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 3
    AND difficulty_stage = 4
    AND prompt = 'Why is Ruth''s reputation as a worthy woman important in this scene?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  3,
  5,
  'How does Ruth''s request in chapter 3 deepen the book''s theology of refuge?',
  '["The refuge Boaz named under God''s wings becomes refuge sought through a human redeemer", "It replaces God''s refuge with pagan ritual", "It denies that God works through families", "It limits refuge to the threshing floor alone"]'::jsonb,
  'The refuge Boaz named under God''s wings becomes refuge sought through a human redeemer',
  'The covering image links divine refuge and redeeming action through Boaz (Ruth 2:12; 3:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 3
    AND difficulty_stage = 5
    AND prompt = 'How does Ruth''s request in chapter 3 deepen the book''s theology of refuge?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  3,
  5,
  'How does chapter 3 balance bold initiative and honorable restraint?',
  '["Ruth acts boldly, and Boaz responds within moral and legal bounds", "Ruth hesitates, and Boaz pressures her into a decision", "Naomi prevents any decisive action from happening", "The chapter rejects both boldness and restraint"]'::jsonb,
  'Ruth acts boldly, and Boaz responds within moral and legal bounds',
  'Ruth approaches Boaz directly, but Boaz handles the matter with integrity and due order (Ruth 3:6-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 3
    AND difficulty_stage = 5
    AND prompt = 'How does chapter 3 balance bold initiative and honorable restraint?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  3,
  5,
  'How does chapter 3 prepare for the resolution of Naomi''s emptiness from chapter 1?',
  '["It brings the family crisis to the threshold of public redemption", "It sends Naomi back into mourning without hope", "It replaces household restoration with private romance", "It moves the story away from inheritance and lineage"]'::jsonb,
  'It brings the family crisis to the threshold of public redemption',
  'By the chapter''s end, Boaz is committed to addressing the household''s need through proper redemption (Ruth 3:12-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 3
    AND difficulty_stage = 5
    AND prompt = 'How does chapter 3 prepare for the resolution of Naomi''s emptiness from chapter 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  3,
  5,
  'What does Naomi''s confidence at the end of chapter 3 reveal?',
  '["She believes Boaz''s character aligns with his promise to act promptly", "She has already spoken with the nearer redeemer", "She thinks Ruth should stop trusting Boaz", "She expects the case to continue for many years"]'::jsonb,
  'She believes Boaz''s character aligns with his promise to act promptly',
  'Naomi says Boaz will not rest until he finishes the matter that day (Ruth 3:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 3
    AND difficulty_stage = 5
    AND prompt = 'What does Naomi''s confidence at the end of chapter 3 reveal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  3,
  5,
  'What narrative function does the gift of barley serve after the threshing floor exchange?',
  '["It confirms Boaz''s goodwill while the legal question remains unresolved", "It ends Ruth''s need to glean forever that night", "It buys Naomi''s field from the nearer redeemer", "It signals that marriage has already been completed secretly"]'::jsonb,
  'It confirms Boaz''s goodwill while the legal question remains unresolved',
  'The grain accompanies Boaz''s promise and assures Naomi that the matter is moving forward (Ruth 3:15-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 3
    AND difficulty_stage = 5
    AND prompt = 'What narrative function does the gift of barley serve after the threshing floor exchange?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  3,
  5,
  'Why is Boaz''s insistence on the nearer redeemer narratively crucial?',
  '["It shows redemption in Ruth is righteous, public, and ordered, not merely romantic", "It proves Boaz does not truly want to redeem Ruth", "It means Naomi misunderstood the law completely", "It removes any need for the elders in chapter 4"]'::jsonb,
  'It shows redemption in Ruth is righteous, public, and ordered, not merely romantic',
  'Boaz''s restraint prepares for the lawful gate scene rather than a private resolution (Ruth 3:12-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 3
    AND difficulty_stage = 5
    AND prompt = 'Why is Boaz''s insistence on the nearer redeemer narratively crucial?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  3,
  5,
  'Why is Ruth''s identity as a worthy woman central to the chapter''s meaning?',
  '["It frames redemption as covenant faithfulness joined to noble character", "It allows Ruth to bypass the legal process", "It proves she was born in Bethlehem", "It explains why the harvest law no longer applies"]'::jsonb,
  'It frames redemption as covenant faithfulness joined to noble character',
  'Boaz''s recognition of Ruth''s worth supports the chapter''s portrait of honorable redemption (Ruth 3:10-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 3
    AND difficulty_stage = 5
    AND prompt = 'Why is Ruth''s identity as a worthy woman central to the chapter''s meaning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  4,
  1,
  'How many elders did Boaz ask to sit as witnesses?',
  '["Ten", "Seven", "Twelve", "Five"]'::jsonb,
  'Ten',
  'Boaz took ten men of the elders of the city and told them to sit down (Ruth 4:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 4
    AND difficulty_stage = 1
    AND prompt = 'How many elders did Boaz ask to sit as witnesses?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  4,
  1,
  'What did the nearer kinsman do to confirm giving up his right?',
  '["Took off his sandal", "Tore his garment", "Offered six measures of barley", "Raised his staff"]'::jsonb,
  'Took off his sandal',
  'The custom in Israel was confirmed by taking off the sandal, and the nearer kinsman gave it to Boaz (Ruth 4:7-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 4
    AND difficulty_stage = 1
    AND prompt = 'What did the nearer kinsman do to confirm giving up his right?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  4,
  1,
  'What did the nearer kinsman first say about redeeming the land?',
  '["I will redeem it", "I cannot redeem it", "Ask Boaz first", "Wait until harvest ends"]'::jsonb,
  'I will redeem it',
  'At first the nearer kinsman said, ''I will redeem it'' (Ruth 4:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 4
    AND difficulty_stage = 1
    AND prompt = 'What did the nearer kinsman first say about redeeming the land?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  4,
  1,
  'What property did Naomi need to sell?',
  '["The parcel of land that belonged to Elimelech", "Boaz''s barley field", "Mahlon''s house in Moab", "The city gate"]'::jsonb,
  'The parcel of land that belonged to Elimelech',
  'Boaz told the nearer kinsman that Naomi was selling the parcel of land that belonged to Elimelech (Ruth 4:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 4
    AND difficulty_stage = 1
    AND prompt = 'What property did Naomi need to sell?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  4,
  1,
  'What was the name of the son born to Ruth and Boaz?',
  '["Obed", "Jesse", "Mahlon", "Perez"]'::jsonb,
  'Obed',
  'The women said a son had been born to Naomi, and they named him Obed (Ruth 4:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 4
    AND difficulty_stage = 1
    AND prompt = 'What was the name of the son born to Ruth and Boaz?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  4,
  1,
  'Where did Boaz go to settle the matter of redemption?',
  '["To the gate", "To the threshing floor", "To Moab", "To the tabernacle"]'::jsonb,
  'To the gate',
  'Boaz went up to the gate and sat down there to settle the matter publicly (Ruth 4:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 4
    AND difficulty_stage = 1
    AND prompt = 'Where did Boaz go to settle the matter of redemption?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  4,
  1,
  'Whom did Boaz take as his wife?',
  '["Ruth", "Naomi", "Orpah", "Mara"]'::jsonb,
  'Ruth',
  'Boaz declared that he had acquired Ruth the Moabitess to be his wife (Ruth 4:10, 13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 4
    AND difficulty_stage = 1
    AND prompt = 'Whom did Boaz take as his wife?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  4,
  2,
  'What blessing did the witnesses speak over Ruth?',
  '["May she be like Rachel and Leah", "May she return to Moab in peace", "May she judge Israel", "May she own all Bethlehem"]'::jsonb,
  'May she be like Rachel and Leah',
  'The people and elders blessed Ruth to be like Rachel and Leah, who built the house of Israel (Ruth 4:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 4
    AND difficulty_stage = 2
    AND prompt = 'What blessing did the witnesses speak over Ruth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  4,
  2,
  'What did Naomi do with the child after he was born?',
  '["Laid him in her bosom and became nurse to him", "Sent him to the elders", "Returned him to Ruth''s relatives", "Dedicated him at Shiloh immediately"]'::jsonb,
  'Laid him in her bosom and became nurse to him',
  'Naomi took the child, laid him in her bosom, and became his nurse (Ruth 4:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 4
    AND difficulty_stage = 2
    AND prompt = 'What did Naomi do with the child after he was born?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  4,
  2,
  'What house did the witnesses mention because of Perez?',
  '["The house of Judah", "The house of Saul", "The house of Levi", "The house of Gideon"]'::jsonb,
  'The house of Judah',
  'They prayed that Boaz''s house would be like the house of Perez, whom Tamar bore to Judah (Ruth 4:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 4
    AND difficulty_stage = 2
    AND prompt = 'What house did the witnesses mention because of Perez?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  4,
  2,
  'Who said to Naomi, ''Blessed be the LORD, who has not left you without a near kinsman today''?',
  '["The women", "Boaz", "The elders alone", "Ruth"]'::jsonb,
  'The women',
  'The women spoke this blessing to Naomi after the child was born (Ruth 4:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 4
    AND difficulty_stage = 2
    AND prompt = 'Who said to Naomi, ''Blessed be the LORD, who has not left you without a near kinsman today''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  4,
  2,
  'Who was Obed''s son?',
  '["Jesse", "David", "Boaz", "Salmon"]'::jsonb,
  'Jesse',
  'The genealogy says Obed became the father of Jesse (Ruth 4:17, 22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 4
    AND difficulty_stage = 2
    AND prompt = 'Who was Obed''s son?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  4,
  2,
  'Why did Boaz say he was acquiring Ruth along with the field?',
  '["To raise up the name of the dead on his inheritance", "To increase the number of field workers", "To take her back to Moab", "To settle a dispute with the elders"]'::jsonb,
  'To raise up the name of the dead on his inheritance',
  'Boaz said the marriage was connected with preserving the name of the dead on his inheritance (Ruth 4:5, 10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 4
    AND difficulty_stage = 2
    AND prompt = 'Why did Boaz say he was acquiring Ruth along with the field?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  4,
  2,
  'Why did the nearer kinsman refuse to redeem once Ruth was mentioned?',
  '["He feared damaging his own inheritance", "He did not know Naomi", "He was leaving Bethlehem", "He lacked the price of the field"]'::jsonb,
  'He feared damaging his own inheritance',
  'When Boaz added Ruth to the redemption matter, the nearer kinsman said it would mar his own inheritance (Ruth 4:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 4
    AND difficulty_stage = 2
    AND prompt = 'Why did the nearer kinsman refuse to redeem once Ruth was mentioned?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  4,
  3,
  'What does the birth of Obed mean for Naomi''s emptiness?',
  '["Her emptiness is answered with restored family life", "She is told to return again to Moab", "Her inheritance is lost forever", "Her grief is left unchanged"]'::jsonb,
  'Her emptiness is answered with restored family life',
  'The women celebrate that Naomi has a restorer of life and nourisher in old age (Ruth 4:14-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 4
    AND difficulty_stage = 3
    AND prompt = 'What does the birth of Obed mean for Naomi''s emptiness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  4,
  3,
  'What does the gate scene show about redemption in Ruth?',
  '["It is a public and legally witnessed act", "It happens only through private promises", "It depends on military conquest", "It bypasses family inheritance concerns"]'::jsonb,
  'It is a public and legally witnessed act',
  'Boaz settles the matter before elders and witnesses at the gate (Ruth 4:1-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 4
    AND difficulty_stage = 3
    AND prompt = 'What does the gate scene show about redemption in Ruth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  4,
  3,
  'What does the sandal custom emphasize in this chapter?',
  '["The transfer of a legal right in a recognized public way", "A private engagement between Ruth and Boaz", "The end of barley harvest", "Mourning for Elimelech"]'::jsonb,
  'The transfer of a legal right in a recognized public way',
  'The narrator explains the sandal custom as confirmation in matters of redemption and exchange (Ruth 4:7-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 4
    AND difficulty_stage = 3
    AND prompt = 'What does the sandal custom emphasize in this chapter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  4,
  3,
  'What is the effect of ending the book with a genealogy leading to David?',
  '["It ties this household redemption to Israel''s royal future", "It shifts the story away from Naomi entirely", "It proves Boaz was already a king", "It closes the book with an unrelated list"]'::jsonb,
  'It ties this household redemption to Israel''s royal future',
  'The genealogy ends with David, linking the story to the larger history of Israel (Ruth 4:17, 22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 4
    AND difficulty_stage = 3
    AND prompt = 'What is the effect of ending the book with a genealogy leading to David?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  4,
  3,
  'Why do the blessings over Ruth connect her with Rachel, Leah, and Tamar?',
  '["They place her story inside Israel''s larger family history", "They prove she descended from all three women", "They show the elders reject her Moabite background", "They explain why Naomi receives the child"]'::jsonb,
  'They place her story inside Israel''s larger family history',
  'The witnesses speak of Rachel, Leah, and Tamar to frame Ruth''s role within the building of Israel''s house (Ruth 4:11-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 4
    AND difficulty_stage = 3
    AND prompt = 'Why do the blessings over Ruth connect her with Rachel, Leah, and Tamar?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  4,
  3,
  'Why is Ruth praised as better than seven sons?',
  '["Her faithful love has brought restoration beyond ordinary expectation", "She has become ruler over Bethlehem", "She has given Naomi many fields", "She has replaced every tribe in Israel"]'::jsonb,
  'Her faithful love has brought restoration beyond ordinary expectation',
  'The women tell Naomi that Ruth, who loves her, is better to her than seven sons (Ruth 4:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 4
    AND difficulty_stage = 3
    AND prompt = 'Why is Ruth praised as better than seven sons?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  4,
  3,
  'Why is the nearer kinsman''s withdrawal important for Boaz''s role?',
  '["It clears the lawful way for Boaz to redeem", "It proves Boaz had no real claim", "It ends Naomi''s hope permanently", "It removes Ruth from the household line"]'::jsonb,
  'It clears the lawful way for Boaz to redeem',
  'Once the nearer redeemer declines, Boaz can act without violating rightful order (Ruth 4:6, 8-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 4
    AND difficulty_stage = 3
    AND prompt = 'Why is the nearer kinsman''s withdrawal important for Boaz''s role?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  4,
  4,
  'How does Boaz differ from the nearer kinsman in the redemption scene?',
  '["Boaz embraces the cost of preserving the dead man''s name", "Boaz refuses the inheritance to protect himself", "Boaz acts without concern for Ruth", "Boaz rejects the witnesses and elders"]'::jsonb,
  'Boaz embraces the cost of preserving the dead man''s name',
  'The nearer kinsman draws back to protect his inheritance, while Boaz accepts the obligation to preserve the line (Ruth 4:5-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 4
    AND difficulty_stage = 4
    AND prompt = 'How does Boaz differ from the nearer kinsman in the redemption scene?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  4,
  4,
  'How does Ruth 4 complete the movement from emptiness to fullness?',
  '["Naomi''s bereaved household is restored through redemption, marriage, and birth", "Naomi gains grain but loses her family line", "Boaz fails to redeem and the field is lost", "Ruth returns childless to Moab"]'::jsonb,
  'Naomi''s bereaved household is restored through redemption, marriage, and birth',
  'The chapter brings land, marriage, and Obed together as the answer to the losses named in chapter 1 (Ruth 4:3-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 4
    AND difficulty_stage = 4
    AND prompt = 'How does Ruth 4 complete the movement from emptiness to fullness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  4,
  4,
  'How does the Perez genealogy help interpret Ruth''s story?',
  '["It shows this family line belongs within God''s ongoing covenant history", "It proves Boaz inherited the throne immediately", "It replaces Naomi''s family with Judah''s enemies", "It means the nearer kinsman was from Moab"]'::jsonb,
  'It shows this family line belongs within God''s ongoing covenant history',
  'The chapter frames Boaz''s house through Perez and then carries the line to David (Ruth 4:12, 18-22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 4
    AND difficulty_stage = 4
    AND prompt = 'How does the Perez genealogy help interpret Ruth''s story?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  4,
  4,
  'What does Ruth 4 imply about redemption in everyday life?',
  '["It can involve land, marriage, witnesses, and a newborn child all at once", "It happens only in visions and miracles", "It has nothing to do with family obligations", "It excludes public recognition"]'::jsonb,
  'It can involve land, marriage, witnesses, and a newborn child all at once',
  'The chapter resolves the story through ordinary legal and family means that carry deep covenant significance (Ruth 4:1-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 4
    AND difficulty_stage = 4
    AND prompt = 'What does Ruth 4 imply about redemption in everyday life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  4,
  4,
  'What does the women''s blessing reveal about how the book views Ruth?',
  '["She is fully woven into the hope of Israel''s household life", "She remains an outsider after the marriage", "She is praised only for field labor", "She is separated from Naomi once Obed is born"]'::jsonb,
  'She is fully woven into the hope of Israel''s household life',
  'The women praise Ruth''s love and celebrate the child as restoration for Naomi (Ruth 4:14-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 4
    AND difficulty_stage = 4
    AND prompt = 'What does the women''s blessing reveal about how the book views Ruth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  4,
  4,
  'Why is Obed called a restorer of life and nourisher of old age?',
  '["His birth signals the renewal of Naomi''s household future", "He immediately takes over Boaz''s estate management", "He becomes a judge over Israel in the chapter", "He leads Naomi back to Moab"]'::jsonb,
  'His birth signals the renewal of Naomi''s household future',
  'The women''s words interpret Obed as the answer to Naomi''s desolation and aging vulnerability (Ruth 4:14-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 4
    AND difficulty_stage = 4
    AND prompt = 'Why is Obed called a restorer of life and nourisher of old age?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  4,
  4,
  'Why is the city gate the fitting place for the book''s resolution?',
  '["What began as private loss is resolved through public covenant order", "It is the only place where grain could be measured", "It keeps Naomi from hearing the decision", "It allows Ruth to hide her identity"]'::jsonb,
  'What began as private loss is resolved through public covenant order',
  'The gate scene turns household need into recognized communal action with witnesses (Ruth 4:1-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 4
    AND difficulty_stage = 4
    AND prompt = 'Why is the city gate the fitting place for the book''s resolution?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  4,
  5,
  'How does Ruth 4 hold together legal precision and covenant mercy?',
  '["The redemption is carefully witnessed and yet saturated with blessing and kindness", "The law cancels any possibility of compassion", "Mercy appears only after the legal process is ignored", "The elders reject all blessing language"]'::jsonb,
  'The redemption is carefully witnessed and yet saturated with blessing and kindness',
  'The chapter includes exact legal steps, public witnesses, and repeated words of blessing and restoration (Ruth 4:1-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 4
    AND difficulty_stage = 5
    AND prompt = 'How does Ruth 4 hold together legal precision and covenant mercy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  4,
  5,
  'How does the ending of Ruth answer the tensions introduced in chapter 1?',
  '["The widowed, empty household becomes a restored line leading to David", "The famine returns and Bethlehem remains barren", "Ruth departs from Naomi without any lasting bond", "The land is lost and the family name disappears"]'::jsonb,
  'The widowed, empty household becomes a restored line leading to David',
  'The book closes by reversing the losses of chapter 1 through redemption, birth, and genealogy (Ruth 1:20-21; 4:14-22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 4
    AND difficulty_stage = 5
    AND prompt = 'How does the ending of Ruth answer the tensions introduced in chapter 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  4,
  5,
  'How does the public blessing over Ruth deepen the book''s treatment of outsider inclusion?',
  '["A Moabite widow is spoken of in the language of Israel''s founding mothers", "Ruth is blessed only after hiding her origin", "The elders refuse to mention Israel''s family history", "The blessing excludes Ruth from Judah''s line"]'::jsonb,
  'A Moabite widow is spoken of in the language of Israel''s founding mothers',
  'The people bless Ruth in terms of Rachel, Leah, and Tamar, signaling remarkable inclusion in Israel''s story (Ruth 4:11-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 4
    AND difficulty_stage = 5
    AND prompt = 'How does the public blessing over Ruth deepen the book''s treatment of outsider inclusion?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  4,
  5,
  'What does Naomi''s reception of Obed show about the book''s resolution?',
  '["Redemption restores not only property and marriage but also household joy", "Naomi is left outside the new family entirely", "The child belongs only to the elders of Bethlehem", "The story resolves without any change to Naomi''s life"]'::jsonb,
  'Redemption restores not only property and marriage but also household joy',
  'Naomi takes the child and the women celebrate renewed life for her household (Ruth 4:16-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 4
    AND difficulty_stage = 5
    AND prompt = 'What does Naomi''s reception of Obed show about the book''s resolution?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  4,
  5,
  'What theological weight does the statement ''the LORD gave her conception'' carry?',
  '["The final restoration is presented as God''s gift, not merely human success", "It means Ruth had never been married before", "It shows Boaz solved the problem without divine help", "It limits the story''s meaning to Naomi alone"]'::jsonb,
  'The final restoration is presented as God''s gift, not merely human success',
  'After the lawful actions at the gate, the narrator still credits the LORD with giving conception (Ruth 4:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 4
    AND difficulty_stage = 5
    AND prompt = 'What theological weight does the statement ''the LORD gave her conception'' carry?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  4,
  5,
  'Why does the book end with David rather than stopping at Obed?',
  '["It extends household redemption into the horizon of Israel''s kingdom story", "It turns Ruth into a military chronicle", "It denies the importance of Naomi''s restoration", "It shows Obed was unimportant to the family line"]'::jsonb,
  'It extends household redemption into the horizon of Israel''s kingdom story',
  'The genealogy moves beyond Obed and Jesse to David, widening the significance of the story (Ruth 4:17, 22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 4
    AND difficulty_stage = 5
    AND prompt = 'Why does the book end with David rather than stopping at Obed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT
  8,
  4,
  5,
  'Why is the anonymous nearer kinsman narratively effective in chapter 4?',
  '["His withdrawal highlights Boaz as the willing redeemer who preserves the family line", "His name is hidden because he becomes king later", "He serves mainly to replace Boaz in the story", "He proves redemption should remain private"]'::jsonb,
  'His withdrawal highlights Boaz as the willing redeemer who preserves the family line',
  'The nearer redeemer declines, and Boaz stands out as the one who embraces the cost of redemption (Ruth 4:6-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank
  WHERE book_number = 8
    AND chapter = 4
    AND difficulty_stage = 5
    AND prompt = 'Why is the anonymous nearer kinsman narratively effective in chapter 4?'
);
