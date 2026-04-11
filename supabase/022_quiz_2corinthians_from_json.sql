-- ============================================================================
-- LOGOS LIGHT - 2 Corinthians (book 47) quiz questions from quiz-questions/2corinthians.json
-- ============================================================================
-- Idempotent: skips rows that already match (book_number, chapter, difficulty_stage, prompt).
-- ============================================================================

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 1, 1, 'According to 2 Corinthians 1:3, God is described as the Father of what?', '["Father of Mercy","Father of the Nations","Father of War","Father of Science"]'::jsonb, 'Father of Mercy', 'Paul opens by blessing ''the Father of mercies and God of all comfort'' (2 Cor 1:3). This establishes the comfort theme of the letter.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Corinthians 1:3, God is described as the Father of what?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 1, 1, 'In 2 Corinthians 1:8, what kind of hardship did Paul experience in Asia?', '["Extreme pressure beyond his ability to endure","A mild spiritual temptation","Financial difficulties only","Loss of his eyesight"]'::jsonb, 'Extreme pressure beyond his ability to endure', 'Paul writes ''we do not want you to be unaware, brothers, of the affliction we experienced in Asia; for we were so utterly, unbearably crushed'' (2 Cor 1:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'In 2 Corinthians 1:8, what kind of hardship did Paul experience in Asia?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 1, 1, 'What does Paul promise in 2 Corinthians 1:15?', '["To visit the Corinthians twice","To send Timothy with the message","To never write again","To abandon his missionary work"]'::jsonb, 'To visit the Corinthians twice', 'Paul says ''Because I was sure of this, I wanted to come to you first, so that you might have a second experience of grace'' (2 Cor 1:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does Paul promise in 2 Corinthians 1:15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 1, 1, 'What is God described as making firm in our hearts in 2 Corinthians 1:21?', '["His spirit as a seal and pledge","Our earthly possessions","Our political power","Our military strength"]'::jsonb, 'His spirit as a seal and pledge', '''Now it is God who establishes us...and has put his Spirit in our hearts as a guarantee'' (2 Cor 1:21-22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'What is God described as making firm in our hearts in 2 Corinthians 1:21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 1, 1, 'Who does Paul say he followed in his conduct according to 2 Corinthians 1:12?', '["Godly sincerity and grace from God","The wisdom of the Pharisees","Peter''s example exclusively","His mother''s teachings"]'::jsonb, 'Godly sincerity and grace from God', 'Paul states he has ''behaved in the world...with holiness and godly sincerity, not by earthly wisdom but by the grace of God'' (2 Cor 1:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who does Paul say he followed in his conduct according to 2 Corinthians 1:12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 1, 1, 'Why does Paul say he did not come to Corinth as planned in 2 Corinthians 1:23?', '["To spare the church from a painful visit","Because he was afraid of Peter","Because the ship sank","Because he forgot the address"]'::jsonb, 'To spare the church from a painful visit', '''It is to spare you that I refrain from coming to Corinth. Not that we lord it over your faith'' (2 Cor 1:23-24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'Why does Paul say he did not come to Corinth as planned in 2 Corinthians 1:23?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 1, 1, 'Why does Paul say the Corinthians will hold their heads high on the day of the Lord in 2 Corinthians 1:14?', '["Because they boast in Paul and Paul boasts in them","Because they have become wealthy","Because they never sinned","Because the Romans converted"]'::jsonb, 'Because they boast in Paul and Paul boasts in them', '''You can boast of us just as we will boast of you in the day of the Lord Jesus'' (2 Cor 1:14) shows mutual spiritual confidence.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'Why does Paul say the Corinthians will hold their heads high on the day of the Lord in 2 Corinthians 1:14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 1, 2, 'According to 2 Corinthians 1:5-7, how does sharing in Christ''s sufferings benefit believers?', '["Believers overcame through Christ and will be comforted as they suffer","Suffering has no spiritual value","Only leaders should experience hardship","Comfort comes without any struggle"]'::jsonb, 'Believers overcame through Christ and will be comforted as they suffer', '''Just as the sufferings of Christ flow over into our lives, so also through Christ our comfort overflows'' (2 Cor 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 2 Corinthians 1:5-7, how does sharing in Christ''s sufferings benefit believers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 1, 2, 'How does Paul''s comfort in afflictions relate to his ability to comfort others in 2 Corinthians 1:4?', '["The comfort he receives from God enables him to comfort others","He avoids afflictions entirely to appear strong","Comfort comes only through isolation from others","Suffering makes compassion impossible"]'::jsonb, 'The comfort he receives from God enables him to comfort others', '''We are comforted...so that we may be able to comfort those...with the comfort...ourselves received from God'' (2 Cor 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does Paul''s comfort in afflictions relate to his ability to comfort others in 2 Corinthians 1:4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 1, 2, 'In 2 Corinthians 1:3-4, Paul describes God as the source of comfort. What does Paul say comfort is given for?', '["To make us feel superior to others","To enable us to comfort those in any trouble","To ensure we never face affliction again","To prove we are chosen by God"]'::jsonb, 'To enable us to comfort those in any trouble', 'Paul establishes that the comfort we receive from God equips us to comfort others who are suffering the same afflictions.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'In 2 Corinthians 1:3-4, Paul describes God as the source of comfort. What does Paul say comfort is given for?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 1, 2, 'What does the seal of the Holy Spirit signify in 2 Corinthians 1:22?', '["God''s pledge or guarantee of redemption to believers","A tax mark on Christian property","Permission to enter the synagogue","A requirement to become a priest"]'::jsonb, 'God''s pledge or guarantee of redemption to believers', '''Now it is God who establishes us...and has put his Spirit in our hearts as a guarantee'' (2 Cor 1:21-22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does the seal of the Holy Spirit signify in 2 Corinthians 1:22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 1, 2, 'What is the relationship between Paul''s word and God''s yes in 2 Corinthians 1:19-20?', '["All God''s promises find their yes in Christ, making Paul''s preaching reliable","Paul''s word is separate from God''s truth","God''s promises only apply to the wealthy","Christ contradicts Paul''s teachings"]'::jsonb, 'All God''s promises find their yes in Christ, making Paul''s preaching reliable', '''The Son of God, Jesus Christ...was not Yes and No; but in him it is always Yes. For all the promises of God find their Yes in him'' (2 Cor 1:19-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What is the relationship between Paul''s word and God''s yes in 2 Corinthians 1:19-20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 1, 2, 'What is the theological significance of Paul''s afflictions in Asia according to 2 Corinthians 1:9?', '["They taught him to rely on God who raises the dead, not on himself","They proved Paul was unworthy of ministry","They were punishment for specific sins","They demonstrated his superior strength"]'::jsonb, 'They taught him to rely on God who raises the dead, not on himself', '''We felt that we had received the sentence of death. But that was to make us rely not on ourselves but on God who raises the dead'' (2 Cor 1:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What is the theological significance of Paul''s afflictions in Asia according to 2 Corinthians 1:9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 1, 2, 'What problem created a need for Paul to address the Corinthians'' forgiveness in 2 Corinthians 2:5-11?', '["Someone had caused Paul grief and needed to be forgiven by the church","Paul had stolen money from the church","The church had rejected all apostles","Peter had moved to Corinth"]'::jsonb, 'Someone had caused Paul grief and needed to be forgiven by the church', '''If anyone has caused grief...the punishment inflicted on him by the majority is sufficient. Now instead, you ought to forgive and comfort him'' (2 Cor 2:5-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What problem created a need for Paul to address the Corinthians'' forgiveness in 2 Corinthians 2:5-11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 1, 3, 'According to 2 Corinthians 1:12, what does Paul say he can boast about regarding his conduct?', '["His missionary journeys throughout Asia","The holiness and sincerity by which he has conducted himself","How much money he raised for the Jerusalem church","His superiority as an apostle over others"]'::jsonb, 'The holiness and sincerity by which he has conducted himself', 'Paul boasts in his clear conscience regarding his conduct, characterized by holiness and sincerity, particularly in his relations with the Corinthians.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 2 Corinthians 1:12, what does Paul say he can boast about regarding his conduct?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 1, 3, 'How does Paul''s discussion of comfort in 2 Corinthians 1:3-7 establish a theological foundation for grace?', '["Suffering produces endurance, tested character, and hope through God''s comfort","Believers should never experience any pain or hardship","God''s comfort only comes to the wealthy","Suffering proves someone is not a true Christian"]'::jsonb, 'Suffering produces endurance, tested character, and hope through God''s comfort', '''We...are comforted...so that we may be able to comfort those who are in affliction'' (2 Cor 1:4), establishing that shared suffering creates ministry capacity.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Paul''s discussion of comfort in 2 Corinthians 1:3-7 establish a theological foundation for grace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 1, 3, 'In 2 Corinthians 1:23-24, why does Paul say he didn''t return to Corinth?', '["To test their faith","To spare them from distress","Because of poor travel conditions","To focus on ministering in other regions"]'::jsonb, 'To spare them from distress', 'Paul explains that he spared them by not making a painful visit, as he did not want to come to them in sorrow.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Corinthians 1:23-24, why does Paul say he didn''t return to Corinth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 1, 3, 'What does Paul''s explanation of his travel plan change reveal about his relationship with the Corinthians in 2 Corinthians 1:23-24?', '["He prioritized their spiritual growth over his own authority and comfort","He was afraid of their military power","He wanted to abandon Christianity","He was secretly meeting with their enemies"]'::jsonb, 'He prioritized their spiritual growth over his own authority and comfort', '''It is to spare you that I refrain from coming to Corinth...Not that we lord it over your faith; rather, we work with you for your joy'' (2 Cor 1:23-24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Paul''s explanation of his travel plan change reveal about his relationship with the Corinthians in 2 Corinthians 1:23-24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 1, 3, 'What is implied about Paul''s confidence in God in 2 Corinthians 1:8-11?', '["Even when facing seemingly hopeless situations, God''s deliverance demonstrates trustworthiness","Paul had no real faith in God''s power","God only helps wealthy people","Prayer is ineffective in crises"]'::jsonb, 'Even when facing seemingly hopeless situations, God''s deliverance demonstrates trustworthiness', '''We do not want you unaware of our affliction...but he delivered us...Help together on our behalf by prayer also'' (2 Cor 1:8, 10-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is implied about Paul''s confidence in God in 2 Corinthians 1:8-11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 1, 3, 'What sign did the Corinthians need according to 2 Corinthians 1:22?', '["A vision from heaven","The seal of the Holy Spirit as a deposit","A letter of recommendation from other apostles","Healing miracles to confirm His word"]'::jsonb, 'The seal of the Holy Spirit as a deposit', 'Paul describes the Holy Spirit as the seal and deposit (guarantee) that God has given to believers in their hearts.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What sign did the Corinthians need according to 2 Corinthians 1:22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 1, 3, 'Why does Paul emphasize his sincerity in 2 Corinthians 1:12?', '["To counter accusations that he was manipulative and self-serving in his reversals","To prove he was the wealthiest apostle","To claim superiority over all other churches","To announce his retirement from ministry"]'::jsonb, 'To counter accusations that he was manipulative and self-serving in his reversals', '''Our boast is this: the testimony of our conscience that we have behaved in the world...with godly sincerity'' (2 Cor 1:12), addressing questions about his changed travel plans.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul emphasize his sincerity in 2 Corinthians 1:12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 1, 4, 'How does Paul describe the relationship between the afflictions of Christ and the afflictions of believers in 2 Corinthians 1:5?', '["Believers'' afflictions are greater than Christ''s","The sufferings of Christ overflow into believers who follow Him","Christ protected believers from experiencing any affliction","Afflictions are divided unequally among different believers"]'::jsonb, 'The sufferings of Christ overflow into believers who follow Him', 'Paul indicates that participating in Christ''s sufferings abounds through the comfort that also overflows through Christ.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Paul describe the relationship between the afflictions of Christ and the afflictions of believers in 2 Corinthians 1:5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 1, 4, 'How does Paul''s change of travel plans reflect the tension between apostolic authority and pastoral sensitivity in 2 Corinthians 1:15-24?', '["Pastoral care sometimes requires submitting personal desires to others'' spiritual needs for their joy","Apostles should never change their plans under any circumstance","Authority means imposing one''s will on others","Flexibility indicates weakness and untrustworthiness"]'::jsonb, 'Pastoral care sometimes requires submitting personal desires to others'' spiritual needs for their joy', '''We work with you for your joy...Not that we lord it over your faith'' (2 Cor 1:24), showing apostolic authority expressed through humble service.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Paul''s change of travel plans reflect the tension between apostolic authority and pastoral sensitivity in 2 Corinthians 1:15-24?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 1, 4, 'How does Paul''s concept of ''yes and amen'' in 2 Corinthians 1:20 reflect christological understanding of God''s promises?', '["Christ is the fulfillment and confirmation of all divine covenants and promises","Promises are only metaphorical","God contradicts himself through Jesus","Only the Old Testament promises matter"]'::jsonb, 'Christ is the fulfillment and confirmation of all divine covenants and promises', '''All the promises of God find their Yes in [Christ]; that is why it is through him that we say the Amen'' (2 Cor 1:20), showing Christ as the culmination of God''s redemptive plan.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Paul''s concept of ''yes and amen'' in 2 Corinthians 1:20 reflect christological understanding of God''s promises?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 1, 4, 'In 2 Corinthians 1:15-16, what was Paul''s original plan that he changed?', '["To never visit Corinth again","To visit twice-going to Macedonia and coming back through Corinth","To send all his letters instead of visiting","To establish a new church in Corinth"]'::jsonb, 'To visit twice-going to Macedonia and coming back through Corinth', 'Paul had planned a double visit to benefit them by returning again from Macedonia, but had to alter this plan due to circumstances.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'In 2 Corinthians 1:15-16, what was Paul''s original plan that he changed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 1, 4, 'What does the eschatological confidence Paul expresses in 2 Corinthians 1:14 suggest about his assurance of eternal salvation?', '["Confidence in final resurrection and judgment day demonstrates present spiritual assurance in Christ","Believers cannot know their eternal destiny until death","Only Paul would be present at the judgment","The day of judgment will never come"]'::jsonb, 'Confidence in final resurrection and judgment day demonstrates present spiritual assurance in Christ', '''You...know that just as you are ours, so also we are yours in the day of the Lord Jesus'' (2 Cor 1:14), expressing mutual salvation confidence.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does the eschatological confidence Paul expresses in 2 Corinthians 1:14 suggest about his assurance of eternal salvation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 1, 4, 'What is the significance of Paul recording his ''afflictions'' (2 Corinthians 1:8-9) and not being able to recover?', '["It demonstrates his weakness in faith","It shows he should have stayed in Jerusalem","It reveals his dependence on God''s power rather than his own strength","It was preparation for writing the epistle"]'::jsonb, 'It reveals his dependence on God''s power rather than his own strength', 'Paul describes facing pressure beyond his ability to endure, so he despaired even of life itself-this teaches that trust must be in God who raises the dead, not in ourselves.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What is the significance of Paul recording his ''afflictions'' (2 Corinthians 1:8-9) and not being able to recover?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 1, 4, 'What theological paradox does Paul address through his afflictions in Asia in 2 Corinthians 1:8-9?', '["True Christian strength emerges from conscious human weakness and dependence on God","God causes all suffering to punish believers","Christians should never face hardship","Faith makes physical suffering disappear instantly"]'::jsonb, 'True Christian strength emerges from conscious human weakness and dependence on God', '''We felt...sentence of death. But that was to make us rely not on ourselves but on God who raises the dead'' (2 Cor 1:9), establishing that weakness enables faith.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What theological paradox does Paul address through his afflictions in Asia in 2 Corinthians 1:8-9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 1, 5, 'How does Paul''s discussion of his itinerary crisis in 2 Corinthians 1:15-24 exemplify the relationship between apostolic authority, congregational autonomy, and mutual Christian accountability?', '["Authority operates through persuasion and shared joy rather than coercion, establishing lateral accountability","Apostles have absolute unquestioned power over all believers everywhere","Churches have no responsibility to apostolic leadership","Accountability relationships are purely vertical and hierarchical"]'::jsonb, 'Authority operates through persuasion and shared joy rather than coercion, establishing lateral accountability', '''Not that we lord it over your faith; rather, we work with you for your joy'' (2 Cor 1:24), demonstrating collaborative authority model with mutual responsibility.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Paul''s discussion of his itinerary crisis in 2 Corinthians 1:15-24 exemplify the relationship between apostolic authority, congregational autonomy, and mutual Christian accountability?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 1, 5, 'How does Paul''s statement that God ''will deliver us'' (2 Corinthians 1:10) relate to his present sufferings?', '["Future deliverance means present trials should be ignored","God''s future deliverance guarantees His present support and hope","Deliverance can only come through human effort","Paul doubts God''s ability to deliver"]'::jsonb, 'God''s future deliverance guarantees His present support and hope', 'Paul''s confidence in God''s past and present deliverances establishes faith in His future deliverance, providing present confidence amid affliction.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Paul''s statement that God ''will deliver us'' (2 Corinthians 1:10) relate to his present sufferings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 1, 5, 'How does Paul''s treatment of divine comfort through suffering in 2 Corinthians 1:3-7 synthesize themes of theodicy, ecclesiology, and pastoral ministry?', '["Afflictions reveal God''s character, strengthen the church, and equip believers to comfort others in shared humanity","Suffering is meaningless and should be avoided at all costs","God causes suffering to punish specific sins","Individual Christians are isolated in their suffering without community support"]'::jsonb, 'Afflictions reveal God''s character, strengthen the church, and equip believers to comfort others in shared humanity', '''God...comforts us in all our affliction, so that we may be able to comfort those...with the comfort we ourselves receive'' (2 Cor 1:4), integrating personal, communal, and missional dimensions.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Paul''s treatment of divine comfort through suffering in 2 Corinthians 1:3-7 synthesize themes of theodicy, ecclesiology, and pastoral ministry?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 1, 5, 'How does Paul''s use of the term ''afflictions that came upon us in Asia'' (2 Corinthians 1:8) function argumentatively?', '["To excuse his failures as an apostle","To validate his credibility as an apostle who shares in Christ''s sufferings","To prove Asia Minor is not ready for the gospel","To request financial support from the Corinthians"]'::jsonb, 'To validate his credibility as an apostle who shares in Christ''s sufferings', 'By describing severe trials beyond his ability to endure, Paul authenticates his apostolic ministry and his identification with Christ''s sufferings.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Paul''s use of the term ''afflictions that came upon us in Asia'' (2 Corinthians 1:8) function argumentatively?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 1, 5, 'What is the significance of Paul calling God ''the God of all comfort'' (2 Corinthians 1:3)?', '["God only comforts the successful","God''s comforting character is universal and available in all circumstances","Comfort comes only through human relationships","Only wealthy believers experience God''s comfort"]'::jsonb, 'God''s comforting character is universal and available in all circumstances', 'This title establishes God''s comprehensive comfort extending through all types of tribulation and to all His people.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the significance of Paul calling God ''the God of all comfort'' (2 Corinthians 1:3)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 1, 5, 'What pneumatological implications does Paul draw from the sealing of the Spirit in 2 Corinthians 1:21-22 regarding believers'' assurance and eschatological fulfillment?', '["The Spirit''s sealing serves as a present guarantee of future redemption, establishing assured hope","The Holy Spirit is only symbolic and has no actual power","Believers can lose their salvation at any moment","Spiritual sealing only applies to apostles"]'::jsonb, 'The Spirit''s sealing serves as a present guarantee of future redemption, establishing assured hope', '''Now it is God who establishes us...and has given us his Spirit in our hearts as a guarantee'' (2 Cor 1:21-22), where ''guarantee'' (arrabon) means down payment ensuring full payment.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What pneumatological implications does Paul draw from the sealing of the Spirit in 2 Corinthians 1:21-22 regarding believers'' assurance and eschatological fulfillment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 1, 5, 'What theological principle does Paul establish in 2 Corinthians 1:3-7 about suffering and comfort?', '["God removes all suffering from His children immediately","The comfort received becomes the equipment for ministering to others in similar trials","Suffering indicates lack of faith in God","Comfort is reserved only for apostles"]'::jsonb, 'The comfort received becomes the equipment for ministering to others in similar trials', 'Paul establishes a cycle: God comforts us in our affliction, equipping us to comfort others with the same comfort we receive, making suffering purposeful.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What theological principle does Paul establish in 2 Corinthians 1:3-7 about suffering and comfort?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 2, 1, 'According to 2 Corinthians 2:12-13, what opportunity did the Lord open for Paul?', '["A door to preach the gospel of Christ in Troas","An opportunity to become wealthy","A position as High Priest","Command of Roman military forces"]'::jsonb, 'A door to preach the gospel of Christ in Troas', '''When I came to Troas to preach the gospel of Christ and found that the Lord had opened a door for me'' (2 Cor 2:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Corinthians 2:12-13, what opportunity did the Lord open for Paul?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 2, 1, 'According to 2 Corinthians 2:9, what did Paul write the harsh letter to test?', '["The obedience of the Corinthians","The strength of the Romans","The wealth of Jerusalem","The courage of Peter"]'::jsonb, 'The obedience of the Corinthians', '''For this is why I wrote, that I might test whether you are obedient in everything'' (2 Cor 2:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Corinthians 2:9, what did Paul write the harsh letter to test?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 2, 1, 'In 2 Corinthians 2:1, Paul references a decision to make. What decision is this regarding?', '["Whether to return to Jerusalem","Whether to visit Corinth in sorrow","Whether to continue his apostolic ministry","Whether to accept the Jerusalem collection"]'::jsonb, 'Whether to visit Corinth in sorrow', 'Paul decided not to make another painful visit to the Corinthians in sorrow, having already made one difficult visit.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'In 2 Corinthians 2:1, Paul references a decision to make. What decision is this regarding?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 2, 1, 'In 2 Corinthians 2:16, what does Paul ask about regarding being adequate for his apostolic task?', '["Who is adequate for these things?","Who is the richest person?","Who is the strongest warrior?","Who is the best builder?"]'::jsonb, 'Who is adequate for these things?', '''And who is adequate for these things?'' (2 Cor 2:16) expresses Paul''s awareness of the gravity and difficulty of his ministry.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'In 2 Corinthians 2:16, what does Paul ask about regarding being adequate for his apostolic task?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 2, 1, 'What comfort did Titus bring Paul in 2 Corinthians 2:13?', '["Paul had no comfort but departed to find Titus despite the open door","News that Corinth had rejected all apostles","A message that the Romans were attacking","Information that Peter had died"]'::jsonb, 'Paul had no comfort but departed to find Titus despite the open door', '''I had no peace of mind, because I did not find my brother Titus there; so I said goodbye to them and went on to Macedonia'' (2 Cor 2:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'What comfort did Titus bring Paul in 2 Corinthians 2:13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 2, 1, 'What is Paul''s metaphor for spreading knowledge of Christ in 2 Corinthians 2:14?', '["Leading in triumphal procession, spreading the fragrance of knowledge of Him","Fighting a physical war","Building a large building","Planting fields of grain"]'::jsonb, 'Leading in triumphal procession, spreading the fragrance of knowledge of Him', '''But thanks be to God, who in Christ always leads us in triumphal procession, and through us spreads the fragrance'' (2 Cor 2:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'What is Paul''s metaphor for spreading knowledge of Christ in 2 Corinthians 2:14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 2, 1, 'What person did Paul instruct the Corinthians to forgive in 2 Corinthians 2:5-8?', '["Someone who had caused grief and needed comfort from the church","Peter who denied Jesus","The high priest in Damascus","Roman soldiers"]'::jsonb, 'Someone who had caused grief and needed comfort from the church', '''If anyone has caused grief...the punishment inflicted on him by the majority is sufficient. Now instead, you ought to forgive and comfort him'' (2 Cor 2:5-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'What person did Paul instruct the Corinthians to forgive in 2 Corinthians 2:5-8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 2, 2, 'According to 2 Corinthians 2:14, how does Paul metaphorically describe God''s action regarding the knowledge of Christ?', '["God hides the knowledge of Christ","God leads us in triumph and spreads the knowledge of Christ everywhere","God restricts knowledge to selected people","God delays revealing Christ until the end times"]'::jsonb, 'God leads us in triumph and spreads the knowledge of Christ everywhere', 'Paul uses the imagery of a triumphal procession to describe how God leads believers in His triumph and manifests the fragrance of Christ''s knowledge through them.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 2 Corinthians 2:14, how does Paul metaphorically describe God''s action regarding the knowledge of Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 2, 2, 'How does Paul''s lack of peace despite an open ministry door reflect his pastoral priorities in 2 Corinthians 2:12-13?', '["His concern for the Corinthians'' spiritual state superseded immediate ministry opportunities","Open doors were not important to Paul","Paul was afraid to preach","Money was his only concern"]'::jsonb, 'His concern for the Corinthians'' spiritual state superseded immediate ministry opportunities', '''When I came to Troas...the Lord had opened a door...I still had no peace of mind...so I said goodbye and went on to Macedonia'' (2 Cor 2:12-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does Paul''s lack of peace despite an open ministry door reflect his pastoral priorities in 2 Corinthians 2:12-13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 2, 2, 'What does Paul mean by God leading believers ''in triumphal procession'' in the context of 2 Corinthians 2:14?', '["God uses believers as instruments to spread Christ''s victory everywhere they go","Only wealthy people experience God''s victory","Earthly military conquests represent God''s kingdom","Suffering indicates God has abandoned the church"]'::jsonb, 'God uses believers as instruments to spread Christ''s victory everywhere they go', '''But thanks be to God, who in Christ always leads us in triumphal procession, and through us spreads the fragrance'' (2 Cor 2:14), showing believers as participants in Christ''s victory.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul mean by God leading believers ''in triumphal procession'' in the context of 2 Corinthians 2:14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 2, 2, 'What does Paul suggest about Satan''s schemes regarding the man to be forgiven in 2 Corinthians 2:10-11?', '["Satan seeks to gain advantage through excessive punishment and unforgiveness","Forgiveness is harmful to the church","Satan has no power in Christian communities","All punishment should be infinite"]'::jsonb, 'Satan seeks to gain advantage through excessive punishment and unforgiveness', '''Anyone you forgive, I also forgive...so that we will not be outwitted by Satan; for we are not ignorant of his designs'' (2 Cor 2:10-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul suggest about Satan''s schemes regarding the man to be forgiven in 2 Corinthians 2:10-11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 2, 2, 'What is the main purpose of 2 Corinthians 2:5-11?', '["To demand harsh punishment for the offender","To encourage forgiveness and restoration of a repentant wrongdoer","To expose false apostles in the congregation","To establish new church discipline rules"]'::jsonb, 'To encourage forgiveness and restoration of a repentant wrongdoer', 'Paul appeals to the Corinthians to forgive and comfort the man who caused pain, lest he be overwhelmed by excessive sorrow.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What is the main purpose of 2 Corinthians 2:5-11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 2, 2, 'What is the significance of the fragrance metaphor in 2 Corinthians 2:14-16?', '["Gospel spreads awareness of Christ, but reactions differ based on whether people are being saved or perishing","The gospel is only pleasant to some people","God''s word has a bad smell","No one appreciates Christian preaching"]'::jsonb, 'Gospel spreads awareness of Christ, but reactions differ based on whether people are being saved or perishing', '''For we are the aroma of Christ to God...to those being saved and to those perishing...a fragrance from death to death, a fragrance from life to life'' (2 Cor 2:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What is the significance of the fragrance metaphor in 2 Corinthians 2:14-16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 2, 2, 'What primary reason does Paul give for writing the Corinthians with tears in 2 Corinthians 2?', '["To test your obedience","Out of great distress and anguish of heart","To strengthen their faith","To correct false doctrine"]'::jsonb, 'Out of great distress and anguish of heart', 'For out of much affliction and anguish of heart I wrote to you with many tears (2 Corinthians 2:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What primary reason does Paul give for writing the Corinthians with tears in 2 Corinthians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 2, 3, 'According to 2 Corinthians 2, what should the Corinthians do regarding the man who caused sorrow?', '["Reject him permanently","Reaffirm their love for him in forgiveness","Report him to the Jerusalem council","Remove him from all gatherings"]'::jsonb, 'Reaffirm their love for him in forgiveness', 'You ought rather to forgive and comfort him, lest he be overwhelmed by excessive sorrow (2 Corinthians 2:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 2 Corinthians 2, what should the Corinthians do regarding the man who caused sorrow?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 2, 3, 'How does Paul characterize people who preach Christ from wrong motives in 2 Corinthians 2:17?', '["As the majority of preachers","As hucksters (false merchants) of God''s word","As weak in faith but sincere","As helpers of true apostles"]'::jsonb, 'As hucksters (false merchants) of God''s word', 'Paul contrasts those who peddle (hawk) God''s word for profit with those who preach from sincerity and through God''s strength.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Paul characterize people who preach Christ from wrong motives in 2 Corinthians 2:17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 2, 3, 'How does Paul''s instruction about forgiveness in 2 Corinthians 2:5-11 establish a theology of redemptive discipline?', '["Punishment aims at repentance and ultimate restoration to community, not permanent exclusion","Punishment should be permanent and unforgiving","Discipline has no spiritual purpose","Satan''s defeat comes through absolute rejection"]'::jsonb, 'Punishment aims at repentance and ultimate restoration to community, not permanent exclusion', '''The punishment inflicted on him...is sufficient. Now instead, you ought to forgive and comfort him'' (2 Cor 2:6-7), showing punishment as remedial, not retributive.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Paul''s instruction about forgiveness in 2 Corinthians 2:5-11 establish a theology of redemptive discipline?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 2, 3, 'How does the fragrance metaphor in 2 Corinthians 2:14-16 suggest the universal significance of Christian witness?', '["Christian example and message reach everywhere and generate decisive responses toward salvation or judgment","Christianity is irrelevant to most people","God only works through certain people in certain places","Christian witness has no effect on non-believers"]'::jsonb, 'Christian example and message reach everywhere and generate decisive responses toward salvation or judgment', '''Through us spreads the fragrance of the knowledge of him in every place. For we are the aroma of Christ...to those being saved and to those perishing'' (2 Cor 2:14-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does the fragrance metaphor in 2 Corinthians 2:14-16 suggest the universal significance of Christian witness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 2, 3, 'What does Paul mean by referring to the knowledge of Christ as a ''fragrance'' that is either ''unto life'' or ''unto death'' (2 Corinthians 2:15-16)?', '["The gospel saves some but condemns others based on their response","Different churches preach different gospels","Only Jewish believers can recognize Christ","The gospel''s effect depends entirely on God''s predestination"]'::jsonb, 'The gospel saves some but condemns others based on their response', 'Paul indicates that the same gospel of Christ produces different effects: life to those who believe and death to those who reject it.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Paul mean by referring to the knowledge of Christ as a ''fragrance'' that is either ''unto life'' or ''unto death'' (2 Corinthians 2:15-16)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 2, 3, 'What does Paul''s departure from Troas despite an open door suggest about competing loyalties in ministry in 2 Corinthians 2:12-13?', '["Pastoral care for troubled churches sometimes takes precedence over immediate evangelistic opportunities","Missionaries should ignore pastoral responsibilities","Open doors are less important than comfort","Churches should be left to their own problems"]'::jsonb, 'Pastoral care for troubled churches sometimes takes precedence over immediate evangelistic opportunities', '''I found...the Lord had opened a door...yet I had no peace of mind, because I did not find my brother Titus'' (2 Cor 2:12-13), showing pastoral anxiety outweighing open ministry.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Paul''s departure from Troas despite an open door suggest about competing loyalties in ministry in 2 Corinthians 2:12-13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 2, 3, 'What metaphor does Paul use in 2 Corinthians 2:14-16 to describe the preaching of the gospel?', '["A light shining in darkness","The fragrance of the knowledge of Christ in every place","A seed sown in good soil","A building on a foundation"]'::jsonb, 'The fragrance of the knowledge of Christ in every place', 'Now thanks be to God who always leads us in triumph in Christ, and through us diffuses the fragrance of His knowledge in every place (2 Corinthians 2:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What metaphor does Paul use in 2 Corinthians 2:14-16 to describe the preaching of the gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 2, 4, 'How does Paul''s emotional attachment to the Corinthian church, shown in 2 Corinthians 2:12-13, function as a theological statement about pastoral identity?', '["Apostles maintain genuine emotional investment in churches'' welfare as reflection of Christ''s care","Pastors should be detached and emotionally uninvolved","Emotional responses indicate weakness in ministry","Paul was being manipulative"]'::jsonb, 'Apostles maintain genuine emotional investment in churches'' welfare as reflection of Christ''s care', '''I still had no peace of mind...so I said goodbye to them and went on to Macedonia'' (2 Cor 2:13), revealing deep pastoral concern beyond mere duty.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Paul''s emotional attachment to the Corinthian church, shown in 2 Corinthians 2:12-13, function as a theological statement about pastoral identity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 2, 4, 'In 2 Corinthians 2, Paul contrasts the ''aroma'' of the gospel to different groups. What dual outcomes does it produce?', '["Life to those being saved and death to those perishing","Truth to the wise and foolishness to the simple","Joy to believers and anger to unbelievers","Strength to the weak and weakness to the strong"]'::jsonb, 'Life to those being saved and death to those perishing', 'For we are to God the fragrance of Christ among those who are being saved and among those who are perishing. To the one we are the aroma of death unto death, to the other aroma of life unto life (2 Corinthians 2:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'In 2 Corinthians 2, Paul contrasts the ''aroma'' of the gospel to different groups. What dual outcomes does it produce?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 2, 4, 'In 2 Corinthians 2:6-8, what danger does Paul warn against regarding the punishment of the wrongdoer?', '["Not punishing him severely enough","Excessive sorrow that could destroy him","Allowing him to remain permanently in the church","Waiting too long to address the offense"]'::jsonb, 'Excessive sorrow that could destroy him', 'Paul urges them to reaffirm their love for the man and comfort him, lest he be overwhelmed by excessive sorrow and despair.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'In 2 Corinthians 2:6-8, what danger does Paul warn against regarding the punishment of the wrongdoer?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 2, 4, 'What christological significance underlies Paul''s claim about spreading ''the fragrance of knowledge of him'' in 2 Corinthians 2:14?', '["Christ''s victory and presence become tangible and persuasive through believers'' faithful witness","Christ is not really present in the world","Knowledge of Christ is private and personal only","Believers have no role in Christ''s ongoing mission"]'::jsonb, 'Christ''s victory and presence become tangible and persuasive through believers'' faithful witness', '''Thanks be to God, who in Christ always leads us in triumphal procession...through us spreads the fragrance of the knowledge of him'' (2 Cor 2:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'What christological significance underlies Paul''s claim about spreading ''the fragrance of knowledge of him'' in 2 Corinthians 2:14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 2, 4, 'What does Paul''s rhetorical question ''Who is adequate for these things?'' in 2 Corinthians 2:16 communicate about apostolic self-perception?', '["Sufficiency for ministry comes only from God, not from human qualification or merit","Apostles have inherent superior abilities","Adequacy comes from wealth and education","Some people are naturally suited for ministry without God''s help"]'::jsonb, 'Sufficiency for ministry comes only from God, not from human qualification or merit', '''And who is adequate for these things?'' (2 Cor 2:16) introduces Paul''s answer that adequacy comes from God alone (2 Cor 3:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Paul''s rhetorical question ''Who is adequate for these things?'' in 2 Corinthians 2:16 communicate about apostolic self-perception?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 2, 4, 'What does Paul''s statement about ''forgiving in the person of Christ'' (2 Corinthians 2:10) imply?', '["Forgiveness is optional and each person decides","Forgiveness reflects Christ''s character and reconciles us to His purpose","Only church leaders can grant forgiveness","God cannot forgive what men refuse to forgive"]'::jsonb, 'Forgiveness reflects Christ''s character and reconciles us to His purpose', 'Acting in Christ''s person means exercising forgiveness that aligns with Christ''s character and extends His grace and redemptive purpose.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Paul''s statement about ''forgiving in the person of Christ'' (2 Corinthians 2:10) imply?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 2, 4, 'Why does Paul say Satan might gain an advantage over them through unforgiveness (2 Corinthians 2:11)?', '["Satan cannot be harmed by forgiveness","Division and bitterness from unforgiveness give Satan opportunity to work","Forgiveness strengthens Satan''s position in the church","Satan is defeated regardless of human attitudes"]'::jsonb, 'Division and bitterness from unforgiveness give Satan opportunity to work', 'Paul warns that Satan exploits unforgiveness and discord in the church, as these emotional states and divisions are his tools.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul say Satan might gain an advantage over them through unforgiveness (2 Corinthians 2:11)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 2, 5, 'How does Paul''s emphasis on forgiveness in 2 Corinthians 2:5-11 anticipate his later teaching about not being ''unequally yoked'' with unbelievers?', '["He is recommending the removal of all believers who sin","He establishes the redemptive intent within the community first, before addressing external associations","Forgiveness and separation are contradictory principles","This passage has no connection to community relationships"]'::jsonb, 'He establishes the redemptive intent within the community first, before addressing external associations', 'Paul addresses restoring a believer through forgiveness within the church before later addressing the boundary between church and world.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Paul''s emphasis on forgiveness in 2 Corinthians 2:5-11 anticipate his later teaching about not being ''unequally yoked'' with unbelievers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 2, 5, 'How does Paul''s treatment of forgiveness, pastoral concern, and apostolic adequacy in 2 Corinthians 2 develop a comprehensive ecclesiology that integrates discipline, care, and dependence on the Spirit?', '["The church operates as a community where redemptive discipline, mutual care, and Spirit-dependence interconnect","Churches should operate independently of God''s guidance","Discipline and forgiveness are incompatible goals","Apostolic leadership requires self-sufficiency"]'::jsonb, 'The church operates as a community where redemptive discipline, mutual care, and Spirit-dependence interconnect', 'Forgiveness to restore (2:6-11), pastoral concern for churches (2:12-13), and Spirit-dependence for adequacy (2:16) form integrated ecclesiology of redemptive community.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Paul''s treatment of forgiveness, pastoral concern, and apostolic adequacy in 2 Corinthians 2 develop a comprehensive ecclesiology that integrates discipline, care, and dependence on the Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 2, 5, 'How does Paul''s triumphal procession metaphor (2 Corinthians 2:14) function to address Corinthian concerns about his apostolic authority?', '["It proves Paul''s authority exceeds other apostles","It grounds Paul''s authority in God''s victory and leadership, not personal power","It demonstrates Corinthian inferiority to other churches","It announces Paul''s impending return to their city"]'::jsonb, 'It grounds Paul''s authority in God''s victory and leadership, not personal power', 'The metaphor shifts focus from Paul''s personal qualifications to God leading him in His triumph, establishing apostolic authority through divine commission rather than credentials.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Paul''s triumphal procession metaphor (2 Corinthians 2:14) function to address Corinthian concerns about his apostolic authority?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 2, 5, 'What does Paul mean in 2 Corinthians 2:17 by saying he speaks ''in the presence of God'' and ''through Christ''?', '["Only Paul can speak with God''s authority","His preaching is accountable to God and done through Christ''s power and authority","God is literally present in the room when he speaks","Other preachers do not speak before God"]'::jsonb, 'His preaching is accountable to God and done through Christ''s power and authority', 'Paul establishes that his ministry operates under God''s authority and surveillance, conducted through Christ''s power, which guarantees sincerity.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Paul mean in 2 Corinthians 2:17 by saying he speaks ''in the presence of God'' and ''through Christ''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 2, 5, 'What is the relationship between Paul''s pastoral decision not to visit in sorrow (2:1) and his theology of comfort and resurrection in chapters 1?', '["They are unrelated topics in separate arguments","His comfort in affliction enables him to make decisions that spare others from sorrow","Resurrection theology requires separation from local churches","Sorrow is forbidden for all Christians in all situations"]'::jsonb, 'His comfort in affliction enables him to make decisions that spare others from sorrow', 'Paul''s personal experience of God''s comfort and the suffering-comfort cycle shapes his pastoral sensitivity to spare the Corinthians from unnecessary pain.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the relationship between Paul''s pastoral decision not to visit in sorrow (2:1) and his theology of comfort and resurrection in chapters 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 2, 5, 'What pedagogical purpose does Paul''s reversal in emotional response-from open door to anxiety-serve in establishing the tone and agenda of his second letter in 2 Corinthians 2:12-13?', '["It establishes that apostolic leadership prioritizes relationship healing over numerical expansion, reorienting readers'' expectations","Paul wanted to avoid preaching the gospel","The letter''s concerns are primarily administrative","Paul''s emotions are unreliable guides"]'::jsonb, 'It establishes that apostolic leadership prioritizes relationship healing over numerical expansion, reorienting readers'' expectations', 'The narrative of leaving Troas despite open door frames the letter''s emphasis on reconciliation (2:5-11) and defense of Paul''s ministry integrity.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What pedagogical purpose does Paul''s reversal in emotional response-from open door to anxiety-serve in establishing the tone and agenda of his second letter in 2 Corinthians 2:12-13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 2, 5, 'What theological principle does Paul establish in 2 Corinthians 2:16 regarding the effectiveness of apostolic preaching?', '["The gospel''s power depends on the speaker''s eloquence","The same message produces opposite effects in different recipients based on their response","Only those genuinely chosen by God understand the message","The effectiveness is proportional to the suffering of the apostle"]'::jsonb, 'The same message produces opposite effects in different recipients based on their response', 'To the one we are the aroma of death unto death, and to the other aroma of life unto life. And who is sufficient for these things? (2 Corinthians 2:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What theological principle does Paul establish in 2 Corinthians 2:16 regarding the effectiveness of apostolic preaching?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 3, 1, 'According to 2 Corinthians 3:17, what is associated with the Spirit of the Lord?', '["Freedom","Bondage","Fear","Confusion"]'::jsonb, 'Freedom', '''Now the Lord is the Spirit, and where the Spirit of the Lord is, there is freedom'' (2 Cor 3:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Corinthians 3:17, what is associated with the Spirit of the Lord?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 3, 1, 'According to 2 Corinthians 3:18, what happens when believers behold the Lord''s glory with unveiled faces?', '["They are transformed into the same image from glory to glory","They face judgment and condemnation","They become ill and weak","Nothing changes in them"]'::jsonb, 'They are transformed into the same image from glory to glory', '''And we all...beholding the glory of the Lord, are being transformed into the same image from one degree of glory to another'' (2 Cor 3:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Corinthians 3:18, what happens when believers behold the Lord''s glory with unveiled faces?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 3, 1, 'According to 2 Corinthians 3:6, what does the Spirit do in contrast to the letter?', '["The Spirit gives life while the letter kills","The letter gives life while the Spirit condemns","Neither has any effect","Both give death"]'::jsonb, 'The Spirit gives life while the letter kills', '''He has made us competent as ministers...of the new covenant...for the letter kills, but the Spirit gives life'' (2 Cor 3:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Corinthians 3:6, what does the Spirit do in contrast to the letter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 3, 1, 'What does Paul claim is written on the hearts of believers in 2 Corinthians 3:2-3?', '["The epistle of Christ written by the Spirit, not with ink but on tablets of human hearts","The law written on stone tablets","Earthly contracts and agreements","Secret government codes"]'::jsonb, 'The epistle of Christ written by the Spirit, not with ink but on tablets of human hearts', '''You yourselves are our letter...written not with ink but with the Spirit of the living God, not on tablets of stone but on tablets of human hearts'' (2 Cor 3:2-3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does Paul claim is written on the hearts of believers in 2 Corinthians 3:2-3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 3, 1, 'What does Paul say happened to Moses'' face when he received the law in 2 Corinthians 3:7?', '["His face shone with glory so bright the Israelites could not look at it","He became pale and sickly","His face turned to stone","Nothing special happened to his face"]'::jsonb, 'His face shone with glory so bright the Israelites could not look at it', '''The ministry of death...came with glory, so that the Israelites could not gaze at Moses'' face'' (2 Cor 3:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does Paul say happened to Moses'' face when he received the law in 2 Corinthians 3:7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 3, 1, 'What does Paul say he does not need in 2 Corinthians 3:1?', '["The Holy Spirit","Letters of recommendation","The support of the church","A written commission from Jerusalem"]'::jsonb, 'Letters of recommendation', 'Paul states he doesn''t need letters of commendation, unlike some others who brought such credentials to Corinth.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does Paul say he does not need in 2 Corinthians 3:1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 3, 1, 'What is Paul comparing when he mentions old and new covenants in 2 Corinthians 3:14?', '["The law given on Sinai with the gospel of Christ through the Spirit","Two different religions","Two different countries","Two different languages"]'::jsonb, 'The law given on Sinai with the gospel of Christ through the Spirit', '''For to this day the same veil remains when the old covenant is read...for only in Christ is it taken away'' (2 Cor 3:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'What is Paul comparing when he mentions old and new covenants in 2 Corinthians 3:14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 3, 2, 'How does Paul''s assertion that the Spirit gives life relate to his description of the law in 2 Corinthians 3:6?', '["The law alone cannot produce spiritual life-only the Spirit operating through grace activates life-giving transformation","The law independently produces spiritual life","Neither the law nor the Spirit has any effect","The Spirit contradicts the law"]'::jsonb, 'The law alone cannot produce spiritual life-only the Spirit operating through grace activates life-giving transformation', '''The letter kills, but the Spirit gives life'' (2 Cor 3:6). The law reveals sin and condemnation; the Spirit transforms hearts through grace.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does Paul''s assertion that the Spirit gives life relate to his description of the law in 2 Corinthians 3:6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 3, 2, 'How does Paul''s image of the veil in 2 Corinthians 3:13-16 explain the spiritual condition of those who reject Christ?', '["A veil of hardness prevents understanding of scripture and Christ even when attempting to interpret the law","People naturally understand God perfectly without Christ","The law clearly points to Christ in obvious ways","Believers have the same mental limitations as non-believers"]'::jsonb, 'A veil of hardness prevents understanding of scripture and Christ even when attempting to interpret the law', '''Even to this day when Moses is read, a veil covers their hearts...they are reading the old covenant...and miss the point that is fulfilled in Christ'' (2 Cor 3:14-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does Paul''s image of the veil in 2 Corinthians 3:13-16 explain the spiritual condition of those who reject Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 3, 2, 'In 2 Corinthians 3:2-3, what does Paul claim the Corinthians themselves are as evidence of his apostolic legitimacy?', '["Living epistles written by the Spirit in their hearts","Written documents in his personal files","Witnesses who testified falsely about him","Examples of how not to follow Christ"]'::jsonb, 'Living epistles written by the Spirit in their hearts', 'Paul argues that the Corinthians'' transformed lives, written by the Spirit on their hearts, are his letter of recommendation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'In 2 Corinthians 3:2-3, what does Paul claim the Corinthians themselves are as evidence of his apostolic legitimacy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 3, 2, 'What contrast does Paul draw between the ''letter'' and the ''Spirit'' in 2 Corinthians 3:6?', '["The letter is true and the Spirit is false","The letter kills while the Spirit gives life","They are identical in function and effect","The Spirit is found only in Old Testament times"]'::jsonb, 'The letter kills while the Spirit gives life', 'Paul contrasts the dead, external law with the life-giving power of the Holy Spirit who transforms believers from within.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What contrast does Paul draw between the ''letter'' and the ''Spirit'' in 2 Corinthians 3:6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 3, 2, 'What does Paul mean by contrasting the ministry of death and condemnation with a more glorious ministry in 2 Corinthians 3:7-11?', '["The law brought guilt and judgment, but the gospel brings righteousness and life through grace","The law is evil and the gospel is good in all ways","Both are equally glorious","Neither brings any glory to God"]'::jsonb, 'The law brought guilt and judgment, but the gospel brings righteousness and life through grace', '''If the ministry of condemnation has glory...much more will the ministry of the Spirit have glory'' (2 Cor 3:8-9), where the gospel surpasses the law.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul mean by contrasting the ministry of death and condemnation with a more glorious ministry in 2 Corinthians 3:7-11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 3, 2, 'What does Paul say about the Corinthian believers being ''written'' in 2 Corinthians 3:2-3?', '["They are inscribed on tablets of stone","They are known and read by all people","They are recorded in the Book of Life","They are marked with God''s seal"]'::jsonb, 'They are known and read by all people', 'You are our epistle written in our hearts, known and read by all men; clearly you are an epistle of Christ, ministered by us (2 Corinthians 3:2-3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say about the Corinthian believers being ''written'' in 2 Corinthians 3:2-3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 3, 2, 'What is the significance of transformation ''from glory to glory'' in 2 Corinthians 3:18?', '["Believers undergo progressive, continuous transformation toward Christ''s likeness throughout their Christian life","Transformation happens all at once at conversion","Believers never change or grow spiritually","Transformation is external only"]'::jsonb, 'Believers undergo progressive, continuous transformation toward Christ''s likeness throughout their Christian life', '''And we all...are being transformed into the same image from one degree of glory to another...for this comes from the Lord, who is the Spirit'' (2 Cor 3:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What is the significance of transformation ''from glory to glory'' in 2 Corinthians 3:18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 3, 3, 'According to 2 Corinthians 3:14-16, what happens when someone turns to the Lord?', '["The veil remains impossible to remove","The veil is taken away and one can behold the Lord''s glory","They must still observe Jewish dietary laws","Turning to the Lord and removing the veil are unrelated"]'::jsonb, 'The veil is taken away and one can behold the Lord''s glory', 'Paul teaches that coming to Christ removes the spiritual blindness (veil) that prevented understanding God''s glory and the fulfillment in Jesus.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 2 Corinthians 3:14-16, what happens when someone turns to the Lord?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 3, 3, 'How does Paul''s description of believers as Christ''s written epistle in 2 Corinthians 3:2-3 reconceptualize the nature of apostolic ministry and validation?', '["The Corinthians'' changed character serves as visible authentication of Paul''s apostolic legitimacy beyond written credentials","Apostles authenticate themselves solely through letters and documents","The lives of believers have no connection to apostolic authority","Written documentation is the only valid form of authority"]'::jsonb, 'The Corinthians'' changed character serves as visible authentication of Paul''s apostolic legitimacy beyond written credentials', '''You are our letter...everyone can read and recognize these characteristics. You show that you are a letter from Christ...written not with ink but with the Spirit'' (2 Cor 3:2-3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Paul''s description of believers as Christ''s written epistle in 2 Corinthians 3:2-3 reconceptualize the nature of apostolic ministry and validation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 3, 3, 'How does the veil imagery in 2 Corinthians 3:14-16 function theologically in explaining both Jewish unbelief and Christian faith?', '["Spiritual blindness separates believers from non-believers regarding Christ, but removal of the veil through faith enables transformed understanding","All people naturally understand Jesus as the Messiah","The law and Christ are equally clear to all people","Understanding Christ requires no transformation of perspective"]'::jsonb, 'Spiritual blindness separates believers from non-believers regarding Christ, but removal of the veil through faith enables transformed understanding', '''Their minds were hardened...Even to this day when Moses is read, a veil covers their hearts. But when one turns to the Lord, the veil is removed'' (2 Cor 3:14-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does the veil imagery in 2 Corinthians 3:14-16 function theologically in explaining both Jewish unbelief and Christian faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 3, 3, 'In 2 Corinthians 3, Paul contrasts two covenants. What distinguishes the new covenant from the old?', '["The new covenant is written on stone tablets","The new covenant is written on hearts by the Spirit","The new covenant requires more obedience","The new covenant is only for the Gentiles"]'::jsonb, 'The new covenant is written on hearts by the Spirit', 'You are clearly an epistle of Christ...written not with ink but by the Spirit of the living God, not on tablets of stone but on tablets of flesh, that is, of the heart (2 Corinthians 3:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Corinthians 3, Paul contrasts two covenants. What distinguishes the new covenant from the old?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 3, 3, 'What does Paul mean by ''the glory of the Lord is being transformed from glory to glory'' in 2 Corinthians 3:18?', '["Different churches have different levels of God''s presence","As we behold Jesus, we are progressively transformed into His image","God''s glory increases over time in the universe","Only spiritual leaders can be transformed by God''s glory"]'::jsonb, 'As we behold Jesus, we are progressively transformed into His image', 'Paul describes a progressive transformation where, by beholding the Lord''s glory unveiled in Christ, we are continuously conformed to His image by the Spirit.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Paul mean by ''the glory of the Lord is being transformed from glory to glory'' in 2 Corinthians 3:18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 3, 3, 'What does Paul''s contrast between the fading glory of the old covenant and the permanent, surpassing glory of the new covenant communicate about progressive revelation in 2 Corinthians 3:7-11?', '["God''s redemptive plan develops progressively from law to gospel, with each phase revealing more perfect grace","God''s revelation ended with the law","The gospel contradicts previous revelation","All covenants are equally valid for believers today"]'::jsonb, 'God''s redemptive plan develops progressively from law to gospel, with each phase revealing more perfect grace', '''The ministry of the Spirit is far more glorious...For the one fades away and the other steadfastly abides'' (2 Cor 3:8-11), showing gospel as fulfillment exceeding the law.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Paul''s contrast between the fading glory of the old covenant and the permanent, surpassing glory of the new covenant communicate about progressive revelation in 2 Corinthians 3:7-11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 3, 3, 'What is the significance of the veil that Moses put on his face (2 Corinthians 3:13) in Paul''s argument?', '["Moses wanted to protect his face from sun damage","It symbolizes how God hides His glory from humans","It represents the concealment of the fading glory of the old covenant from Israel","Veils were required for all Hebrew priests"]'::jsonb, 'It represents the concealment of the fading glory of the old covenant from Israel', 'Paul interprets the veil as meaning Moses hid the fact that the glory of the old covenant was fading, as it was being superseded by the new covenant.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the significance of the veil that Moses put on his face (2 Corinthians 3:13) in Paul''s argument?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 3, 4, 'How does Paul''s distinction between the old and new covenants in 2 Corinthians 3:7-11 establish the superiority of his ministry?', '["The old covenant was completely false and worthless","Even though the old covenant had glory, the new covenant surpasses it in glory and permanence","Both covenants are equally binding today","The new covenant has less glory than the old"]'::jsonb, 'Even though the old covenant had glory, the new covenant surpasses it in glory and permanence', 'Paul acknowledges the old covenant''s glory but argues the new covenant has greater, more enduring glory because it is written on hearts by the Spirit.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Paul''s distinction between the old and new covenants in 2 Corinthians 3:7-11 establish the superiority of his ministry?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 3, 4, 'How does Paul''s theology of transformation in 2 Corinthians 3:18 function as a theodicy addressing the delayed parousia and present sanctification in ongoing time?', '["Progressive Spirit-wrought transformation provides present sanctification while awaiting final transformation at resurrection","Christians must achieve perfection immediately through their own effort","The Spirit only works in religious buildings or official ceremonies","Christians cannot experience spiritual growth until after death"]'::jsonb, 'Progressive Spirit-wrought transformation provides present sanctification while awaiting final transformation at resurrection', '''We are being [progressively] transformed into the same image from one degree of glory to another...for this comes from the Lord, who is the Spirit'' (2 Cor 3:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Paul''s theology of transformation in 2 Corinthians 3:18 function as a theodicy addressing the delayed parousia and present sanctification in ongoing time?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 3, 4, 'In 2 Corinthians 3:4-6, why is Paul''s confidence founded in God rather than in himself?', '["He is incapable of competence","His competence as a minister comes from God through Christ","Self-confidence is always wrong","Competence is achieved through human effort alone"]'::jsonb, 'His competence as a minister comes from God through Christ', 'Paul establishes that the right foundation for apostolic confidence is not personal qualifications but competence given by God as a minister of the new covenant.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'In 2 Corinthians 3:4-6, why is Paul''s confidence founded in God rather than in himself?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 3, 4, 'What does the progression from written code to Spirit-animation in 2 Corinthians 3:6 suggest about the nature of Christian ethics and obedience?', '["Genuine obedience flows from internal Spirit-empowerment producing willing love, not external legal compliance","Christians should have no moral law or ethics","The Spirit opposes moral tradition and law","Legal compliance is more important than transformation of heart"]'::jsonb, 'Genuine obedience flows from internal Spirit-empowerment producing willing love, not external legal compliance', '''The letter kills, but the Spirit gives life'' (2 Cor 3:6). Spirit-animated obedience transforms the heart, not merely constrains external behavior.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does the progression from written code to Spirit-animation in 2 Corinthians 3:6 suggest about the nature of Christian ethics and obedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 3, 4, 'What is the primary theological significance of the veil that Moses wore in 2 Corinthians 3:12-18?', '["It symbolized the mystery of God''s nature","It represents the limitation of the old covenant that is removed in Christ","It served as protection from God''s glory","It indicated Moses'' authority over Israel"]'::jsonb, 'It represents the limitation of the old covenant that is removed in Christ', 'But we all, with unveiled face, beholding as in a mirror the glory of the Lord, are being transformed into the same image from glory to glory, just as by the Spirit of the Lord (2 Corinthians 3:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'What is the primary theological significance of the veil that Moses wore in 2 Corinthians 3:12-18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 3, 4, 'What is the role of boldness in Paul''s ministry argument in 2 Corinthians 3:12?', '["Boldness proves spiritual maturity in all cases","Because of the hope of the new covenant, Paul speaks with great boldness","Boldness is a sign of arrogance and should be avoided","Paul actually recommends hesitation and uncertainty"]'::jsonb, 'Because of the hope of the new covenant, Paul speaks with great boldness', 'Paul''s confidence to speak plainly (not using veiled speech) flows from hope in the superior fullness of the new covenant.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'What is the role of boldness in Paul''s ministry argument in 2 Corinthians 3:12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 3, 4, 'What pneumatological claim does Paul make in 2 Corinthians 3:17 and how does it challenge conventional Jewish theology?', '["Identifying the Lord with the Spirit challenges traditional monotheism distinctions and establishes the Spirit as the Lord''s personal presence","The Spirit and the Lord are completely separate entities","The Spirit has less authority than the Lord","Paul''s statement creates confusion about Christian theology"]'::jsonb, 'Identifying the Lord with the Spirit challenges traditional monotheism distinctions and establishes the Spirit as the Lord''s personal presence', '''Now the Lord is the Spirit'' (2 Cor 3:17) is a remarkable identification that equates the Spirit with the Lord''s personal transformative power.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'What pneumatological claim does Paul make in 2 Corinthians 3:17 and how does it challenge conventional Jewish theology?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 3, 5, 'According to 2 Corinthians 3, how does the ''glory'' of the new covenant compare to the old?', '["The old covenant had greater glory but it has passed away","The new covenant has surpassing glory that makes the old appear as having no glory","Both covenants contain equal glory but different expressions","The comparison cannot be made because they serve different purposes"]'::jsonb, 'The new covenant has surpassing glory that makes the old appear as having no glory', 'Even what was made glorious has no glory now in comparison with the surpassing glory (2 Corinthians 3:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 2 Corinthians 3, how does the ''glory'' of the new covenant compare to the old?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 3, 5, 'How does Paul synthesize concepts of apostolic validation, covenantal fulfillment, and spiritual transformation in 2 Corinthians 3 to develop a theology of Christian freedom and progressive sanctification?', '["Believers validated by Spirit transformation, operating under new covenant superiority, participate in progressive glory transformation expressing gospel freedom","Law and gospel are equally binding on Christians","Apostolic ministry has no connection to believers'' transformation","Freedom from law leads to spiritual chaos and immorality"]'::jsonb, 'Believers validated by Spirit transformation, operating under new covenant superiority, participate in progressive glory transformation expressing gospel freedom', 'The chapter integrates apostolic validation (3:2-3), covenantal contrast (3:7-11), veil removal (3:14-16), Spirit identity (3:17), and transformative freedom (3:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Paul synthesize concepts of apostolic validation, covenantal fulfillment, and spiritual transformation in 2 Corinthians 3 to develop a theology of Christian freedom and progressive sanctification?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 3, 5, 'How does Paul''s argument about the veil (2 Corinthians 3:13-16) function as a response to Corinthian criticisms about his letters versus his personal presence?', '["The veil has no connection to his communication style","Paul parallels the veil obscuring Moses'' fading glory with critics'' misunderstanding of his letters and authority","Writing is inherently clearer than face-to-face conversation","Paul admits his letters are confusing and should be ignored"]'::jsonb, 'Paul parallels the veil obscuring Moses'' fading glory with critics'' misunderstanding of his letters and authority', 'Paul''s veil metaphor suggests that just as Israel could not perceive the ending of the old covenant, some Corinthians fail to perceive the validity of his apostolic message.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Paul''s argument about the veil (2 Corinthians 3:13-16) function as a response to Corinthian criticisms about his letters versus his personal presence?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 3, 5, 'How does Paul''s theology of the new covenant in 2 Corinthians 3 construct his defense against accusations that his ministry lacks authority?', '["New covenant theology proves all other apostles are false","If the new covenant surpasses the old in glory, then Paul''s ministry of the Spirit possesses greater authority than law-based alternatives","Authority is determined by formal credentials alone","Paul avoids engaging with the authority question"]'::jsonb, 'If the new covenant surpasses the old in glory, then Paul''s ministry of the Spirit possesses greater authority than law-based alternatives', 'By establishing the new covenant''s superiority, Paul implicitly claims greater authority for his Spirit-centered ministry compared to any law-based or authority-credential approach.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Paul''s theology of the new covenant in 2 Corinthians 3 construct his defense against accusations that his ministry lacks authority?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 3, 5, 'What is the polemical and constructive function of Paul''s law-gospel typology in 2 Corinthians 3 regarding both Jewish opponents and Christian Corinthians struggling with their identity?', '["The contrast establishes both that the gospel supersedes the law and that Christian freedom operates within transformed community identity","The law remains equally binding on Christians as on Jews","Paul is arguing for adoption of Jewish practices by Christians","The law has no spiritual significance whatsoever"]'::jsonb, 'The contrast establishes both that the gospel supersedes the law and that Christian freedom operates within transformed community identity', 'Paul argues the new covenant is more glorious (3:8-11), that understanding requires the veil to be removed (3:14-16), and that freedom characterizes Spirit-led life (3:17-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the polemical and constructive function of Paul''s law-gospel typology in 2 Corinthians 3 regarding both Jewish opponents and Christian Corinthians struggling with their identity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 3, 5, 'What is the theological significance of the transformation ''from glory to glory'' being accomplished ''by the Spirit of the Lord'' (2 Corinthians 3:18)?', '["Spiritual transformation is accomplished by human effort and willpower","The Spirit of the Lord continuously works to conform believers to Christ''s image","Transformation happens only once at conversion and then stops","God''s glory is external to the believer"]'::jsonb, 'The Spirit of the Lord continuously works to conform believers to Christ''s image', 'Paul attributes progressive sanctification to the continuous working of God''s Spirit, not to human achievement, establishing spiritual transformation as ongoing and divine.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the theological significance of the transformation ''from glory to glory'' being accomplished ''by the Spirit of the Lord'' (2 Corinthians 3:18)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 3, 5, 'What transformation process does Paul describe in 2 Corinthians 3:18, and what is its mechanism?', '["Believers are transformed instantly and completely upon conversion","Believers are gradually transformed into Christ''s image through beholding His glory by the Spirit","Transformation occurs only through rigorous obedience to the law","The Spirit transforms unbelievers without their knowledge or consent"]'::jsonb, 'Believers are gradually transformed into Christ''s image through beholding His glory by the Spirit', 'But we all, with unveiled face, beholding as in a mirror the glory of the Lord, are being transformed into the same image from glory to glory, just as by the Spirit of the Lord (2 Corinthians 3:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What transformation process does Paul describe in 2 Corinthians 3:18, and what is its mechanism?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 4, 1, 'According to 2 Corinthians 4:16, what does Paul say happens while the outward self is wasting away?', '["The inner self is renewed day by day","The entire spirit dies","Nothing happens spiritually","Physical strength increases"]'::jsonb, 'The inner self is renewed day by day', '''Though outwardly we are wasting away, yet inwardly we are being renewed day by day'' (2 Cor 4:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Corinthians 4:16, what does Paul say happens while the outward self is wasting away?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 4, 1, 'According to 2 Corinthians 4:4, what has the god of this age blinded?', '["The minds of unbelievers to the light of the gospel of the glory of Christ","Only church leaders","All believers fail to see clearly","The minds of all people equally"]'::jsonb, 'The minds of unbelievers to the light of the gospel of the glory of Christ', '''The god of this age has blinded the minds of unbelievers, so they cannot see the light of the gospel of the glory of Christ'' (2 Cor 4:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Corinthians 4:4, what has the god of this age blinded?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 4, 1, 'In 2 Corinthians 4:1, what does Paul say he received according to God''s mercy?', '["Wealth and status","This ministry","A mandate to judge others","Permission to stop preaching"]'::jsonb, 'This ministry', 'Paul recalls that having received mercy from God, he has this ministry as a gift, motivating his perseverance.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'In 2 Corinthians 4:1, what does Paul say he received according to God''s mercy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 4, 1, 'What does Paul advise believers to focus on in 2 Corinthians 4:18?', '["Focus on the unseen eternal rather than the seen temporary things","Focus only on material and earthly concerns","Ignore both physical and spiritual reality","Focus on tribulation and suffering"]'::jsonb, 'Focus on the unseen eternal rather than the seen temporary things', '''We fix our eyes not on what is seen, but on what is unseen. For what is seen is temporary, but what is unseen is eternal'' (2 Cor 4:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does Paul advise believers to focus on in 2 Corinthians 4:18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 4, 1, 'What does Paul mean by ''treasure in earthen vessels'' in 2 Corinthians 4:7?', '["The surpassing power of God is contained in weak human bodies/apostles","Wealth should be buried in pottery vases","Christians should be strong and powerful","God''s power is not really accessible to humans"]'::jsonb, 'The surpassing power of God is contained in weak human bodies/apostles', '''We have this treasure in jars of clay to show that this all-surpassing power is from God and not from us'' (2 Cor 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does Paul mean by ''treasure in earthen vessels'' in 2 Corinthians 4:7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 4, 1, 'What does Paul say about earthly troubles in relation to eternal glory in 2 Corinthians 4:17?', '["Light momentary troubles are achieving an eternal weight of glory beyond all comparison","Earthly troubles are permanent and final","There is no eternal glory to hope for","Troubles and glory cannot coexist"]'::jsonb, 'Light momentary troubles are achieving an eternal weight of glory beyond all comparison', '''Our light troubles are achieving for us an eternal glory that far outweighs them all'' (2 Cor 4:17, NIV).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does Paul say about earthly troubles in relation to eternal glory in 2 Corinthians 4:17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 4, 1, 'What does Paul say about his conduct in ministry according to 2 Corinthians 4:1-2?', '["He refuses to lose heart or use deceptive/shameful methods, but commends himself by truth and God''s grace","He uses whatever means necessary to succeed","He is discouraged and wants to quit","He boasts constantly about his accomplishments"]'::jsonb, 'He refuses to lose heart or use deceptive/shameful methods, but commends himself by truth and God''s grace', '''We do not lose heart...We have renounced secret and shameful ways...Rather, we commend ourselves to every man''s conscience in the sight of God'' (2 Cor 4:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does Paul say about his conduct in ministry according to 2 Corinthians 4:1-2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 4, 2, 'How does Paul''s openness about his struggles in 2 Corinthians 4:1-2 defend his apostolic credibility against accusations of dishonesty?', '["His refusal to use deceptive tactics and commitment to truth demonstrate integrity that validates his message","Admitting struggles proves he is a false apostle","Honesty is irrelevant to apostolic authority","Paul is being self-pitying"]'::jsonb, 'His refusal to use deceptive tactics and commitment to truth demonstrate integrity that validates his message', '''We do not lose heart...We have renounced disgraceful, underhanded ways...Rather, by the open statement of the truth we commend ourselves'' (2 Cor 4:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does Paul''s openness about his struggles in 2 Corinthians 4:1-2 defend his apostolic credibility against accusations of dishonesty?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 4, 2, 'How does Paul''s theology of the treasure in earthen vessels subvert conventional understandings of power and strength in 2 Corinthians 4:7-9?', '["Divine power is demonstrated and becomes visible precisely through human weakness and suffering, not despite it","Weakness indicates lack of faith","God only works through the strong and capable","Human weakness is unspiritual"]'::jsonb, 'Divine power is demonstrated and becomes visible precisely through human weakness and suffering, not despite it', '''We are hard pressed...but not crushed...struck down, but not destroyed...carrying about the death of Jesus so that the life of Jesus may also be revealed'' (2 Cor 4:8-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does Paul''s theology of the treasure in earthen vessels subvert conventional understandings of power and strength in 2 Corinthians 4:7-9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 4, 2, 'In 2 Corinthians 4:4, who does Paul identify as blinding the minds of unbelievers?', '["God","The Corinthian church leaders","The god of this age","Roman authorities"]'::jsonb, 'The god of this age', 'Paul identifies the god of this age (Satan) as blinding the minds of those without faith to prevent them from seeing the gospel''s light.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'In 2 Corinthians 4:4, who does Paul identify as blinding the minds of unbelievers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 4, 2, 'What does Paul refuse to do ''for the sake of his ministry'' in 2 Corinthians 4:2?', '["To preach the gospel","To walk in craftiness or handle the word of God deceitfully","To demand financial support from churches","To travel to distant countries"]'::jsonb, 'To walk in craftiness or handle the word of God deceitfully', 'Paul renounces deceptive practices and underhandedness, instead commending himself by honest presentation of the truth to every individual''s conscience.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul refuse to do ''for the sake of his ministry'' in 2 Corinthians 4:2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 4, 2, 'What does Paul say about receiving mercy as it relates to his ministry in 2 Corinthians 4:1?', '["He earned it through his sufferings","Since he received mercy, he does not lose heart in his ministry","He must constantly prove himself worthy","Mercy is promised only to the pure in heart"]'::jsonb, 'Since he received mercy, he does not lose heart in his ministry', 'Therefore, since we have this ministry, as we have received mercy, we do not lose heart (2 Corinthians 4:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say about receiving mercy as it relates to his ministry in 2 Corinthians 4:1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 4, 2, 'What does the contrast between outward decay and inward renewal in 2 Corinthians 4:16 suggest about the nature of Christian hope?', '["Spiritual renewal occurs independently of and even contrary to physical decline, sustaining hope in mortality","Physical strength is necessary for spiritual growth","There is no spiritual renewal or hope available to believers","Christians should deny physical reality"]'::jsonb, 'Spiritual renewal occurs independently of and even contrary to physical decline, sustaining hope in mortality', '''Though outwardly we are wasting away, yet inwardly we are being renewed day by day'' (2 Cor 4:16), offering perspective beyond bodily mortality.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does the contrast between outward decay and inward renewal in 2 Corinthians 4:16 suggest about the nature of Christian hope?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 4, 2, 'What does the image of the god of this age blinding minds in 2 Corinthians 4:4 suggest about the nature of unbelief?', '["Unbelief involves spiritual blindness from satanic deception, not merely intellectual disagreement","Unbelievers simply lack information about Jesus","Satan has no influence on human belief","Unbelief is entirely a matter of individual choice"]'::jsonb, 'Unbelief involves spiritual blindness from satanic deception, not merely intellectual disagreement', '''The god of this age has blinded the minds of unbelievers, so they cannot see the light of the gospel of the glory of Christ'' (2 Cor 4:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does the image of the god of this age blinding minds in 2 Corinthians 4:4 suggest about the nature of unbelief?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 4, 3, 'According to 2 Corinthians 4:8-9, what pattern characterizes Paul''s experience of affliction?', '["Affliction leads to despair and hopelessness","Hard pressed in every way yet not crushed; perplexed yet not despairing","Paul claims to have never faced any difficulty","Afflictions are punishment for sin"]'::jsonb, 'Hard pressed in every way yet not crushed; perplexed yet not despairing', 'Paul lists a series of paradoxical statements showing that despite severe pressure, he is not destroyed-establishing resilience through God''s strength.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 2 Corinthians 4:8-9, what pattern characterizes Paul''s experience of affliction?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 4, 3, 'How does Paul''s argument about proclamation versus hiddenness in 2 Corinthians 4:3-4 address charges that he obscures the gospel or lacks clarity?', '["The gospel is open and clear; if some cannot see it, blindness comes from Satan, not Paul''s lack of clarity","Paul intentionally hides the gospel from some people","Satanic blindness is metaphorical, not real","Paul''s preaching is genuinely confusing"]'::jsonb, 'The gospel is open and clear; if some cannot see it, blindness comes from Satan, not Paul''s lack of clarity', '''We have renounced secret and shameful ways...in an open statement of truth...If our gospel is veiled, it is veiled to those who are perishing'' (2 Cor 4:2-3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Paul''s argument about proclamation versus hiddenness in 2 Corinthians 4:3-4 address charges that he obscures the gospel or lacks clarity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 4, 3, 'How does Paul''s paradox of ''momentary light troubled achieving eternal weight of glory'' in 2 Corinthians 4:17 function rhetorically in comforting persecuted believers?', '["Recontextualizes limited temporal sufferings within an eternal framework making them insignificant in comparison","Suffering has no meaning or purpose in Christian life","Present suffering and eternal glory cannot be meaningfully compared","Believers should ignore present difficulties"]'::jsonb, 'Recontextualizes limited temporal sufferings within an eternal framework making them insignificant in comparison', '''Our light troubles are achieving for us an eternal glory that far outweighs them all'' (2 Cor 4:17), juxtaposing temporal limitation with eternal totality.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Paul''s paradox of ''momentary light troubled achieving eternal weight of glory'' in 2 Corinthians 4:17 function rhetorically in comforting persecuted believers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 4, 3, 'In 2 Corinthians 4:3-4, what does Paul identify as the cause of spiritual blindness to the gospel?', '["Intellectual inability to understand truth","The god of this age has blinded the minds of unbelievers","Lack of desire to seek truth","Cultural ignorance and educational deficiency"]'::jsonb, 'The god of this age has blinded the minds of unbelievers', 'But even if our gospel is veiled, it is veiled to those who are perishing, whose minds the god of this age has blinded (2 Corinthians 4:3-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Corinthians 4:3-4, what does Paul identify as the cause of spiritual blindness to the gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 4, 3, 'What does Paul mean by ''always carrying about in the body the dying of Jesus'' (2 Corinthians 4:10)?', '["Jesus is literally dying in a spiritual sense","Believers participate in Christ''s sufferings and death as they follow Him","Physical death is necessary for salvation","Suffering is a sign of God''s disapproval"]'::jsonb, 'Believers participate in Christ''s sufferings and death as they follow Him', 'Paul teaches that as believers follow Christ, they share in His dying, identifying with His death so that His life is manifested through them.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Paul mean by ''always carrying about in the body the dying of Jesus'' (2 Corinthians 4:10)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 4, 3, 'What is the meaning of Paul describing Christians as having ''this treasure in earthen vessels'' (2 Corinthians 4:7)?', '["Physical treasures should be stored carefully","The infinite power and love of Christ is contained in fragile, ordinary human beings","Earthen vessels were valuable in the ancient world","Paul is criticizing Corinthian materialism"]'::jsonb, 'The infinite power and love of Christ is contained in fragile, ordinary human beings', 'Paul contrasts the infinite, transcendent gospel (''treasure'') with human weakness (''earthen vessels''), emphasizing that the power is God''s, not ours.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the meaning of Paul describing Christians as having ''this treasure in earthen vessels'' (2 Corinthians 4:7)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 4, 3, 'What theological significance does Paul assign to his suffering and weakness in 2 Corinthians 4:8-12 regarding apostolic authority?', '["Apostolic authority is authenticated through participating in Christ''s death so that Christ''s resurrection life becomes evident through the apostle","Only comfortable, successful apostles have real authority","Suffering invalidates apostolic claims","Apostolic power excludes physical hardship"]'::jsonb, 'Apostolic authority is authenticated through participating in Christ''s death so that Christ''s resurrection life becomes evident through the apostle', '''We are...always carrying about in our body the death of Jesus, so that the life of Jesus also may be revealed in our body'' (2 Cor 4:10), showing martyrdom-like participation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What theological significance does Paul assign to his suffering and weakness in 2 Corinthians 4:8-12 regarding apostolic authority?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 4, 4, 'How does Paul''s reversal of power-failure nexus in 2 Corinthians 4:7-12 challenge honor-shame cultures'' valuation of apostolic status?', '["True apostolic honor consists in transparent weakness that showcases divine power, inverting cultural honor based on personal strength","Apostles should display maximum power and invulnerability","Weakness brings shame that cannot be redeemed","Cultural values about honor are completely irrelevant to Christianity"]'::jsonb, 'True apostolic honor consists in transparent weakness that showcases divine power, inverting cultural honor based on personal strength', '''We have this treasure in jars of clay to show that this all-surpassing power is from God and not from us'' (2 Cor 4:7), redefining honor through apparent shame.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Paul''s reversal of power-failure nexus in 2 Corinthians 4:7-12 challenge honor-shame cultures'' valuation of apostolic status?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 4, 4, 'How does the image of ''light shining out of darkness'' (2 Corinthians 4:6) relate to Paul''s ministry of the gospel?', '["It refers only to natural sunlight","God who commanded light to shine from darkness has shined in hearts to reveal Christ''s glory","Darkness is more important than light in spiritual understanding","This is a poetic phrase with no theological significance"]'::jsonb, 'God who commanded light to shine from darkness has shined in hearts to reveal Christ''s glory', 'Paul parallels God''s creation of light with His illumination of hearts to know Christ''s glory, showing the gospel brings light where spiritual darkness existed.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the image of ''light shining out of darkness'' (2 Corinthians 4:6) relate to Paul''s ministry of the gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 4, 4, 'In 2 Corinthians 4:13, what does Paul cite as his motivation for speaking?', '["Financial reward from the churches","The Spirit of faith that compels him to speak, as written in Scripture","His own personal ambitions","Coercion from other apostles"]'::jsonb, 'The Spirit of faith that compels him to speak, as written in Scripture', 'Paul grounds his preaching in the same Spirit of faith that moved the psalmist to speak, indicating his message comes from the same divine source.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'In 2 Corinthians 4:13, what does Paul cite as his motivation for speaking?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 4, 4, 'What anthropological and eschatological vision does Paul develop through the physical-spiritual contrast in 2 Corinthians 4:16-18?', '["The human person is not confined to the physical body; spiritual renewal persists as the body decays, establishing present transformation and resurrection hope","Humans are purely physical with no spiritual dimension","The spirit and body are completely separate and unrelated","Physical decay negates spiritual possibility"]'::jsonb, 'The human person is not confined to the physical body; spiritual renewal persists as the body decays, establishing present transformation and resurrection hope', 'Paul integrates present spiritual renewal (4:16), resurrection hope (4:14), and eternal perspective (4:18) into a comprehensive anthropology transcending physicalism.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'What anthropological and eschatological vision does Paul develop through the physical-spiritual contrast in 2 Corinthians 4:16-18?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 4, 4, 'What does the metaphor of ''treasure in earthen vessels'' in 2 Corinthians 4:7 illustrate about apostolic ministry?', '["Ministers should live modestly and avoid wealth","The surpassing power belongs to God, not to the weak human vessels carrying the message","Believers should value the physical body as a temple","Ministers must protect their reputation and dignity"]'::jsonb, 'The surpassing power belongs to God, not to the weak human vessels carrying the message', 'But we have this treasure in earthen vessels, that the excellence of the power may be of God and not of us (2 Corinthians 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does the metaphor of ''treasure in earthen vessels'' in 2 Corinthians 4:7 illustrate about apostolic ministry?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 4, 4, 'What paradox does Paul establish by saying ''so then death is working in us, but life in you'' (2 Corinthians 4:12)?', '["Paul accepts death while the Corinthians accept life from different sources","Paul''s willingness to suffer and die produces spiritual life in the Corinthians","Corinthians are not affected by Paul''s ministry","This statement contains no genuine paradox"]'::jsonb, 'Paul''s willingness to suffer and die produces spiritual life in the Corinthians', 'Paul suggests that his apostolic self-sacrifice and near-death experiences become the means through which spiritual life flows to the Corinthian believers.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'What paradox does Paul establish by saying ''so then death is working in us, but life in you'' (2 Corinthians 4:12)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 4, 4, 'What soteriological claim does Paul make through the phrase ''the light of the gospel of the glory of Christ'' in 2 Corinthians 4:4-6?', '["Christ''s personal glory constitutes the content and saving knowledge that illuminates hearts and transforms identity","The gospel is primarily about moral rules","Christ''s glory is incidental to salvation","Illumination occurs without personal transformation"]'::jsonb, 'Christ''s personal glory constitutes the content and saving knowledge that illuminates hearts and transforms identity', '''The light of the gospel of the glory of Christ...shines in our hearts to give the light of the knowledge of the glory of God in the face of Christ'' (2 Cor 4:4-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'What soteriological claim does Paul make through the phrase ''the light of the gospel of the glory of Christ'' in 2 Corinthians 4:4-6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 4, 5, 'How does Paul connect suffering and glory in 2 Corinthians 4:16-18, and what hope does he offer?', '["Suffering is meaningless and should be avoided at all costs","Though outwardly wasting away, the inward person is renewed daily, and light afflictions work a surpassing eternal glory","Suffering purifies the soul and eliminates sin completely","Those who suffer will receive compensation in the afterlife"]'::jsonb, 'Though outwardly wasting away, the inward person is renewed daily, and light afflictions work a surpassing eternal glory', 'For which cause we do not lose heart, but though our outward man is decaying, yet our inward man is being renewed day by day. For momentary, light affliction is producing for us an eternal weight of glory far beyond all comparison (2 Corinthians 4:16-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Paul connect suffering and glory in 2 Corinthians 4:16-18, and what hope does he offer?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 4, 5, 'How does Paul integrate suffering, weakness, resurrection hope, and eternal perspective in 2 Corinthians 4 to develop a theodicy that maintains both present vulnerability and transcendent meaning?', '["Temporal suffering participates in Christ''s death and resurrection pattern, achieving eternal significance as the inward self is progressively renewed","Suffering is meaningless and should be avoided at all costs","Present pain cannot coexist with eternal hope","Christians gain invulnerability in this life"]'::jsonb, 'Temporal suffering participates in Christ''s death and resurrection pattern, achieving eternal significance as the inward self is progressively renewed', 'Paul weaves together participation in Christ''s death (4:10), inward renewal (4:16), resurrection hope (4:14), and eternal glory perspective (4:17-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Paul integrate suffering, weakness, resurrection hope, and eternal perspective in 2 Corinthians 4 to develop a theodicy that maintains both present vulnerability and transcendent meaning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 4, 5, 'How does Paul''s principle that ''the inner self is being renewed day by day'' (2 Corinthians 4:16) transform the meaning of the outer person perishing?', '["Physical death proves God has abandoned us","Spiritual renewal occurs continuously even as physical bodies age, establishing priority of spiritual over physical","Spiritual renewal contradicts physical existence","Physical and spiritual realities are completely separate"]'::jsonb, 'Spiritual renewal occurs continuously even as physical bodies age, establishing priority of spiritual over physical', 'Paul''s statement reorients Corinthians'' perspective: even as external circumstances deteriorate, internal spiritual transformation progresses, making physical hardship less ultimate.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Paul''s principle that ''the inner self is being renewed day by day'' (2 Corinthians 4:16) transform the meaning of the outer person perishing?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 4, 5, 'How does Paul''s theology of the ''earthen vessel'' (2 Corinthians 4:7-12) serve as a defense against Corinthian judgments about his apostolic credentials?', '["It proves Paul is weak and therefore not an apostle","It establishes that his afflictions and weaknesses demonstrate God''s power, not undermine his authority","Weakness is incompatible with apostolic ministry","This passage is irrelevant to his apostolic authority"]'::jsonb, 'It establishes that his afflictions and weaknesses demonstrate God''s power, not undermine his authority', 'Paul reframes his weaknesses as evidence of God''s power working through him, transforming criticism of his suffering into proof of genuine apostolic authority.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Paul''s theology of the ''earthen vessel'' (2 Corinthians 4:7-12) serve as a defense against Corinthian judgments about his apostolic credentials?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 4, 5, 'In 2 Corinthians 4:5-6, how does Paul''s refusal to preach ''ourselves'' but rather ''Jesus Christ as Lord'' function theologically and apologetically?', '["Paul denies having any role in preaching","Preaching Christ rather than self-promotion establishes authentic gospel ministry and humility","Self-promotion is necessary for effective ministry","The identity of the preacher is irrelevant to the message"]'::jsonb, 'Preaching Christ rather than self-promotion establishes authentic gospel ministry and humility', 'Paul contrasts false apostles who promote themselves with his focus on Christ, grounding apostolic authority in Christ''s lordship rather than personal advancement.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 2 Corinthians 4:5-6, how does Paul''s refusal to preach ''ourselves'' but rather ''Jesus Christ as Lord'' function theologically and apologetically?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 4, 5, 'What is the relationship between Paul''s present afflictions and his future glory (2 Corinthians 4:16-18)?', '["Present afflictions contradict future hope in Christ","Light afflictions produce an eternal weight of glory far exceeding them","There is no connection between present suffering and future reward","Future hope makes present suffering meaningless"]'::jsonb, 'Light afflictions produce an eternal weight of glory far exceeding them', 'Paul establishes perspective: momentary light afflictions are incomparable to the eternal, transcendent weight of glory awaiting believers, motivating focus on eternal realities.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the relationship between Paul''s present afflictions and his future glory (2 Corinthians 4:16-18)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 4, 5, 'What pneumatological and christological synthesis does Paul achieve in 2 Corinthians 4:3-6 regarding the nature of the gospel and its power to transform satanically-blinded minds?', '["The gospel''s power resides in Christ''s glory as divinely-revealed substance, communicated by the Spirit to create new saving knowledge that overcomes satanic blindness","The gospel is merely human opinion without divine power","Satan''s power is omnipotent and irreversible","Christ''s glory is impersonal and abstract"]'::jsonb, 'The gospel''s power resides in Christ''s glory as divinely-revealed substance, communicated by the Spirit to create new saving knowledge that overcomes satanic blindness', '''God...made his light shine in our hearts to give us the light of the knowledge of the glory of God in the face of Christ'' (2 Cor 4:6), integrating divinity, revelation, and transformation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What pneumatological and christological synthesis does Paul achieve in 2 Corinthians 4:3-6 regarding the nature of the gospel and its power to transform satanically-blinded minds?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 5, 1, 'According to 2 Corinthians 5:17, what does it mean to be in Christ?', '["All things become important","All things become new","All things become difficult","All things become simple"]'::jsonb, 'All things become new', '2 Corinthians 5:17 states that if anyone is in Christ, they are a new creation; old things have passed away.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Corinthians 5:17, what does it mean to be in Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 5, 1, 'In 2 Corinthians 5:1, Paul mentions a building not made with hands. What is this building?', '["An earthly house","A temple in Jerusalem","An eternal house in heaven","A church building"]'::jsonb, 'An eternal house in heaven', 'Paul refers to a heavenly dwelling-an eternal house in heaven that God has prepared for believers.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'In 2 Corinthians 5:1, Paul mentions a building not made with hands. What is this building?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 5, 1, 'In 2 Corinthians 5:20, Paul describes himself and ministers as what for Christ?', '["Servants and slaves","Ambassadors","Judges","Prophets"]'::jsonb, 'Ambassadors', '2 Corinthians 5:20 states: ''We are ambassadors for Christ, as though God were pleading through us.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'In 2 Corinthians 5:20, Paul describes himself and ministers as what for Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 5, 1, 'What does 2 Corinthians 5:10 say we will all appear before?', '["The throne of Satan","The judgment seat of Christ","The high priest","The Roman governor"]'::jsonb, 'The judgment seat of Christ', '2 Corinthians 5:10 teaches that we must all appear before the judgment seat of Christ.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does 2 Corinthians 5:10 say we will all appear before?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 5, 1, 'What experience does Paul desire in 2 Corinthians 5:8?', '["To remain on earth always","To be absent from the body and present with the Lord","To escape all suffering","To gain worldly riches"]'::jsonb, 'To be absent from the body and present with the Lord', '2 Corinthians 5:8 expresses Paul''s longing to be absent from the body and present with the Lord.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'What experience does Paul desire in 2 Corinthians 5:8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 5, 1, 'What ministry does Paul describe in 2 Corinthians 5:18-19?', '["The ministry of judgment","The ministry of reconciliation","The ministry of condemnation","The ministry of law"]'::jsonb, 'The ministry of reconciliation', 'Paul states in 2 Corinthians 5:18 that God has given us the ministry of reconciliation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'What ministry does Paul describe in 2 Corinthians 5:18-19?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 5, 1, 'Who made Christ sin for us according to 2 Corinthians 5:21?', '["Judas","The Roman authorities","God","The Jewish leaders"]'::jsonb, 'God', '2 Corinthians 5:21 says God made Christ sin for us, though He knew no sin.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who made Christ sin for us according to 2 Corinthians 5:21?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 5, 2, 'According to 2 Corinthians 5:7, how are believers instructed to live?', '["By sight alone","By faith, not by sight","By works only","By the law"]'::jsonb, 'By faith, not by sight', '2 Corinthians 5:7 states ''For we walk by faith, not by sight.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 2 Corinthians 5:7, how are believers instructed to live?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 5, 2, 'How does Paul characterize the old perspective of knowing Christ in 2 Corinthians 5:16?', '["Spiritually perfect","After the flesh","Through divine revelation","Through miraculous signs"]'::jsonb, 'After the flesh', '2 Corinthians 5:16 says Paul no longer knows Christ after the flesh, indicating a transformation from earthly perspective to spiritual understanding.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does Paul characterize the old perspective of knowing Christ in 2 Corinthians 5:16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 5, 2, 'In 2 Corinthians 5:13, to what two audiences does Paul refer as recipients of his ministry?', '["Jews and Gentiles","Men and women","God and men","Rich and poor"]'::jsonb, 'God and men', 'Paul mentions being beside himself toward God and being of right mind toward the Corinthians (representing men).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'In 2 Corinthians 5:13, to what two audiences does Paul refer as recipients of his ministry?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 5, 2, 'What does 2 Corinthians 5:11 indicate about Paul''s motivation for his ministry?', '["Fear of persecution","Love of money","Knowledge of the terror of the Lord","Desire for popularity"]'::jsonb, 'Knowledge of the terror of the Lord', '2 Corinthians 5:11 says knowing the terror of the Lord, Paul persuades men.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does 2 Corinthians 5:11 indicate about Paul''s motivation for his ministry?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 5, 2, 'What reason does Paul give in 2 Corinthians 5:14 for why Christ''s love motivates believers?', '["Christ is wealthy","Christ died for all","Christ promised rewards","Christ removed suffering"]'::jsonb, 'Christ died for all', '2 Corinthians 5:14 states ''the love of Christ constrains us, because we judge thus: that if One died for all, then all died.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'What reason does Paul give in 2 Corinthians 5:14 for why Christ''s love motivates believers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 5, 2, 'Which word best describes the transformation described in 2 Corinthians 5:17?', '["Gradual","Temporary","Creation","Evolution"]'::jsonb, 'Creation', 'The verse uses ''creation'' (kainos ktisis) suggesting a new creative work, not evolution or gradual change.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'Which word best describes the transformation described in 2 Corinthians 5:17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 5, 2, 'Why does Paul mention the judgment seat of Christ in 2 Corinthians 5:10?', '["To intimidate the Corinthians","To motivate proper living and accountability","To excuse sinful behavior","To reduce faith requirements"]'::jsonb, 'To motivate proper living and accountability', 'Paul references future judgment to motivate believers to conduct themselves properly and be reconciled to God.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why does Paul mention the judgment seat of Christ in 2 Corinthians 5:10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 5, 3, 'How does 2 Corinthians 5:14-15 connect Christ''s death with believers'' purpose?', '["Death ends all purpose","Christ''s death obligates believers to live for Him","Death is meaningless","Believers live for themselves"]'::jsonb, 'Christ''s death obligates believers to live for Him', 'Paul argues that Christ died for all, therefore all died with Him, so living believers should now live for Christ rather than themselves.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does 2 Corinthians 5:14-15 connect Christ''s death with believers'' purpose?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 5, 3, 'How does Paul resolve the tension between physical death and spiritual hope in 2 Corinthians 5:1-8?', '["Physical death is the end","Heaven compensates for earthly loss","Earthly bodies are eternal","Death has no spiritual significance"]'::jsonb, 'Heaven compensates for earthly loss', 'Paul argues that though our earthly house dissolves, we have an eternal building in heaven, and being with the Lord is far better.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Paul resolve the tension between physical death and spiritual hope in 2 Corinthians 5:1-8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 5, 3, 'In 2 Corinthians 5:12, what does Paul say about judging by appearance?', '["Appearances are always accurate","Appearances can be deceptive","He commends those judging by appearance","Appearance determines truth"]'::jsonb, 'Appearances can be deceptive', 'Paul gives the Corinthians opportunity to commend themselves to those who judge by superficial appearance, implying such judgment is inadequate.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Corinthians 5:12, what does Paul say about judging by appearance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 5, 3, 'In 2 Corinthians 5:19-20, what does Paul suggest about believers'' post-reconciliation responsibility?', '["Rest from ministry","Share the message of reconciliation","Separate from unbelievers","Await final judgment silently"]'::jsonb, 'Share the message of reconciliation', 'Paul states God has committed to believers the word of reconciliation and positions them as ambassadors to implore others.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Corinthians 5:19-20, what does Paul suggest about believers'' post-reconciliation responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 5, 3, 'What theological principle does 2 Corinthians 5:21 establish about Christ''s substitutionary work?', '["Partial atonement only","Sympathy with human weakness","Complete substitution of sinlessness for sin","Temporary forgiveness"]'::jsonb, 'Complete substitution of sinlessness for sin', 'The verse teaches that God made the sinless Christ to be sin (representing our condition) so we become His righteousness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What theological principle does 2 Corinthians 5:21 establish about Christ''s substitutionary work?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 5, 3, 'What transition occurs in 2 Corinthians 5:16-17 regarding knowledge and newness?', '["Earthly knowledge increases","Perspective shifts from material to spiritual, resulting in complete renewal","Nothing changes","Knowledge decreases"]'::jsonb, 'Perspective shifts from material to spiritual, resulting in complete renewal', 'Moving from knowing Christ ''after the flesh'' to spiritual understanding brings transformation-old things pass away and all becomes new.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What transition occurs in 2 Corinthians 5:16-17 regarding knowledge and newness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 5, 3, 'Why is Paul''s statement in 2 Corinthians 5:7 significant for daily Christian living?', '["Sight is unreliable","Faith must override sensory evidence and doubt","Sight is impossible","Faith and sight are equivalent"]'::jsonb, 'Faith must override sensory evidence and doubt', 'Living by faith means trusting God''s promises even when visible circumstances suggest otherwise or create doubt.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is Paul''s statement in 2 Corinthians 5:7 significant for daily Christian living?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 5, 4, 'How do 2 Corinthians 5:9-10 relate motivation for holy living to future accountability?', '["Judgment eliminates moral responsibility","Present motivation to please Christ connects to future evaluation of deeds","Deeds have no future consequence","Living morally avoids judgment entirely"]'::jsonb, 'Present motivation to please Christ connects to future evaluation of deeds', 'Paul connects ambition to be pleasing to Christ with the reality that each will receive according to deeds done in the body at judgment.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do 2 Corinthians 5:9-10 relate motivation for holy living to future accountability?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 5, 4, 'How does 2 Corinthians 5:18-20 reframe the purpose of God''s reconciliation?', '["Only for personal comfort","For believers to continue reconciliation ministry","Ends all conflict permanently","Removes need for holy living"]'::jsonb, 'For believers to continue reconciliation ministry', 'God reconciled us to Himself and gave us the ministry of reconciliation-believers become agents extending Christ''s reconciliation message to others.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 2 Corinthians 5:18-20 reframe the purpose of God''s reconciliation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 5, 4, 'How does Paul''s argument about heavenly compensation in 2 Corinthians 5:1-4 challenge materialistic worldviews?', '["Material possessions are ultimate","Temporary earthly comfort exceeds eternal reward","Eternal realities have greater weight than visible temporary ones","The body has no future"]'::jsonb, 'Eternal realities have greater weight than visible temporary ones', 'Paul argues that the weight of glory prepares for heaven outweighs earthly suffering; eternal invisible realities matter more than present visible ones.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Paul''s argument about heavenly compensation in 2 Corinthians 5:1-4 challenge materialistic worldviews?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 5, 4, 'In 2 Corinthians 5, what does Paul say happens to those who are ''in Christ''?', '["They become a new creation","They inherit all the promises of Israel","They are freed from all labor","They receive earthly riches"]'::jsonb, 'They become a new creation', 'If anyone is in Christ, he is a new creation. Old things have passed away (2 Corinthians 5:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'In 2 Corinthians 5, what does Paul say happens to those who are ''in Christ''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 5, 4, 'In 2 Corinthians 5:15, what does ''no longer live for themselves'' imply about Christian ethics?', '["Self-interest is permitted","Selflessness overrides personal concern entirely","Personal flourishing and Christ-centeredness reconcile","Ethics are optional"]'::jsonb, 'Personal flourishing and Christ-centeredness reconcile', 'Believers reorient motivation from self-centeredness to pleasing Christ; this doesn''t eliminate legitimate personal needs but subordinates them to Christ''s lordship.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'In 2 Corinthians 5:15, what does ''no longer live for themselves'' imply about Christian ethics?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 5, 4, 'What paradox does 2 Corinthians 5:21 establish between Christ''s nature and condition?', '["No paradox exists","The sinless one became the representation of sin","Sinners became righteous through Law","Sin was forgiven without payment"]'::jsonb, 'The sinless one became the representation of sin', 'God made Christ (who knew no sin) to be sin for us-paradoxically, perfect innocence and moral guilt united so believers gain His righteousness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'What paradox does 2 Corinthians 5:21 establish between Christ''s nature and condition?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 5, 4, 'What theological priority does Paul establish by placing judgment before comfort in 2 Corinthians 5:10-11?', '["Comfort is unimportant","Accountability precedes confidence","God ignores human behavior","Judgment is conditional"]'::jsonb, 'Accountability precedes confidence', 'Paul discusses appearing before Christ''s judgment seat before declaring confidence-suggesting believers must recognize accountability for deeds before boldly presenting themselves.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'What theological priority does Paul establish by placing judgment before comfort in 2 Corinthians 5:10-11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 5, 5, 'According to 2 Corinthians 5:19, what did God accomplish through Christ?', '["God reconciled the world to himself, not counting their trespasses against them","God destroyed all sin completely so no judgment remains","God made everyone automatically saved without faith","God separated the righteous from the unrighteous"]'::jsonb, 'God reconciled the world to himself, not counting their trespasses against them', 'God was in Christ reconciling the world to himself, not counting their trespasses against them (2 Corinthians 5:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'According to 2 Corinthians 5:19, what did God accomplish through Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 5, 5, 'How do 2 Corinthians 5:1-8 and 5:20 together present the tension between ''already'' and ''not yet'' eschatology?', '["No tension exists","Believers are already reconciled yet await Christ''s presence and final transformation","All is already complete","All is still future"]'::jsonb, 'Believers are already reconciled yet await Christ''s presence and final transformation', 'Paul balances present reconciliation status with groaning for future transformation and longing to be with the Lord, reflecting theological ''already/not yet'' framework.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'How do 2 Corinthians 5:1-8 and 5:20 together present the tension between ''already'' and ''not yet'' eschatology?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 5, 5, 'How does 2 Corinthians 5:6-7 function theologically against both mysticism and materialism?', '["Reality is unknowable","Physical distance from Christ requires faith, not experiential certainty, yet doesn''t diminish relational reality","Mysticism is always valid","Matter is illusion"]'::jsonb, 'Physical distance from Christ requires faith, not experiential certainty, yet doesn''t diminish relational reality', 'Paul affirms intimate walk with Christ through faith despite physical separation from Him; this counters both religious skepticism and materialist assumptions about reality.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 2 Corinthians 5:6-7 function theologically against both mysticism and materialism?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 5, 5, 'How does the concept of divine ''imputation'' in 2 Corinthians 5:21 function as the counterpart to Adam''s imputation in Romans?', '["Imputation only applies to sin","Christ''s righteousness imputed to believers reverses sin''s imputation","Imputation is human theory only","Righteousness cannot be imputed"]'::jsonb, 'Christ''s righteousness imputed to believers reverses sin''s imputation', 'As sin was imputed to humanity through Adam, Christ''s righteousness is imputed to believers through His substitution, establishing divine justice through exchange.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does the concept of divine ''imputation'' in 2 Corinthians 5:21 function as the counterpart to Adam''s imputation in Romans?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 5, 5, 'In the context of Corinthian party divisions, how does Paul''s argument in 2 Corinthians 5:11-17 address false apostolic claims?', '["Paul abandons apostolic authority","True ministry is measured by inner motivation and reconciliation fruit, not superficial appearance or credentials","Credentials alone prove ministry","Personal preference determines truth"]'::jsonb, 'True ministry is measured by inner motivation and reconciliation fruit, not superficial appearance or credentials', 'Against competitors judging by appearance, Paul argues authentic ministry flows from fear of the Lord and renews people spiritually.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'In the context of Corinthian party divisions, how does Paul''s argument in 2 Corinthians 5:11-17 address false apostolic claims?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 5, 5, 'What does Paul say he begs the Corinthians to do in 2 Corinthians 5:20?', '["Be reconciled to God","Send money to Jerusalem","Stop forgiving those who sin","Avoid the ministry of reconciliation"]'::jsonb, 'Be reconciled to God', 'We are ambassadors therefore on behalf of Christ, as though God were pleading by us: we beg you on behalf of Christ, be reconciled to God (2 Corinthians 5:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Paul say he begs the Corinthians to do in 2 Corinthians 5:20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 5, 5, 'What does Paul''s statement ''absent from the body and present with the Lord'' in 2 Corinthians 5:8 reveal about his understanding of the intermediate state?', '["Soul sleep occurs","Believers have consciousness and communion with Christ between death and resurrection","Physical death ends existence","The body is unnecessary"]'::jsonb, 'Believers have consciousness and communion with Christ between death and resurrection', 'Paul prefers being ''present with the Lord'' after death, indicating personal consciousness in an intermediate state before bodily resurrection.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Paul''s statement ''absent from the body and present with the Lord'' in 2 Corinthians 5:8 reveal about his understanding of the intermediate state?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 6, 1, 'How does Paul describe himself and other ministers in 2 Corinthians 6:3-4?', '["Wealthy and powerful","Servants of God commended through patient endurance","Superior to the congregation","Immune from suffering"]'::jsonb, 'Servants of God commended through patient endurance', 'Paul describes himself and others as ministers of God, commending themselves through much patience in afflictions.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'How does Paul describe himself and other ministers in 2 Corinthians 6:3-4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 6, 1, 'In 2 Corinthians 6:16, what does Paul ask the Corinthians?', '["Do you doubt God''s partnership with you?","Do you not know that you are the temple of God?","Are you separate from God?","Can God dwell anywhere?"]'::jsonb, 'Do you not know that you are the temple of God?', '2 Corinthians 6:16 asks ''Do you not know that you are the temple of God and that the Spirit of God dwells in you?'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'In 2 Corinthians 6:16, what does Paul ask the Corinthians?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 6, 1, 'In 2 Corinthians 6:17, what does Paul command believers to do?', '["Remain isolated always","Come out from among them and be separate","Ignore unbelievers completely","Compete with unbelievers"]'::jsonb, 'Come out from among them and be separate', '2 Corinthians 6:17 commands believers to ''come out from among them and be separate, says the Lord.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'In 2 Corinthians 6:17, what does Paul command believers to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 6, 1, 'Name one of the spiritual contrasts in 2 Corinthians 6:14.', '["Light and darkness","Beauty and ugliness","Tall and short","Fast and slow"]'::jsonb, 'Light and darkness', '2 Corinthians 6:14 presents the contrast between light and darkness as an example of incompatible partnerships.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'Name one of the spiritual contrasts in 2 Corinthians 6:14.'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 6, 1, 'What does 2 Corinthians 6:1 warn against?', '["Receiving grace successfully","Receiving grace in vain","Working for God","Trusting in faith"]'::jsonb, 'Receiving grace in vain', '2 Corinthians 6:1 warns believers not to receive the grace of God in vain.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does 2 Corinthians 6:1 warn against?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 6, 1, 'What does Paul claim in 2 Corinthians 6:2 about the acceptable time?', '["The future is best","Now is the acceptable time, now is the day of salvation","Salvation is impossible","Time is irrelevant to salvation"]'::jsonb, 'Now is the acceptable time, now is the day of salvation', '2 Corinthians 6:2 emphasizes urgency: ''Now is the accepted time; behold, now is the day of salvation.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does Paul claim in 2 Corinthians 6:2 about the acceptable time?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 6, 1, 'What instruction does 2 Corinthians 6:14 give about being unequally yoked?', '["Do not be unequally yoked with unbelievers","Yoke sharing promotes unity","Beliefs are irrelevant in relationships","Yoked partnerships always succeed"]'::jsonb, 'Do not be unequally yoked with unbelievers', '2 Corinthians 6:14 instructs believers not to be unequally yoked with unbelievers.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'What instruction does 2 Corinthians 6:14 give about being unequally yoked?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 6, 2, 'According to 2 Corinthians 6:4-5, what types of afflictions did Paul endure?', '["Only spiritual afflictions","Troubles, needs, distresses, stripes, imprisonments, tumults, labors","Only emotional pain","No real suffering"]'::jsonb, 'Troubles, needs, distresses, stripes, imprisonments, tumults, labors', 'Paul catalogs physical sufferings including stripes (beatings), imprisonments, tumults, and labors to commend his apostolic ministry.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 2 Corinthians 6:4-5, what types of afflictions did Paul endure?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 6, 2, 'How does 2 Corinthians 6:16 support the spiritual significance of believers'' bodies?', '["Bodies are insignificant","You are God''s temple where His Spirit dwells","Only souls matter","The Spirit avoids physical bodies"]'::jsonb, 'You are God''s temple where His Spirit dwells', 'Identifying believers as God''s temple emphasizes that their physical beings are sacred dwelling places for the Spirit.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does 2 Corinthians 6:16 support the spiritual significance of believers'' bodies?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 6, 2, 'How does Paul''s catalog of virtues in 2 Corinthians 6:6-7 characterize mature ministry?', '["Material success only","Knowledge, patience, kindness, Holy Spirit, genuine love, truthfulness, and God''s power","Emotional stability alone","Physical strength"]'::jsonb, 'Knowledge, patience, kindness, Holy Spirit, genuine love, truthfulness, and God''s power', 'Paul lists attributes commending him as a minister: intellectual, relational, spiritual, and moral qualities reflecting God''s character.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does Paul''s catalog of virtues in 2 Corinthians 6:6-7 characterize mature ministry?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 6, 2, 'In 2 Corinthians 6, what is the main instruction about being ''unequally yoked''?', '["Do not be unequally yoked with unbelievers","Yoke yourself with all people equally","Marry someone unequally rich","Avoid friendship with those unlike you"]'::jsonb, 'Do not be unequally yoked with unbelievers', 'Do not be unequally yoked with unbelievers (2 Corinthians 6:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'In 2 Corinthians 6, what is the main instruction about being ''unequally yoked''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 6, 2, 'In 2 Corinthians 6:9-10, what paradoxes does Paul mention about his condition?', '["Happiness and sadness both","Sorrowful yet rejoicing, poor yet making many rich, having nothing yet possessing all things","Wealth and poverty alternate","Neither joy nor sorrow"]'::jsonb, 'Sorrowful yet rejoicing, poor yet making many rich, having nothing yet possessing all things', 'Paul presents spiritual paradoxes: though grieved, he rejoices; though poor materially, he enriches others spiritually.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'In 2 Corinthians 6:9-10, what paradoxes does Paul mention about his condition?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 6, 2, 'What does Paul''s phrase ''we have wronged no one'' in 2 Corinthians 6:8 suggest about his opponents'' accusations?', '["All accusations were true","Paul directly refutes false character attacks","Paul never defended himself","Accusations had no basis"]'::jsonb, 'Paul directly refutes false character attacks', 'Paul responds to the accusation of financial exploitation and dishonability with direct denial, asserting his integrity against slanderous opponents.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul''s phrase ''we have wronged no one'' in 2 Corinthians 6:8 suggest about his opponents'' accusations?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 6, 2, 'What underlying principle justifies Paul''s prohibition of unequal yoking in 2 Corinthians 6:14?', '["Strangers are dangerous","Believers and unbelievers have fundamentally opposed spiritual allegiances","Different people should never associate","Partnership always fails"]'::jsonb, 'Believers and unbelievers have fundamentally opposed spiritual allegiances', 'The principle is incompatibility of belief-believers belong to Christ while unbelievers remain under different spiritual authority.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'What underlying principle justifies Paul''s prohibition of unequal yoking in 2 Corinthians 6:14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 6, 3, 'According to 2 Corinthians 6:14-15, with what is light incompatible?', '["Darkness","The world","Jewish customs","Earthly wealth"]'::jsonb, 'Darkness', 'What fellowship have the righteous with the unrighteous? Or what communion has light with darkness? (2 Corinthians 6:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 2 Corinthians 6:14-15, with what is light incompatible?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 6, 3, 'How does 2 Corinthians 6:16-18 support the concept of believers'' separation through scriptural citation?', '["Scripture is irrelevant","Multiple OT passages promise God''s dwelling with a separated people","Separation is never commanded","God''s presence requires no boundaries"]'::jsonb, 'Multiple OT passages promise God''s dwelling with a separated people', 'Paul cites Leviticus and related passages about separation and God''s indwelling, establishing biblical foundation for believers'' distinct identity.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does 2 Corinthians 6:16-18 support the concept of believers'' separation through scriptural citation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 6, 3, 'How does Paul''s confession in 2 Corinthians 6:8 (''as deceivers, yet true'') address the Corinthians'' judgment?', '["Paul admits deceit","Paul acknowledges accusations while asserting truth behind appearances","Perception always equals reality","Paul abandons truth claims"]'::jsonb, 'Paul acknowledges accusations while asserting truth behind appearances', 'Paul recognizes false perceptions held by some but insists on his genuine reliability; external judgment doesn''t define apostolic reality.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Paul''s confession in 2 Corinthians 6:8 (''as deceivers, yet true'') address the Corinthians'' judgment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 6, 3, 'In 2 Corinthians 6:14, why are multiple spiritual incompatibilities listed (righteousness/lawlessness, light/darkness, Christ/Belial)?', '["Examples are random","To demonstrate comprehensive incompatibility at multiple spiritual levels","One example is sufficient","Incompatibility is limited to belief"]'::jsonb, 'To demonstrate comprehensive incompatibility at multiple spiritual levels', 'Paul presents escalating incompatibilities to show the totality of separation-ethical, eschatological, and spiritual dimensions all contradict partnership.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Corinthians 6:14, why are multiple spiritual incompatibilities listed (righteousness/lawlessness, light/darkness, Christ/Belial)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 6, 3, 'In 2 Corinthians 6:16, what metaphor does Paul use for believers?', '["They are the temple of God","They are soldiers of Christ","They are ambassadors of peace","They are children of light"]'::jsonb, 'They are the temple of God', 'You are the temple of the living God, as God said, I will dwell with them and walk with them (2 Corinthians 6:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Corinthians 6:16, what metaphor does Paul use for believers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 6, 3, 'What does the concept of believers as God''s temple in 2 Corinthians 6:16 imply for personal holiness?', '["Holiness is irrelevant","If believers house God''s Spirit, personal purity directly affects God''s dwelling place","Bodies are independent of God","Holiness is optional"]'::jsonb, 'If believers house God''s Spirit, personal purity directly affects God''s dwelling place', 'Being a temple means one''s body is sacred; this provides motivation for sanctification and separateness befitting a divine dwelling.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the concept of believers as God''s temple in 2 Corinthians 6:16 imply for personal holiness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 6, 3, 'Why does Paul connect the urgency in 2 Corinthians 6:2 to his discussion of ministry afflictions?', '["Time is irrelevant to suffering","The present moment demands immediate response to the grace God offers through suffering ministers","Afflictions delay salvation","Ministry is unnecessary"]'::jsonb, 'The present moment demands immediate response to the grace God offers through suffering ministers', 'Paul emphasizes that now is the day of salvation, and his commendation through affliction demonstrates God''s available grace for this moment.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul connect the urgency in 2 Corinthians 6:2 to his discussion of ministry afflictions?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 6, 4, 'How do the spiritual paradoxes in 2 Corinthians 6:9-10 serve Paul''s apologetic against false apostles?', '["Paradoxes prove weakness","Living paradoxes demonstrate power contrary to worldly logic-divine power through human weakness","Strength eliminates contradiction","Weakness disproves calling"]'::jsonb, 'Living paradoxes demonstrate power contrary to worldly logic-divine power through human weakness', 'Paul''s paradoxical condition (poor yet enriching, sorrowful yet joyful) proves his apostolic authenticity; he embodies grace, not worldly success.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How do the spiritual paradoxes in 2 Corinthians 6:9-10 serve Paul''s apologetic against false apostles?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 6, 4, 'How does 2 Corinthians 6:14-18 distinguish between cultural separation and spiritual separation?', '["All separation is cultural","Spiritual allegiance requires relational distinction, not necessarily social isolation","Believers should avoid all contact","Separation is only spiritual"]'::jsonb, 'Spiritual allegiance requires relational distinction, not necessarily social isolation', 'Paul warns against intimate spiritual partnership (yoking) without prohibiting all interaction; the basis is opposing loyalty, not mere cultural difference.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 2 Corinthians 6:14-18 distinguish between cultural separation and spiritual separation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 6, 4, 'In 2 Corinthians 6:1-2, how does Paul''s appeal to ''now is the day of salvation'' address the Corinthians'' complacency?', '["Procrastination is harmless","He summons urgency while grace is available and ministry opportunity remains","Future is always better than now","Spiritual decisions can wait"]'::jsonb, 'He summons urgency while grace is available and ministry opportunity remains', 'Paul warns against wasting the present grace period; salvation and service shouldn''t be postponed as if opportunities guarantee renewal.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'In 2 Corinthians 6:1-2, how does Paul''s appeal to ''now is the day of salvation'' address the Corinthians'' complacency?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 6, 4, 'In 2 Corinthians 6:17, what is Paul commanding believers to do by quoting Old Testament language?', '["Come out from among them and be separate","Gather together for worship only","Return to the temple in Jerusalem","Isolate themselves completely from all people"]'::jsonb, 'Come out from among them and be separate', 'Come out from among them and be separate, says the Lord (2 Corinthians 6:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'In 2 Corinthians 6:17, what is Paul commanding believers to do by quoting Old Testament language?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 6, 4, 'What covenant promise does Paul reference in 2 Corinthians 6:18 to assure believers of God''s relationship?', '["God will be a father to them and they will be sons and daughters","God will provide endless material wealth","God will protect them from all earthly suffering","God will make them judges of all nations"]'::jsonb, 'God will be a father to them and they will be sons and daughters', 'I will be a father to you, and you will be my sons and daughters (2 Corinthians 6:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'What covenant promise does Paul reference in 2 Corinthians 6:18 to assure believers of God''s relationship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 6, 4, 'What distinction does 2 Corinthians 6:17 make regarding the nature of separation required from unbelievers?', '["Absolute and complete isolation","Clean separation from spiritual contamination through distinct identity and allegiance","Psychological distance only","No separation is needed"]'::jsonb, 'Clean separation from spiritual contamination through distinct identity and allegiance', 'Paul''s reference to touching unclean things implies spiritual contamination; separation isn''t about avoiding physical contact but maintaining spiritual integrity.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'What distinction does 2 Corinthians 6:17 make regarding the nature of separation required from unbelievers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 6, 4, 'What is Paul''s basis for instructing the Corinthians about separation from unbelievers in 2 Corinthians 6?', '["The principle that God and idols cannot coexist, and believers are the temple of God","The law of Moses requires strict separation","Greek philosophical wisdom demands isolation","The Jerusalem apostles explicitly commanded this"]'::jsonb, 'The principle that God and idols cannot coexist, and believers are the temple of God', 'What agreement does the temple of God have with idols? You are the temple of the living God (2 Corinthians 6:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'What is Paul''s basis for instructing the Corinthians about separation from unbelievers in 2 Corinthians 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 6, 5, 'How does 2 Corinthians 6:14''s principle of non-yoking intersect with 1 Corinthians 9:19-22 where Paul becomes ''all things to all people''?', '["They contradict each other","Cultural adaptation differs from spiritual compromise; separation protects intimate bonds","Paul changes his teachings inconsistently","No reconciliation is possible"]'::jsonb, 'Cultural adaptation differs from spiritual compromise; separation protects intimate bonds', 'Paul''s flexibility in non-essential cultural matters (1 Cor 9) never compromises fundamental spiritual allegiance to Christ; yoking represents intimate commitment incompatible with unbelief.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 2 Corinthians 6:14''s principle of non-yoking intersect with 1 Corinthians 9:19-22 where Paul becomes ''all things to all people''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 6, 5, 'How does the catalog of spiritual qualities in 2 Corinthians 6:6-7 contrast with Corinthian wisdom about ministry leadership?', '["Corinthians prioritize the same qualities","Paul''s list emphasizes Spirit-filled virtue over intellectual sophistication that Corinthians valued","Virtue and wisdom are identical","Neither matters in leadership"]'::jsonb, 'Paul''s list emphasizes Spirit-filled virtue over intellectual sophistication that Corinthians valued', 'Paul counters Corinthian preferences for rhetorical skill and worldly prestige with character formation: knowledge of God, patience, purity, and sincere love mark true leadership.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does the catalog of spiritual qualities in 2 Corinthians 6:6-7 contrast with Corinthian wisdom about ministry leadership?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 6, 5, 'In 2 Corinthians 6:14-16, what primary concern does Paul raise about being unequally yoked with unbelievers?', '["Financial difficulties will result from mixed relationships","There is no fellowship between righteousness and lawlessness, and no communion between the temple of God and idols","Unbelievers are inherently sinful beyond redemption","Such relationships should be tolerated if the unbeliever agrees to it"]'::jsonb, 'There is no fellowship between righteousness and lawlessness, and no communion between the temple of God and idols', 'Do not be unequally yoked together with unbelievers. For what fellowship has righteousness with lawlessness? And what communion has light with darkness? And what accord has Christ with Belial (2 Corinthians 6:14-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 2 Corinthians 6:14-16, what primary concern does Paul raise about being unequally yoked with unbelievers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 6, 5, 'In the context of Corinthian factionalism, how does Paul''s presentation of pastoral afflictions in 2 Corinthians 6:4-10 redefine apostolic authority?', '["Authority rests on power and prestige","True authority emerges through patient endurance of suffering, paradoxical weakness, and Spirit-empowered ministry","Suffering disqualifies leadership","Credentials depend on comfort"]'::jsonb, 'True authority emerges through patient endurance of suffering, paradoxical weakness, and Spirit-empowered ministry', 'Against rivals claiming impressive credentials, Paul establishes that genuine apostolic authority is constituted by God''s grace operating through human weakness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'In the context of Corinthian factionalism, how does Paul''s presentation of pastoral afflictions in 2 Corinthians 6:4-10 redefine apostolic authority?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 6, 5, 'What identity does Paul affirm for believers in 2 Corinthians 6:16, based on God''s covenant promise?', '["They are slaves of the household of God","You are the temple of the living God, as God has said","They are ambassadors of a heavenly kingdom","You are seated in heavenly places in Christ Jesus"]'::jsonb, 'You are the temple of the living God, as God has said', 'And what agreement has the temple of God with idols? For you are the temple of the living God. As God has said: ''I will dwell in them and walk among them. I will be their God, and they shall be My people'' (2 Corinthians 6:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What identity does Paul affirm for believers in 2 Corinthians 6:16, based on God''s covenant promise?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 6, 5, 'What implications does the temple metaphor in 2 Corinthians 6:16-18 hold for corporate worship and community boundaries?', '["Individuals alone matter","Collective holiness and distinct community identity are essential; God''s presence requires corporate separation","Community is irrelevant","Boundaries inhibit faith"]'::jsonb, 'Collective holiness and distinct community identity are essential; God''s presence requires corporate separation', 'Believers corporately form God''s temple; this requires community coherence and distinguishable identity-implications for church discipline and membership boundaries.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What implications does the temple metaphor in 2 Corinthians 6:16-18 hold for corporate worship and community boundaries?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 6, 5, 'What two expressions of readiness does Paul emphasize in 2 Corinthians 6:2 regarding the accepted time and day of salvation?', '["Complete obedience and joyful acceptance","''Behold, now is the accepted time'' and ''behold, now is the day of salvation''","Repentance and faith as prerequisites","Understanding God''s will and obeying it"]'::jsonb, '''Behold, now is the accepted time'' and ''behold, now is the day of salvation''', 'For He says: ''In an acceptable time I have heard you, and in the day of salvation I have helped you.'' Behold, now is the accepted time; behold, now is the day of salvation (2 Corinthians 6:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What two expressions of readiness does Paul emphasize in 2 Corinthians 6:2 regarding the accepted time and day of salvation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 7, 1, 'In 2 Corinthians 7:13, what was Paul''s response to the Corinthians'' demonstration of obedience?', '["Indifference","Even greater comfort and greater joy","Doubt about their sincerity","Concern"]'::jsonb, 'Even greater comfort and greater joy', '2 Corinthians 7:13 states Paul was comforted by their obedience and his joy was multiplied.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'In 2 Corinthians 7:13, what was Paul''s response to the Corinthians'' demonstration of obedience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 7, 1, 'In 2 Corinthians 7:4, what does Paul claim despite facing great trials?', '["He is greatly discouraged","He is exceedingly joyful and overflowing with comfort","He experiences minimal emotion","He is uncertain about his faith"]'::jsonb, 'He is exceedingly joyful and overflowing with comfort', '2 Corinthians 7:4 states Paul is ''filled with comfort'' and ''overflowing with joy in all our tribulation.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'In 2 Corinthians 7:4, what does Paul claim despite facing great trials?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 7, 1, 'To what kind of sorrow does Paul refer in 2 Corinthians 7:10?', '["Worldly sorrow","Godly sorrow that leads to repentance","Happy feelings","Temporary emotion"]'::jsonb, 'Godly sorrow that leads to repentance', '2 Corinthians 7:10 contrasts worldly sorrow with godly sorrow that ''produces repentance leading to salvation.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'To what kind of sorrow does Paul refer in 2 Corinthians 7:10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 7, 1, 'What does Paul call the Corinthians at the beginning of 2 Corinthians 7?', '["Beloved","Disobedient","Worldly","Foolish"]'::jsonb, 'Beloved', 'Having therefore these promises, beloved, let us cleanse ourselves (2 Corinthians 7:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does Paul call the Corinthians at the beginning of 2 Corinthians 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 7, 1, 'What does Paul state the Corinthians have in his heart in 2 Corinthians 7:3?', '["A small place","They are in his heart both in death and life","No significant place","A peripheral place"]'::jsonb, 'They are in his heart both in death and life', '2 Corinthians 7:3 expresses Paul''s deep affection, saying the Corinthians are in his heart.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does Paul state the Corinthians have in his heart in 2 Corinthians 7:3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 7, 1, 'What good news did Titus bring Paul about the Corinthians in 2 Corinthians 7:7?', '["Their wealth increased","Their longing, mourning, and zeal for Paul","Their complaints","Their departure from faith"]'::jsonb, 'Their longing, mourning, and zeal for Paul', '2 Corinthians 7:7 describes the Corinthians'' ''longing for me, your mourning, your zeal for me,'' which comforted Paul.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'What good news did Titus bring Paul about the Corinthians in 2 Corinthians 7:7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 7, 1, 'Why did Titus come to the Corinthians according to 2 Corinthians 7:6?', '["To bring condemnation","To comfort the discouraged and bring news to Paul","To demand obedience","To collect money"]'::jsonb, 'To comfort the discouraged and bring news to Paul', '2 Corinthians 7:6 indicates God comforted Paul through Titus''s arrival and bringing news of the Corinthians.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 7
    AND q.difficulty_stage = 1
    AND q.prompt = 'Why did Titus come to the Corinthians according to 2 Corinthians 7:6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 7, 2, 'How does Paul''s confidence in the Corinthians in 2 Corinthians 7:16 follow from their demonstrated repentance?', '["He has no confidence","He trusts they will continue in obedience","Repentance is temporary","Trust is unfounded"]'::jsonb, 'He trusts they will continue in obedience', '2 Corinthians 7:16 expresses confidence in the Corinthians'' continuing commitment based on their repentant response.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does Paul''s confidence in the Corinthians in 2 Corinthians 7:16 follow from their demonstrated repentance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 7, 2, 'How does the Corinthians'' response in 2 Corinthians 7:11 demonstrate the effectiveness of their repentance?', '["No change occurred","They showed earnestness, clearing of themselves, indignation, fear, longing, zeal, and vindication","They ignored the letter","They remained unchanged"]'::jsonb, 'They showed earnestness, clearing of themselves, indignation, fear, longing, zeal, and vindication', '2 Corinthians 7:11 catalogs the visible fruits of their repentance in attitudes and actions.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does the Corinthians'' response in 2 Corinthians 7:11 demonstrate the effectiveness of their repentance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 7, 2, 'In 2 Corinthians 7, what brought Titus comfort when he came to the Corinthians?', '["Their spirit was refreshed by the Corinthians","He received financial support","He was elected as a leader","He found no opposition to his teaching"]'::jsonb, 'Their spirit was refreshed by the Corinthians', 'By the coming of Titus... his spirit was refreshed by you all (2 Corinthians 7:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'In 2 Corinthians 7, what brought Titus comfort when he came to the Corinthians?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 7, 2, 'In 2 Corinthians 7:5-6, what physical and emotional state was Paul experiencing before Titus arrived?', '["Perfect peace","Afflictions of body and fear and conflict in mind","Rest and confidence","No troubles"]'::jsonb, 'Afflictions of body and fear and conflict in mind', '2 Corinthians 7:5 describes Paul''s anxiety while awaiting news until Titus arrived bringing comfort.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'In 2 Corinthians 7:5-6, what physical and emotional state was Paul experiencing before Titus arrived?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 7, 2, 'What does 2 Corinthians 7:1 command believers regarding godliness?', '["Godliness is impossible","Cleanse yourself from all filthiness of flesh and spirit, perfecting holiness","Abandon efforts at purity","External behavior alone matters"]'::jsonb, 'Cleanse yourself from all filthiness of flesh and spirit, perfecting holiness', '2 Corinthians 7:1 calls for both negative (cleansing from defilement) and positive (perfecting holiness) dimensions of sanctification.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does 2 Corinthians 7:1 command believers regarding godliness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 7, 2, 'What does Paul''s emotional response in 2 Corinthians 7:4 reveal about his investment in the Corinthians?', '["Detachment and removal","Deep involvement and genuine care expressed through both comfort and joy","Absence of feeling","Minimal concern"]'::jsonb, 'Deep involvement and genuine care expressed through both comfort and joy', 'Paul''s comfort despite trials and overflowing joy indicates his emotional solidarity with and genuine affection for the congregation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul''s emotional response in 2 Corinthians 7:4 reveal about his investment in the Corinthians?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 7, 2, 'What principle regarding sorrow does Paul establish in 2 Corinthians 7:8-9?', '["Sorrow is always harmful","Proper sorrow about sin can produce beneficial repentance and spiritual growth","Sorrow is unnecessary","Regret is permanent"]'::jsonb, 'Proper sorrow about sin can produce beneficial repentance and spiritual growth', 'Paul acknowledges his letter caused sorrow, but notes the sorrow led to repentance-demonstrating constructive rather than destructive sorrow.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 7
    AND q.difficulty_stage = 2
    AND q.prompt = 'What principle regarding sorrow does Paul establish in 2 Corinthians 7:8-9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 7, 3, 'How does 2 Corinthians 7:2 frame Paul''s apology in terms of their relational history?', '["Paul admits comprehensive wrongdoing","Open your hearts; Paul has wronged no one and corrupted no one","Paul is guilty","No relationship exists"]'::jsonb, 'Open your hearts; Paul has wronged no one and corrupted no one', 'Paul appeals to their direct knowledge of his conduct, suggesting they can testify to his integrity if they reflect honestly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does 2 Corinthians 7:2 frame Paul''s apology in terms of their relational history?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 7, 3, 'How does 2 Corinthians 7:8-10 distinguish between regret and repentance?', '["They are identical","Regret involves sorrow about consequences; repentance involves conviction and turning from sin","Both are harmful","Truth ultimately proves neither"]'::jsonb, 'Regret involves sorrow about consequences; repentance involves conviction and turning from sin', 'Paul differentiates between worldly sorrow (regret about being caught or suffering loss) and godly sorrow (genuine turning from wrongdoing).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does 2 Corinthians 7:8-10 distinguish between regret and repentance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 7, 3, 'In 2 Corinthians 7:11, what does Paul list as evidence of the Corinthians'' repentance?', '["Earnestness, clearing themselves, indignation, fear, and zeal for what is right","Fasting and prayer only","Financial restitution to Paul","Complete isolation from society"]'::jsonb, 'Earnestness, clearing themselves, indignation, fear, and zeal for what is right', 'What earnestness it caused in you, what clearing of yourselves, what indignation, what fear, what longing, what zeal, what vindication! (2 Corinthians 7:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Corinthians 7:11, what does Paul list as evidence of the Corinthians'' repentance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 7, 3, 'In 2 Corinthians 7:9-10, what paradox exists in the result of godly sorrow?', '["Sorrow eliminates happiness","Sorrow results in repentance which leads to salvation and ultimate joy","Sadness is permanent","No good results from pain"]'::jsonb, 'Sorrow results in repentance which leads to salvation and ultimate joy', 'The Corinthians'' pain became productive, leading to restored relationship with Paul and assurance of divine approval.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Corinthians 7:9-10, what paradox exists in the result of godly sorrow?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 7, 3, 'What does the relationship between Paul and Titus in 2 Corinthians 7:6-7 illustrate?', '["Individual ministry is superior","God uses relationships and spiritual community to provide comfort and strength","Personal isolation is preferable","Relationships hinder work"]'::jsonb, 'God uses relationships and spiritual community to provide comfort and strength', 'God comforted Paul through Titus-demonstrating that spiritual work involves community and mutual encouragement, not isolated effort.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the relationship between Paul and Titus in 2 Corinthians 7:6-7 illustrate?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 7, 3, 'What is the key distinction Paul makes between ''godly sorrow'' and ''worldly sorrow'' in 2 Corinthians 7:10?', '["Godly sorrow produces repentance, worldly sorrow produces death","Worldly sorrow is more intense than godly sorrow","Godly sorrow requires external punishment","Worldly sorrow leads to eternal life"]'::jsonb, 'Godly sorrow produces repentance, worldly sorrow produces death', 'Godly sorrow produces repentance leading to salvation, not to be regretted; but the sorrow of the world produces death (2 Corinthians 7:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the key distinction Paul makes between ''godly sorrow'' and ''worldly sorrow'' in 2 Corinthians 7:10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 7, 3, 'Why does Paul emphasize the completeness of the Corinthians'' obedience in 2 Corinthians 7:15?', '["Partial obedience is sufficient","Complete obedience proves genuine repentance and loyalty to Paul as God''s representative","Degrees of obedience don''t matter","Obedience is irrelevant"]'::jsonb, 'Complete obedience proves genuine repentance and loyalty to Paul as God''s representative', 'The Corinthians'' total obedience vindicates Paul''s apostolic authority and demonstrates their genuine spiritual transformation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 7
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul emphasize the completeness of the Corinthians'' obedience in 2 Corinthians 7:15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 7, 4, 'How does 2 Corinthians 7:1 serve as the practical outworking of the reconciliation theology in chapter 5?', '["No connection exists","Reconciled believers respond with sanctification-cleansing from defilement and perfecting holiness through God''s promises","Theology has no practical effect","Chapter 5 contradicts chapter 7"]'::jsonb, 'Reconciled believers respond with sanctification-cleansing from defilement and perfecting holiness through God''s promises', 'Having established reconciliation''s doctrine, Paul calls for its behavioral reality; reconciliation with God produces separation from sin and pursuit of holiness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 2 Corinthians 7:1 serve as the practical outworking of the reconciliation theology in chapter 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 7, 4, 'How does Paul''s vulnerability in 2 Corinthians 7:5-6 (admitting his anxiety and need for Titus) strengthen his apostolic authority?', '["Vulnerability undermines authority","Genuine humanity and dependence on God''s comfort strengthens credibility against rivals claiming invulnerability","Leaders must never need support","Authority requires distance"]'::jsonb, 'Genuine humanity and dependence on God''s comfort strengthens credibility against rivals claiming invulnerability', 'Paul''s transparency about his struggles contrasts with false apostles'' false invulnerability; it demonstrates authentic faith in God''s sustaining grace.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Paul''s vulnerability in 2 Corinthians 7:5-6 (admitting his anxiety and need for Titus) strengthen his apostolic authority?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 7, 4, 'In 2 Corinthians 7:12-13, how does Paul''s statement about acting ''for your sakes'' reframe the purpose of his severe letter?', '["The letter was about Paul''s interests","Strategic rebuke served their spiritual benefit though painful, demonstrating pastoral priority","Correction was unnecessary","Paul''s motivation was anger"]'::jsonb, 'Strategic rebuke served their spiritual benefit though painful, demonstrating pastoral priority', 'Paul clarifies that his rebuke, though severe, aimed at their restoration and vindication-prioritizing their growth over comfort.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'In 2 Corinthians 7:12-13, how does Paul''s statement about acting ''for your sakes'' reframe the purpose of his severe letter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 7, 4, 'In 2 Corinthians 7:5-6, how does Paul describe his emotional state and what relieved it?', '["He was afflicted in every way but was comforted by the coming of Titus","He was joyful and received no suffering","He was angry at the church and needed vindication","He was fearful and found comfort in his own strength"]'::jsonb, 'He was afflicted in every way but was comforted by the coming of Titus', 'When we came into Macedonia, our flesh had no respite... but God, who comforts the downcast, comforted us by the coming of Titus (2 Corinthians 7:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'In 2 Corinthians 7:5-6, how does Paul describe his emotional state and what relieved it?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 7, 4, 'What does the Corinthians'' rapid repentance in 2 Corinthians 7:11 indicate about Paul''s previous letter''s effectiveness?', '["The letter was ineffective","Combining rebuke with confidence in their spiritual capacity produced immediate transformation","Change never occurred","Harsh words alone produce change"]'::jsonb, 'Combining rebuke with confidence in their spiritual capacity produced immediate transformation', 'The effectiveness lay not merely in correction but in Paul''s demonstrated belief in their ability to respond-modeling both accountability and affirmation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does the Corinthians'' rapid repentance in 2 Corinthians 7:11 indicate about Paul''s previous letter''s effectiveness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 7, 4, 'What was communicated to Paul about the Corinthians through Titus in 2 Corinthians 7?', '["Their longing for him, their mourning, and their zeal for him","Their rejection of his authority","Their intention to follow Peter instead","Their plan to move to another city"]'::jsonb, 'Their longing for him, their mourning, and their zeal for him', 'And he told us of your longing, your mourning, your zeal for me (2 Corinthians 7:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'What was communicated to Paul about the Corinthians through Titus in 2 Corinthians 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 7, 4, 'What was the primary purpose of Paul''s severe letter mentioned in 2 Corinthians 7?', '["To produce repentance and demonstrate his care, not to cause harm","To expel a member from the church permanently","To establish his authority over all churches","To collect money for Jerusalem"]'::jsonb, 'To produce repentance and demonstrate his care, not to cause harm', 'I wrote to you out of much tribulation and anguish of heart and with many tears, not that you should be grieved, but that you might know the love I have for you (2 Corinthians 2:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 7
    AND q.difficulty_stage = 4
    AND q.prompt = 'What was the primary purpose of Paul''s severe letter mentioned in 2 Corinthians 7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 7, 5, 'How does Paul explain the role of testing and trials in 2 Corinthians 7 regarding the believers'' faith?', '["Trials prove the genuineness of faith and produce growth through godly sorrow","Believers should never experience any difficulty or testing","Trials are punishment for hidden sins","Trials are meaningless and serve no spiritual purpose"]'::jsonb, 'Trials prove the genuineness of faith and produce growth through godly sorrow', 'Godly sorrow produces repentance leading to salvation, not to be regretted (2 Corinthians 7:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Paul explain the role of testing and trials in 2 Corinthians 7 regarding the believers'' faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 7, 5, 'How does the emotional arc of 2 Corinthians 7 illustrate the psychological and relational process of reconciliation?', '["Emotions are irrelevant to reconciliation","Proper reconciliation involves sorrow for wrong, genuine repentance, mutual comfort, and restored confidence","Only thoughts matter","Feelings hinder reconciliation"]'::jsonb, 'Proper reconciliation involves sorrow for wrong, genuine repentance, mutual comfort, and restored confidence', 'Paul traces the journey: his anxiety, Titus''s arrival with news of their repentance, their demonstrated godly sorrow, and mutual joy-depicting reconciliation''s emotional realism.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does the emotional arc of 2 Corinthians 7 illustrate the psychological and relational process of reconciliation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 7, 5, 'In 2 Corinthians 7, what does Paul emphasize about his relationship with the Corinthians despite the difficulty?', '["He has complete confidence in them and boasts about them to others","He has lost all hope in their spiritual growth","He views them as enemies of the faith","He recommends they seek a different apostle"]'::jsonb, 'He has complete confidence in them and boasts about them to others', 'For even if I made you grieve with my letter, I do not regret it... I rejoice, not that you were grieved, but that you were grieved into repenting (2 Corinthians 7:8-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 2 Corinthians 7, what does Paul emphasize about his relationship with the Corinthians despite the difficulty?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 7, 5, 'In the context of Corinthian factionalism, how does 2 Corinthians 7:13-16 use Titus''s affection as evidence of Paul''s integrity?', '["Titus''s feelings are irrelevant","An apostle''s character is validated when respected colleagues testify personally to their virtue and effect","Testimony is unreliable","Paul needs no validation"]'::jsonb, 'An apostle''s character is validated when respected colleagues testify personally to their virtue and effect', 'Titus''s affection and testimony to the Corinthians serves as external, credible witness against those questioning Paul''s apostolic legitimacy.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'In the context of Corinthian factionalism, how does 2 Corinthians 7:13-16 use Titus''s affection as evidence of Paul''s integrity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 7, 5, 'What does Paul mean by ''godly sorrow'' in 2 Corinthians 7:9-10, and what is its result?', '["Remorse about being caught in sin without genuine repentance","Sorrow according to God''s will produces repentance to salvation without regret, while worldly sorrow brings death","All sadness about sin leads to transformation","God''s sorrow is experienced differently than human sorrow"]'::jsonb, 'Sorrow according to God''s will produces repentance to salvation without regret, while worldly sorrow brings death', 'For godly sorrow produces repentance leading to salvation, not to be regretted; but the sorrow of the world produces death (2 Corinthians 7:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Paul mean by ''godly sorrow'' in 2 Corinthians 7:9-10, and what is its result?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 7, 5, 'What does Paul''s confidence in the Corinthians'' continued obedience imply about the relationship between justification and sanctification in his theology?', '["Justification guarantees sinless perfection","Growth in obedience follows justification; believers internalize Paul''s authority through their transformation","Obedience is irrelevant to faith","Justification eliminates struggle"]'::jsonb, 'Growth in obedience follows justification; believers internalize Paul''s authority through their transformation', 'Paul''s trust that the Corinthians will continue obeying reflects his belief that justification initiates transformation-grace doesn''t eliminate effort but motivates it.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Paul''s confidence in the Corinthians'' continued obedience imply about the relationship between justification and sanctification in his theology?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 7, 5, 'What theological principle about God''s work does Paul establish in 2 Corinthians 7:10?', '["God''s design produces outcomes; sorrow from God leads to repentance and salvation","God forces salvation upon all people equally","Human emotion alone determines spiritual outcomes","Sorrow is always evil and should be avoided"]'::jsonb, 'God''s design produces outcomes; sorrow from God leads to repentance and salvation', 'Godly sorrow produces repentance leading to salvation, not to be regretted; but the sorrow of the world produces death (2 Corinthians 7:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 7
    AND q.difficulty_stage = 5
    AND q.prompt = 'What theological principle about God''s work does Paul establish in 2 Corinthians 7:10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 8, 1, 'How does 2 Corinthians 8:2 describe the Macedonians'' giving despite their circumstances?', '["They were wealthy and comfortable","In great trials and deep poverty, they gave liberally","They gave reluctantly","They refused to give"]'::jsonb, 'In great trials and deep poverty, they gave liberally', '2 Corinthians 8:2 states that the Macedonians'' ''abundance of joy and their deep poverty abounded in the riches of their liberality.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'How does 2 Corinthians 8:2 describe the Macedonians'' giving despite their circumstances?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 8, 1, 'In 2 Corinthians 8:5, what did the Macedonians give first?', '["Only their money","Themselves to the Lord","Their possessions","Their time"]'::jsonb, 'Themselves to the Lord', '2 Corinthians 8:5 emphasizes they ''first gave themselves to the Lord, and then to us by the will of God.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'In 2 Corinthians 8:5, what did the Macedonians give first?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 8, 1, 'What church does Paul mention as an example of generous giving in 2 Corinthians 8:1?', '["The church at Rome","The churches of Macedonia","The church at Corinth","The church at Jerusalem"]'::jsonb, 'The churches of Macedonia', '2 Corinthians 8:1 references the grace of God given to the Macedonian churches.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'What church does Paul mention as an example of generous giving in 2 Corinthians 8:1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 8, 1, 'What does Paul advise the Corinthians to do in 2 Corinthians 8:11?', '["Give nothing","Complete what they began with willingness","Delay their giving","Give only what is easy"]'::jsonb, 'Complete what they began with willingness', '2 Corinthians 8:11 urges the Corinthians to complete the task they began ''that as there was a readiness to desire it, so there may be a completion.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does Paul advise the Corinthians to do in 2 Corinthians 8:11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 8, 1, 'What does Paul describe in 2 Corinthians 8 that the churches of Macedonia were known for?', '["Their generosity in giving","Their military power","Their philosophical teachings","Their agricultural abundance"]'::jsonb, 'Their generosity in giving', 'The churches of Macedonia... overflowed in a wealth of generosity (2 Corinthians 8:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does Paul describe in 2 Corinthians 8 that the churches of Macedonia were known for?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 8, 1, 'What reason does Paul give for the Corinthians'' giving in 2 Corinthians 8:9?', '["Obligation to the poor","To imitate Christ who became poor that they might become rich","Pressure from Paul","Fear of punishment"]'::jsonb, 'To imitate Christ who became poor that they might become rich', '2 Corinthians 8:9 states: ''Though He was rich, yet for your sakes He became poor, that you through His poverty might become rich.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'What reason does Paul give for the Corinthians'' giving in 2 Corinthians 8:9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 8, 1, 'What spiritual gift does Paul mention in 2 Corinthians 8:7?', '["Only generosity","Grace, faith, utterance, knowledge, and giving","Only faith","Only knowledge"]'::jsonb, 'Grace, faith, utterance, knowledge, and giving', '2 Corinthians 8:7 states the Corinthians excel in grace, utterance, knowledge, earnestness, and love.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 8
    AND q.difficulty_stage = 1
    AND q.prompt = 'What spiritual gift does Paul mention in 2 Corinthians 8:7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 8, 2, 'According to 2 Corinthians 8:12, what determines acceptable giving?', '["The amount given","Willingness from what one has, not from what one does not have","Pressure from others","Obligation"]'::jsonb, 'Willingness from what one has, not from what one does not have', '2 Corinthians 8:12 states the gift is ''acceptable according to what one has, and not according to what he does not have.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 2 Corinthians 8:12, what determines acceptable giving?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 8, 2, 'In 2 Corinthians 8:3, what does Paul say about the Macedonians giving beyond their capacity?', '["They couldn''t afford it","They gave according to their means and beyond, by their own desire","They were forced","They regretted it"]'::jsonb, 'They gave according to their means and beyond, by their own desire', '2 Corinthians 8:3 notes they gave even ''beyond their ability, of their own accord.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'In 2 Corinthians 8:3, what does Paul say about the Macedonians giving beyond their capacity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 8, 2, 'In 2 Corinthians 8:3-4, how did the churches of Macedonia demonstrate their commitment to giving?', '["They gave beyond their ability and begged to participate in the collection","They gave only what was required by law","They gave reluctantly under pressure","They gave only to receive recognition"]'::jsonb, 'They gave beyond their ability and begged to participate in the collection', 'They gave according to their ability, yes and beyond their ability... begging us with much urging to take the fellowship of the giving to the saints (2 Corinthians 8:3-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'In 2 Corinthians 8:3-4, how did the churches of Macedonia demonstrate their commitment to giving?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 8, 2, 'What does 2 Corinthians 8:6 indicate about Titus''s role in the giving project?', '["Titus refused to help","Titus encouraged the Corinthians to complete their generous work","The collection was Titus''s idea alone","Titus was uninvolved"]'::jsonb, 'Titus encouraged the Corinthians to complete their generous work', '2 Corinthians 8:6 indicates Titus encouraged the Corinthians to complete their generous work.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does 2 Corinthians 8:6 indicate about Titus''s role in the giving project?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 8, 2, 'What principle does Paul establish in 2 Corinthians 8:13-14 regarding giving and relief?', '["The wealthy should keep all possessions","Giving should balance inequalities so there is equality among believers","Poverty is permanent","Equality is impossible"]'::jsonb, 'Giving should balance inequalities so there is equality among believers', '2 Corinthians 8:13-14 promotes equality: the rich''s abundance supplies the poor''s lack, creating mutual support.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'What principle does Paul establish in 2 Corinthians 8:13-14 regarding giving and relief?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 8, 2, 'What principle of generous giving does Paul establish in 2 Corinthians 8:12?', '["Willingness is what counts, not the amount given","Only the wealthy should give to God","Giving must always be equal among believers","The poor should give more than the rich"]'::jsonb, 'Willingness is what counts, not the amount given', 'If the willingness is there, the gift is acceptable according to what one has (2 Corinthians 8:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'What principle of generous giving does Paul establish in 2 Corinthians 8:12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 8, 2, 'Why does Paul present the Macedonian example before exhorting Corinthian giving?', '["To shame the Corinthians","To inspire imitation of generous love and demonstrate giving''s grace","To criticize the Corinthians","As coincidence"]'::jsonb, 'To inspire imitation of generous love and demonstrate giving''s grace', 'Paul uses the Macedonians'' liberality as a positive model-their joy in poverty contrasts with and should inspire the Corinthians'' relative wealth.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 8
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why does Paul present the Macedonian example before exhorting Corinthian giving?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 8, 3, 'How does 2 Corinthians 8:9 connect Christ''s incarnation to the theology of Christian generosity?', '["Generosity is unrelated to Christ","Christ''s voluntary self-impoverishment establishes the pattern and motivation for believers'' sacrificial giving","Generosity is burdensome","Christ''s wealth ensures our comfort"]'::jsonb, 'Christ''s voluntary self-impoverishment establishes the pattern and motivation for believers'' sacrificial giving', 'Paul roots generosity in Christology: Christ emptied Himself of wealth and privilege for others'' benefit, modeling the giving attitude.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does 2 Corinthians 8:9 connect Christ''s incarnation to the theology of Christian generosity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 8, 3, 'How does the language of ''grace'' in 2 Corinthians 8:1-4 reframe the giving project?', '["Grace is unrelated to generosity","Giving is described as God''s grace operating in believers, not mere human effort","Grace eliminates giving","Giving is human achievement"]'::jsonb, 'Giving is described as God''s grace operating in believers, not mere human effort', 'Paul attributes all giving to God''s grace-it''s not believers'' independent righteousness but grace working through them.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does the language of ''grace'' in 2 Corinthians 8:1-4 reframe the giving project?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 8, 3, 'In 2 Corinthians 8:7-8, why does Paul appeal to comparison rather than command regarding giving?', '["Paul lacks authority","Willing generosity demonstrates sincere love more authentically than obligation","Commands are unnecessary","Love and obedience contradict"]'::jsonb, 'Willing generosity demonstrates sincere love more authentically than obligation', 'Paul proves the Corinthians'' sincerity of love through voluntary giving-contrasting external command with internal transformation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Corinthians 8:7-8, why does Paul appeal to comparison rather than command regarding giving?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 8, 3, 'In 2 Corinthians 8:9, what does Paul use as the supreme example of humbling generosity?', '["Christ''s becoming poor so we might become rich through his poverty","The wealthy rulers of the world","The Roman emperors'' generosity to their citizens","The scribes and Pharisees'' almsgiving"]'::jsonb, 'Christ''s becoming poor so we might become rich through his poverty', 'You know the grace of our Lord Jesus Christ, that though he was rich, yet for your sake he became poor, so that you through his poverty might become rich (2 Corinthians 8:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Corinthians 8:9, what does Paul use as the supreme example of humbling generosity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 8, 3, 'What does 2 Corinthians 8:13-15 suggest about the relationship between present inequality and future equality?', '["Inequality is God''s permanent design","Believers should work toward material equilibrium through giving, ensuring no one has excess while others lack","Help is impossible","Equality is unnecessary"]'::jsonb, 'Believers should work toward material equilibrium through giving, ensuring no one has excess while others lack', 'Paul envisions mutual obligation: the Corinthians'' abundance meets Macedonian need, and their future need might be met by others.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 2 Corinthians 8:13-15 suggest about the relationship between present inequality and future equality?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 8, 3, 'What does the Macedonian example in 2 Corinthians 8:1-5 reveal about the connection between faith and generosity?', '["Faith and generosity are unrelated","Deep spiritual commitment (''giving themselves to the Lord'') produces generous love regardless of economic hardship","Poverty prevents faith","Wealth necessitates generosity"]'::jsonb, 'Deep spiritual commitment (''giving themselves to the Lord'') produces generous love regardless of economic hardship', 'The Macedonians'' generosity flows from prior self-surrender to God; spiritual allegiance, not economic status, determines giving.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the Macedonian example in 2 Corinthians 8:1-5 reveal about the connection between faith and generosity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 8, 3, 'What is Paul''s perspective on fairness in giving addressed in 2 Corinthians 8:13-14?', '["The goal is equality: those with abundance help those in need","Some should always have more than others","Everyone must give identical amounts","The poor should not receive help from the rich"]'::jsonb, 'The goal is equality: those with abundance help those in need', 'Our desire is not that others might be relieved while you are hard pressed, but that there might be equality. At the present time your plenty will supply what they need (2 Corinthians 8:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is Paul''s perspective on fairness in giving addressed in 2 Corinthians 8:13-14?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 8, 3, 'Who did Paul send ahead to the Corinthians to prepare their generous gift in advance in 2 Corinthians 8:6?', '["Titus","Timothy","Barnabas","Silas"]'::jsonb, 'Titus', 'We have urged Titus... that as he had started, so he should also complete for you this gracious work (2 Corinthians 8:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 8
    AND q.difficulty_stage = 3
    AND q.prompt = 'Who did Paul send ahead to the Corinthians to prepare their generous gift in advance in 2 Corinthians 8:6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 8, 4, 'How does 2 Corinthians 8:10-12 address the tension between intention and completion in giving?', '["Intentions alone are sufficient","Completing begun commitments with willing hearts is essential; readiness means action","Completion is unnecessary","Intentions can substitute for action"]'::jsonb, 'Completing begun commitments with willing hearts is essential; readiness means action', 'Paul encourages the Corinthians to follow through on their initial decision to contribute; unfinished intentions undermine community trust.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 2 Corinthians 8:10-12 address the tension between intention and completion in giving?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 8, 4, 'How does Paul''s discussion of the Macedonian churches reveal the relationship between suffering and spiritual growth in 2 Corinthians 8:1-5?', '["Suffering prevents growth","Trials produce character and generosity; afflictions don''t constrain grace but enable it","Comfort guarantees virtue","Suffering is pointless"]'::jsonb, 'Trials produce character and generosity; afflictions don''t constrain grace but enable it', 'The Macedonians'' trials paradoxically enhanced their spiritual maturity, demonstrated by their generous overflow-suffering refined faith rather than diminishing it.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Paul''s discussion of the Macedonian churches reveal the relationship between suffering and spiritual growth in 2 Corinthians 8:1-5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 8, 4, 'In 2 Corinthians 8:21, what concern does Paul raise about the collection for the saints?', '["He wants to ensure integrity and honesty in handling the money","He doesn''t trust the recipients","He wants to become wealthy from it","He has concerns about the poor"]'::jsonb, 'He wants to ensure integrity and honesty in handling the money', 'For we aim at what is honorable not only in the Lord''s sight but also in the sight of men (2 Corinthians 8:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'In 2 Corinthians 8:21, what concern does Paul raise about the collection for the saints?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 8, 4, 'In what way does the principle of ''equality'' in 2 Corinthians 8:14 function as an alternative to both communism and unconstrained capitalism?', '["Paul advocates communism","Giving creates equilibrium where abundance supplies need, promoting mutual care while respecting ownership","Unconstrained wealth is blessed","Equality means identical distribution"]'::jsonb, 'Giving creates equilibrium where abundance supplies need, promoting mutual care while respecting ownership', 'Neither extreme (abolishing property or ignoring need), but responsive generosity-those with abundance deliberately sharing to eliminate others'' lack.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'In what way does the principle of ''equality'' in 2 Corinthians 8:14 function as an alternative to both communism and unconstrained capitalism?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 8, 4, 'What does Paul mean by saying believers should ''abound in this grace'' of giving in 2 Corinthians 8?', '["They should excel in generosity as they excel in faith and knowledge","They should give only when commanded","Generosity is less important than doctrine","Financial giving has no spiritual significance"]'::jsonb, 'They should excel in generosity as they excel in faith and knowledge', 'But as you abound in everything-in faith, in utterance, in knowledge, in all diligence, and in your love for us-see that you abound in this grace of giving (2 Corinthians 8:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Paul mean by saying believers should ''abound in this grace'' of giving in 2 Corinthians 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 8, 4, 'What explicit instruction does Paul give about collecting the gift in 2 Corinthians 8:1-2?', '["They should contribute to the collection with eager willingness guided by their ability and love","They should wait for Paul''s personal instruction","They should deny themselves all basic needs","They should copy the exact amounts given elsewhere"]'::jsonb, 'They should contribute to the collection with eager willingness guided by their ability and love', 'The churches of Macedonia... out of the most severe trial, their overflowing joy and their extreme poverty welled up in rich generosity (2 Corinthians 8:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'What explicit instruction does Paul give about collecting the gift in 2 Corinthians 8:1-2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 8, 4, 'What reality about their own situation does Paul remind the Macedonians about in contrast to their giving in 2 Corinthians 8:2?', '["Though in great affliction and poverty, their joy overflowed in generosity","They were wealthy and gave from their abundance","They were comfortable and stressed-free","They had been promised exemption from trials"]'::jsonb, 'Though in great affliction and poverty, their joy overflowed in generosity', 'Out of the most severe trial, their overflowing joy and their extreme poverty welled up in rich generosity (2 Corinthians 8:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 8
    AND q.difficulty_stage = 4
    AND q.prompt = 'What reality about their own situation does Paul remind the Macedonians about in contrast to their giving in 2 Corinthians 8:2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 8, 5, 'How does 2 Corinthians 8:13-14''s vision of ''equality among believers'' challenge both ancient patronage systems and modern economic models?', '["Patronage is endorsed","Mutual obligation and responsive generosity replace hierarchical dependency; believers practice reciprocal care transcending economic stratification","Economic systems are irrelevant","Wealth concentration is biblical"]'::jsonb, 'Mutual obligation and responsive generosity replace hierarchical dependency; believers practice reciprocal care transcending economic stratification', 'Paul''s model rejects patronage (wealthy controlling poor through obligation) and inequality systems, establishing communities where abundance serves need.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 2 Corinthians 8:13-14''s vision of ''equality among believers'' challenge both ancient patronage systems and modern economic models?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 8, 5, 'How does 2 Corinthians 8:9 serve as the theological foundation for Paul''s entire argument about Christian giving throughout chapters 8-9?', '["Christ''s wealth is the foundation","Christ''s voluntary poverty demonstrates the pattern of self-sacrifice that should motivate all Christian generosity","Generosity is unrelated to Christ","Wealth-keeping is Christ''s model"]'::jsonb, 'Christ''s voluntary poverty demonstrates the pattern of self-sacrifice that should motivate all Christian generosity', 'Paul anchors all exhortation to give in Christology-believers imitate Christ''s self-emptying love by sacrificing possessions for others'' welfare.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 2 Corinthians 8:9 serve as the theological foundation for Paul''s entire argument about Christian giving throughout chapters 8-9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 8, 5, 'How does Paul frame the relationship between Christ''s sacrifice and Christian giving in 2 Corinthians 8:9?', '["Christ''s humiliation and poverty becomes the pattern and motivation for our generosity","Christ''s sacrifice requires no response or imitation from believers","Material giving is incompatible with faith in Christ","Only those wealthy can demonstrate faith in Christ"]'::jsonb, 'Christ''s humiliation and poverty becomes the pattern and motivation for our generosity', 'You know the grace of our Lord Jesus Christ, that though he was rich, yet for your sake he became poor, so that you through his poverty might become rich (2 Corinthians 8:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Paul frame the relationship between Christ''s sacrifice and Christian giving in 2 Corinthians 8:9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 8, 5, 'In 2 Corinthians 8:14-15, what Old Testament principle does Paul reference to justify mutual support among churches?', '["Equality of conditions: those with abundance supply those in need, as with the manna in the wilderness","All believers must remain in poverty","Wealth accumulation is always sinful","Churches should isolate from one another"]'::jsonb, 'Equality of conditions: those with abundance supply those in need, as with the manna in the wilderness', 'It is written: ''The one who gathered much did not have too much, and the one who gathered little did not have too little'' (2 Corinthians 8:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 2 Corinthians 8:14-15, what Old Testament principle does Paul reference to justify mutual support among churches?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 8, 5, 'In the context of Corinthian pride and boasting, how does Paul''s emphasis on willing and gracious giving in 2 Corinthians 8:1-12 address their spiritual maturity?', '["Boasting is virtuous","True spiritual maturity is demonstrated through humble grace and sacrifice, not proud achievement","Generosity demonstrates superiority","Boasting accompanies giving"]'::jsonb, 'True spiritual maturity is demonstrated through humble grace and sacrifice, not proud achievement', 'Paul counters the Corinthians'' self-promotion with an ethic of generosity as grace-demonstration-maturity is measured by voluntary sacrifice, not public acclaim.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'In the context of Corinthian pride and boasting, how does Paul''s emphasis on willing and gracious giving in 2 Corinthians 8:1-12 address their spiritual maturity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 8, 5, 'What does Paul''s repeated emphasis on willing participation in giving suggest about the nature of true generosity in 2 Corinthians 8?', '["True generosity flows from inner conviction and free choice, not compulsion","Reluctant giving is more pleasing to God","Generosity should be legislated and enforced","Those who give reluctantly are more righteous"]'::jsonb, 'True generosity flows from inner conviction and free choice, not compulsion', 'Each of you should give what you have decided in your heart to give, not reluctantly or under compulsion, for God loves a cheerful giver (2 Corinthians 9:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Paul''s repeated emphasis on willing participation in giving suggest about the nature of true generosity in 2 Corinthians 8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 8, 5, 'What theological motivation does Paul provide for the Macedonians'' extraordinary generosity in 2 Corinthians 8:5?', '["They first gave themselves to the Lord, making financial giving a natural overflow","They were seeking public recognition and status","They expected financial return on their investment","They were trying to earn salvation through works"]'::jsonb, 'They first gave themselves to the Lord, making financial giving a natural overflow', 'They gave themselves first to the Lord and then to us by the will of God (2 Corinthians 8:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 8
    AND q.difficulty_stage = 5
    AND q.prompt = 'What theological motivation does Paul provide for the Macedonians'' extraordinary generosity in 2 Corinthians 8:5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 9, 1, 'According to 2 Corinthians 9, what does God love?', '["A cheerful giver","The rich","Those who repent","Faithful servants"]'::jsonb, 'A cheerful giver', '2 Corinthians 9:7 states ''God loves a cheerful giver.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Corinthians 9, what does God love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 9, 1, 'According to 2 Corinthians 9:10, what does God provide?', '["Seed to the sower","Food for the weak","Clothes for the poor","Shelter for refugees"]'::jsonb, 'Seed to the sower', '2 Corinthians 9:10 states ''God...provides seed to the sower and bread for food.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Corinthians 9:10, what does God provide?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 9, 1, 'In 2 Corinthians 9:6, what will a person reap if they sow sparingly?', '["Sparingly","Abundantly","Nothing","Double"]'::jsonb, 'Sparingly', '2 Corinthians 9:6 says ''Whoever sows sparingly will also reap sparingly.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'In 2 Corinthians 9:6, what will a person reap if they sow sparingly?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 9, 1, 'In 2 Corinthians 9:8, what does Paul say God is able to do?', '["Make you rich","Make all grace abound toward you","Give you perfect health","Guarantee your salvation"]'::jsonb, 'Make all grace abound toward you', '2 Corinthians 9:8 reads ''And God is able to make all grace abound toward you.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'In 2 Corinthians 9:8, what does Paul say God is able to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 9, 1, 'What collection was Paul organizing in 2 Corinthians 9?', '["For the poor in Jerusalem","For temple renovation","For missionary work","For his own needs"]'::jsonb, 'For the poor in Jerusalem', '2 Corinthians 8-9 discusses Paul organizing a collection for the poor saints in Jerusalem.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'What collection was Paul organizing in 2 Corinthians 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 9, 1, 'What does 2 Corinthians 9:12 say giving accomplishes?', '["Supplies the needs of the saints","Makes you wealthy","Ensures heaven","Impresses others"]'::jsonb, 'Supplies the needs of the saints', '2 Corinthians 9:12 indicates giving ''is supplying the needs of the saints.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does 2 Corinthians 9:12 say giving accomplishes?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 9, 1, 'Who is the example of generosity that Paul references in 2 Corinthians 8-9?', '["The churches of Macedonia","Peter and James","The wealthy Romans","King David"]'::jsonb, 'The churches of Macedonia', '2 Corinthians 8:1-5 presents the Macedonian churches as examples of generous giving despite poverty.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 9
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who is the example of generosity that Paul references in 2 Corinthians 8-9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 9, 2, 'According to 2 Corinthians 9:7, what condition makes giving acceptable?', '["With reluctance","With joy and willingness","Under compulsion","Only to the poor"]'::jsonb, 'With joy and willingness', '2 Corinthians 9:7 stresses giving should be voluntary, not under compulsion.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 2 Corinthians 9:7, what condition makes giving acceptable?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 9, 2, 'According to 2 Corinthians 9:9, whose words does Paul quote about generosity?', '["Moses","David","Solomon","Isaiah"]'::jsonb, 'David', '2 Corinthians 9:9 quotes Psalm 112:9 about distributing freely to the poor.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 2 Corinthians 9:9, whose words does Paul quote about generosity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 9, 2, 'How does Paul describe the results of generous giving in 2 Corinthians 9:11?', '["It creates poverty","You will be made rich in every way","Others will owe you","God will punish you"]'::jsonb, 'You will be made rich in every way', '2 Corinthians 9:11 promises ''you will be made rich in every way so that you can be generous on every occasion.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does Paul describe the results of generous giving in 2 Corinthians 9:11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 9, 2, 'In 2 Corinthians 9, what does Paul emphasize about one''s giving ability?', '["Give only from excess","Give according to what you have","Never give more than others","Give only if wealthy"]'::jsonb, 'Give according to what you have', '2 Corinthians 8:12 emphasizes willingness according to what one has, not what one lacks.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'In 2 Corinthians 9, what does Paul emphasize about one''s giving ability?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 9, 2, 'What concern about the collection does Paul address in 2 Corinthians 9:3-4?', '["It might not be completed","Others might criticize it","Titus might reject it","It would offend the rich"]'::jsonb, 'It might not be completed', '2 Corinthians 9:3-4 shows Paul wanted to ensure the promised gift was ready.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'What concern about the collection does Paul address in 2 Corinthians 9:3-4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 9, 2, 'What does 2 Corinthians 9:8 suggest about God''s grace in relation to good works?', '["Grace prevents good works","Grace makes you prideful","Grace abounds to enable every good work","Grace is separate from works"]'::jsonb, 'Grace abounds to enable every good work', '2 Corinthians 9:8 states God''s grace abounds ''so that...you will abound in every good work.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does 2 Corinthians 9:8 suggest about God''s grace in relation to good works?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 9, 2, 'What thanksgiving response does Paul expect from the recipients of the collection (2 Corinthians 9:11-12)?', '["Material repayment","Political support","Glory to God through their generosity","Conversion to Christianity"]'::jsonb, 'Glory to God through their generosity', '2 Corinthians 9:11-13 indicates giving leads to thanksgiving and glorifying God.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 9
    AND q.difficulty_stage = 2
    AND q.prompt = 'What thanksgiving response does Paul expect from the recipients of the collection (2 Corinthians 9:11-12)?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 9, 3, 'According to 2 Corinthians 9:5, what had Paul previously asked the Corinthians to prepare?', '["A church building","The promised generous gift that was pledged","A letter to the apostles","Accommodation for his visit"]'::jsonb, 'The promised generous gift that was pledged', '2 Corinthians 9:5 references Paul''s earlier request for them to complete their promised contribution.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'According to 2 Corinthians 9:5, what had Paul previously asked the Corinthians to prepare?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 9, 3, 'How does Paul connect giving to spiritual maturity in 2 Corinthians 9?', '["Giving proves faith","Generous giving demonstrates love and obedience to God''s word","Only wealthy believers should give","Giving guarantees perfection"]'::jsonb, 'Generous giving demonstrates love and obedience to God''s word', '2 Corinthians 9:13 connects the giving to obedience to the gospel of Christ.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Paul connect giving to spiritual maturity in 2 Corinthians 9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 9, 3, 'How does Paul distinguish between coerced and voluntary giving in 2 Corinthians 9:7?', '["Both are equally valid","Coerced giving is superior","Voluntary giving with right attitude pleases God","Involuntary giving is more noble"]'::jsonb, 'Voluntary giving with right attitude pleases God', '2 Corinthians 9:7 emphasizes that each person should decide what to give, not grudgingly.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Paul distinguish between coerced and voluntary giving in 2 Corinthians 9:7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 9, 3, 'In 2 Corinthians 9, Paul describes God''s provision for those who give generously. What does Paul say God is able to do for the giver?', '["Supply all needs abundantly","Ensure worldly wealth only","Remove all earthly struggles","Grant spiritual authority only"]'::jsonb, 'Supply all needs abundantly', 'Paul states in 9:8 that ''God is able to bless you abundantly, so that in all things at all times, having all that you need, you will abound in every good work.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Corinthians 9, Paul describes God''s provision for those who give generously. What does Paul say God is able to do for the giver?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 9, 3, 'In 2 Corinthians 9:13, what does Paul say the collection accomplishes beyond material support?', '["Prevents persecution","Proves obedience to Christ and leads to thanksgiving to God","Converts unbelievers","Establishes Paul''s authority"]'::jsonb, 'Proves obedience to Christ and leads to thanksgiving to God', '2 Corinthians 9:13 indicates the collection reveals obedience to the gospel and produces thanksgiving.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Corinthians 9:13, what does Paul say the collection accomplishes beyond material support?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 9, 3, 'What does 2 Corinthians 9:10-11 suggest about the relationship between sufficiency and generosity?', '["Only the rich can be generous","Sufficiency enables generosity in all circumstances","Poverty prevents any giving","Generosity creates poverty"]'::jsonb, 'Sufficiency enables generosity in all circumstances', '2 Corinthians 9:10-11 promises God provides both bread and seed, enabling rejoicing and generosity.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 2 Corinthians 9:10-11 suggest about the relationship between sufficiency and generosity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 9, 3, 'What principle does Paul establish in 2 Corinthians 9:6 about the nature of giving?', '["Giving depletes resources","Investment and return principle applies to generosity","Only large amounts matter","Small gifts are worthless"]'::jsonb, 'Investment and return principle applies to generosity', '2 Corinthians 9:6 uses the agricultural metaphor of sowing and reaping to show proportional blessings.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 9
    AND q.difficulty_stage = 3
    AND q.prompt = 'What principle does Paul establish in 2 Corinthians 9:6 about the nature of giving?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 9, 4, 'According to Paul in 2 Corinthians 9:7, what determines whether giving is acceptable to God?', '["The amount given to the church","What the giver''s heart decides to give","Public recognition of the donation","Pressure from church leaders"]'::jsonb, 'What the giver''s heart decides to give', 'Paul states ''You must each decide in your heart how much to give. And don''t give reluctantly or in response to pressure.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'According to Paul in 2 Corinthians 9:7, what determines whether giving is acceptable to God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 9, 4, 'How does Paul use Psalm 112:9 in 2 Corinthians 9:9 to reframe the Corinthians'' giving?', '["To shame them for stinginess","To connect their giving to the righteous pattern of generosity described in scripture","To reduce their gift obligation","To praise only the wealthy"]'::jsonb, 'To connect their giving to the righteous pattern of generosity described in scripture', 'Paul cites Psalm 112:9 to show that generous giving aligns with the righteous character described in scripture.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Paul use Psalm 112:9 in 2 Corinthians 9:9 to reframe the Corinthians'' giving?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 9, 4, 'How might 2 Corinthians 9:13 be understood as connecting social action to gospel proclamation?', '["Social action replaces witness","Generosity provides visible proof of the gospel''s transformative power","The gospel is only spiritual","Works contradict faith"]'::jsonb, 'Generosity provides visible proof of the gospel''s transformative power', '2 Corinthians 9:13 indicates that the collection proves obedience to Christ and glorifies God, making faith visible.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'How might 2 Corinthians 9:13 be understood as connecting social action to gospel proclamation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 9, 4, 'In the context of 2 Corinthians 8-9, what does the Corinthians'' giving demonstrate about ecclesial unity?', '["Churches are independent units","Demonstration of practical love across communities strengthens the body of Christ","Only Jewish believers should help others","Aid is a sign of weakness"]'::jsonb, 'Demonstration of practical love across communities strengthens the body of Christ', 'The collection exemplifies koinonia (fellowship) and mutual care among churches-a key expression of unity.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'In the context of 2 Corinthians 8-9, what does the Corinthians'' giving demonstrate about ecclesial unity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 9, 4, 'What agricultural metaphor does Paul use in 9:10 to describe the relationship between giving seeds and receiving a harvest?', '["The sower who sows sparingly will reap sparingly","The farmer who waits always receives the largest crop","Planting seeds guarantees immediate financial return","God multiplies crops only for the wealthy"]'::jsonb, 'The sower who sows sparingly will reap sparingly', 'Paul writes in 9:6: ''Remember this: Whoever sows sparingly will also reap sparingly, and whoever sows generously will also reap generously.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'What agricultural metaphor does Paul use in 9:10 to describe the relationship between giving seeds and receiving a harvest?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 9, 4, 'What does Paul suggest about the relationship between attitude and action in 2 Corinthians 9:7?', '["Attitude is irrelevant to giving","Right attitude transforms the act of giving itself","Actions matter more than intentions","External compliance is all that matters"]'::jsonb, 'Right attitude transforms the act of giving itself', '2 Corinthians 9:7 indicates that a ''cheerful'' heart changes the nature and acceptance of the gift.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Paul suggest about the relationship between attitude and action in 2 Corinthians 9:7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 9, 4, 'What theological principle underlines Paul''s argument about giving in 2 Corinthians 9:8-11?', '["Poverty is spiritual","God''s supply and blessing enable continuous generosity","Wealth indicates holiness","Material resources are unimportant"]'::jsonb, 'God''s supply and blessing enable continuous generosity', '2 Corinthians 9:8-11 establishes that divine sufficiency and blessing empower sustained generosity.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 9
    AND q.difficulty_stage = 4
    AND q.prompt = 'What theological principle underlines Paul''s argument about giving in 2 Corinthians 9:8-11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 9, 5, 'How does 2 Corinthians 9:12-13 frame the collection as more than charity?', '["It is purely financial redistribution","It expresses obedience, produces gratitude, and reveals character transformation through the gospel","It is a tax","It demonstrates superiority"]'::jsonb, 'It expresses obedience, produces gratitude, and reveals character transformation through the gospel', '2 Corinthians 9:12-13 shows the gift supplies needs, produces thanksgiving, and proves obedience to Christ.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 2 Corinthians 9:12-13 frame the collection as more than charity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 9, 5, 'How does Paul''s discussion of sowing and reaping in 2 Corinthians 9 challenge a purely transactional view of Christian giving?', '["He argues that God''s provision is conditional on perfection","He emphasizes God''s abundance flows from generosity motivated by grace, not by calculating returns","He promises material wealth proportional to the amount given","He suggests giving should only occur when one has surplus"]'::jsonb, 'He emphasizes God''s abundance flows from generosity motivated by grace, not by calculating returns', 'Paul frames giving within the context of God''s grace (9:8) and the cheerful heart (9:7), directing focus away from transactional benefit toward gratitude and spiritual transformation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Paul''s discussion of sowing and reaping in 2 Corinthians 9 challenge a purely transactional view of Christian giving?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 9, 5, 'How does the theology of divine sufficiency in 2 Corinthians 9:8 inform Christian economic ethics?', '["Wealth is sinful","Trust in God''s provision enables generosity without anxiety about personal scarcity","Material needs are unspiritual","Only the rich have obligations"]'::jsonb, 'Trust in God''s provision enables generosity without anxiety about personal scarcity', '2 Corinthians 9:8 suggests faith in God''s abundant grace liberates giving from fear of deprivation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does the theology of divine sufficiency in 2 Corinthians 9:8 inform Christian economic ethics?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 9, 5, 'What does Paul mean by his statement that God ''loves a cheerful giver'' in 2 Corinthians 9:7, and how does this relate to the Proverbs passage he references?', '["Happiness determines one''s financial status","God''s pleasure in giving stems from a willing, joyful heart rather than obligatory or grudging generosity","Cheerfulness requires giving away all possessions","Only wealthy people can give cheerfully"]'::jsonb, 'God''s pleasure in giving stems from a willing, joyful heart rather than obligatory or grudging generosity', 'The quote echoes Proverbs 22:8-9, emphasizing that genuine giving flows from internal joy and willingness, reflecting a transformation of heart rather than external compliance.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Paul mean by his statement that God ''loves a cheerful giver'' in 2 Corinthians 9:7, and how does this relate to the Proverbs passage he references?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 9, 5, 'What is the ultimate spiritual purpose of the collection Paul describes in chapter 9, beyond the relief of poverty?', '["To prove Corinthian wealth to Jerusalem","To create thanksgiving to God and Christian unity through generosity","To establish Paul''s personal authority","To mandate economic equality among all believers"]'::jsonb, 'To create thanksgiving to God and Christian unity through generosity', 'Paul emphasizes in 9:11-13 that generous giving leads to thanksgiving and glorification of God, demonstrating the believers'' obedience and love, which strengthens the whole body of Christ.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the ultimate spiritual purpose of the collection Paul describes in chapter 9, beyond the relief of poverty?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 9, 5, 'What paradox does 2 Corinthians 9:6-11 present about generosity and abundance?', '["Giving always reduces personal wealth","Sowing generously appears costly yet produces greater return through divine supply","The poor cannot be generous","Abundance comes without effort"]'::jsonb, 'Sowing generously appears costly yet produces greater return through divine supply', 'The passage teaches that generous sowing involves personal sacrifice, but God supplies and multiplies blessings.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What paradox does 2 Corinthians 9:6-11 present about generosity and abundance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 9, 5, 'What structural connection exists between 2 Corinthians 9:1-5 and 9:6-13 regarding preparation and execution?', '["They contradict each other","Preparation without right motivation requires reframing through principle, then results flow from faithful action","Only preparation matters","Only execution matters"]'::jsonb, 'Preparation without right motivation requires reframing through principle, then results flow from faithful action', 'Paul first ensures the gift is ready (9:1-5), then establishes principles (9:6-7) to guide proper giving attitudes.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 9
    AND q.difficulty_stage = 5
    AND q.prompt = 'What structural connection exists between 2 Corinthians 9:1-5 and 9:6-13 regarding preparation and execution?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 10, 1, 'According to 2 Corinthians 10:1, with what does Paul appeal to the Corinthians?', '["Authority and power","Meekness and gentleness of Christ","Anger and correction","Money and gifts"]'::jsonb, 'Meekness and gentleness of Christ', '2 Corinthians 10:1 begins ''By the meekness and gentleness of Christ, I appeal to you.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Corinthians 10:1, with what does Paul appeal to the Corinthians?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 10, 1, 'According to 2 Corinthians 10:13, what bounds had God assigned to Paul?', '["To stay in Jerusalem","A field of service that included the Corinthians","To work only with Gentiles","No specific boundaries"]'::jsonb, 'A field of service that included the Corinthians', '2 Corinthians 10:13-15 indicates Paul''s apostolic territory and the Corinthians as part of it.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Corinthians 10:13, what bounds had God assigned to Paul?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 10, 1, 'According to 2 Corinthians 10:5, what should be demolished by spiritual warfare?', '["Church buildings","Strongholds and arguments against God","Believers themselves","Secular governments"]'::jsonb, 'Strongholds and arguments against God', '2 Corinthians 10:4-5 mentions demolishing ''strongholds...and every pretension that sets itself up against God.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Corinthians 10:5, what should be demolished by spiritual warfare?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 10, 1, 'In 2 Corinthians 10, what does Paul say about weapons of warfare?', '["They are physical and earthly","They are not carnal but mighty through God","Christians should not use them","Only soldiers need them"]'::jsonb, 'They are not carnal but mighty through God', '2 Corinthians 10:4 states ''the weapons we fight with are not the weapons of the world.}'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'In 2 Corinthians 10, what does Paul say about weapons of warfare?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 10, 1, 'In 2 Corinthians 10:8, for what does Paul say he has authority?', '["To condemn","For building you up","To take your money","To exile from the church"]'::jsonb, 'For building you up', '2 Corinthians 10:8 states ''the authority the Lord gave us...for building you up, not for tearing you down.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'In 2 Corinthians 10:8, for what does Paul say he has authority?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 10, 1, 'What does 2 Corinthians 10:12 warn against?', '["Building churches","Commending ourselves and measuring ourselves by ourselves","Giving too much money","Writing letters"]'::jsonb, 'Commending ourselves and measuring ourselves by ourselves', '2 Corinthians 10:12 cautions that ''they...compare themselves with themselves, which is not wise.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does 2 Corinthians 10:12 warn against?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 10, 1, 'Who were apparently criticizing Paul in 2 Corinthians 10?', '["The Roman government","Some at Corinth who thought his letters were harsh but his presence weak","The Jerusalem church","Pagan philosophers"]'::jsonb, 'Some at Corinth who thought his letters were harsh but his presence weak', '2 Corinthians 10:10 records criticism that his letters were weighty but his bodily presence weak.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 10
    AND q.difficulty_stage = 1
    AND q.prompt = 'Who were apparently criticizing Paul in 2 Corinthians 10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 10, 2, 'According to 2 Corinthians 10:4-5, what kind of power does spiritual warfare possess?', '["Physical force","Divine power to demolish strongholds","Psychological persuasion only","Economic influence"]'::jsonb, 'Divine power to demolish strongholds', '2 Corinthians 10:4 states spiritual weapons are ''mighty through God for pulling down strongholds.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 2 Corinthians 10:4-5, what kind of power does spiritual warfare possess?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 10, 2, 'How does Paul characterize his apostolic authority in 2 Corinthians 10:8?', '["As oppressive and tyrannical","Given by the Lord for building up, not for harm","Limited to Jerusalem","Dependent on the Corinthians"]'::jsonb, 'Given by the Lord for building up, not for harm', '2 Corinthians 10:8 emphasizes his authority is constructive, not destructive.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does Paul characterize his apostolic authority in 2 Corinthians 10:8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 10, 2, 'In 2 Corinthians 10, Paul addresses critics who claim he acts boldly in letters but is weak in person. What does Paul say about his authority?', '["He denies having any authority","His authority comes from Christ to build up, not tear down","He grants critics are correct about his weakness","Authority is measured by physical appearance"]'::jsonb, 'His authority comes from Christ to build up, not tear down', 'Paul states in 10:8 that the Lord gave him authority ''for building you up rather than pulling you down,'' directly addressing the charge of inconsistency.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'In 2 Corinthians 10, Paul addresses critics who claim he acts boldly in letters but is weak in person. What does Paul say about his authority?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 10, 2, 'In 2 Corinthians 10:1, how does Paul balance strength with approach?', '["He is harsh and domineering","He appeals with meekness while having authority","He withdraws from confrontation","He demands obedience"]'::jsonb, 'He appeals with meekness while having authority', '2 Corinthians 10:1 shows Paul''s apostolic authority tempered by Christ''s example of gentleness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'In 2 Corinthians 10:1, how does Paul balance strength with approach?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 10, 2, 'In 2 Corinthians 10:10, what was Paul''s response to those criticizing his letter writing?', '["He apologized","He defended his authority and letters","He abandoned correspondence","He blamed others"]'::jsonb, 'He defended his authority and letters', '2 Corinthians 10:11 indicates Paul would match his letters with actions if needed.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'In 2 Corinthians 10:10, what was Paul''s response to those criticizing his letter writing?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 10, 2, 'What does 2 Corinthians 10:5 indicate about the scope of spiritual warfare?', '["Limited to external enemies","Involves thoughts and claims against God","Only defensive","Purely intellectual debate"]'::jsonb, 'Involves thoughts and claims against God', '2 Corinthians 10:5 mentions taking ''captive every thought to make it obedient to Christ.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does 2 Corinthians 10:5 indicate about the scope of spiritual warfare?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 10, 2, 'What does Paul suggest about boasting in 2 Corinthians 10:17?', '["Boast in yourselves","Boast in the Lord","Avoid boasting entirely","Boast humbly in your works"]'::jsonb, 'Boast in the Lord', '2 Corinthians 10:17 quotes Jeremiah: ''Let the one who boasts boast in the Lord.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 10
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul suggest about boasting in 2 Corinthians 10:17?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 10, 3, 'How does 2 Corinthians 10:12 function within Paul''s defense of his apostolic ministry?', '["To mock commendation","To reject self-promotion in favor of the Lord''s commendation and proper boundaries","To praise self-measurement","To criticize all measurement"]'::jsonb, 'To reject self-promotion in favor of the Lord''s commendation and proper boundaries', 'Paul rejects comparing with others, grounding legitimacy in the Lord''s assignment, not peer evaluation.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does 2 Corinthians 10:12 function within Paul''s defense of his apostolic ministry?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 10, 3, 'How does the metaphor of weapons in 2 Corinthians 10:3-5 reveal Paul''s view of apostolic work?', '["It is merely political or social","It is spiritual conflict requiring divine power, not worldly methods","Physical force is necessary","Intellectual argument alone suffices"]'::jsonb, 'It is spiritual conflict requiring divine power, not worldly methods', 'The military metaphor indicates apostolic ministry addresses spiritual strongholds through God''s power.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does the metaphor of weapons in 2 Corinthians 10:3-5 reveal Paul''s view of apostolic work?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 10, 3, 'In 2 Corinthians 10, Paul contrasts ''worldly weapons'' with what kind of weapons in spiritual warfare?', '["Political influence","Financial power","Divine power through God that is mighty to bring down strongholds","Physical strength"]'::jsonb, 'Divine power through God that is mighty to bring down strongholds', 'Paul explicitly states in 10:4: ''The weapons we fight with are not the weapons of the world... they have divine power to demolish strongholds.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Corinthians 10, Paul contrasts ''worldly weapons'' with what kind of weapons in spiritual warfare?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 10, 3, 'In 2 Corinthians 10:13-16, what does Paul establish about his apostolic territory?', '["He had no legitimate area of service","His field included the Corinthians and extended to unreached areas","He was limited to Jerusalem only","He should expand indefinitely"]'::jsonb, 'His field included the Corinthians and extended to unreached areas', '2 Corinthians 10:13-16 shows Paul''s sphere encompassed the Corinthians and gospel work toward new regions.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Corinthians 10:13-16, what does Paul establish about his apostolic territory?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 10, 3, 'What does 2 Corinthians 10:1 suggest about Paul''s authority being legitimate despite appearing weak?', '["Weakness invalidates authority","True authority flows through meekness and gentleness, mirroring Christ","Authority requires harshness","Paul had no real authority"]'::jsonb, 'True authority flows through meekness and gentleness, mirroring Christ', 'Paul grounds legitimate authority not in forcefulness but in Christ''s character of meekness and gentleness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 2 Corinthians 10:1 suggest about Paul''s authority being legitimate despite appearing weak?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 10, 3, 'What does Paul mean by ''taking captive every thought to make it obedient to Christ'' in 2 Corinthians 10:5?', '["Suppressing all independent thinking","Bringing mental struggles and false ideas under submission to Christ''s truth","Developing military tactics","Rejecting all human reasoning"]'::jsonb, 'Bringing mental struggles and false ideas under submission to Christ''s truth', 'Paul describes spiritual warfare where believers must reject arguments and pretensions that oppose God''s knowledge and align thought patterns with Christ''s authority.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Paul mean by ''taking captive every thought to make it obedient to Christ'' in 2 Corinthians 10:5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 10, 3, 'Why does Paul emphasize the nature of his authority in 2 Corinthians 10:1-8?', '["To boast about himself","To establish legitimate grounds for addressing problems while affirming constructive rather than destructive intent","To demand submission","To apologize for past harshness"]'::jsonb, 'To establish legitimate grounds for addressing problems while affirming constructive rather than destructive intent', 'Paul asserts his authority as real but exercised for building up, anticipating his stern message in chapter 13.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 10
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul emphasize the nature of his authority in 2 Corinthians 10:1-8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 10, 4, 'How does Paul respond to claims that his letters are ''weighty and forceful'' but his personal presence is ''unimpressive''?', '["He admits the criticism is justified","He states his letters reflect his true character and what he will do in person","He argues physical appearance determines authority","He dismisses all critics as unspiritual"]'::jsonb, 'He states his letters reflect his true character and what he will do in person', 'Paul asserts in 10:11 that he will be consistent: ''Such a person should realize that what we are in our letters when we are absent, we will be in our actions when we are present.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Paul respond to claims that his letters are ''weighty and forceful'' but his personal presence is ''unimpressive''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 10, 4, 'How does Paul''s emphasis on ''the Lord gave us'' in 2 Corinthians 10:8 function rhetorically in his defense?', '["To excuse abuse of power","To assert divine source of authority while committing it to constructive purpose","To blame God for harsh actions","To suggest authority is temporary"]'::jsonb, 'To assert divine source of authority while committing it to constructive purpose', 'Paul grounds authority in Christ while explicitly limiting it to edification, not destruction.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Paul''s emphasis on ''the Lord gave us'' in 2 Corinthians 10:8 function rhetorically in his defense?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 10, 4, 'How might 2 Corinthians 10:12-13 be understood as Paul''s response to false apostles?', '["He ignores them","He rejects their self-commendation by asserting the Lord''s measure of legitimacy, not peer approval","He joins their standards","He lacks grounds to respond"]'::jsonb, 'He rejects their self-commendation by asserting the Lord''s measure of legitimacy, not peer approval', 'False apostles likely used self-promotion and comparison; Paul appeals to divine appointment instead.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'How might 2 Corinthians 10:12-13 be understood as Paul''s response to false apostles?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 10, 4, 'What does Paul declare about the weapons of his warfare in 2 Corinthians 10:3-4, and their purpose?', '["His weapons are swords and armor for physical combat","His weapons are not carnal but mighty through God for pulling down strongholds","Christian warfare requires defensive fortifications","The apostles use worldly strategies and persuasion"]'::jsonb, 'His weapons are not carnal but mighty through God for pulling down strongholds', 'For the weapons of our warfare are not carnal but mighty in God for pulling down strongholds, casting down arguments and every high thing that exalts itself against the knowledge of God (2 Corinthians 10:4-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Paul declare about the weapons of his warfare in 2 Corinthians 10:3-4, and their purpose?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 10, 4, 'What does Paul''s reference to ''those who boast in the Lord'' in 2 Corinthians 10:17 imply about legitimate apostolic identity?', '["Boasting is always wrong","True ministry identity is grounded in God''s work, not personal achievement or peer recognition","The Lord''s work is irrelevant","Personal boasting should be increased"]'::jsonb, 'True ministry identity is grounded in God''s work, not personal achievement or peer recognition', '2 Corinthians 10:17 (quoting Jeremiah 9:24) suggests legitimate boasting acknowledges God''s agency.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Paul''s reference to ''those who boast in the Lord'' in 2 Corinthians 10:17 imply about legitimate apostolic identity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 10, 4, 'What principle does Paul establish in 2 Corinthians 10:12-13 regarding self-evaluation and comparing oneself to others?', '["Comparison with others is necessary for growth","Those who speak wisely about themselves deserve authority","Not wise to measure oneself by others; should measure by the standard God assigned","Self-comparison proves spiritual maturity"]'::jsonb, 'Not wise to measure oneself by others; should measure by the standard God assigned', 'Paul criticizes comparing and commending oneself by comparison to others (10:12), instead advocating for measuring oneself against God''s assigned sphere (10:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'What principle does Paul establish in 2 Corinthians 10:12-13 regarding self-evaluation and comparing oneself to others?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 10, 4, 'What theological principle underlies 2 Corinthians 10:4-5 regarding spiritual transformation?', '["Human effort suffices","Divine power addresses fundamental ideological resistance through spiritual means","Thoughts are unchangeable","Only external change matters"]'::jsonb, 'Divine power addresses fundamental ideological resistance through spiritual means', 'The passage indicates transformation requires God''s power to overcome mental strongholds against God.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 10
    AND q.difficulty_stage = 4
    AND q.prompt = 'What theological principle underlies 2 Corinthians 10:4-5 regarding spiritual transformation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 10, 5, 'How does 2 Corinthians 10:1-8 address the paradox of apostolic authority expressed through humility?', '["The paradox cannot be resolved","Real authority mirrors Christ''s meekness while possessing divine empowerment for building and correction","Humility negates authority","Authority requires domination"]'::jsonb, 'Real authority mirrors Christ''s meekness while possessing divine empowerment for building and correction', 'Paul balances legitimate apostolic power with Christ-like gentleness, showing meekness and authority coexist.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 2 Corinthians 10:1-8 address the paradox of apostolic authority expressed through humility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 10, 5, 'How does Paul defend his apostleship and boldness in 2 Corinthians 10:7-8 against critics who challenged his authority?', '["He appeals to his popularity and success in converting many","The Lord gave him authority for edification, not destruction, though he appears bold in letters","He relies on letters of recommendation from other apostles","He demonstrates his power through miraculous signs and wonders"]'::jsonb, 'The Lord gave him authority for edification, not destruction, though he appears bold in letters', 'The Lord gave us authority for edification and not for destruction (2 Corinthians 10:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Paul defend his apostleship and boldness in 2 Corinthians 10:7-8 against critics who challenged his authority?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 10, 5, 'How does Paul''s refusal to boast beyond his assigned field in 2 Corinthians 10:13-16 function as a critique of rival missionaries?', '["It rejects ministry expansion entirely","It shows apostolic legitimacy respects God-given boundaries rather than claiming credit for others'' work","It proves Paul lacked confidence in the gospel","It means Corinth was outside Paul''s calling"]'::jsonb, 'It shows apostolic legitimacy respects God-given boundaries rather than claiming credit for others'' work', 'Paul refuses to boast beyond the measure God assigned him and will not boast in another man''s labors (2 Corinthians 10:13-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Paul''s refusal to boast beyond his assigned field in 2 Corinthians 10:13-16 function as a critique of rival missionaries?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 10, 5, 'How does Paul''s war metaphor in 2 Corinthians 10:3-5 function within his larger argument about apostolic authority and false teachers?', '["It demonstrates that physical power determines spiritual truth","It frames spiritual struggle against false ideas as valid conflict requiring God''s power, not compromising worldly methods","It suggests all criticism is demonic","It proves that bold speech alone establishes authority"]'::jsonb, 'It frames spiritual struggle against false ideas as valid conflict requiring God''s power, not compromising worldly methods', 'Paul distinguishes between fighting ''according to the flesh'' versus using divine weapons, establishing that confronting false teaching is spiritual warfare requiring God''s power, not worldly tactics.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Paul''s war metaphor in 2 Corinthians 10:3-5 function within his larger argument about apostolic authority and false teachers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 10, 5, 'How might the spiritual warfare imagery in 2 Corinthians 10:4-5 inform Paul''s handling of opposition in chapters 11-13?', '["It is irrelevant","Spiritual conflict justifies addressing thoughts and ideologies opposing Christ, connecting to his response to false teachers","Physical confrontation is needed","Conflict should be avoided altogether"]'::jsonb, 'Spiritual conflict justifies addressing thoughts and ideologies opposing Christ, connecting to his response to false teachers', 'The spiritual warfare framework explains Paul''s vigorous response to false apostles-they represent strongholds opposing Christ.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'How might the spiritual warfare imagery in 2 Corinthians 10:4-5 inform Paul''s handling of opposition in chapters 11-13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 10, 5, 'What does Paul''s discussion of apostolic authority in chapter 10 reveal about his pastoral concern versus his critics'' focus?', '["Paul seeks personal recognition; critics wish to help the church","Paul grounds authority in building up believers; critics boast and divide the church","Authority should be determined by theological credentials","The strongest speaker automatically deserves leadership"]'::jsonb, 'Paul grounds authority in building up believers; critics boast and divide the church', 'Paul contrasts his purpose of edification (10:8) with the false apostles'' tendency to boast and undermine his authority, revealing different values about what leadership means.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Paul''s discussion of apostolic authority in chapter 10 reveal about his pastoral concern versus his critics'' focus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 10, 5, 'What strategic function does the ''self-commendation'' critique in 2 Corinthians 10:12-18 serve in Paul''s overall argument?', '["To deflect from his own credibility issues","To redirect approval from peer comparison to God''s measure, thus undermining false apostles who rely on self-promotion","To avoid accountability","To appeal to majority opinion"]'::jsonb, 'To redirect approval from peer comparison to God''s measure, thus undermining false apostles who rely on self-promotion', 'By rejecting comparative evaluation, Paul critiques the very standard false apostles depend on for credibility.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 10
    AND q.difficulty_stage = 5
    AND q.prompt = 'What strategic function does the ''self-commendation'' critique in 2 Corinthians 10:12-18 serve in Paul''s overall argument?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 11, 1, 'According to 2 Corinthians 11:23, how does Paul compare his sufferings to those of other apostles?', '["He had suffered less","He was a fraud with no sufferings","He had suffered more, listing prisons, beatings, and dangers","Suffering was not relevant"]'::jsonb, 'He had suffered more, listing prisons, beatings, and dangers', '2 Corinthians 11:23-28 catalogs Paul''s extensive sufferings as proof of his apostolic authenticity.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Corinthians 11:23, how does Paul compare his sufferings to those of other apostles?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 11, 1, 'According to 2 Corinthians 11:3, whom does Paul say he fears deceiving the Corinthians?', '["The Roman government","The devil deceiving them as the serpent deceived Eve","False teachers","Themselves"]'::jsonb, 'The devil deceiving them as the serpent deceived Eve', '2 Corinthians 11:3 references Satan deceiving Eve and warns a similar deception could corrupt the believers.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Corinthians 11:3, whom does Paul say he fears deceiving the Corinthians?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 11, 1, 'According to 2 Corinthians 11:7, what was wrong with Paul preaching the gospel freely?', '["It was laziness","The Corinthians interpreted his refusal of support as implying he was not a true apostle","It wasted time","Nothing was wrong"]'::jsonb, 'The Corinthians interpreted his refusal of support as implying he was not a true apostle', '2 Corinthians 11:7 suggests some saw Paul''s not taking payment as evidence he was not genuinely apostolic.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Corinthians 11:7, what was wrong with Paul preaching the gospel freely?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 11, 1, 'In 2 Corinthians 11:4, what ''different gospel'' does Paul mention?', '["A gospel about philosophy","One preached by those who proclaim a different Jesus or a different spirit","A lost original gospel","A political gospel"]'::jsonb, 'One preached by those who proclaim a different Jesus or a different spirit', '2 Corinthians 11:4 warns against accepting a different gospel, spirit, or jesus than what Paul preached.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'In 2 Corinthians 11:4, what ''different gospel'' does Paul mention?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 11, 1, 'What does Paul compare himself to in 2 Corinthians 11:2?', '["A king","A virgin bride","A father preparing a chaste virgin bride for one husband","A soldier"]'::jsonb, 'A father preparing a chaste virgin bride for one husband', '2 Corinthians 11:2 uses the metaphor of Paul as one presenting the church as a pure bride to Christ.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does Paul compare himself to in 2 Corinthians 11:2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 11, 1, 'What false apostles does 2 Corinthians 11:13 call them?', '["Ignorant teachers","Deceitful workers masquerading as apostles of Christ","Heretics","Philosophers"]'::jsonb, 'Deceitful workers masquerading as apostles of Christ', '2 Corinthians 11:13 identifies such figures as ''false apostles, deceitful workers, masquerading as apostles of Christ.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'What false apostles does 2 Corinthians 11:13 call them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 11, 1, 'What is Paul''s main complaint about the Corinthian church in 2 Corinthians 11:1-4?', '["They are too generous with money","They are tolerating false apostles who present a different Jesus and gospel","They lack spiritual gifts","They refuse to help the poor"]'::jsonb, 'They are tolerating false apostles who present a different Jesus and gospel', 'Paul expresses concern that the Corinthians are accepting ''a different gospel'' and ''a different Jesus'' through false apostles (11:4), compromising their faith.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 11
    AND q.difficulty_stage = 1
    AND q.prompt = 'What is Paul''s main complaint about the Corinthian church in 2 Corinthians 11:1-4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 11, 2, 'According to 2 Corinthians 11:13-15, what will happen to false apostles?', '["They will succeed","Satan disguises them as servants of righteousness, but they will face judgment","They are innocent","Judgment is irrelevant"]'::jsonb, 'Satan disguises them as servants of righteousness, but they will face judgment', '2 Corinthians 11:13-15 indicates false apostles will face reckoning according to their deeds.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 2 Corinthians 11:13-15, what will happen to false apostles?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 11, 2, 'How does Paul defend his refusal of support in 2 Corinthians 11:7-11?', '["He was lazy","His sacrificial work demonstrated love and true apostolic concern, more than paid servants would show","No defense was needed","He should have taken money"]'::jsonb, 'His sacrificial work demonstrated love and true apostolic concern, more than paid servants would show', '2 Corinthians 11:7-11 suggests Paul''s self-support showed his love for them exceeded that of others.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does Paul defend his refusal of support in 2 Corinthians 11:7-11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 11, 2, 'In 2 Corinthians 11, what specific boasts does Paul reluctantly make about his ministry credentials?', '["Only his theological training","His Jewish heritage, his labors, sufferings, and visions","His financial success and social status","Only his educational achievements"]'::jsonb, 'His Jewish heritage, his labors, sufferings, and visions', 'Paul details in 11:22-28 being ''Hebrew of Hebrews,'' working harder and suffering more than other apostles, then adds his visions and revelations in chapter 12.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'In 2 Corinthians 11, what specific boasts does Paul reluctantly make about his ministry credentials?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 11, 2, 'What contrast does Paul make between himself and the false apostles regarding spiritual experiences in 2 Corinthians 11?', '["Paul lacks spiritual experiences","Paul emphasizes authentic suffering and apostolic labor over claims of visions and experiences","False apostles suffered more","Both suffered equally"]'::jsonb, 'Paul emphasizes authentic suffering and apostolic labor over claims of visions and experiences', 'Paul recounts imprisonments, beatings, and dangers rather than supernatural claims, suggesting real apostolic credentials.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'What contrast does Paul make between himself and the false apostles regarding spiritual experiences in 2 Corinthians 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 11, 2, 'What does Paul reveal about his financial practice in 2 Corinthians 11:7-9 that distinguished him from false apostles?', '["He charged the highest prices for teaching","He didn''t charge the Corinthians and supported himself through other means","He demanded payment from new converts","He required donations before preaching"]'::jsonb, 'He didn''t charge the Corinthians and supported himself through other means', 'Paul states he ''preached the gospel of God to you free of charge'' and that other churches supported him financially so he wouldn''t burden Corinth.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul reveal about his financial practice in 2 Corinthians 11:7-9 that distinguished him from false apostles?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 11, 2, 'What does Paul''s concern about the Corinthians being ''corrupted from the simplicity that is in Christ'' (2 Corinthians 11:3) mean?', '["They were becoming too simple","They risked deviation from undivided devotion to Christ through deceptive teaching","Simplicity was harmful","Corruption was inevitable"]'::jsonb, 'They risked deviation from undivided devotion to Christ through deceptive teaching', '2 Corinthians 11:3 indicates fear they would lose singular focus on Christ due to false apostolic influence.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul''s concern about the Corinthians being ''corrupted from the simplicity that is in Christ'' (2 Corinthians 11:3) mean?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 11, 2, 'Why does Paul describe himself as a fool in 2 Corinthians 11:1?', '["He actually is foolish","He is about to boast of his sufferings, which appears foolish but necessary for his defense","To insult the Corinthians","As pure humility"]'::jsonb, 'He is about to boast of his sufferings, which appears foolish but necessary for his defense', '2 Corinthians 11:1 introduces his ''fool''s boast''-necessary to counter false apostles despite its apparent foolishness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 11
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why does Paul describe himself as a fool in 2 Corinthians 11:1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 11, 3, 'How does Paul''s catalog of sufferings in 2 Corinthians 11:23-28 function as an argument about authentic apostolic authority?', '["Suffering proves someone is spiritually weak","Enduring hardships for the gospel demonstrates genuine commitment and apostolic identity","Physical suffering has no spiritual significance","Only wealthy apostles are truly effective"]'::jsonb, 'Enduring hardships for the gospel demonstrates genuine commitment and apostolic identity', 'Paul''s detailed account of imprisonments, beatings, shipwrecks, and hardships (11:23-27) serves as evidence of authentic apostolic calling, contrasting with false apostles who avoid suffering.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Paul''s catalog of sufferings in 2 Corinthians 11:23-28 function as an argument about authentic apostolic authority?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 11, 3, 'How does the ''bride'' metaphor in 2 Corinthians 11:2 serve Paul''s warning about false apostles?', '["It is merely decorative language","It establishes exclusive devotion to Christ; false teaching threatens this purity by introducing competing loyalties","Brides are unimportant","The metaphor contradicts his message"]'::jsonb, 'It establishes exclusive devotion to Christ; false teaching threatens this purity by introducing competing loyalties', 'Just as a bride should be faithful to one husband, believers must maintain undivided loyalty to Christ.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does the ''bride'' metaphor in 2 Corinthians 11:2 serve Paul''s warning about false apostles?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 11, 3, 'How does the catalog of Paul''s sufferings in 2 Corinthians 11:23-28 function in his defense?', '["It is a sad narrative","It establishes credentials through demonstrating authentic apostolic labor and sacrifice far exceeding false apostles","Suffering proves nothing","Only popularity matters"]'::jsonb, 'It establishes credentials through demonstrating authentic apostolic labor and sacrifice far exceeding false apostles', 'The extreme nature and breadth of Paul''s suffering testifies to genuine apostolic commitment and divine calling.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does the catalog of Paul''s sufferings in 2 Corinthians 11:23-28 function in his defense?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 11, 3, 'In 2 Corinthians 11:5-6, how does Paul address the charge that he is ''not as eloquent'' as others?', '["He agrees he is inferior","He acknowledges eloquence differences while asserting his knowledge of truth is adequate for apostolic effectiveness","Eloquence is irrelevant","He was the most eloquent"]'::jsonb, 'He acknowledges eloquence differences while asserting his knowledge of truth is adequate for apostolic effectiveness', '2 Corinthians 11:6 shows Paul prioritizes faithfulness to gospel truth over rhetorical sophistication.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'In 2 Corinthians 11:5-6, how does Paul address the charge that he is ''not as eloquent'' as others?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 11, 3, 'What does Paul mean by ''weakness'' in 2 Corinthians 11:30 after listing his sufferings?', '["Literal weakness","His sufferings revealed dependence on God''s strength rather than human power","He was inadequate","Strength is irrelevant"]'::jsonb, 'His sufferings revealed dependence on God''s strength rather than human power', '2 Corinthians 11:30 shifts perspective-boasting in weakness paradoxically reveals divine power at work.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Paul mean by ''weakness'' in 2 Corinthians 11:30 after listing his sufferings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 11, 3, 'What is the relationship between Paul''s self-support and his apostolic authority in 2 Corinthians 11:7-15?', '["Support proves authority","His voluntary self-support demonstrates genuine concern and invalidates false claims that he served for gain","Self-support proves he is inferior","Support is irrelevant to authority"]'::jsonb, 'His voluntary self-support demonstrates genuine concern and invalidates false claims that he served for gain', 'Paul''s refusal of payment showed his apostolic motivation was Christ and the believers, not personal profit.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the relationship between Paul''s self-support and his apostolic authority in 2 Corinthians 11:7-15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 11, 3, 'What is the significance of Paul describing himself as ''a Hebrew of Hebrews'' and speaking of ''Israelites'' in 2 Corinthians 11:22?', '["He is claiming superiority over non-Jewish believers","He is asserting his legitimate Jewish credentials against false apostles making similar claims","He is rejecting his Jewish identity","He is arguing for Jewish dominance in the church"]'::jsonb, 'He is asserting his legitimate Jewish credentials against false apostles making similar claims', 'The false apostles apparently claimed Jewish authenticity as a credential; Paul counters by noting he, too, is authentically Jewish, then demonstrates his true apostolic identity through his sufferings.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 11
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the significance of Paul describing himself as ''a Hebrew of Hebrews'' and speaking of ''Israelites'' in 2 Corinthians 11:22?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 11, 4, 'How does Paul''s statement about becoming ''weak'' so that believers become ''strong'' in 2 Corinthians 11:29 reflect his broader theology of power?', '["Weakness is always a sign of failure","God''s power is perfected in weakness, and leaders serve by identifying with others'' struggles","Only strong leaders deserve respect","Weakness disqualifies someone from ministry"]'::jsonb, 'God''s power is perfected in weakness, and leaders serve by identifying with others'' struggles', 'This statement foreshadows 12:9''s ''my grace is sufficient for you, my power is made perfect in weakness,'' revealing Paul''s paradoxical theology that true strength comes through vulnerability and identification.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Paul''s statement about becoming ''weak'' so that believers become ''strong'' in 2 Corinthians 11:29 reflect his broader theology of power?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 11, 4, 'How does the serpent imagery in 2 Corinthians 11:3 characterize the threat posed by false apostles?', '["Obvious and crude","Subtle and deceptive, corrupting simple devotion to Christ through cunning misdirection","Unimportant","Transparent"]'::jsonb, 'Subtle and deceptive, corrupting simple devotion to Christ through cunning misdirection', 'The serpent''s deception was subtle; Paul suggests false apostles similarly corrupt through sophisticated deception.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the serpent imagery in 2 Corinthians 11:3 characterize the threat posed by false apostles?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 11, 4, 'How might 2 Corinthians 11:4 be understood in relation to syncretism or heresy within early Christianity?', '["It is irrelevant to heresy","It warns that corruptions present a ''different'' Jesus or Spirit, suggesting doctrinal distortion beyond simple disagreement","All Jesuses are the same","Heresy is the same as orthodoxy"]'::jsonb, 'It warns that corruptions present a ''different'' Jesus or Spirit, suggesting doctrinal distortion beyond simple disagreement', 'Paul suggests false apostles propagate fundamentally different understandings of Christ and the Spirit.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'How might 2 Corinthians 11:4 be understood in relation to syncretism or heresy within early Christianity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 11, 4, 'In 2 Corinthians 11:5-6, how does Paul respond to claims that he is inferior to the ''super apostles''?', '["He acknowledges that he lacks their education and training","Though he may be untrained in speech, he is not deficient in knowledge, and they have fully known that in all things he has made this manifest","He argues that his sufferings prove his superiority","He suggests that the comparison is unfair due to cultural differences"]'::jsonb, 'Though he may be untrained in speech, he is not deficient in knowledge, and they have fully known that in all things he has made this manifest', 'For I consider that I am not at all inferior to the most eminent apostles. Even though I am untrained in speech, yet I am not in knowledge (2 Corinthians 11:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'In 2 Corinthians 11:5-6, how does Paul respond to claims that he is inferior to the ''super apostles''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 11, 4, 'What does Paul''s description of false apostles as ''masquerading as apostles of Christ'' and ''servants of righteousness'' in 2 Corinthians 11:13-15 reveal about the nature of false teaching?', '["False teachers are obvious and openly anti-Christian","False teachers appear righteous outwardly but serve Satan, deceiving through external appearance","Only poor people fall for false teaching","False apostles openly admit their deception"]'::jsonb, 'False teachers appear righteous outwardly but serve Satan, deceiving through external appearance', 'Paul warns that ''Satan himself masquerades as an angel of light'' (11:14), and false apostles similarly appear legitimate while actually serving deception, making them particularly dangerous.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Paul''s description of false apostles as ''masquerading as apostles of Christ'' and ''servants of righteousness'' in 2 Corinthians 11:13-15 reveal about the nature of false teaching?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 11, 4, 'What does Paul''s mention of visions and revelations in 2 Corinthians 12:1-2 suggest about false apostles'' claims in chapter 11?', '["They make no claims","They likely boasted of supernatural experiences, which Paul will address with his own mystical experience","Such experiences are irrelevant","Paul endorses all claims"]'::jsonb, 'They likely boasted of supernatural experiences, which Paul will address with his own mystical experience', 'The transition to Paul''s own vision suggests he is matching what false apostles claimed and surpassing them.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Paul''s mention of visions and revelations in 2 Corinthians 12:1-2 suggest about false apostles'' claims in chapter 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 11, 4, 'What is the rhetorical function of the ''fool''s boast'' framework in 2 Corinthians 11:1-12:10?', '["Paul is actually foolish","It creates distance from boasting while making necessary claims, maintaining humility while defending apostolic legitimacy","Boasting is acceptable","Humility is ignored"]'::jsonb, 'It creates distance from boasting while making necessary claims, maintaining humility while defending apostolic legitimacy', 'Calling boasting ''foolish'' allows Paul to defend himself without endorsing pride-a rhetorical strategy.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 11
    AND q.difficulty_stage = 4
    AND q.prompt = 'What is the rhetorical function of the ''fool''s boast'' framework in 2 Corinthians 11:1-12:10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 11, 5, 'How does Paul''s extended defense of his apostolic credentials in 2 Corinthians 11 demonstrate a paradoxical understanding of Christian leadership?', '["True authority requires boasting about accomplishments","He defends credentials he considers foolish to defend, admitting real apostolic identity is proven through suffering and identification with others, not status","Leaders should minimize their contributions","Apostolic authority is purely spiritual and never defended"]'::jsonb, 'He defends credentials he considers foolish to defend, admitting real apostolic identity is proven through suffering and identification with others, not status', 'Paul frames his boasting as ''foolish'' (11:1, 16, 19) yet proceeds to catalog his sufferings, revealing that true apostolic authority operates inversely to worldly standards-proven through weakness, not power.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Paul''s extended defense of his apostolic credentials in 2 Corinthians 11 demonstrate a paradoxical understanding of Christian leadership?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 11, 5, 'How does the dichotomy between ''different gospel'' and ''simplicity in Christ'' in 2 Corinthians 11:3-4 illuminate Paul''s theology of true apostolic ministry?', '["Theology is unimportant","True ministry maintains Christ-centered simplicity against complex distortions that introduce alternative gospels or spirits","Complexity proves authenticity","Simplicity indicates weakness"]'::jsonb, 'True ministry maintains Christ-centered simplicity against complex distortions that introduce alternative gospels or spirits', 'Paul suggests authentic Christianity is fundamentally simple-a bride devoted to Christ-while distortions complicate it.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does the dichotomy between ''different gospel'' and ''simplicity in Christ'' in 2 Corinthians 11:3-4 illuminate Paul''s theology of true apostolic ministry?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 11, 5, 'How might 2 Corinthians 11:2 (bride imagery) inform understanding of Paul''s opposition to false apostles throughout chapters 11-12?', '["Irrelevant to opposition","The bride metaphor establishes that loyalty to Christ is non-negotiable; false apostles threaten this by offering competing spiritual authority","Marriages are unrelated to apostles","Opposition is unjustified"]'::jsonb, 'The bride metaphor establishes that loyalty to Christ is non-negotiable; false apostles threaten this by offering competing spiritual authority', 'As a bride cannot serve two husbands, believers cannot follow both Christ and false apostles-making opposition necessary.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'How might 2 Corinthians 11:2 (bride imagery) inform understanding of Paul''s opposition to false apostles throughout chapters 11-12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 11, 5, 'What contrast does Paul establish between false apostles'' financial practices and his own in 2 Corinthians 11:7-12, and what does this reveal about his understanding of the gospel?', '["Money management is irrelevant to faith","False apostles exploit believers financially; Paul self-sacrificed to prove the gospel''s integrity, avoiding appearance of mercenary motives","All ministers should demand high salaries","Financial support always indicates false teaching"]'::jsonb, 'False apostles exploit believers financially; Paul self-sacrificed to prove the gospel''s integrity, avoiding appearance of mercenary motives', 'Paul''s refusal of payment and willingness to labor for support (11:8-12) serves as a moral argument against false apostles who exploit the Corinthians, demonstrating the gospel''s genuine concern for believers.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What contrast does Paul establish between false apostles'' financial practices and his own in 2 Corinthians 11:7-12, and what does this reveal about his understanding of the gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 11, 5, 'What extensive list of sufferings does Paul provide in 2 Corinthians 11:23-28 to validate his apostolic credentials?', '["He lists his financial gains and influence among churches","Imprisonments, beatings, shipwrecks, hunger, cold, nakedness, and daily anxiety for the churches","His visions and revelations that surpass other apostles","His ability to perform greater miracles than the original apostles"]'::jsonb, 'Imprisonments, beatings, shipwrecks, hunger, cold, nakedness, and daily anxiety for the churches', 'Are they servants of Christ? (I speak as one beside myself) I am more so: in far more labors, in far more imprisonments, in far more beatings, in deaths often...in perils of rivers, in perils of robbers, in danger from my own countrymen, in danger from Gentiles (2 Corinthians 11:23-26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What extensive list of sufferings does Paul provide in 2 Corinthians 11:23-28 to validate his apostolic credentials?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 11, 5, 'What mysterious experience does Paul describe in 2 Corinthians 11:32-33, and what does it reveal about his circumstances?', '["A vision of being caught up to paradise","The governor under Aretas sought to seize him, so he escaped in a basket through a window in the wall","An encounter with false apostles who tried to arrest him","His escape from persecution using human ingenuity and resourcefulness"]'::jsonb, 'The governor under Aretas sought to seize him, so he escaped in a basket through a window in the wall', 'In Damascus the governor, under Aretas the king, was guarding the city of the Damascenes with a garrison, desiring to arrest me; and I was let down in a basket through a window in the wall, and escaped his hands (2 Corinthians 11:32-33).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What mysterious experience does Paul describe in 2 Corinthians 11:32-33, and what does it reveal about his circumstances?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 11, 5, 'What theological strategy does Paul employ by contrasting his hardships with the false apostles'' apparent comfort and gain in 2 Corinthians 11?', '["Hardship is meaningless","Suffering demonstrates authentic apostolic commitment and exposes false apostles as self-serving, revealing theological truth through lived contrast","Comfort proves authenticity","Strategy is irrelevant"]'::jsonb, 'Suffering demonstrates authentic apostolic commitment and exposes false apostles as self-serving, revealing theological truth through lived contrast', 'Paul presents suffering as validation of apostolic integrity and true gospel motivation versus false apostles'' apparent self-interest.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 11
    AND q.difficulty_stage = 5
    AND q.prompt = 'What theological strategy does Paul employ by contrasting his hardships with the false apostles'' apparent comfort and gain in 2 Corinthians 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 12, 1, 'According to 2 Corinthians 12:2, where was Paul caught up to?', '["The mountain","The third heaven","Jerusalem","Egypt"]'::jsonb, 'The third heaven', '2 Corinthians 12:2 states ''I know a person in Christ who was caught up to the third heaven.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Corinthians 12:2, where was Paul caught up to?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 12, 1, 'According to 2 Corinthians 12:7, what was given to Paul to ''keep me from exalting myself''?', '["A command","A thorn in the flesh","A limitation on movement","A financial burden"]'::jsonb, 'A thorn in the flesh', '2 Corinthians 12:7 mentions ''a thorn was given to me in my flesh...a messenger of Satan.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Corinthians 12:7, what was given to Paul to ''keep me from exalting myself''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 12, 1, 'According to 2 Corinthians 12:9, when is power made perfect?', '["In strength","In weakness","In wealth","In numbers"]'::jsonb, 'In weakness', '2 Corinthians 12:9 states ''power is made perfect in weakness.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Corinthians 12:9, when is power made perfect?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 12, 1, 'In 2 Corinthians 12:2, what extraordinary vision does Paul describe?', '["He saw Jesus ascending to heaven","He was caught up to the third heaven and heard inexpressible things","He received written revelation like John","He had a vision of an angel"]'::jsonb, 'He was caught up to the third heaven and heard inexpressible things', 'Paul describes being ''caught up to the third heaven'' and hearing ''inexpressible things'' that he is ''not permitted to tell'' (12:2-4), emphasizing the transcendent nature of the experience.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'In 2 Corinthians 12:2, what extraordinary vision does Paul describe?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 12, 1, 'In 2 Corinthians 12:4, what did Paul hear in paradise?', '["Angels singing","Inexpressible words not permitted to repeat","God''s judgment","Divine condemnation"]'::jsonb, 'Inexpressible words not permitted to repeat', '2 Corinthians 12:4 mentions hearing ''inexpressible things...that are not permitted to tell.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'In 2 Corinthians 12:4, what did Paul hear in paradise?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 12, 1, 'In 2 Corinthians 12:9, what did the Lord say about His grace?', '["It will end","My grace is sufficient for you","Grace is selective","No grace will be given"]'::jsonb, 'My grace is sufficient for you', '2 Corinthians 12:9 records the Lord''s response: ''My grace is sufficient for you.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'In 2 Corinthians 12:9, what did the Lord say about His grace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 12, 1, 'What did Paul do three times regarding his thorn in 2 Corinthians 12:8?', '["Complained to churches","Begged the Lord to remove it","Ignored it","Blamed Satan"]'::jsonb, 'Begged the Lord to remove it', '2 Corinthians 12:8 states ''Three times I pleaded with the Lord about this.'''
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 12
    AND q.difficulty_stage = 1
    AND q.prompt = 'What did Paul do three times regarding his thorn in 2 Corinthians 12:8?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 12, 2, 'According to 2 Corinthians 12:9-10, how should Paul respond to his weakness?', '["Fight against it","Delight in weaknesses as the context for Christ''s power and strength","Ignore it","Be ashamed of it"]'::jsonb, 'Delight in weaknesses as the context for Christ''s power and strength', '2 Corinthians 12:9-10 shows Paul concluding he will gladly boast in weakness for Christ''s sake.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 2 Corinthians 12:9-10, how should Paul respond to his weakness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 12, 2, 'How does Paul''s response to the ''thorn in the flesh'' demonstrate his spiritual maturity in 2 Corinthians 12:8-10?', '["He demands God remove it immediately","He prayed for removal, but accepted God''s grace as sufficient when the answer was no, learning strength comes through weakness","He denies any negative experiences","He argues the thorn proves God doesn''t care"]'::jsonb, 'He prayed for removal, but accepted God''s grace as sufficient when the answer was no, learning strength comes through weakness', 'Paul prayed three times for removal, but when God said ''My grace is sufficient for you, for my power is made perfect in weakness,'' he embraced this paradox (12:9-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does Paul''s response to the ''thorn in the flesh'' demonstrate his spiritual maturity in 2 Corinthians 12:8-10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 12, 2, 'How does the contrast between Paul''s visions and his thorn in 2 Corinthians 12 serve his theological message?', '["Visions are better than suffering","Divine favor includes both extraordinary revelations and humbling limitations to keep believers dependent on grace","Thorns negate visions","Both are separate experiences"]'::jsonb, 'Divine favor includes both extraordinary revelations and humbling limitations to keep believers dependent on grace', '2 Corinthians 12 presents visions and suffering together as part of Paul''s authentic apostolic experience with God.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does the contrast between Paul''s visions and his thorn in 2 Corinthians 12 serve his theological message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 12, 2, 'What does the phrase ''whether in the body or out of the body'' in 2 Corinthians 12:2-3 suggest?', '["The experience was imaginary","Paul was uncertain of the literal nature of his mystical experience or vision","The body is irrelevant","It was purely physical"]'::jsonb, 'Paul was uncertain of the literal nature of his mystical experience or vision', 'The uncertainty whether the experience was physical or visionary reflects the mystical and transcendent nature of the experience.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does the phrase ''whether in the body or out of the body'' in 2 Corinthians 12:2-3 suggest?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 12, 2, 'What is Paul''s ''thorn in the flesh'' that he mentions in 2 Corinthians 12:7?', '["A specific physical illness he names directly","A messenger of Satan to torment him-possibly physical illness, persecution, or spiritual struggle-sent to keep him humble","A member of the church who opposed him","His decision to not marry"]'::jsonb, 'A messenger of Satan to torment him-possibly physical illness, persecution, or spiritual struggle-sent to keep him humble', 'Paul describes the thorn as ''a messenger of Satan, to torment me'' (12:7), its exact nature remaining mysterious, but the function being to prevent pride from his spiritual experiences.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'What is Paul''s ''thorn in the flesh'' that he mentions in 2 Corinthians 12:7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 12, 2, 'What is the nature of Paul''s ''thorn in the flesh'' according to 2 Corinthians 12:7?', '["Literal plant thorns","A messenger of Satan sent to afflict him, likely physical suffering or opposition","A spiritual symbol only","An imaginary ailment"]'::jsonb, 'A messenger of Satan sent to afflict him, likely physical suffering or opposition', '2 Corinthians 12:7 describes it as a messenger of Satan; many scholars suggest it was illness, opposition, or hardship.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'What is the nature of Paul''s ''thorn in the flesh'' according to 2 Corinthians 12:7?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 12, 2, 'Why does Paul hesitate to report his heavenly experience in 2 Corinthians 12:1-6?', '["It didn''t happen","It seems like boasting, and he prefers to speak about what people can observe about him","Heavenly experiences are irrelevant","He forgot it"]'::jsonb, 'It seems like boasting, and he prefers to speak about what people can observe about him', '2 Corinthians 12:1 indicates Paul will boast reluctantly; 12:6 shows he avoids overestimating himself beyond observable evidence.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 12
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why does Paul hesitate to report his heavenly experience in 2 Corinthians 12:1-6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 12, 3, 'How does 2 Corinthians 12:10 reframe Paul''s understanding of hardship?', '["Hardship is evil and should be eliminated","Paul accepts and even rejoices in hardships as vehicles for Christ''s power and strength to work through him","Suffering is worthless","Strength renders hardship impossible"]'::jsonb, 'Paul accepts and even rejoices in hardships as vehicles for Christ''s power and strength to work through him', '2 Corinthians 12:10 shows Paul''s perspective shift-hardship becomes valuable as the context for Christ''s strength.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does 2 Corinthians 12:10 reframe Paul''s understanding of hardship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 12, 3, 'How does Paul''s account of his heavenly vision in 2 Corinthians 12:2-4 compare rhetorically to false apostles'' claims in chapter 11?', '["Paul makes no claims","Paul presents his own authentic mystical experience to match and exceed false apostles'' boasts while maintaining humility","False apostles had no experiences","Comparison is irrelevant"]'::jsonb, 'Paul presents his own authentic mystical experience to match and exceed false apostles'' boasts while maintaining humility', 'Paul counters false apostles by demonstrating he too has supernatural experiences, while being reluctant to boast.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Paul''s account of his heavenly vision in 2 Corinthians 12:2-4 compare rhetorically to false apostles'' claims in chapter 11?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 12, 3, 'How does the structure of 2 Corinthians 12 move from spiritual experience to practical implication?', '["It moves from visions to condemnation","From heavenly experiences and sufferings to emphasizing Paul''s ultimate concern is building up the Corinthian community","From negative to positive teaching only","It lacks internal organization"]'::jsonb, 'From heavenly experiences and sufferings to emphasizing Paul''s ultimate concern is building up the Corinthian community', 'Paul climaxes the chapter by noting that his boasting isn''t for his own glory but to demonstrate God''s reality, with his ultimate concern being the church''s spiritual health (12:19-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does the structure of 2 Corinthians 12 move from spiritual experience to practical implication?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 12, 3, 'What does God''s response in 2 Corinthians 12:9 reveal about divine perspective on human weakness?', '["Weakness is shameful","God''s grace is the proper measure of sufficiency; human weakness becomes the arena for divine power","Strength alone matters","Weakness is permanent defeat"]'::jsonb, 'God''s grace is the proper measure of sufficiency; human weakness becomes the arena for divine power', 'God does not remove the thorn but offers grace, suggesting weakness is the context for experiencing divine sufficiency.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does God''s response in 2 Corinthians 12:9 reveal about divine perspective on human weakness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 12, 3, 'What does Paul''s willingness to boast in his weaknesses (2 Corinthians 12:9-10) reveal about his redefinition of power?', '["Weakness should always be hidden","In Christian perspective, boasting in weakness inverts worldly values-God''s strength is paradoxically revealed through human limitation","Power and weakness are mutually exclusive","Only the naturally strong can serve God"]'::jsonb, 'In Christian perspective, boasting in weakness inverts worldly values-God''s strength is paradoxically revealed through human limitation', 'Paul states he will ''boast all the more gladly about my weaknesses, so that Christ''s power may rest on me'' (12:9), establishing weakness as the condition for experiencing God''s power.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Paul''s willingness to boast in his weaknesses (2 Corinthians 12:9-10) reveal about his redefinition of power?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 12, 3, 'What extraordinary experience does Paul mention in 2 Corinthians 12:2-4, and how does he describe it?', '["A vision where Jesus appeared to him on the Damascus road","He was caught up to the third heaven and heard inexpressible words","A transfiguration experience where he saw God''s glory","A near-death experience where he visited paradise temporarily"]'::jsonb, 'He was caught up to the third heaven and heard inexpressible words', 'I know a man in Christ who fourteen years ago was caught up to the third heaven-whether in the body or out of the body I do not know...and heard inexpressible things (2 Corinthians 12:2-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'What extraordinary experience does Paul mention in 2 Corinthians 12:2-4, and how does he describe it?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 12, 3, 'Why is Paul''s refusal to boast about his vision in 2 Corinthians 12:5-6 significant?', '["He is unimpressed by the vision","It demonstrates authentic humility and prevents self-exaltation, contrasting with false apostles likely prone to self-promotion","Visions are worthless","He forgot the vision"]'::jsonb, 'It demonstrates authentic humility and prevents self-exaltation, contrasting with false apostles likely prone to self-promotion', 'Paul''s restraint about his extraordinary experience shows genuine humility, differentiating him from those who self-promote.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 12
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is Paul''s refusal to boast about his vision in 2 Corinthians 12:5-6 significant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 12, 4, 'How might the ''third heaven'' vision (2 Corinthians 12:2-4) and the ''thorn'' (12:7) be understood as interconnected aspects of Paul''s apostolic calling?', '["They are unrelated events","Vision grants authority; thorn ensures humility-together they balance divine exaltation with human dependence","Only vision matters","Thorn contradicts vision"]'::jsonb, 'Vision grants authority; thorn ensures humility-together they balance divine exaltation with human dependence', 'The paradox strengthens Paul''s defense: he has genuine divine encounters but remains truly dependent on grace.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'How might the ''third heaven'' vision (2 Corinthians 12:2-4) and the ''thorn'' (12:7) be understood as interconnected aspects of Paul''s apostolic calling?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 12, 4, 'In 2 Corinthians 12:11-13, how does Paul conclude his apostolic defense, and what underlying principles emerge?', '["He abandons his defense completely","He notes he has been forced to foolish boasting but reasserts the signs of a true apostle: perseverance in serving without burden","He demands recognition","He admits his apostolic authority is questionable"]'::jsonb, 'He notes he has been forced to foolish boasting but reasserts the signs of a true apostle: perseverance in serving without burden', 'Paul claims in 12:12 that the signs of an apostle were demonstrated among the Corinthians ''by perseverance, by signs, wonders and miracles,'' but what distinguishes him is refusing financial burden on them.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'In 2 Corinthians 12:11-13, how does Paul conclude his apostolic defense, and what underlying principles emerge?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 12, 4, 'What does Paul''s boasting in weakness in 2 Corinthians 12:9-10 reveal about the nature of true apostolic power?', '["Power is merely political","True apostolic power is paradoxically revealed through dependence on God''s grace rather than human capability","Weakness disproves authority","Power and weakness are incompatible"]'::jsonb, 'True apostolic power is paradoxically revealed through dependence on God''s grace rather than human capability', 'Paul redefines apostolic authority not as dominance but as transparent reliance on Christ''s strength working through weakness.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Paul''s boasting in weakness in 2 Corinthians 12:9-10 reveal about the nature of true apostolic power?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 12, 4, 'What does Paul''s decision not to recount his visions as credentials (2 Corinthians 12:1-6) suggest about his argument''s strategy?', '["He has no visions to report","Rather than use transcendent experiences as proof of authority, he chooses to be known by service and weakness, a more authentic apostolic witness","Visions are worthless","All spiritual experiences are deceptive"]'::jsonb, 'Rather than use transcendent experiences as proof of authority, he chooses to be known by service and weakness, a more authentic apostolic witness', 'Paul mentions having visions (12:2-4) but refuses to boast of them, choosing instead to be ''known by his weaknesses'' (12:5), prioritizing authentic witness over extraordinary credentials.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Paul''s decision not to recount his visions as credentials (2 Corinthians 12:1-6) suggest about his argument''s strategy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 12, 4, 'What does Paul''s metaphor of ''thorn in the flesh'' in 2 Corinthians 12:7-8 reveal about the purpose of trials and afflictions?', '["God removes obstacles that hinder spiritual progress","A messenger of Satan was sent to buffet Paul, so he might not be exalted above measure","Physical ailments are always a sign of unconfessed sin","Believers should never experience persistent difficulties"]'::jsonb, 'A messenger of Satan was sent to buffet Paul, so he might not be exalted above measure', 'And lest I should be exalted above measure by the abundance of the revelations, a thorn in the flesh was given to me, a messenger of Satan to buffet me (2 Corinthians 12:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Paul''s metaphor of ''thorn in the flesh'' in 2 Corinthians 12:7-8 reveal about the purpose of trials and afflictions?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 12, 4, 'What is the theological significance of God''s denial of Paul''s prayer in 2 Corinthians 12:8-9?', '["God does not answer prayer","Refusal of removal offers greater blessing-the ongoing grace sufficient to transform weakness into strength","Prayer is ineffective","Suffering serves no purpose"]'::jsonb, 'Refusal of removal offers greater blessing-the ongoing grace sufficient to transform weakness into strength', 'God''s ''no'' to removal becomes ''yes'' to deeper grace-a paradoxical blessing that strengthens Paul spiritually.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'What is the theological significance of God''s denial of Paul''s prayer in 2 Corinthians 12:8-9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 12, 4, 'Why is the thorn in the flesh in 2 Corinthians 12:7 theologically significant even without being precisely identified?', '["Its exact medical diagnosis is the main point of the passage","Its ambiguity keeps the focus on God''s grace and the purpose of humbled dependence rather than on the affliction itself","It proves Paul''s vision was false","It shows suffering always comes from personal sin"]'::jsonb, 'Its ambiguity keeps the focus on God''s grace and the purpose of humbled dependence rather than on the affliction itself', 'Paul emphasizes why the thorn was given and the Lord''s answer of sufficient grace, not the thorn''s exact form (2 Corinthians 12:7-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 12
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is the thorn in the flesh in 2 Corinthians 12:7 theologically significant even without being precisely identified?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 12, 5, 'How does the paradox of divine power perfected in human weakness (2 Corinthians 12:9) fundamentally reshape the Corinthians'' understanding of what constitutes spiritual authority?', '["Authority is measured by earthly success and strength","True spiritual authority is demonstrated through endurance of weakness while trusting divine sufficiency, inverting cultural values","Weakness disqualifies leadership","Divine power operates independently of human condition"]'::jsonb, 'True spiritual authority is demonstrated through endurance of weakness while trusting divine sufficiency, inverting cultural values', 'Paul''s theology presents a radical counter-cultural claim: genuine authority comes not from strength, credentials, or power but from vulnerability and reliance on God''s grace, fundamentally challenging how the Corinthians evaluated leadership.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does the paradox of divine power perfected in human weakness (2 Corinthians 12:9) fundamentally reshape the Corinthians'' understanding of what constitutes spiritual authority?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 12, 5, 'How does the trajectory from Paul''s vision to his thorn in 2 Corinthians 12 inform Christian understanding of divine favor and suffering?', '["Favor excludes suffering","Divine favor encompasses both transcendent blessing and suffering designed to cultivate genuine dependence and depth of faith","Suffering proves disfavor","Vision and suffering are mutually exclusive"]'::jsonb, 'Divine favor encompasses both transcendent blessing and suffering designed to cultivate genuine dependence and depth of faith', '2 Corinthians 12 teaches that God''s favor includes joy (vision) and challenge (thorn), each essential to spiritual maturity.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does the trajectory from Paul''s vision to his thorn in 2 Corinthians 12 inform Christian understanding of divine favor and suffering?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 12, 5, 'How might 2 Corinthians 12:7-10 be understood as Paul''s most profound response to the false apostles in chapters 11-12?', '["It is irrelevant to false apostles","By finding strength in weakness, Paul reveals a spirituality transcending false apostles'' self-promotion, making their approach futile","False apostles are not addressed","The response is superficial"]'::jsonb, 'By finding strength in weakness, Paul reveals a spirituality transcending false apostles'' self-promotion, making their approach futile', 'If true power operates through weakness and grace, false apostles'' boasting becomes not just wrong but spiritually empty.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'How might 2 Corinthians 12:7-10 be understood as Paul''s most profound response to the false apostles in chapters 11-12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 12, 5, 'What critical shift occurs in 2 Corinthians 12:6-10 regarding Paul''s boasting strategy?', '["No shift occurs","Paul transitions from reluctant boasting about visions to authentic rejoicing in weaknesses, redefining legitimate apostolic witness","He abandons boasting entirely","He increases boasting"]'::jsonb, 'Paul transitions from reluctant boasting about visions to authentic rejoicing in weaknesses, redefining legitimate apostolic witness', 'The movement reveals that true witness lies not in extraordinary experiences but in transparent vulnerability to God''s grace.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What critical shift occurs in 2 Corinthians 12:6-10 regarding Paul''s boasting strategy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 12, 5, 'What is the theological significance of Paul''s statement ''I will not boast about myself, except about my weaknesses'' (2 Corinthians 12:5) within his full argument to the Corinthians?', '["Weakness proves spiritual failure","It establishes that authentic apostolic witness centers on transparency about human limitation where divine grace operates, not on self-promotion","Strength and weakness are equally valuable","True leaders never acknowledge limitations"]'::jsonb, 'It establishes that authentic apostolic witness centers on transparency about human limitation where divine grace operates, not on self-promotion', 'This statement synthesizes Paul''s defense: true authority is built on honest acknowledgment of weakness (12:5-6), differentiating him from false apostles who boast in accomplishments and exploit believers.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the theological significance of Paul''s statement ''I will not boast about myself, except about my weaknesses'' (2 Corinthians 12:5) within his full argument to the Corinthians?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 12, 5, 'What paradoxical principle does Paul learn through his ''thorn in the flesh'' experience in 2 Corinthians 12:9-10?', '["Human strength is insufficient, so we must develop greater determination","God''s grace is sufficient and His power is made perfect in weakness","Suffering purges all weakness and produces inevitable strength","The thorn was removed once Paul gained sufficient faith"]'::jsonb, 'God''s grace is sufficient and His power is made perfect in weakness', 'And He said to me, ''My grace is sufficient for you, for My strength is made perfect in weakness'' (2 Corinthians 12:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'What paradoxical principle does Paul learn through his ''thorn in the flesh'' experience in 2 Corinthians 12:9-10?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 12, 5, 'Why does Paul claim to ''delight'' in weaknesses, insults, hardships, and persecutions in 2 Corinthians 12:10, according to his theological framework?', '["He enjoys physical suffering and emotional pain","For Christ''s sake, because when he is weak, then he is strong through Christ''s power","Suffering builds character and proves spiritual maturity","God rewards those who endure the most difficult trials"]'::jsonb, 'For Christ''s sake, because when he is weak, then he is strong through Christ''s power', 'Therefore I take pleasure in infirmities, in reproaches, in needs, in persecutions, in distresses, for Christ''s sake. For when I am weak, then I am strong (2 Corinthians 12:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 12
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does Paul claim to ''delight'' in weaknesses, insults, hardships, and persecutions in 2 Corinthians 12:10, according to his theological framework?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 13, 1, 'According to 2 Corinthians 13:1, how many times had Paul visited the Corinthians?', '["Once","Twice before this third visit","Many times","He had not visited"]'::jsonb, 'Twice before this third visit', '2 Corinthians 13:1 mentions ''this is my third visit to you,'' counting proposed visits.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Corinthians 13:1, how many times had Paul visited the Corinthians?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 13, 1, 'According to 2 Corinthians 13:3, what proof of Christ''s power within Paul do the Corinthians seek?', '["Great miracles","Signs of Christ speaking through him","Monetary proof","Political authority"]'::jsonb, 'Signs of Christ speaking through him', '2 Corinthians 13:3 indicates the Corinthians wanted proof that Christ spoke through Paul.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Corinthians 13:3, what proof of Christ''s power within Paul do the Corinthians seek?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 13, 1, 'According to 2 Corinthians 13:5, what should the Corinthians do?', '["Ignore Paul","Examine yourselves to see if you are in the faith","Surrender all authority","Never question themselves"]'::jsonb, 'Examine yourselves to see if you are in the faith', '2 Corinthians 13:5 calls for self-examination regarding their faith in Christ.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Corinthians 13:5, what should the Corinthians do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 13, 1, 'In 2 Corinthians 13:1, what does Paul invoke regarding judgment?', '["His own authority","The testimony of two or three witnesses","Roman law","Church consensus"]'::jsonb, 'The testimony of two or three witnesses', '2 Corinthians 13:1 cites Deuteronomy 19:15 on testimony of witnesses.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'In 2 Corinthians 13:1, what does Paul invoke regarding judgment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 13, 1, 'In 2 Corinthians 13:14, what benediction does Paul pronounce?', '["Peace be with you","The grace of the Lord, the love of God, and the fellowship of the Spirit","Blessings on your homes","Safety in journeys"]'::jsonb, 'The grace of the Lord, the love of God, and the fellowship of the Spirit', '2 Corinthians 13:14 contains the famous Trinitarian benediction.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'In 2 Corinthians 13:14, what benediction does Paul pronounce?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 13, 1, 'What does Christ''s crucifixion demonstrate in 2 Corinthians 13:4?', '["Weakness only","Weakness, yet Christ lives by God''s power","Death is final","Strength without weakness"]'::jsonb, 'Weakness, yet Christ lives by God''s power', '2 Corinthians 13:4 references Christ''s crucifixion as weakness but also His resurrection through God''s power.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'What does Christ''s crucifixion demonstrate in 2 Corinthians 13:4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 13, 1, 'What warning does Paul issue in 2 Corinthians 13:2?', '["He will not return","He warned those who sinned before that if he comes again he will not spare them","Warnings will be limited","No consequences will follow"]'::jsonb, 'He warned those who sinned before that if he comes again he will not spare them', '2 Corinthians 13:2 conveys Paul''s stern warning against continued sin.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 13
    AND q.difficulty_stage = 1
    AND q.prompt = 'What warning does Paul issue in 2 Corinthians 13:2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 13, 2, 'According to 2 Corinthians 13:2-3, how does Paul distinguish between his personal power and Christ''s power?', '["They are identical","He will act sternly, but his authority comes from Christ working through him","He has no personal authority","Christ is irrelevant"]'::jsonb, 'He will act sternly, but his authority comes from Christ working through him', '2 Corinthians 13:3 clarifies that the power is not Paul''s but Christ''s operating through him.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to 2 Corinthians 13:2-3, how does Paul distinguish between his personal power and Christ''s power?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 13, 2, 'How does 2 Corinthians 13:4 address the tension between power and weakness?', '["Power eliminates weakness","Christ was crucified in weakness but lives by God''s power; believers similarly live by God''s power in him","Weakness is final","Power and weakness cannot coexist"]'::jsonb, 'Christ was crucified in weakness but lives by God''s power; believers similarly live by God''s power in him', '2 Corinthians 13:4 connects Christ''s paradox to believers'' experience of weakness and divine power.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does 2 Corinthians 13:4 address the tension between power and weakness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 13, 2, 'In 2 Corinthians 13:7, what does Paul prefer?', '["To display his power over them","That they do what is right even if it means he appears weak rather than they fail his test","Their failure to understand him","Demonstrating personal authority"]'::jsonb, 'That they do what is right even if it means he appears weak rather than they fail his test', '2 Corinthians 13:7 shows Paul prioritizes their spiritual integrity over proving his own authority.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'In 2 Corinthians 13:7, what does Paul prefer?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 13, 2, 'What does Paul mean by asking the Corinthians to ''examine yourselves'' in 2 Corinthians 13:5?', '["Examine others","Test whether you remain in faith and whether Christ is in you","Avoid self-reflection","Look for faults in leaders only"]'::jsonb, 'Test whether you remain in faith and whether Christ is in you', '2 Corinthians 13:5 calls for personal spiritual self-assessment rather than external judgment.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul mean by asking the Corinthians to ''examine yourselves'' in 2 Corinthians 13:5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 13, 2, 'What does Paul wish for the Corinthians in 2 Corinthians 13:9?', '["Their perfection","That you be restored to completeness, which is what he prays for","Their punishment","Their failure"]'::jsonb, 'That you be restored to completeness, which is what he prays for', '2 Corinthians 13:9 shows Paul''s true desire is their spiritual restoration and maturity.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul wish for the Corinthians in 2 Corinthians 13:9?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 13, 2, 'What does Paul''s mention of a ''third visit'' in 2 Corinthians 13:1 suggest about the seriousness of his intent?', '["It is his first challenge","He has warned before and now intends to act if necessary, establishing a pattern of escalation","This is a casual visit","No discipline will follow"]'::jsonb, 'He has warned before and now intends to act if necessary, establishing a pattern of escalation', 'Mentioning the third visit after prior warnings indicates Paul''s patience has limits and action may follow.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul''s mention of a ''third visit'' in 2 Corinthians 13:1 suggest about the seriousness of his intent?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 13, 2, 'What is Paul''s primary purpose in writing about ''three witnesses'' in 2 Corinthians 13:1?', '["To establish a legal court precedent","To indicate his third visit will involve testimony from multiple sources about the Corinthians'' need for repentance","To prove a mathematical formula","To count the number of apostles"]'::jsonb, 'To indicate his third visit will involve testimony from multiple sources about the Corinthians'' need for repentance', 'Paul invokes the Old Testament principle that ''every matter may be established by the testimony of two or three witnesses'' (13:1), warning that his third visit will bring judgment for unrepentant believers.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 13
    AND q.difficulty_stage = 2
    AND q.prompt = 'What is Paul''s primary purpose in writing about ''three witnesses'' in 2 Corinthians 13:1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 13, 3, 'How do 2 Corinthians 13:10 and 13:8 together characterize Paul''s use of authority?', '["Authority is for harm","Authority is for building up and cannot act against truth, establishing legitimate and constructive bounds","He will abuse authority","Authority has no limits"]'::jsonb, 'Authority is for building up and cannot act against truth, establishing legitimate and constructive bounds', '2 Corinthians 13:8-10 indicates Paul''s authority is always constructive and truthful, never merely punitive.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'How do 2 Corinthians 13:10 and 13:8 together characterize Paul''s use of authority?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 13, 3, 'How does Paul''s concern that they ''fail the test'' in 2 Corinthians 13:5-6 reveal his pastoral motivation?', '["He wants them to fail","He is concerned for their spiritual status and wants them to prove they are in the faith, not that they fail","Failure is irrelevant","He does not care about outcomes"]'::jsonb, 'He is concerned for their spiritual status and wants them to prove they are in the faith, not that they fail', '2 Corinthians 13:6 clarifies Paul hopes they will pass the test-he seeks their spiritual health.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Paul''s concern that they ''fail the test'' in 2 Corinthians 13:5-6 reveal his pastoral motivation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 13, 3, 'How does Paul''s warning in 2 Corinthians 13:2-4 about his upcoming visit balance severity with grace?', '["It promises only punishment without possibility of change","It warns he will not be lenient toward persistent sin, yet makes clear his power comes from Christ who is living and powerful, giving opportunity to repent","It ignores the possibility of repentance","It suggests Paul is weak and powerless"]'::jsonb, 'It warns he will not be lenient toward persistent sin, yet makes clear his power comes from Christ who is living and powerful, giving opportunity to repent', 'Paul states he won''t be lenient (13:2) but immediately grounds this in Christ''s power and resurrection (13:4), indicating judgment flows from living truth to which believers can respond.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Paul''s warning in 2 Corinthians 13:2-4 about his upcoming visit balance severity with grace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 13, 3, 'What does Paul''s exhortation to ''examine yourselves'' in 2 Corinthians 13:5 suggest about his approach to church discipline?', '["Only leaders should evaluate spiritual health","Believers themselves should conduct spiritual self-examination to verify if they remain in the faith and if Christ lives in them","Examination is unnecessary","Only external observation matters"]'::jsonb, 'Believers themselves should conduct spiritual self-examination to verify if they remain in the faith and if Christ lives in them', 'Paul invites the Corinthians to ''test yourselves'' and ''examine yourselves'' (13:5), placing responsibility on them to assess their own spiritual condition rather than expecting external judgment alone.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Paul''s exhortation to ''examine yourselves'' in 2 Corinthians 13:5 suggest about his approach to church discipline?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 13, 3, 'What does Paul''s statement ''we are glad when we are weak and you are strong'' in 2 Corinthians 13:9 indicate about his view of authority?', '["Authority is about domination","His authority exists to enable their strength, not to maintain his superiority","Their strength undermines his role","Strength is competitive"]'::jsonb, 'His authority exists to enable their strength, not to maintain his superiority', 'Paul''s gladness at their strength while he appears weak shows authority is servant-oriented, not domineering.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Paul''s statement ''we are glad when we are weak and you are strong'' in 2 Corinthians 13:9 indicate about his view of authority?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 13, 3, 'What does the ending of 2 Corinthians 13:11-14 suggest about the letter''s overall message?', '["Condemnation is final","Despite warnings, Paul calls them to peace, encouragement, and fellowship, affirming the ultimate goal is restoration","No reconciliation is possible","The letter is purely critical"]'::jsonb, 'Despite warnings, Paul calls them to peace, encouragement, and fellowship, affirming the ultimate goal is restoration', 'The benediction and calls to restoration counter the stern warnings, showing Paul''s ultimate pastoral concern.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the ending of 2 Corinthians 13:11-14 suggest about the letter''s overall message?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 13, 3, 'What is the rhetorical function of the legal standard in 2 Corinthians 13:1 referencing witnesses?', '["To enable condemnation","To establish legitimacy of potential discipline by invoking established legal principle, suggesting Paul''s actions will be fair","To avoid all judgment","Witnesses are unnecessary"]'::jsonb, 'To establish legitimacy of potential discipline by invoking established legal principle, suggesting Paul''s actions will be fair', 'Paul grounds potential discipline in biblical law, asserting it will be justified and not arbitrary.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 13
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the rhetorical function of the legal standard in 2 Corinthians 13:1 referencing witnesses?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 13, 4, 'How does 2 Corinthians 13:3-4 use Christ''s paradox to anticipate Paul''s exercise of authority?', '["Christ is irrelevant to authority","As Christ appears weak but is powerful through God, Paul may appear gentle but act with authority if necessary, mirroring Christ''s model","Authority should be purely harsh","Christ guarantees no discipline"]'::jsonb, 'As Christ appears weak but is powerful through God, Paul may appear gentle but act with authority if necessary, mirroring Christ''s model', 'Paul grounds his potential sternness in Christ''s paradox-apparent weakness conceals genuine authority from God.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 2 Corinthians 13:3-4 use Christ''s paradox to anticipate Paul''s exercise of authority?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 13, 4, 'How might 2 Corinthians 13:10-11 be understood as the culmination of the entire epistle''s theme?', '["It summarizes criticisms","It balances authority with restoration, concluding that power exists to build up and foster unity despite necessary discipline","It dismisses earlier themes","The epistle has no unifying theme"]'::jsonb, 'It balances authority with restoration, concluding that power exists to build up and foster unity despite necessary discipline', 'The conclusion integrates the stern warnings of chapters 10-13 with the pastoral calls to unity and peace.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'How might 2 Corinthians 13:10-11 be understood as the culmination of the entire epistle''s theme?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 13, 4, 'In 2 Corinthians 13:9, Paul states ''I am glad whenever I am weak but you are strong.'' How does this statement synthesize his entire letter''s theology?', '["It expresses preference for his own weakness","It reveals his ultimate goal is the Corinthians'' spiritual strength, not his own vindication-his weakness is acceptable if it means their maturity","It suggests the Corinthians should dominate him","It contradicts earlier statements"]'::jsonb, 'It reveals his ultimate goal is the Corinthians'' spiritual strength, not his own vindication-his weakness is acceptable if it means their maturity', 'This statement, positioned near the letter''s close, summarizes Paul''s pastoral heart: his weaknesses, struggles, and even being ''disgraced while you are honored'' (13:9) are worthwhile if the Corinthians grow strong.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'In 2 Corinthians 13:9, Paul states ''I am glad whenever I am weak but you are strong.'' How does this statement synthesize his entire letter''s theology?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 13, 4, 'What does 2 Corinthians 13:5-9 reveal about the relationship between Paul''s authority and the Corinthians'' responsibility?', '["Paul bears all responsibility","Paul''s authority invites their self-examination; he desires their spiritual success more than proving his power","They have no responsibility","Authority negates responsibility"]'::jsonb, 'Paul''s authority invites their self-examination; he desires their spiritual success more than proving his power', '2 Corinthians 13:5-9 shifts focus from Paul''s authority to their self-assessment and growth-mutual responsibility.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does 2 Corinthians 13:5-9 reveal about the relationship between Paul''s authority and the Corinthians'' responsibility?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 13, 4, 'What does Paul mean when he says ''We are weak, but you are strong'' in 2 Corinthians 13:3-4?', '["Paul admits that he and the apostles lack true authority","Paul uses apparent weakness in the flesh while Christ demonstrates power, and believers should follow Christ''s example of power through weakness","The Corinthians have surpassed the apostles in spiritual maturity","Believers should rely on their own strength rather than God''s"]'::jsonb, 'Paul uses apparent weakness in the flesh while Christ demonstrates power, and believers should follow Christ''s example of power through weakness', 'For though He was crucified in weakness, yet He lives by the power of God. For we also are weak in Him, but we shall live with Him by the power of God toward you (2 Corinthians 13:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Paul mean when he says ''We are weak, but you are strong'' in 2 Corinthians 13:3-4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 13, 4, 'What does Paul''s closing prayer about ''perfection'' in 2 Corinthians 13:9 and ''restoration'' in 13:11 reveal about his expectations for the Corinthian church?', '["They should be immediately flawless","They are broken and fractious and require patient restoration to wholeness through obedience and divine grace","They are already perfect and need no change","Paul abandons all hope for their redemption"]'::jsonb, 'They are broken and fractious and require patient restoration to wholeness through obedience and divine grace', 'Paul prays they be ''restored'' and made ''complete'' (13:9, 11), acknowledging present brokenness while maintaining hope for healing through their alignment with Christ and one another.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Paul''s closing prayer about ''perfection'' in 2 Corinthians 13:9 and ''restoration'' in 13:11 reveal about his expectations for the Corinthian church?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 13, 4, 'What warning does Paul issue to the Corinthians in 2 Corinthians 13:1-2 regarding his third visit and their need for repentance?', '["He promises miraculous signs to prove his authority","By the mouth of two or three witnesses shall every word be established, and he will not spare those who have sinned","Physical punishment and excommunication will be administered","He will remain gentle even if they continue in sin"]'::jsonb, 'By the mouth of two or three witnesses shall every word be established, and he will not spare those who have sinned', 'This will be the third time I am coming to you. By the mouth of two or three witnesses every word shall be established. I have told you before, and foretell as if I were present the second time (2 Corinthians 13:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 13
    AND q.difficulty_stage = 4
    AND q.prompt = 'What warning does Paul issue to the Corinthians in 2 Corinthians 13:1-2 regarding his third visit and their need for repentance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 13, 5, 'How does 2 Corinthians 13:11-14 function as a solution to the tensions established throughout chapters 10-13?', '["It ignores tensions","It invokes joy, encouragement, unity, and Divine grace as healing forces that transcend conflict and establish basis for reconciliation","Tensions remain unresolved","The solution is merely verbal"]'::jsonb, 'It invokes joy, encouragement, unity, and Divine grace as healing forces that transcend conflict and establish basis for reconciliation', 'The concluding exhortations and benediction offer practical spiritual means for overcoming the conflicts Paul addressed.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 2 Corinthians 13:11-14 function as a solution to the tensions established throughout chapters 10-13?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 13, 5, 'How does the contrast between Paul''s threatened use of authority to punish (13:2-4) and his actual desire for Corinthian restoration (13:9-11) reflect the tension between judgment and mercy throughout 2 Corinthians?', '["Paul is inconsistent and hypocritical","Paul''s willingness to judge serves the purpose of redemption-power is exercised for building up, not destruction, with judgment aimed at restoration of broken believers","Judgment and mercy are contradictory concepts","Paul doesn''t genuinely care about the Corinthians"]'::jsonb, 'Paul''s willingness to judge serves the purpose of redemption-power is exercised for building up, not destruction, with judgment aimed at restoration of broken believers', 'Throughout 2 Corinthians, Paul holds together power used for judgment (13:3-4) and the pastor''s heart seeking restoration (13:9-11), revealing that true apostolic authority is always exercised for believers'' ultimate good.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does the contrast between Paul''s threatened use of authority to punish (13:2-4) and his actual desire for Corinthian restoration (13:9-11) reflect the tension between judgment and mercy throughout 2 Corinthians?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 13, 5, 'How does the pattern of warning-examination-restoration in 2 Corinthians 13:1-14 model Christian discipline and community accountability?', '["Discipline is purely punitive","Legitimate discipline includes clear warning, invites self-examination, and aims at restoration within community, not merely punishment","Accountability is avoided","Community cannot correct members"]'::jsonb, 'Legitimate discipline includes clear warning, invites self-examination, and aims at restoration within community, not merely punishment', '2 Corinthians 13 exemplifies that true discipline is restorative and community-oriented, not simply punitive or authoritarian.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does the pattern of warning-examination-restoration in 2 Corinthians 13:1-14 model Christian discipline and community accountability?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 13, 5, 'In 2 Corinthians 13:5, what test does Paul urge the Corinthians to apply to themselves regarding their faith in Christ?', '["Count how many times they have prayed and studied Scripture","Examine yourselves whether you are in the faith; prove yourselves","Confess all sins to a church authority","Demonstrate works that prove their salvation"]'::jsonb, 'Examine yourselves whether you are in the faith; prove yourselves', 'Examine yourselves as to whether you are in the faith. Test yourselves (2 Corinthians 13:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'In 2 Corinthians 13:5, what test does Paul urge the Corinthians to apply to themselves regarding their faith in Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 13, 5, 'What is the significance of Paul''s final benedictions about ''the grace of the Lord Jesus Christ'' and ''the fellowship of the Holy Spirit'' in 2 Corinthians 13:14, given the letter''s concerns?', '["These are merely polite closing formulas with no substance","They affirm the Trinitarian communion is the antidote to division and the foundation for genuine apostolic fellowship Paul has labored to restore","They contradict the letter''s theology","They suggest the letter''s warnings were meaningless"]'::jsonb, 'They affirm the Trinitarian communion is the antidote to division and the foundation for genuine apostolic fellowship Paul has labored to restore', 'The final benediction emphasizing grace, love, and fellowship completes Paul''s argument: unity and restored relationships flow from believers'' participation in the triune God''s communion, which he has been defending and calling them toward throughout.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the significance of Paul''s final benedictions about ''the grace of the Lord Jesus Christ'' and ''the fellowship of the Holy Spirit'' in 2 Corinthians 13:14, given the letter''s concerns?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 13, 5, 'What theological framework underlies 2 Corinthians 13:4 regarding the relationship between Christ''s crucifixion and believers'' experience of weakness and power?', '["Christ and believers are isolated","Christ''s pattern of weakness yielding to divine power becomes the model for believers'' paradoxical strength through apparent vulnerability","Believers have no connection to Christ","Weakness is purely negative"]'::jsonb, 'Christ''s pattern of weakness yielding to divine power becomes the model for believers'' paradoxical strength through apparent vulnerability', '2 Corinthians 13:4 establishes Christ''s crucifixion-resurrection pattern as paradigmatic for Christian experience and power.'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What theological framework underlies 2 Corinthians 13:4 regarding the relationship between Christ''s crucifixion and believers'' experience of weakness and power?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 47, 13, 5, 'What three elements does Paul emphasize in the closing benediction of 2 Corinthians 13:13-14 as expressions of Christian fellowship?', '["Obedience, good works, and ceremonial worship","The grace of the Lord Jesus, the love of God, and the communion of the Holy Spirit","Faith, hope, and charity as theological virtues","Truth, justice, and holiness as divine attributes"]'::jsonb, 'The grace of the Lord Jesus, the love of God, and the communion of the Holy Spirit', 'The grace of the Lord Jesus Christ, and the love of God, and the communion of the Holy Spirit be with you all (2 Corinthians 13:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 47
    AND q.chapter = 13
    AND q.difficulty_stage = 5
    AND q.prompt = 'What three elements does Paul emphasize in the closing benediction of 2 Corinthians 13:13-14 as expressions of Christian fellowship?'
);
