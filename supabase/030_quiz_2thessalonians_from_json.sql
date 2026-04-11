-- ============================================================================
-- LOGOS LIGHT - 2 Thessalonians (book 53) quiz questions from quiz-questions/2thessalonians.json
-- ============================================================================
-- Idempotent: skips rows that already match (book_number, chapter, difficulty_stage, prompt).
-- ============================================================================

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 1, 1, 'According to 2 Thessalonians 1, who are named with Paul in the greeting?', '["Silvanus and Timothy","Barnabas and Titus","Luke and Mark","Peter and John"]'::jsonb, 'Silvanus and Timothy', 'Paul, Silvanus, and Timothy are named together in the greeting (2 Thessalonians 1:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Thessalonians 1, who are named with Paul in the greeting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 1, 1, 'According to 2 Thessalonians 1, what does Paul say grows exceedingly?', '["Their faith","Their wealth","Their political influence","Their knowledge of Rome"]'::jsonb, 'Their faith', 'Paul says their faith grows exceedingly (2 Thessalonians 1:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Thessalonians 1, what does Paul say grows exceedingly?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 1, 1, 'According to 2 Thessalonians 1, what abounded among them?', '["Love of each one toward one another","Fear of persecution","Temple worship","Observance of feast days"]'::jsonb, 'Love of each one toward one another', 'Paul says the love of each one of them all toward one another abounds (2 Thessalonians 1:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Thessalonians 1, what abounded among them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 1, 1, 'According to 2 Thessalonians 1, in what do the Thessalonians show perseverance and faith?', '["All persecutions and afflictions","All public debates","Temple offerings","Travel to Jerusalem"]'::jsonb, 'All persecutions and afflictions', 'Paul boasts of their perseverance and faith in all persecutions and afflictions that they endure (2 Thessalonians 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Thessalonians 1, in what do the Thessalonians show perseverance and faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 1, 1, 'According to 2 Thessalonians 1, what is it righteous for God to repay to those who trouble believers?', '["Affliction","Honor","Peace","Prosperity"]'::jsonb, 'Affliction', 'It is a righteous thing with God to repay affliction to those who afflict believers (2 Thessalonians 1:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Thessalonians 1, what is it righteous for God to repay to those who trouble believers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 1, 1, 'According to 2 Thessalonians 1, with what will the Lord Jesus be revealed from heaven?', '["The angels of his power","The elders of Jerusalem","The kings of the earth","Only the apostles"]'::jsonb, 'The angels of his power', 'The Lord Jesus will be revealed from heaven with the angels of his power (2 Thessalonians 1:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Thessalonians 1, with what will the Lord Jesus be revealed from heaven?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 1, 1, 'According to 2 Thessalonians 1, what will Jesus render in flaming fire?', '["Vengeance","Mercy only","Silence","A new covenant sign"]'::jsonb, 'Vengeance', 'Paul says Jesus will render vengeance in flaming fire (2 Thessalonians 1:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Thessalonians 1, what will Jesus render in flaming fire?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 1, 2, 'What does Paul say the Thessalonians'' endurance is evidence of in 2 Thessalonians 1?', '["The righteous judgment of God","Their Roman citizenship","Their superior wisdom","Their freedom from weakness"]'::jsonb, 'The righteous judgment of God', 'Their endurance is a manifest token of the righteous judgment of God (2 Thessalonians 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say the Thessalonians'' endurance is evidence of in 2 Thessalonians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 1, 2, 'For what does Paul say the Thessalonians are suffering in 2 Thessalonians 1?', '["The Kingdom of God","The temple law","Roman reform","Their own ambitions"]'::jsonb, 'The Kingdom of God', 'They are counted worthy of the Kingdom of God, for which they also suffer (2 Thessalonians 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'For what does Paul say the Thessalonians are suffering in 2 Thessalonians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 1, 2, 'What will God give to the afflicted believers according to 2 Thessalonians 1?', '["Rest with Paul and his companions","Immediate wealth","Political power","Escape from all earthly work"]'::jsonb, 'Rest with Paul and his companions', 'God will give rest with us to you who are afflicted (2 Thessalonians 1:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What will God give to the afflicted believers according to 2 Thessalonians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 1, 2, 'On whom will the Lord take vengeance according to 2 Thessalonians 1?', '["Those who do not know God and do not obey the gospel","All who suffer","Only the Romans","Only false apostles"]'::jsonb, 'Those who do not know God and do not obey the gospel', 'Vengeance comes on those who do not know God and do not obey the gospel of our Lord Jesus (2 Thessalonians 1:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'On whom will the Lord take vengeance according to 2 Thessalonians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 1, 2, 'What punishment does Paul describe in 2 Thessalonians 1?', '["Eternal destruction from the face of the Lord","Temporary exile only","Loss of property","Bodily sickness only"]'::jsonb, 'Eternal destruction from the face of the Lord', 'Paul speaks of eternal destruction from the face of the Lord and from the glory of his might (2 Thessalonians 1:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What punishment does Paul describe in 2 Thessalonians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 1, 2, 'When will Christ be glorified in his saints according to 2 Thessalonians 1?', '["In that day","At Pentecost","At Paul''s next visit","After the temple is rebuilt"]'::jsonb, 'In that day', 'He comes to be glorified in his saints and admired in all those who believe in that day (2 Thessalonians 1:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'When will Christ be glorified in his saints according to 2 Thessalonians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 1, 2, 'What does Paul pray God will count the Thessalonians worthy of in 2 Thessalonians 1?', '["Their calling","Temple worship","Roman peace","Apostolic office"]'::jsonb, 'Their calling', 'Paul prays that God would count them worthy of their calling (2 Thessalonians 1:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul pray God will count the Thessalonians worthy of in 2 Thessalonians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 1, 3, 'Why does Paul interpret the Thessalonians'' endurance as evidence of God''s righteous judgment?', '["Their faithful suffering shows God is preparing a just reversal and vindication","Suffering proves God ignores them","Judgment is based only on Roman courts","Perseverance removes the need for God''s action"]'::jsonb, 'Their faithful suffering shows God is preparing a just reversal and vindication', 'Paul presents their endurance as evidence of God''s righteous judgment and then describes God repaying affliction to persecutors and rest to believers (2 Thessalonians 1:5-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul interpret the Thessalonians'' endurance as evidence of God''s righteous judgment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 1, 3, 'What does 2 Thessalonians 1 teach about the return of Christ?', '["His return brings both relief for believers and judgment for those who reject the gospel","It is only a symbol of inner peace","It matters only for angels","It concerns unbelievers alone"]'::jsonb, 'His return brings both relief for believers and judgment for those who reject the gospel', 'Paul describes Christ''s revelation from heaven as bringing rest to afflicted believers and vengeance on those who reject God and the gospel (2 Thessalonians 1:7-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 2 Thessalonians 1 teach about the return of Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 1, 3, 'Why does Paul connect knowing God with obeying the gospel in 2 Thessalonians 1?', '["Rejecting the gospel is treated as a refusal of God''s revealed claim","Knowing God is unrelated to response","Obedience replaces faith entirely","The gospel is only for people already obedient"]'::jsonb, 'Rejecting the gospel is treated as a refusal of God''s revealed claim', 'Paul joins those who do not know God with those who do not obey the gospel, showing that response to the gospel reveals relation to God (2 Thessalonians 1:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul connect knowing God with obeying the gospel in 2 Thessalonians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 1, 3, 'How does prayer function in the chapter''s closing verses?', '["Prayer asks God to complete in the believers what matches their calling and faith","Prayer is only for relief from trouble","Prayer replaces endurance","Prayer concerns only the future judgment of others"]'::jsonb, 'Prayer asks God to complete in the believers what matches their calling and faith', 'Paul prays that God would count them worthy of their calling and fulfill every desire of goodness and work of faith with power (2 Thessalonians 1:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does prayer function in the chapter''s closing verses?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 1, 3, 'What is the significance of Christ being glorified in his saints in 2 Thessalonians 1?', '["His saving work will be openly displayed in the transformed people who belong to him","Believers will replace Christ''s glory","Only angels will see his glory","Glory belongs only to heaven, not to the church"]'::jsonb, 'His saving work will be openly displayed in the transformed people who belong to him', 'Paul says Christ will be glorified in his saints and marveled at in all who believed, showing his glory displayed in and among his people (2 Thessalonians 1:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the significance of Christ being glorified in his saints in 2 Thessalonians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 1, 3, 'Why does Paul boast about the Thessalonians to other churches?', '["Their endurance under suffering is an encouraging testimony of God''s grace","He wants to embarrass other churches","He is seeking money from them","He lacks anything doctrinal to say"]'::jsonb, 'Their endurance under suffering is an encouraging testimony of God''s grace', 'Paul boasts in the churches of God about their perseverance and faith amid persecutions and afflictions (2 Thessalonians 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul boast about the Thessalonians to other churches?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 1, 3, 'What does 2 Thessalonians 1 imply about present suffering and future worthiness?', '["Suffering for God''s kingdom belongs to the path of those being prepared for it","Worthiness is earned by pain itself","Suffering proves exclusion from the kingdom","Only apostles can suffer meaningfully"]'::jsonb, 'Suffering for God''s kingdom belongs to the path of those being prepared for it', 'Paul says they are counted worthy of God''s kingdom, for which they also suffer, linking present affliction and future vindication (2 Thessalonians 1:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 2 Thessalonians 1 imply about present suffering and future worthiness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 1, 4, 'How does 2 Thessalonians 1 hold together grace and judgment?', '["The same Lord who sustains believers by grace will also judge those who reject God and the gospel","Grace cancels judgment altogether","Judgment belongs to the Father but not to Christ","The chapter speaks only of wrath and not of grace"]'::jsonb, 'The same Lord who sustains believers by grace will also judge those who reject God and the gospel', 'Paul opens with grace and peace, praises the church''s growth, then describes Christ''s righteous judgment and the glorification of believers in him (2 Thessalonians 1:2-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 2 Thessalonians 1 hold together grace and judgment?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 1, 4, 'Why is the future rest of believers described together with Christ''s revelation from heaven?', '["Relief for the church is inseparable from the public appearing of Jesus as Lord and judge","Rest comes before Christ appears","The rest is purely inward and not future","Paul means retirement from labor only"]'::jsonb, 'Relief for the church is inseparable from the public appearing of Jesus as Lord and judge', 'Paul ties believers'' rest explicitly to the revelation of the Lord Jesus from heaven with his mighty angels (2 Thessalonians 1:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is the future rest of believers described together with Christ''s revelation from heaven?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 1, 4, 'What does this chapter suggest about the meaning of persecution for the church?', '["Persecution does not negate God''s rule but becomes part of the context for endurance, prayer, and final vindication","Persecution means the church has failed completely","The church should seek retaliation now","Persecution has no theological meaning at all"]'::jsonb, 'Persecution does not negate God''s rule but becomes part of the context for endurance, prayer, and final vindication', 'Paul reads persecution through God''s righteous judgment, future reversal, and present prayer for worthy living (2 Thessalonians 1:4-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does this chapter suggest about the meaning of persecution for the church?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 1, 4, 'How does Paul tie calling, goodness, faith, and power together in 2 Thessalonians 1?', '["God''s call is meant to issue in faith-filled goodness that he himself empowers","Calling replaces the need for works of faith","Power belongs only to judgment, not to believers'' lives","Goodness is unrelated to faith"]'::jsonb, 'God''s call is meant to issue in faith-filled goodness that he himself empowers', 'Paul prays that God would count them worthy of their calling and fulfill every desire of goodness and work of faith with power (2 Thessalonians 1:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Paul tie calling, goodness, faith, and power together in 2 Thessalonians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 1, 4, 'Why does Paul end by mentioning the name of the Lord Jesus being glorified in believers and they in him?', '["The final goal of salvation is shared glory in union with Christ by grace","Believers become independent sources of glory","The church replaces Christ","Paul shifts to abstract theology without connection"]'::jsonb, 'The final goal of salvation is shared glory in union with Christ by grace', 'Paul says the name of the Lord Jesus may be glorified in them, and they in him, according to the grace of God and the Lord Jesus Christ (2 Thessalonians 1:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul end by mentioning the name of the Lord Jesus being glorified in believers and they in him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 1, 4, 'How does 2 Thessalonians 1 portray Jesus in relation to God?', '["Jesus shares in divine judgment, glory, and grace alongside God","Jesus is only a messenger with no judicial role","Paul separates Jesus from God''s saving action","Jesus is mentioned only in the greeting"]'::jsonb, 'Jesus shares in divine judgment, glory, and grace alongside God', 'Jesus is the one revealed from heaven, bringing judgment, glorified in the saints, and named with God in grace and prayer (2 Thessalonians 1:1-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 2 Thessalonians 1 portray Jesus in relation to God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 1, 4, 'What larger pastoral effect comes from Paul boasting in the Thessalonians?', '["Their steadfastness becomes a model that strengthens the wider church under pressure","It isolates them from other believers","It encourages pride without purpose","It means they no longer need exhortation"]'::jsonb, 'Their steadfastness becomes a model that strengthens the wider church under pressure', 'Paul boasts of them in the churches of God, making their perseverance an encouragement beyond Thessalonica itself (2 Thessalonians 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What larger pastoral effect comes from Paul boasting in the Thessalonians?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 1, 5, 'How does 2 Thessalonians 1 present final judgment as morally coherent rather than arbitrary?', '["Judgment is framed as God''s righteous repayment in response to persecution and gospel rejection","Judgment is portrayed as unpredictable force","Paul disconnects judgment from justice","The chapter says nothing about why judgment comes"]'::jsonb, 'Judgment is framed as God''s righteous repayment in response to persecution and gospel rejection', 'Paul explicitly calls it a righteous thing with God to repay affliction to persecutors and to judge those who do not know God or obey the gospel (2 Thessalonians 1:6-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 2 Thessalonians 1 present final judgment as morally coherent rather than arbitrary?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 1, 5, 'Why is Christ''s glorification in the saints such a striking eschatological claim?', '["It shows the church''s final state will publicly display the triumph of Christ''s grace and power","It means believers become divine independently","It limits Christ''s glory to heaven alone","It denies the bodily future of the saints"]'::jsonb, 'It shows the church''s final state will publicly display the triumph of Christ''s grace and power', 'Paul presents the saints as the sphere in which Christ is glorified and marveled at in that day, highlighting the public vindication of his saving work (2 Thessalonians 1:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Christ''s glorification in the saints such a striking eschatological claim?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 1, 5, 'How does this chapter challenge a prosperity view of Christian faithfulness?', '["Faith can grow and love abound in the middle of affliction while awaiting future rest, not present ease","True faith eliminates persecution","Love increases only with material comfort","God''s approval is measured by public success"]'::jsonb, 'Faith can grow and love abound in the middle of affliction while awaiting future rest, not present ease', 'Paul celebrates growing faith and love in the midst of persecutions and afflictions, while locating rest at Christ''s future revelation (2 Thessalonians 1:3-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does this chapter challenge a prosperity view of Christian faithfulness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 1, 5, 'What deeper union-with-Christ theme appears in 2 Thessalonians 1:12?', '["Believers are so joined to Christ by grace that his glory and theirs are inseparably linked","Believers create Christ''s glory by their own efforts","Christ''s glory excludes all participation by believers","Union with Christ is absent from the chapter"]'::jsonb, 'Believers are so joined to Christ by grace that his glory and theirs are inseparably linked', 'Paul prays that Jesus may be glorified in them and they in him, according to grace, implying a profound participatory relation to Christ''s glory (2 Thessalonians 1:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What deeper union-with-Christ theme appears in 2 Thessalonians 1:12?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 1, 5, 'How does 2 Thessalonians 1 hold together divine sovereignty and human response to the gospel?', '["God''s righteous judgment and calling stand alongside real accountability for obeying or rejecting the gospel","Human response is irrelevant because judgment is fixed mechanically","Only divine calling matters and obedience is ignored","The gospel is detached from judgment entirely"]'::jsonb, 'God''s righteous judgment and calling stand alongside real accountability for obeying or rejecting the gospel', 'The chapter speaks both of God''s calling and power in believers and of judgment on those who do not obey the gospel (2 Thessalonians 1:8-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 2 Thessalonians 1 hold together divine sovereignty and human response to the gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 1, 5, 'What is the theological weight of being counted worthy of the kingdom for which believers suffer?', '["Present suffering is interpreted through God''s future kingdom, giving endurance an eschatological horizon","Worthiness is purely earned merit","The kingdom is only a present metaphor","Suffering has no relation to final hope"]'::jsonb, 'Present suffering is interpreted through God''s future kingdom, giving endurance an eschatological horizon', 'Paul places the Thessalonians'' suffering within the framework of being counted worthy of God''s kingdom and awaiting God''s future righteous reversal (2 Thessalonians 1:5-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the theological weight of being counted worthy of the kingdom for which believers suffer?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 1, 5, 'How does 2 Thessalonians 1 present Christian hope as Christ-centered rather than merely circumstance-centered?', '["Relief, vindication, glory, and final worthiness are all tied to the revelation and honor of Jesus","Hope rests mainly on social improvement","Circumstances define the church''s future","The chapter places hope in Paul''s reputation"]'::jsonb, 'Relief, vindication, glory, and final worthiness are all tied to the revelation and honor of Jesus', 'The whole movement of the chapter centers on Jesus'' revelation, judgment, glorification, and grace, making him the focus of Christian hope (2 Thessalonians 1:7-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 2 Thessalonians 1 present Christian hope as Christ-centered rather than merely circumstance-centered?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 2, 1, 'According to 2 Thessalonians 2, concerning what event does Paul ask the believers not to be quickly shaken?', '["The coming of our Lord Jesus Christ and our gathering together to him","The destruction of Jerusalem","Paul''s next visit","The conversion of Rome"]'::jsonb, 'The coming of our Lord Jesus Christ and our gathering together to him', 'Paul speaks concerning the coming of our Lord Jesus Christ and our gathering together to him (2 Thessalonians 2:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Thessalonians 2, concerning what event does Paul ask the believers not to be quickly shaken?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 2, 1, 'According to 2 Thessalonians 2, what did some wrongly say had already come?', '["The day of the Lord","The resurrection of Jesus","Paul''s apostleship","The kingdom of David"]'::jsonb, 'The day of the Lord', 'Paul warns them not to think that the day of the Lord has already come (2 Thessalonians 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Thessalonians 2, what did some wrongly say had already come?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 2, 1, 'According to 2 Thessalonians 2, what must come first before that day?', '["The falling away","The rebuilding of the temple only","Roman peace","Paul''s imprisonment"]'::jsonb, 'The falling away', 'Paul says that day will not come unless the falling away comes first (2 Thessalonians 2:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Thessalonians 2, what must come first before that day?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 2, 1, 'According to 2 Thessalonians 2, what man will be revealed?', '["The man of sin","The prophet Elijah","The high priest","The emperor alone"]'::jsonb, 'The man of sin', 'Paul says the man of sin will be revealed, the son of destruction (2 Thessalonians 2:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Thessalonians 2, what man will be revealed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 2, 1, 'According to 2 Thessalonians 2, where does the lawless one sit?', '["In the temple of God","In Rome''s senate","In the synagogue at Thessalonica","On the Mount of Olives"]'::jsonb, 'In the temple of God', 'Paul says he sits in the temple of God, setting himself up as God (2 Thessalonians 2:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Thessalonians 2, where does the lawless one sit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 2, 1, 'According to 2 Thessalonians 2, by what will the Lord Jesus destroy the lawless one?', '["The breath of his mouth","An army of angels'' swords","A flood","A trumpet blast only"]'::jsonb, 'The breath of his mouth', 'The Lord Jesus will kill him with the breath of his mouth and destroy him by the manifestation of his coming (2 Thessalonians 2:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Thessalonians 2, by what will the Lord Jesus destroy the lawless one?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 2, 1, 'According to 2 Thessalonians 2, what did God choose the believers for from the beginning?', '["Salvation","Earthly rule","Temple priesthood","Freedom from labor"]'::jsonb, 'Salvation', 'God chose them from the beginning for salvation in sanctification of the Spirit and belief of the truth (2 Thessalonians 2:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Thessalonians 2, what did God choose the believers for from the beginning?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 2, 2, 'How does Paul say the Thessalonians should respond to claims that the day of the Lord has already come?', '["Not be quickly shaken or troubled","Withdraw from all fellowship","Accept every prophecy immediately","Ignore Paul''s earlier teaching"]'::jsonb, 'Not be quickly shaken or troubled', 'Paul tells them not to be quickly shaken from their mind or troubled by spirit, word, or letter as if from him (2 Thessalonians 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does Paul say the Thessalonians should respond to claims that the day of the Lord has already come?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 2, 2, 'What kinds of deceptive sources does Paul mention in 2 Thessalonians 2?', '["Spirit, word, or letter as if from us","Dream, famine, or war","Prophet, priest, or king","Temple, law, or sacrifice"]'::jsonb, 'Spirit, word, or letter as if from us', 'Paul warns against being disturbed by spirit, word, or letter as if from him and his companions (2 Thessalonians 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What kinds of deceptive sources does Paul mention in 2 Thessalonians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 2, 2, 'How does Paul describe the man of sin besides that title?', '["The son of destruction","The prince of peace","The faithful witness","The suffering servant"]'::jsonb, 'The son of destruction', 'Paul calls him the son of destruction (2 Thessalonians 2:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does Paul describe the man of sin besides that title?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 2, 2, 'What is already at work according to 2 Thessalonians 2?', '["The mystery of lawlessness","The mystery of the kingdom","The rebuilding of the temple","The resurrection of the dead"]'::jsonb, 'The mystery of lawlessness', 'Paul says the mystery of lawlessness already works (2 Thessalonians 2:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What is already at work according to 2 Thessalonians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 2, 2, 'What will accompany the coming of the lawless one according to 2 Thessalonians 2?', '["All power and signs and lying wonders","Only political speeches","Temple sacrifices","Simple moral teaching"]'::jsonb, 'All power and signs and lying wonders', 'Paul says his coming is according to the working of Satan with all power and signs and lying wonders (2 Thessalonians 2:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What will accompany the coming of the lawless one according to 2 Thessalonians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 2, 2, 'Why do some perish according to 2 Thessalonians 2?', '["They did not receive the love of the truth","They lacked Roman education","They suffered too much","They were not ethnic Jews"]'::jsonb, 'They did not receive the love of the truth', 'They perish because they did not receive the love of the truth that they might be saved (2 Thessalonians 2:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why do some perish according to 2 Thessalonians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 2, 2, 'What does Paul tell the believers to do in 2 Thessalonians 2:15?', '["Stand firm and hold the traditions","Seek new revelations daily","Return to the law of Moses","Wait in silence without discernment"]'::jsonb, 'Stand firm and hold the traditions', 'Paul tells them to stand firm and hold the traditions which they were taught by word or letter (2 Thessalonians 2:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul tell the believers to do in 2 Thessalonians 2:15?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 2, 3, 'Why does Paul emphasize sequence in 2 Thessalonians 2?', '["He wants to stabilize believers against panic by reminding them that certain events must precede the day","He is encouraging date-setting","The order matters only for curiosity","He is replacing faith with charts"]'::jsonb, 'He wants to stabilize believers against panic by reminding them that certain events must precede the day', 'Paul''s purpose is pastoral: he tells them not to be shaken because the day has not come without the falling away and revelation of the lawless one (2 Thessalonians 2:1-3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul emphasize sequence in 2 Thessalonians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 2, 3, 'What does the chapter suggest about deception in the last days?', '["Deception can involve impressive signs while still being opposed to truth and Christ","Signs always prove divine approval","Only letters can deceive, not wonders","Believers are defenseless against deception"]'::jsonb, 'Deception can involve impressive signs while still being opposed to truth and Christ', 'Paul says the lawless one comes with Satanic power, signs, and lying wonders joined to unrighteous deception (2 Thessalonians 2:9-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the chapter suggest about deception in the last days?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 2, 3, 'Why is refusal to love the truth so serious in 2 Thessalonians 2?', '["Because rejection of the truth leaves people vulnerable to delusion and judgment","Because truth is only intellectual detail","Because love is unrelated to salvation","Because deception is harmless"]'::jsonb, 'Because rejection of the truth leaves people vulnerable to delusion and judgment', 'Those who did not receive the love of the truth are said to perish, and God sends them a working of error so they believe the lie (2 Thessalonians 2:10-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is refusal to love the truth so serious in 2 Thessalonians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 2, 3, 'What does Paul mean by saying believers were chosen in sanctification of the Spirit and belief of the truth?', '["God''s saving purpose is worked out through the Spirit''s sanctifying action and faith in the truth","Salvation comes through rituals alone","Truth matters apart from faith","The Spirit''s work makes belief unnecessary"]'::jsonb, 'God''s saving purpose is worked out through the Spirit''s sanctifying action and faith in the truth', 'Paul gives sanctification of the Spirit and belief of the truth as the sphere in which God''s choice unto salvation is realized (2 Thessalonians 2:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Paul mean by saying believers were chosen in sanctification of the Spirit and belief of the truth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 2, 3, 'How does the destruction of the lawless one magnify Christ in 2 Thessalonians 2?', '["Christ overthrows ultimate rebellion effortlessly by his appearing and word","Christ needs human armies to win","The lawless one nearly defeats Christ","The victory belongs mainly to angels"]'::jsonb, 'Christ overthrows ultimate rebellion effortlessly by his appearing and word', 'Paul says the Lord Jesus will kill the lawless one with the breath of his mouth and destroy him by the manifestation of his coming (2 Thessalonians 2:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does the destruction of the lawless one magnify Christ in 2 Thessalonians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 2, 3, 'Why does Paul move from warning about deception to thanksgiving for the believers?', '["He contrasts the destiny of the deceived with God''s preserving grace toward the church","He changes subjects without connection","He wants to minimize the warning","He is unsure whether the warning applies"]'::jsonb, 'He contrasts the destiny of the deceived with God''s preserving grace toward the church', 'After warning about delusion and judgment, Paul gives thanks that God chose the Thessalonians for salvation and called them through the gospel (2 Thessalonians 2:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul move from warning about deception to thanksgiving for the believers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 2, 3, 'What role do apostolic traditions play in 2 Thessalonians 2?', '["They serve as a stabilizing standard against false teaching and panic","They are optional customs only","They replace the gospel entirely","They are private secrets for leaders alone"]'::jsonb, 'They serve as a stabilizing standard against false teaching and panic', 'Paul tells them to stand firm and hold the traditions they were taught by word or letter, grounding them against error (2 Thessalonians 2:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What role do apostolic traditions play in 2 Thessalonians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 2, 4, 'How does 2 Thessalonians 2 balance divine sovereignty and human responsibility in deception and salvation?', '["The chapter speaks of God''s choosing and judgment while still holding people responsible for loving or rejecting the truth","Only sovereignty matters and response is irrelevant","Only human choice matters and God is absent","The two themes are kept separate without contact"]'::jsonb, 'The chapter speaks of God''s choosing and judgment while still holding people responsible for loving or rejecting the truth', 'Paul speaks both of people not receiving the love of the truth and of God choosing believers for salvation and sending judgment on those who delight in unrighteousness (2 Thessalonians 2:10-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 2 Thessalonians 2 balance divine sovereignty and human responsibility in deception and salvation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 2, 4, 'Why is the lawless one described as exalting himself above every so-called god?', '["The chapter presents evil in its climactic form as counterfeit worship and self-deification","Paul is discussing pagan mythology only","He means political pride without spiritual significance","The point is simply temple architecture"]'::jsonb, 'The chapter presents evil in its climactic form as counterfeit worship and self-deification', 'The man of sin opposes and exalts himself against every object of worship, even taking his seat in the temple of God as if he were God (2 Thessalonians 2:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is the lawless one described as exalting himself above every so-called god?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 2, 4, 'How does this chapter define the church''s response to apocalyptic confusion?', '["Calm steadiness, remembered apostolic teaching, and confidence in God''s call","Speculative fear and endless calculation","Withdrawal from all instruction","Reliance on every new spiritual claim"]'::jsonb, 'Calm steadiness, remembered apostolic teaching, and confidence in God''s call', 'Paul tells them not to be shaken, reminds them what he taught before, gives thanks for God''s saving purpose, and commands them to stand firm (2 Thessalonians 2:1-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does this chapter define the church''s response to apocalyptic confusion?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 2, 4, 'What is the significance of the restraining language in 2 Thessalonians 2?', '["Lawlessness is already active, yet its full unveiling is held back until God''s appointed time","Evil is completely absent until the end","Paul denies any present spiritual conflict","The restrainer is explained fully and explicitly"]'::jsonb, 'Lawlessness is already active, yet its full unveiling is held back until God''s appointed time', 'Paul says the mystery of lawlessness already works, but a present restraint remains until the proper revealing of the lawless one (2 Thessalonians 2:6-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'What is the significance of the restraining language in 2 Thessalonians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 2, 4, 'Why does Paul pair eternal comfort and good hope with establishment in every good work and word?', '["True comfort from God produces stable obedience and speech rather than passivity","Comfort means escape from responsibility","Hope matters only for inner feelings","Good works replace God''s grace"]'::jsonb, 'True comfort from God produces stable obedience and speech rather than passivity', 'Paul prays that the Lord Jesus Christ and God the Father comfort their hearts and establish them in every good work and word (2 Thessalonians 2:16-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul pair eternal comfort and good hope with establishment in every good work and word?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 2, 4, 'How does 2 Thessalonians 2 connect truth, salvation, and steadfastness?', '["Salvation comes through belief of the truth, and steadfastness means holding fast to that truth against deception","Truth is secondary to spiritual experience","Steadfastness requires leaving behind apostolic teaching","Salvation and truth are unrelated in the chapter"]'::jsonb, 'Salvation comes through belief of the truth, and steadfastness means holding fast to that truth against deception', 'Paul links salvation with belief of the truth and then commands the church to stand firm and hold the traditions taught by the apostles (2 Thessalonians 2:13-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 2 Thessalonians 2 connect truth, salvation, and steadfastness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 2, 4, 'What does the chapter suggest about counterfeit religion?', '["It may mimic spiritual power and demand worship while remaining fundamentally satanic and false","Counterfeit religion is always obviously weak","Falsehood never uses religious language","Only politics, not worship, can be corrupted"]'::jsonb, 'It may mimic spiritual power and demand worship while remaining fundamentally satanic and false', 'The lawless one is associated with Satanic signs, lying wonders, deception, and self-exaltation in God''s temple, presenting a counterfeit of divine authority (2 Thessalonians 2:4, 9-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does the chapter suggest about counterfeit religion?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 2, 5, 'How does 2 Thessalonians 2 portray the deepest issue in the end-time rebellion?', '["It is fundamentally a revolt against truth and God''s rightful worship, culminating in counterfeit exaltation","It is mainly a political tax dispute","It concerns only chronology and not worship","It is simply a misunderstanding among believers"]'::jsonb, 'It is fundamentally a revolt against truth and God''s rightful worship, culminating in counterfeit exaltation', 'The chapter joins refusal to love the truth with the self-exalting lawless one who sets himself up as divine, making truth and worship central issues (2 Thessalonians 2:4, 10-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 2 Thessalonians 2 portray the deepest issue in the end-time rebellion?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 2, 5, 'Why is Christ''s effortless destruction of the lawless one theologically significant?', '["It reveals the supremacy of Jesus over climactic evil and exposes the fragility of counterfeit power","It suggests evil was never serious","It means believers need no endurance now","It gives the lawless one equal status with Christ"]'::jsonb, 'It reveals the supremacy of Jesus over climactic evil and exposes the fragility of counterfeit power', 'The lawless one arrives with dramatic satanic power, yet Christ destroys him by the breath of his mouth and the manifestation of his coming (2 Thessalonians 2:8-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Christ''s effortless destruction of the lawless one theologically significant?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 2, 5, 'How does 2 Thessalonians 2 challenge an unhealthy fascination with sensational prophecy?', '["Its aim is to steady believers in truth and obedience, not to feed speculative agitation","Paul encourages endless calculations","He says confusion is spiritually useful","The chapter prizes novelty over apostolic teaching"]'::jsonb, 'Its aim is to steady believers in truth and obedience, not to feed speculative agitation', 'Paul writes so the church will not be shaken or troubled and concludes with calls to stand firm and be established in good work and word (2 Thessalonians 2:2, 15-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 2 Thessalonians 2 challenge an unhealthy fascination with sensational prophecy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 2, 5, 'What does this chapter suggest about truth as something more than data?', '["Truth must be loved, believed, and held fast because it is bound up with salvation and fidelity to God","Truth is merely conceptual accuracy","Truth matters only to teachers","Love and truth are opposites in Paul''s thought"]'::jsonb, 'Truth must be loved, believed, and held fast because it is bound up with salvation and fidelity to God', 'Paul speaks of the love of the truth, belief of the truth, and standing firm in what has been taught, making truth relational and salvific as well as doctrinal (2 Thessalonians 2:10, 13, 15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does this chapter suggest about truth as something more than data?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 2, 5, 'How does 2 Thessalonians 2 integrate pneumatology and ecclesiology?', '["The Spirit''s sanctifying work marks out the church as God''s saved people amid widespread deception","The Spirit is mentioned only to explain signs","The church is preserved without the Spirit","The Spirit''s work removes the need for truth"]'::jsonb, 'The Spirit''s sanctifying work marks out the church as God''s saved people amid widespread deception', 'Paul contrasts the deceived with believers chosen for salvation in sanctification of the Spirit and belief of the truth, defining the church''s identity amid lawlessness (2 Thessalonians 2:10-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 2 Thessalonians 2 integrate pneumatology and ecclesiology?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 2, 5, 'Why is the command to hold apostolic traditions crucial in this chapter''s argument?', '["Because continuity with the apostolic gospel is the antidote to destabilizing false claims about the end","Tradition here means human inventions added to the gospel","Paul wants to suppress all teaching outside Thessalonica","The command is unrelated to the warning section"]'::jsonb, 'Because continuity with the apostolic gospel is the antidote to destabilizing false claims about the end', 'After warning about deceptive messages and describing the lawless one, Paul tells believers to stand firm and hold what they were taught by apostolic word or letter (2 Thessalonians 2:2, 15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the command to hold apostolic traditions crucial in this chapter''s argument?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 2, 5, 'How does 2 Thessalonians 2 show that Christian hope is not naive optimism?', '["It fully acknowledges rebellion, deception, and judgment while grounding comfort in God''s electing love and Christ''s victory","Hope means denying evil''s presence","Comfort comes by ignoring doctrine","The chapter offers fear without hope"]'::jsonb, 'It fully acknowledges rebellion, deception, and judgment while grounding comfort in God''s electing love and Christ''s victory', 'The chapter faces the reality of apostasy and lawlessness yet turns to thanksgiving for God''s saving choice and prayer for eternal comfort and good hope through grace (2 Thessalonians 2:3-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 2 Thessalonians 2 show that Christian hope is not naive optimism?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 3, 1, 'According to 2 Thessalonians 3, for what does Paul ask the believers to pray?', '["That the Lord''s word may run swiftly and be glorified","That Rome would fall immediately","That Paul would never suffer again","That the temple would be rebuilt"]'::jsonb, 'That the Lord''s word may run swiftly and be glorified', 'Paul asks prayer that the Lord''s word may run swiftly and be glorified (2 Thessalonians 3:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Thessalonians 3, for what does Paul ask the believers to pray?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 3, 1, 'According to 2 Thessalonians 3, from whom does Paul ask to be delivered?', '["Unreasonable and evil men","All Gentiles","The weak believers","The Roman guards only"]'::jsonb, 'Unreasonable and evil men', 'Paul asks to be delivered from unreasonable and evil men (2 Thessalonians 3:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Thessalonians 3, from whom does Paul ask to be delivered?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 3, 1, 'According to 2 Thessalonians 3, what is the Lord faithful to do?', '["Establish and guard believers from the evil one","Make all persecution end immediately","Give all believers wealth","Reveal every mystery at once"]'::jsonb, 'Establish and guard believers from the evil one', 'Paul says the Lord is faithful, who will establish them and guard them from the evil one (2 Thessalonians 3:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Thessalonians 3, what is the Lord faithful to do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 3, 1, 'According to 2 Thessalonians 3, into what does Paul pray the Lord will direct their hearts?', '["The love of God and the patience of Christ","The riches of Rome and peace","Temple worship and sacrifice","Signs and wonders"]'::jsonb, 'The love of God and the patience of Christ', 'Paul prays that the Lord direct their hearts into the love of God and the patience of Christ (2 Thessalonians 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Thessalonians 3, into what does Paul pray the Lord will direct their hearts?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 3, 1, 'According to 2 Thessalonians 3, from whom should believers withdraw?', '["Every brother who walks disorderly","Every poor person","Every visiting teacher","Every unbeliever in the city"]'::jsonb, 'Every brother who walks disorderly', 'Paul commands withdrawal from every brother who walks disorderly and not after the tradition received from the apostles (2 Thessalonians 3:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Thessalonians 3, from whom should believers withdraw?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 3, 1, 'According to 2 Thessalonians 3, what rule does Paul give about work?', '["If anyone will not work, neither let him eat","Everyone must stop working","Only leaders should work","Work is unnecessary if Christ is coming"]'::jsonb, 'If anyone will not work, neither let him eat', 'Paul says, if anyone will not work, neither let him eat (2 Thessalonians 3:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Thessalonians 3, what rule does Paul give about work?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 3, 1, 'According to 2 Thessalonians 3, how should believers do what is good?', '["Without becoming weary","Only when praised","In secrecy","Only on feast days"]'::jsonb, 'Without becoming weary', 'Paul tells them not to be weary in doing well (2 Thessalonians 3:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to 2 Thessalonians 3, how should believers do what is good?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 3, 2, 'Why does Paul ask for prayer in 2 Thessalonians 3?', '["Mission advances through God''s power and the church''s intercession","He no longer believes God is faithful","Prayer is needed only for travel plans","He wants honor from other churches"]'::jsonb, 'Mission advances through God''s power and the church''s intercession', 'Paul asks for prayer both for the spread of the word and for deliverance from evil men (2 Thessalonians 3:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why does Paul ask for prayer in 2 Thessalonians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 3, 2, 'What example did Paul set among the Thessalonians according to 2 Thessalonians 3?', '["He did not eat anyone''s bread for nothing but worked night and day","He lived off them without concern","He withdrew from work entirely","He sought honor as a ruler"]'::jsonb, 'He did not eat anyone''s bread for nothing but worked night and day', 'Paul says they worked night and day so as not to burden any of them (2 Thessalonians 3:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What example did Paul set among the Thessalonians according to 2 Thessalonians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 3, 2, 'Why did Paul labor rather than claim support in 2 Thessalonians 3?', '["To give them an example to imitate","Because support is always wrong","Because no church helped him ever","To earn Roman favor"]'::jsonb, 'To give them an example to imitate', 'Paul says he did this not because he lacked the right, but to make himself an example to them (2 Thessalonians 3:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why did Paul labor rather than claim support in 2 Thessalonians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 3, 2, 'What problem does Paul report among some in 2 Thessalonians 3?', '["They walk disorderly, doing no work but being busybodies","They deny the resurrection","They demand circumcision","They reject prayer"]'::jsonb, 'They walk disorderly, doing no work but being busybodies', 'Paul says some walk disorderly, working not at all, but being busybodies (2 Thessalonians 3:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What problem does Paul report among some in 2 Thessalonians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 3, 2, 'What does Paul command the disorderly to do in 2 Thessalonians 3?', '["Work quietly and eat their own bread","Leave the church immediately","Stop listening to the apostles","Wait passively for the Lord''s return"]'::jsonb, 'Work quietly and eat their own bread', 'Paul commands such persons to work with quietness and eat their own bread (2 Thessalonians 3:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul command the disorderly to do in 2 Thessalonians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 3, 2, 'How should the church treat someone who does not obey the letter according to 2 Thessalonians 3?', '["Note that person and avoid close company so he may be ashamed","Treat him as an enemy","Ignore the issue completely","Expel him without any warning"]'::jsonb, 'Note that person and avoid close company so he may be ashamed', 'Paul says to note that person and have no company with him, to the end that he may be ashamed (2 Thessalonians 3:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'How should the church treat someone who does not obey the letter according to 2 Thessalonians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 3, 2, 'How does Paul say such a person should still be regarded?', '["As a brother to be admonished","As a permanent enemy","As outside all hope","As a ruler over the church"]'::jsonb, 'As a brother to be admonished', 'Paul says not to count him as an enemy, but admonish him as a brother (2 Thessalonians 3:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does Paul say such a person should still be regarded?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 3, 3, 'Why does Paul connect the spread of the word with prayer and deliverance in 2 Thessalonians 3?', '["Gospel mission advances in a hostile world and therefore requires both divine help and church intercession","Prayer is needed only because the gospel is weak","Deliverance matters more than proclamation","The word spreads automatically without opposition"]'::jsonb, 'Gospel mission advances in a hostile world and therefore requires both divine help and church intercession', 'Paul asks prayer for the word to run swiftly and for deliverance from unreasonable and evil men, showing mission and opposition together (2 Thessalonians 3:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul connect the spread of the word with prayer and deliverance in 2 Thessalonians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 3, 3, 'What does 2 Thessalonians 3 imply about waiting for Christ?', '["Waiting for Christ must not become an excuse for idleness or disorder","Waiting means withdrawing from daily labor","The return of Christ makes work unnecessary","Only leaders should continue ordinary duties"]'::jsonb, 'Waiting for Christ must not become an excuse for idleness or disorder', 'Paul addresses disorderly idleness directly, commanding believers to work quietly and eat their own bread (2 Thessalonians 3:6-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does 2 Thessalonians 3 imply about waiting for Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 3, 3, 'Why does Paul emphasize his own example of labor?', '["He wants moral authority for correcting idleness and to model disciplined Christian life","He is denying ministers may ever receive support","He regrets preaching the gospel","He values labor more than the word"]'::jsonb, 'He wants moral authority for correcting idleness and to model disciplined Christian life', 'Paul says he labored not because he lacked the right to support, but to make himself an example for them to imitate (2 Thessalonians 3:7-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul emphasize his own example of labor?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 3, 3, 'How does the chapter balance discipline and brotherhood?', '["The disorderly are to be corrected and distanced from, yet still treated as brothers rather than enemies","Discipline requires hatred","Brotherhood removes the need for correction","Only leaders are subject to admonition"]'::jsonb, 'The disorderly are to be corrected and distanced from, yet still treated as brothers rather than enemies', 'Paul says to note and avoid the disobedient for shame''s sake, yet not count them as enemies but admonish them as brothers (2 Thessalonians 3:14-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does the chapter balance discipline and brotherhood?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 3, 3, 'What does ''the Lord is faithful'' contribute to Paul''s exhortation?', '["Obedience rests within the assurance of Christ''s preserving faithfulness","Faithfulness makes commands unnecessary","The Lord''s faithfulness applies only to Paul","It means believers cannot face temptation"]'::jsonb, 'Obedience rests within the assurance of Christ''s preserving faithfulness', 'Paul moves from prayer and command to confidence that the Lord will establish and guard them, grounding obedience in divine faithfulness (2 Thessalonians 3:3-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does ''the Lord is faithful'' contribute to Paul''s exhortation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 3, 3, 'Why does Paul mention busybodies rather than merely saying some are lazy?', '["Disorderly idleness harms the community by replacing useful labor with meddling","He is concerned only about economics","Busybodies are praised for concern","The issue is private and has no communal effect"]'::jsonb, 'Disorderly idleness harms the community by replacing useful labor with meddling', 'Paul describes some as not working at all but being busybodies, showing that idleness disturbs communal life rather than remaining neutral (2 Thessalonians 3:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul mention busybodies rather than merely saying some are lazy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 3, 3, 'What does Paul mean by asking the Lord to direct hearts into the love of God and patience of Christ?', '["He wants the church inwardly shaped by divine love and Christlike endurance","He is asking for mere emotional comfort","He is replacing doctrine with feeling","He means only patience for suffering rulers"]'::jsonb, 'He wants the church inwardly shaped by divine love and Christlike endurance', 'Paul prays for the Lord to direct their hearts into God''s love and Christ''s steadfast endurance, describing a deeply formed inner life (2 Thessalonians 3:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Paul mean by asking the Lord to direct hearts into the love of God and patience of Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 3, 4, 'How does 2 Thessalonians 3 connect mission, discipline, and daily work?', '["A church praying for the word''s spread must also live orderly lives that reflect the gospel in practice","Mission makes local discipline irrelevant","Daily work is separate from apostolic mission","Only preaching, not conduct, matters in the chapter"]'::jsonb, 'A church praying for the word''s spread must also live orderly lives that reflect the gospel in practice', 'Paul begins with prayer for the spread of the word and then addresses disorderly conduct and work, showing that gospel advance and church order belong together (2 Thessalonians 3:1-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 2 Thessalonians 3 connect mission, discipline, and daily work?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 3, 4, 'Why is idleness treated as a serious theological issue rather than merely a practical inconvenience?', '["Because it contradicts apostolic tradition, damages the community, and distorts faithful waiting for Christ","Because labor earns salvation","Because the poor are unwelcome in church","Because Rome required employment records"]'::jsonb, 'Because it contradicts apostolic tradition, damages the community, and distorts faithful waiting for Christ', 'Paul grounds his correction in apostolic tradition, his own example, and the disorder caused by busybody behavior (2 Thessalonians 3:6-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is idleness treated as a serious theological issue rather than merely a practical inconvenience?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 3, 4, 'How does this chapter portray Christian correction as restorative?', '["Its goal is shame leading to repentance while preserving brotherly regard","Correction exists only to exclude permanently","Restoration is not considered","Paul advocates public humiliation without relationship"]'::jsonb, 'Its goal is shame leading to repentance while preserving brotherly regard', 'Paul says to note and distance from the disobedient so he may be ashamed, but still admonish him as a brother, showing a restorative purpose (2 Thessalonians 3:14-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does this chapter portray Christian correction as restorative?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 3, 4, 'What does Paul''s personal signature at the end contribute to the letter?', '["It authenticates the letter against confusion from false claims of apostolic letters","It is only decorative convention","It replaces the need for previous teaching","It means others never wrote for Paul"]'::jsonb, 'It authenticates the letter against confusion from false claims of apostolic letters', 'Given earlier concern about a letter as if from Paul, the closing signature marks authenticity and serves as a sign in every letter (2 Thessalonians 2:2; 3:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does Paul''s personal signature at the end contribute to the letter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 3, 4, 'How does 2 Thessalonians 3 balance divine agency and human imitation?', '["Believers rely on the faithful Lord while also imitating apostolic patterns of discipline and labor","Only imitation matters and the Lord''s help is secondary","Only divine action matters and example is unnecessary","The chapter never joins God''s work with human practice"]'::jsonb, 'Believers rely on the faithful Lord while also imitating apostolic patterns of discipline and labor', 'Paul speaks of the Lord''s faithful protection and also calls the church to imitate apostolic conduct in work and order (2 Thessalonians 3:3-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does 2 Thessalonians 3 balance divine agency and human imitation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 3, 4, 'Why does Paul tell believers not to grow weary in doing good right after addressing the disorderly?', '["Correcting abuse should not cause the faithful to stop ordinary persevering goodness","He fears all work will end","Doing good is only for leaders","The command applies only to almsgiving"]'::jsonb, 'Correcting abuse should not cause the faithful to stop ordinary persevering goodness', 'After commanding discipline and labor, Paul exhorts the faithful not to become weary in doing good, preserving a healthy direction for the whole church (2 Thessalonians 3:12-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul tell believers not to grow weary in doing good right after addressing the disorderly?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 3, 4, 'What does the request for prayer reveal about Paul''s view of apostolic ministry?', '["Even apostolic mission depends on the prayers of ordinary churches and God''s active protection","Apostles operate independently of the church","Prayer is mainly symbolic support","Paul asks only for personal comfort"]'::jsonb, 'Even apostolic mission depends on the prayers of ordinary churches and God''s active protection', 'Paul asks the Thessalonians to pray for the swift advance of the word and for deliverance, showing mutual dependence between apostle and church (2 Thessalonians 3:1-2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does the request for prayer reveal about Paul''s view of apostolic ministry?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 3, 5, 'How does 2 Thessalonians 3 challenge passive end-times spirituality?', '["The chapter insists that waiting for Christ must produce prayerful mission, disciplined work, and communal responsibility","Expectation of Christ means ordinary labor is beneath believers","Only leaders must remain active while others wait","The end makes church order obsolete"]'::jsonb, 'The chapter insists that waiting for Christ must produce prayerful mission, disciplined work, and communal responsibility', 'Paul joins prayer for gospel advance, confidence in the Lord, commands about work, and corrective discipline, rejecting any lazy misuse of eschatological hope (2 Thessalonians 3:1-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 2 Thessalonians 3 challenge passive end-times spirituality?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 3, 5, 'What deeper ecclesial vision appears in Paul''s handling of disorderly believers?', '["The church guards its life through disciplined love that aims at restoration rather than destruction","The church maintains purity only by expulsion without warning","Brotherhood ends as soon as correction begins","Community life is unaffected by personal idleness"]'::jsonb, 'The church guards its life through disciplined love that aims at restoration rather than destruction', 'Paul commands social distance for the sake of shame and repentance, yet insists the offender still be admonished as a brother, showing restorative discipline (2 Thessalonians 3:14-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What deeper ecclesial vision appears in Paul''s handling of disorderly believers?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 3, 5, 'Why is the maxim ''if anyone will not work, neither let him eat'' more than a simple proverb here?', '["It functions as apostolic correction against a concrete distortion of Christian life within the church","It is a universal ban on helping the needy","It contradicts Paul''s theology of grace","It is aimed at persecutors outside the church"]'::jsonb, 'It functions as apostolic correction against a concrete distortion of Christian life within the church', 'Paul applies the saying to disorderly believers who refuse ordinary labor and become busybodies, not to undermine generosity but to correct willful idleness (2 Thessalonians 3:10-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the maxim ''if anyone will not work, neither let him eat'' more than a simple proverb here?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 3, 5, 'How does 2 Thessalonians 3 present the church as a community shaped by both grace and order?', '["The Lord gives peace and grace, while the church is called to prayer, obedience, labor, and discipline","Grace abolishes all structure","Order can exist apart from grace","The chapter chooses order over peace"]'::jsonb, 'The Lord gives peace and grace, while the church is called to prayer, obedience, labor, and discipline', 'Paul asks for the Lord''s peace and grace even as he gives commands about work, tradition, and correction, showing grace and order together (2 Thessalonians 3:1-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 2 Thessalonians 3 present the church as a community shaped by both grace and order?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 3, 5, 'What does the chapter imply about faithful leadership in the face of disorder?', '["Leaders must combine example, command, prayer, and brotherly admonition rather than either harshness or neglect","Leadership should avoid practical issues like work","Prayer replaces the need for direct correction","Example alone is sufficient without words"]'::jsonb, 'Leaders must combine example, command, prayer, and brotherly admonition rather than either harshness or neglect', 'Paul offers his own example, gives direct commands, asks for prayer, and insists on admonishing the disorderly as brothers, presenting a full pastoral pattern (2 Thessalonians 3:1-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does the chapter imply about faithful leadership in the face of disorder?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 3, 5, 'Why is the prayer for hearts directed into the love of God and patience of Christ strategically placed?', '["It shows the church''s practical obedience must flow from inward formation by God''s love and Christ''s endurance","It interrupts the chapter without purpose","It replaces all later commands","It applies only to Paul and his companions"]'::jsonb, 'It shows the church''s practical obedience must flow from inward formation by God''s love and Christ''s endurance', 'The prayer stands before commands about disorder and work, indicating that outward order should arise from hearts shaped by divine love and Christlike steadfastness (2 Thessalonians 3:5-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the prayer for hearts directed into the love of God and patience of Christ strategically placed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 53, 3, 5, 'How does 2 Thessalonians 3 bring the whole letter to a fitting close?', '["It returns from end-times concerns to a life of prayer, disciplined faithfulness, authentic apostolic teaching, and Christ''s peace","It abandons the letter''s earlier themes completely","It focuses only on travel details","It ends with unresolved panic about the day of the Lord"]'::jsonb, 'It returns from end-times concerns to a life of prayer, disciplined faithfulness, authentic apostolic teaching, and Christ''s peace', 'The close combines prayer, confidence in the Lord, correction of disorder, authenticated apostolic instruction, and a benediction of peace, gathering the letter''s main concerns into one ending (2 Thessalonians 3:1-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 53
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does 2 Thessalonians 3 bring the whole letter to a fitting close?'
);
