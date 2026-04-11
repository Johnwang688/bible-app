-- ============================================================================
-- LOGOS LIGHT — Galatians (book 48) quiz questions from quiz-questions/galatians.json
-- ============================================================================
-- Idempotent: skips rows that already match (book_number, chapter, difficulty_stage, prompt).
-- ============================================================================

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 1, 1, 'According to Galatians 1, who raised Jesus Christ from the dead?', '["God the Father","The apostles","The Holy Spirit alone","The law of Moses"]'::jsonb, 'God the Father', 'Paul says Jesus Christ was raised from the dead by God the Father (Galatians 1:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 1, who raised Jesus Christ from the dead?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 1, 1, 'According to Galatians 1, from what did Christ give himself to deliver us?', '["This present evil age","Roman rule","Physical sickness","The sea"]'::jsonb, 'This present evil age', 'Christ gave himself for our sins to deliver us out of this present evil age (Galatians 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 1, from what did Christ give himself to deliver us?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 1, 1, 'According to Galatians 1, what were some people doing to the gospel?', '["Perverting it","Memorizing it","Translating it","Singing it"]'::jsonb, 'Perverting it', 'Paul says some were troubling them and wanted to pervert the gospel of Christ (Galatians 1:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 1, what were some people doing to the gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 1, 1, 'According to Galatians 1, what had Paul formerly tried to destroy?', '["The assembly of God","The temple","The Roman empire","The synagogue in Jerusalem"]'::jsonb, 'The assembly of God', 'Paul says he persecuted the assembly of God violently and tried to destroy it (Galatians 1:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 1, what had Paul formerly tried to destroy?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 1, 1, 'According to Galatians 1, where did Paul go after his calling instead of going up immediately to Jerusalem?', '["Arabia","Rome","Alexandria","Philippi"]'::jsonb, 'Arabia', 'Paul says he went away into Arabia and then returned to Damascus (Galatians 1:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 1, where did Paul go after his calling instead of going up immediately to Jerusalem?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 1, 2, 'How does Paul describe the source of his apostleship in Galatians 1?', '["Not from men nor through man, but through Jesus Christ and God the Father","By appointment from the Jerusalem elders","By inheritance from his family","By training under the twelve"]'::jsonb, 'Not from men nor through man, but through Jesus Christ and God the Father', 'Paul opens by saying his apostleship is not from men nor through man, but through Jesus Christ and God the Father (Galatians 1:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does Paul describe the source of his apostleship in Galatians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 1, 2, 'Why was Paul astonished at the Galatians in Galatians 1?', '["They were so quickly deserting the one who called them in Christ\u0027s grace","They refused to receive the letter","They had forgotten his name","They would not collect an offering"]'::jsonb, 'They were so quickly deserting the one who called them in Christ''s grace', 'Paul is astonished that they are quickly deserting him who called them in the grace of Christ for a different gospel (Galatians 1:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why was Paul astonished at the Galatians in Galatians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 1, 2, 'What curse does Paul pronounce in Galatians 1 on anyone preaching a different gospel?', '["Let him be accursed","Let him be silenced for a season","Let him leave the city","Let him be ignored"]'::jsonb, 'Let him be accursed', 'Paul says if anyone preaches a gospel contrary to what they received, let him be accursed (Galatians 1:8-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What curse does Paul pronounce in Galatians 1 on anyone preaching a different gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 1, 2, 'In Galatians 1, what was Paul advancing in before his conversion?', '["Judaism","Greek philosophy","Roman law","Trade among the Gentiles"]'::jsonb, 'Judaism', 'Paul says he advanced in Judaism beyond many of his own age among his people (Galatians 1:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'In Galatians 1, what was Paul advancing in before his conversion?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 1, 2, 'Whom did Paul say he visited when he finally went to Jerusalem after three years?', '["Cephas","Barnabas","Timothy","Stephen"]'::jsonb, 'Cephas', 'After three years Paul went up to Jerusalem to visit Cephas and stayed with him fifteen days (Galatians 1:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'Whom did Paul say he visited when he finally went to Jerusalem after three years?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 1, 3, 'What does Galatians 1 emphasize about the origin of Paul''s gospel?', '["It came through a revelation of Jesus Christ","It came from the traditions of the fathers","It came from debate in Jerusalem","It came from Greek teachers"]'::jsonb, 'It came through a revelation of Jesus Christ', 'Paul says the gospel he preached is not according to man, for he received it through revelation of Jesus Christ (Galatians 1:11-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Galatians 1 emphasize about the origin of Paul''s gospel?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 1, 3, 'Why does Paul mention his former zeal for the traditions of his fathers in Galatians 1?', '["To show that his transformation came from God\u0027s intervention, not gradual self-improvement","To prove he still kept every tradition unchanged","To argue that traditions save sinners","To explain why he avoided all Jews afterward"]'::jsonb, 'To show that his transformation came from God''s intervention, not gradual self-improvement', 'Paul contrasts his former life in Judaism with God''s act of setting him apart and revealing his Son in him (Galatians 1:13-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul mention his former zeal for the traditions of his fathers in Galatians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 1, 3, 'What is Paul arguing by stressing that he did not immediately consult with flesh and blood?', '["His commission and message were independent of human authorization","He rejected all fellowship with believers","He could not travel safely to Jerusalem","He no longer cared about teaching"]'::jsonb, 'His commission and message were independent of human authorization', 'Paul says he did not immediately confer with flesh and blood or go up to Jerusalem, underscoring the divine source of his gospel (Galatians 1:16-17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is Paul arguing by stressing that he did not immediately consult with flesh and blood?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 1, 3, 'How were the assemblies of Judea responding to the report about Paul in Galatians 1?', '["They glorified God because the former persecutor now preached the faith","They doubted that he had really changed","They sent him back to Damascus","They asked him to stop preaching"]'::jsonb, 'They glorified God because the former persecutor now preached the faith', 'They heard that the one who once persecuted them now preached the faith he once tried to destroy, and they glorified God in Paul (Galatians 1:23-24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'How were the assemblies of Judea responding to the report about Paul in Galatians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 1, 3, 'What does Paul''s double warning about a different gospel show about his view of the message of Christ?', '["It is fixed and not open to alteration, even by impressive messengers","It changes from city to city","It is mainly a matter of personal taste","It depends on angelic dreams"]'::jsonb, 'It is fixed and not open to alteration, even by impressive messengers', 'Paul says even if he or an angel from heaven preached another gospel, that messenger should be accursed (Galatians 1:8-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Paul''s double warning about a different gospel show about his view of the message of Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 1, 4, 'How does Galatians 1 connect grace and apostolic authority?', '["Paul defends his authority precisely to protect the gospel of grace from corruption","Paul sets authority against grace","Grace makes authority unnecessary","Authority depends on circumcision"]'::jsonb, 'Paul defends his authority precisely to protect the gospel of grace from corruption', 'Paul opens with grace and peace, then immediately defends the divine source of his apostleship and condemns distortion of the gospel of grace (Galatians 1:1-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Galatians 1 connect grace and apostolic authority?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 1, 4, 'Why does Paul include the possibility of an angel preaching another gospel in Galatians 1?', '["To show that no apparent authority outranks the revealed gospel","To suggest angels often teach the churches directly","To compare himself unfavorably to angels","To explain how he learned from heaven after conversion"]'::jsonb, 'To show that no apparent authority outranks the revealed gospel', 'By including even an angel from heaven, Paul shows the gospel already received is the standard by which every claimant must be judged (Galatians 1:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul include the possibility of an angel preaching another gospel in Galatians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 1, 4, 'What is the force of Paul''s statement, ''If I were still pleasing men, I wouldn''t be a servant of Christ''?', '["The true gospel can require confrontation rather than popularity","Christ\u0027s servants must avoid all human contact","Pleasing people is always sinful","Paul wanted to rule the churches harshly"]'::jsonb, 'The true gospel can require confrontation rather than popularity', 'Paul''s sharp warning proves he is not shaping the message to win human approval but serving Christ faithfully (Galatians 1:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'What is the force of Paul''s statement, ''If I were still pleasing men, I wouldn''t be a servant of Christ''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 1, 4, 'How does Paul''s autobiography in Galatians 1 function in the argument of the letter?', '["It serves as evidence that the gospel he preaches came from God\u0027s revelation rather than human tradition","It replaces all doctrinal teaching with personal stories","It proves Jerusalem was wrong about Christ","It minimizes the importance of the churches"]'::jsonb, 'It serves as evidence that the gospel he preaches came from God''s revelation rather than human tradition', 'Paul''s account of persecution, calling, and limited contact with Jerusalem supports his claim that his gospel is not from man (Galatians 1:11-24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Paul''s autobiography in Galatians 1 function in the argument of the letter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 1, 4, 'Why is James identified as ''the Lord''s brother'' in Galatians 1:19 significant to Paul''s narrative?', '["It clarifies that Paul\u0027s Jerusalem contact was minimal yet important enough to be named specifically","It means James had replaced Cephas as apostle to the Gentiles","It proves family ties guarantee authority","It shows Paul only trusted Jesus\u0027 relatives"]'::jsonb, 'It clarifies that Paul''s Jerusalem contact was minimal yet important enough to be named specifically', 'Paul stresses that he saw only Cephas and James, reinforcing how little his gospel depended on extensive Jerusalem tutoring (Galatians 1:18-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is James identified as ''the Lord''s brother'' in Galatians 1:19 significant to Paul''s narrative?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 1, 5, 'How does Galatians 1 echo prophetic call narratives from the Old Testament?', '["Paul says God set him apart from his mother\u0027s womb and called him by grace","Paul hears a still small voice on Mount Horeb","Paul receives tablets of stone in Arabia","Paul is crowned king over Israel"]'::jsonb, 'Paul says God set him apart from his mother''s womb and called him by grace', 'Paul''s language about being set apart from his mother''s womb echoes prophetic calling motifs such as Jeremiah''s calling, while emphasizing grace in Christ (Galatians 1:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Galatians 1 echo prophetic call narratives from the Old Testament?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 1, 5, 'What is the theological significance of saying Christ ''gave himself for our sins'' in the opening of Galatians?', '["The letter begins by grounding rescue in Christ\u0027s self-giving before any debate about law or works","It means Christ only set an ethical example","It limits salvation to Paul\u0027s companions","It postpones forgiveness until the end of the letter"]'::jsonb, 'The letter begins by grounding rescue in Christ''s self-giving before any debate about law or works', 'Paul frames the whole letter with Christ''s self-giving for sins, establishing grace as the basis of deliverance from the outset (Galatians 1:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the theological significance of saying Christ ''gave himself for our sins'' in the opening of Galatians?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 1, 5, 'Why is Paul''s insistence that his gospel is ''not according to man'' crucial for the rest of Galatians?', '["Because later arguments about justification and the Spirit depend on the message being God\u0027s revelation, not a negotiable human system","Because Paul wanted to reject every human teacher absolutely","Because Galatians is mainly about travel details","Because the churches had asked for a private opinion"]'::jsonb, 'Because later arguments about justification and the Spirit depend on the message being God''s revelation, not a negotiable human system', 'Paul''s later claims about justification by faith and life in the Spirit carry authority because the gospel he proclaims comes by revelation of Jesus Christ (Galatians 1:11-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Paul''s insistence that his gospel is ''not according to man'' crucial for the rest of Galatians?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 1, 5, 'How does Galatians 1 define true fidelity to God over against zeal for tradition?', '["True fidelity is submission to God\u0027s revelation in Christ, not mere intensity in inherited tradition","Tradition and revelation are always identical","Zeal itself justifies a person before God","Only ancestral customs matter to God"]'::jsonb, 'True fidelity is submission to God''s revelation in Christ, not mere intensity in inherited tradition', 'Paul had been extremely zealous for the traditions of his fathers, yet he was opposing God''s gospel until Christ was revealed to him (Galatians 1:14-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Galatians 1 define true fidelity to God over against zeal for tradition?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 1, 5, 'What larger biblical theme is advanced when the churches glorify God because the persecutor now preaches the faith?', '["God\u0027s grace triumphs by turning an enemy into a witness","Human effort can reverse any sin without grace","Persecution is stronger than the gospel","Apostles are chosen by public vote"]'::jsonb, 'God''s grace triumphs by turning an enemy into a witness', 'The churches glorify God because the same Paul who once tried to destroy the faith now proclaims it, highlighting the transforming power of grace (Galatians 1:23-24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'What larger biblical theme is advanced when the churches glorify God because the persecutor now preaches the faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 2, 1, 'According to Galatians 2, who went up with Paul to Jerusalem?', '["Barnabas and Titus","Silas and Timothy","Cephas and John","Luke and Mark"]'::jsonb, 'Barnabas and Titus', 'Paul says he went up again to Jerusalem with Barnabas, taking Titus also with him (Galatians 2:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 2, who went up with Paul to Jerusalem?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 2, 1, 'According to Galatians 2, was Titus compelled to be circumcised?', '["No, he was not compelled","Yes, immediately","Only after Paul left","Only in private"]'::jsonb, 'No, he was not compelled', 'Paul says not even Titus, who was a Greek, was compelled to be circumcised (Galatians 2:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 2, was Titus compelled to be circumcised?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 2, 1, 'According to Galatians 2, what did James, Cephas, and John give Paul and Barnabas?', '["The right hand of fellowship","Letters of dismissal","A temple tax receipt","A copy of the law"]'::jsonb, 'The right hand of fellowship', 'James, Cephas, and John gave Paul and Barnabas the right hand of fellowship (Galatians 2:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 2, what did James, Cephas, and John give Paul and Barnabas?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 2, 1, 'According to Galatians 2, whom did Paul oppose to his face at Antioch?', '["Cephas","Barnabas","James","Titus"]'::jsonb, 'Cephas', 'Paul says he opposed Cephas to his face because he stood condemned (Galatians 2:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 2, whom did Paul oppose to his face at Antioch?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 2, 1, 'According to Galatians 2, who loved Paul and gave himself for him?', '["The Son of God","Moses","Abraham","Barnabas"]'::jsonb, 'The Son of God', 'Paul says he lives by faith in the Son of God, who loved him and gave himself up for him (Galatians 2:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 2, who loved Paul and gave himself for him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 2, 2, 'Why did Paul say he went up to Jerusalem in Galatians 2?', '["Because of a revelation","Because Rome ordered him","Because he feared the apostles","Because the famine had ended"]'::jsonb, 'Because of a revelation', 'Paul says he went up according to revelation and set before them the gospel he preached among the Gentiles (Galatians 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why did Paul say he went up to Jerusalem in Galatians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 2, 2, 'What concern did Paul mention when he set his gospel before the leaders in Galatians 2?', '["That he might be running, or had run, in vain","That he had forgotten the law","That Titus wanted to leave","That Jerusalem was too crowded"]'::jsonb, 'That he might be running, or had run, in vain', 'Paul says he set the gospel before them privately so he would not somehow be running, or have run, in vain (Galatians 2:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What concern did Paul mention when he set his gospel before the leaders in Galatians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 2, 2, 'What did the leaders ask Paul to remember in Galatians 2?', '["The poor","The temple sacrifices","The feast days","The school of Gamaliel"]'::jsonb, 'The poor', 'Paul says the leaders asked only that they should remember the poor, which he was eager to do (Galatians 2:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did the leaders ask Paul to remember in Galatians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 2, 2, 'Why did Cephas draw back from eating with Gentiles in Galatians 2?', '["He feared those of the circumcision","He became ill","Paul rebuked him before the meal","The Gentiles refused him"]'::jsonb, 'He feared those of the circumcision', 'Before certain men came from James, Cephas ate with the Gentiles, but afterward he drew back because he feared the circumcision party (Galatians 2:12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why did Cephas draw back from eating with Gentiles in Galatians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 2, 2, 'According to Galatians 2, by what is a person not justified?', '["Works of the law","Faith in Christ","Grace","Mercy"]'::jsonb, 'Works of the law', 'Paul says a person is not justified by works of the law but through faith in Jesus Christ (Galatians 2:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Galatians 2, by what is a person not justified?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 2, 3, 'What does Titus''s case demonstrate in Galatians 2?', '["Gentile believers need not become Jews to belong fully to Christ","Greek believers must all go to Jerusalem first","Circumcision is necessary only for missionaries","Paul changed his gospel under pressure"]'::jsonb, 'Gentile believers need not become Jews to belong fully to Christ', 'Titus was Greek and was not compelled to be circumcised, showing that Gentile inclusion in Christ does not depend on adopting the law (Galatians 2:3-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Titus''s case demonstrate in Galatians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 2, 3, 'Why does Paul say he did not yield to the false brothers even for an hour?', '["So that the truth of the gospel might remain with the Galatians","So that Titus would feel honored","So that Jerusalem would praise him","So that Barnabas could preach sooner"]'::jsonb, 'So that the truth of the gospel might remain with the Galatians', 'Paul resisted the false brothers so that the truth of the gospel would continue with the churches (Galatians 2:4-5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul say he did not yield to the false brothers even for an hour?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 2, 3, 'What was wrong with Cephas''s conduct at Antioch according to Paul?', '["He was not walking straightforwardly according to the truth of the gospel","He preached a different Christ","He refused to help the poor","He denied knowing Paul"]'::jsonb, 'He was not walking straightforwardly according to the truth of the gospel', 'Paul says Cephas and the others were not walking straightforwardly according to the truth of the gospel (Galatians 2:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What was wrong with Cephas''s conduct at Antioch according to Paul?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 2, 3, 'What does ''I have been crucified with Christ'' mean in Galatians 2?', '["Paul\u0027s old identity under sin and law no longer governs his life","Paul had physically died and returned","Paul stopped using his own name","Paul rejected the resurrection"]'::jsonb, 'Paul''s old identity under sin and law no longer governs his life', 'Paul describes a union with Christ in which the old life is ended and Christ now lives in him (Galatians 2:19-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does ''I have been crucified with Christ'' mean in Galatians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 2, 3, 'What is Paul''s main point in saying that if righteousness were through the law, then Christ died for nothing?', '["Seeking justification by law makes Christ\u0027s death unnecessary","The law and Christ save in equal measure","Christ died only to improve the law","Righteousness is impossible for everyone"]'::jsonb, 'Seeking justification by law makes Christ''s death unnecessary', 'Paul concludes that if righteousness came through law, Christ died in vain (Galatians 2:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is Paul''s main point in saying that if righteousness were through the law, then Christ died for nothing?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 2, 4, 'How does the Antioch incident advance Paul''s argument in Galatians?', '["It shows that table fellowship expresses the truth of justification by faith, so withdrawing from Gentiles denies the gospel in practice","It proves Paul and Cephas preached different Christs","It shows food laws were the letter\u0027s only issue","It ends the need for church correction"]'::jsonb, 'It shows that table fellowship expresses the truth of justification by faith, so withdrawing from Gentiles denies the gospel in practice', 'Paul rebukes Cephas because separating from Gentiles contradicted the gospel''s truth that Jews and Gentiles are justified the same way in Christ (Galatians 2:11-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the Antioch incident advance Paul''s argument in Galatians?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 2, 4, 'Why does Paul say God shows no partiality in the section about Jerusalem''s leaders?', '["Because the standing of famous leaders does not alter the divine truth of the gospel","Because leaders are unimportant in every respect","Because God prefers Gentiles over Jews","Because Paul rejected all cooperation"]'::jsonb, 'Because the standing of famous leaders does not alter the divine truth of the gospel', 'Paul acknowledges the reputation of the leaders yet says God accepts no man''s person, emphasizing that truth is not created by status (Galatians 2:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul say God shows no partiality in the section about Jerusalem''s leaders?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 2, 4, 'What parallel mission does Galatians 2 describe between Peter and Paul?', '["Peter was entrusted with the gospel for the circumcision, and Paul for the Gentiles","Peter preached grace while Paul preached law","Peter served in Jerusalem while Paul served in Rome only","Peter taught doctrine while Paul handled money"]'::jsonb, 'Peter was entrusted with the gospel for the circumcision, and Paul for the Gentiles', 'Paul says he had been entrusted with the gospel to the uncircumcised just as Peter had been to the circumcised (Galatians 2:7-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'What parallel mission does Galatians 2 describe between Peter and Paul?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 2, 4, 'How does Galatians 2 connect justification and new life?', '["The one justified by faith also now lives by faith in the Son of God","Justification is only a past legal term with no effect on life","New life comes only through stricter lawkeeping","Faith belongs to justification but not daily conduct"]'::jsonb, 'The one justified by faith also now lives by faith in the Son of God', 'Paul moves from justification by faith to his confession that the life he now lives in the flesh he lives by faith in the Son of God (Galatians 2:16, 20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Galatians 2 connect justification and new life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 2, 4, 'Why is Barnabas being carried away by hypocrisy especially significant in Galatians 2?', '["Even a close coworker in Gentile mission could be pressured into behavior that denied gospel freedom","Barnabas had never supported Paul\u0027s ministry before","Barnabas was the main false teacher in Galatia","Barnabas wanted the law abolished for Jews"]'::jsonb, 'Even a close coworker in Gentile mission could be pressured into behavior that denied gospel freedom', 'Paul notes that even Barnabas was carried away, underscoring how serious and contagious the hypocrisy had become (Galatians 2:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is Barnabas being carried away by hypocrisy especially significant in Galatians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 2, 5, 'What is the theological importance of Paul''s statement that ''through the law, I died to the law''?', '["The law\u0027s own verdict drove Paul to an end of law-based righteousness so that he might live to God in Christ","The law became evil and had to be destroyed","Paul forgot the commandments after conversion","Only apostles die to the law"]'::jsonb, 'The law''s own verdict drove Paul to an end of law-based righteousness so that he might live to God in Christ', 'Paul says through the law he died to the law in order to live to God, which he then explains in terms of being crucified with Christ (Galatians 2:19-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the theological importance of Paul''s statement that ''through the law, I died to the law''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 2, 5, 'How does Galatians 2 portray hypocrisy as more than a private inconsistency?', '["It publicly reshapes community life in a way that can deny the gospel\u0027s truth","It matters only to the person feeling guilty","It affects prayer but not fellowship","It is less serious than doctrinal error"]'::jsonb, 'It publicly reshapes community life in a way that can deny the gospel''s truth', 'Cephas''s withdrawal influenced others, even Barnabas, and Paul saw it as a failure to walk in line with the gospel (Galatians 2:12-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Galatians 2 portray hypocrisy as more than a private inconsistency?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 2, 5, 'Why does Paul''s personal confession in Galatians 2:20 fit naturally within an argument about justification?', '["Because justification by faith is inseparable from union with the crucified and living Christ","Because Paul changed topics from doctrine to autobiography without connection","Because faith is only emotional language here","Because justification applies only to apostles"]'::jsonb, 'Because justification by faith is inseparable from union with the crucified and living Christ', 'Paul''s declaration about Christ living in him deepens his claim that justification is through faith in Christ rather than works of law (Galatians 2:16, 20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does Paul''s personal confession in Galatians 2:20 fit naturally within an argument about justification?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 2, 5, 'What does Galatians 2 imply about the relationship between apostolic unity and gospel truth?', '["True unity comes from shared submission to the gospel, not from avoiding hard confrontation","Unity requires silence when major issues arise","Gospel truth can be sacrificed for peace","Apostles had no need to agree on doctrine"]'::jsonb, 'True unity comes from shared submission to the gospel, not from avoiding hard confrontation', 'Paul receives fellowship from the leaders in Jerusalem, yet he still confronts Cephas in Antioch when conduct contradicts the gospel (Galatians 2:9, 11-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Galatians 2 imply about the relationship between apostolic unity and gospel truth?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 2, 5, 'How does Galatians 2 prepare for the letter''s later contrast between flesh and Spirit?', '["It already contrasts life rebuilt on law with life now lived by faith in the Son of God","It focuses only on travel and never on inward life","It says the Spirit will replace Christ","It restricts faith to Jewish believers"]'::jsonb, 'It already contrasts life rebuilt on law with life now lived by faith in the Son of God', 'Paul rejects rebuilding what he destroyed and describes a present life lived by faith in Christ, anticipating the later contrast between fleshly reliance and Spirit-shaped life (Galatians 2:18-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Galatians 2 prepare for the letter''s later contrast between flesh and Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 3, 1, 'According to Galatians 3, before whose eyes was Jesus Christ publicly portrayed as crucified?', '["The Galatians","The Romans","The Athenians","The Corinthians"]'::jsonb, 'The Galatians', 'Paul says Jesus Christ was openly set forth crucified before the eyes of the Galatians (Galatians 3:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 3, before whose eyes was Jesus Christ publicly portrayed as crucified?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 3, 1, 'According to Galatians 3, how did the Galatians receive the Spirit?', '["By hearing of faith","By works of the law","By circumcision first","By temple offerings"]'::jsonb, 'By hearing of faith', 'Paul asks whether they received the Spirit by works of the law or by hearing of faith; the expected answer is by hearing of faith (Galatians 3:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 3, how did the Galatians receive the Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 3, 1, 'According to Galatians 3, who believed God and had it counted to him for righteousness?', '["Abraham","Moses","David","Isaac"]'::jsonb, 'Abraham', 'Paul cites Scripture: Abraham believed God, and it was counted to him for righteousness (Galatians 3:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 3, who believed God and had it counted to him for righteousness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 3, 1, 'According to Galatians 3, what did Christ become for us?', '["A curse","A schoolmaster","A slave","An earthly king"]'::jsonb, 'A curse', 'Paul says Christ redeemed us from the curse of the law, having become a curse for us (Galatians 3:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 3, what did Christ become for us?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 3, 1, 'According to Galatians 3, in Christ Jesus what are believers through faith?', '["Children of God","Servants of Moses only","Citizens of Rome","Keepers of the temple"]'::jsonb, 'Children of God', 'Paul says all are children of God through faith in Christ Jesus (Galatians 3:26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 3, in Christ Jesus what are believers through faith?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 3, 2, 'What question does Paul use in Galatians 3 to challenge the Galatians'' shift toward law?', '["Having begun in the Spirit, are you now perfected in the flesh?","Did Moses fail to teach you?","Will Rome approve your customs?","Have you forgotten Jerusalem entirely?"]'::jsonb, 'Having begun in the Spirit, are you now perfected in the flesh?', 'Paul asks whether, after beginning in the Spirit, they are now being perfected in the flesh (Galatians 3:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What question does Paul use in Galatians 3 to challenge the Galatians'' shift toward law?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 3, 2, 'What did Scripture foresee according to Galatians 3 regarding the Gentiles?', '["That God would justify the Gentiles by faith","That Gentiles must become Jews first","That the nations would reject Abraham","That circumcision would save the world"]'::jsonb, 'That God would justify the Gentiles by faith', 'Paul says Scripture, foreseeing that God would justify the Gentiles by faith, preached the gospel beforehand to Abraham (Galatians 3:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Scripture foresee according to Galatians 3 regarding the Gentiles?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 3, 2, 'According to Galatians 3, to whom were the promises spoken?', '["To Abraham and his offspring","To Levi and the priests","To Caesar and the senate","To Esau and his descendants"]'::jsonb, 'To Abraham and his offspring', 'Paul says the promises were spoken to Abraham and to his offspring (Galatians 3:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'According to Galatians 3, to whom were the promises spoken?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 3, 2, 'Why was the law added according to Galatians 3?', '["Because of transgressions until the offspring should come","To replace the promise to Abraham","To save all nations by ceremonies","To make angels rulers over the church"]'::jsonb, 'Because of transgressions until the offspring should come', 'Paul says the law was added because of transgressions until the seed should come to whom the promise had been made (Galatians 3:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why was the law added according to Galatians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 3, 2, 'What does Paul say happened when believers were baptized into Christ in Galatians 3?', '["They put on Christ","They became children of Abraham by circumcision","They became judges of the law","They returned to elementary principles"]'::jsonb, 'They put on Christ', 'Paul says as many as were baptized into Christ put on Christ (Galatians 3:27).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say happened when believers were baptized into Christ in Galatians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 3, 3, 'Why does Paul appeal to Abraham in Galatians 3?', '["To show that righteousness by faith precedes and grounds the later law","To argue that circumcision was never practiced","To deny that Abraham obeyed God at all","To prove the nations are outside God\u0027s plan"]'::jsonb, 'To show that righteousness by faith precedes and grounds the later law', 'Paul argues from Abraham''s faith and the promise given before the law to show that blessing comes by faith, not law (Galatians 3:6-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul appeal to Abraham in Galatians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 3, 3, 'What does Galatians 3 mean by saying, ''The righteous will live by faith''?', '["Right standing before God and true life come through trusting God rather than law performance","Faith is only needed at the start, not afterward","The law is sinful and useless in every sense","Only Abraham could live by faith"]'::jsonb, 'Right standing before God and true life come through trusting God rather than law performance', 'Paul contrasts faith and law, citing Habakkuk to show that the righteous live by faith (Galatians 3:11-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Galatians 3 mean by saying, ''The righteous will live by faith''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 3, 3, 'How does Christ redeem from the curse of the law in Galatians 3?', '["By bearing the curse himself on the tree","By abolishing every command through force","By teaching stricter obedience","By moving the temple to the nations"]'::jsonb, 'By bearing the curse himself on the tree', 'Paul says Christ became a curse for us, citing the one hanged on a tree, so that blessing might come to the Gentiles (Galatians 3:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Christ redeem from the curse of the law in Galatians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 3, 3, 'What role does the law play when Paul calls it a tutor in Galatians 3?', '["It guarded and supervised God\u0027s people until Christ came","It permanently justifies all who hear it","It replaces faith with ritual certainty","It makes the promise to Abraham void"]'::jsonb, 'It guarded and supervised God''s people until Christ came', 'Paul says the law became our tutor to bring us to Christ, but now that faith has come we are no longer under a tutor (Galatians 3:24-25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What role does the law play when Paul calls it a tutor in Galatians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 3, 3, 'Why does Paul say there is neither Jew nor Greek, slave nor free, male nor female in Galatians 3?', '["Because all are one in Christ Jesus with equal standing in the promise","Because earthly identities immediately disappear biologically","Because the church has no diversity of people","Because social roles determine salvation"]'::jsonb, 'Because all are one in Christ Jesus with equal standing in the promise', 'Paul teaches that all who are in Christ share equal covenant standing and belong to Abraham''s offspring through faith (Galatians 3:28-29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul say there is neither Jew nor Greek, slave nor free, male nor female in Galatians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 3, 4, 'How does Galatians 3 relate the promise to Abraham and the law given 430 years later?', '["The later law cannot cancel the earlier promise ratified by God","The law improves the promise into a better covenant of works","The promise became effective only after Sinai","The promise was given to Moses, not Abraham"]'::jsonb, 'The later law cannot cancel the earlier promise ratified by God', 'Paul argues that a covenant previously ratified by God is not annulled by the law that came 430 years later (Galatians 3:17-18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Galatians 3 relate the promise to Abraham and the law given 430 years later?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 3, 4, 'Why does Paul focus on the singular ''offspring'' in Galatians 3:16?', '["To identify the promise as ultimately fulfilled in Christ","To deny that Abraham had many descendants","To prove Greek grammar saves sinners","To reject the book of Genesis"]'::jsonb, 'To identify the promise as ultimately fulfilled in Christ', 'Paul argues that Scripture speaks of one offspring, which he identifies as Christ, making Christ the focal fulfillment of the promise (Galatians 3:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul focus on the singular ''offspring'' in Galatians 3:16?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 3, 4, 'What answer does Paul give when asking whether the law is against the promises of God?', '["Absolutely not, because the law cannot give life though it serves a temporary purpose","Yes, the law opposes every promise God made","Only partly, because angels corrected the promise","The question cannot be answered"]'::jsonb, 'Absolutely not, because the law cannot give life though it serves a temporary purpose', 'Paul rejects the idea that the law opposes the promises, but says that if a law could give life then righteousness would be by law, which it is not (Galatians 3:21-22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'What answer does Paul give when asking whether the law is against the promises of God?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 3, 4, 'How does Galatians 3 connect justification, the Spirit, and Abraham''s blessing?', '["Christ\u0027s redemptive work brings Abraham\u0027s blessing to the Gentiles so they receive the promised Spirit through faith","The Spirit comes only after full lawkeeping","Abraham\u0027s blessing is limited to ethnic Israel","Justification and the Spirit are unrelated topics"]'::jsonb, 'Christ''s redemptive work brings Abraham''s blessing to the Gentiles so they receive the promised Spirit through faith', 'Paul says Christ redeemed us from the curse so that Abraham''s blessing might come to the Gentiles and so that we might receive the promise of the Spirit through faith (Galatians 3:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Galatians 3 connect justification, the Spirit, and Abraham''s blessing?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 3, 4, 'Why does Paul begin Galatians 3 with their experience of the Spirit before moving to Abraham and Scripture?', '["He links their lived experience to the biblical pattern that God works through faith rather than law","He wants experience to replace Scripture entirely","He thinks Abraham is less important than feelings","He no longer cares about doctrine"]'::jsonb, 'He links their lived experience to the biblical pattern that God works through faith rather than law', 'Paul starts with the Galatians'' reception of the Spirit by faith and then confirms that pattern from Abraham and the Scriptures (Galatians 3:2-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul begin Galatians 3 with their experience of the Spirit before moving to Abraham and Scripture?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 3, 5, 'What is the significance of Paul''s statement that Scripture ''shut up all things under sin'' in Galatians 3?', '["It shows the universal problem that makes the promise by faith in Christ necessary for all","It means sin is stronger than God\u0027s promise forever","It teaches that Scripture itself causes evil","It limits salvation to those under Moses"]'::jsonb, 'It shows the universal problem that makes the promise by faith in Christ necessary for all', 'Paul says Scripture imprisoned all things under sin so that the promise by faith in Jesus Christ might be given to those who believe (Galatians 3:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the significance of Paul''s statement that Scripture ''shut up all things under sin'' in Galatians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 3, 5, 'How does Galatians 3 use Abraham to redefine who truly belongs to his family?', '["Those who are of faith are Abraham\u0027s children and heirs in Christ","Only those circumcised on the eighth day belong to Abraham","Only ethnic descendants can inherit the promise","Abraham\u0027s family has no relevance after Christ"]'::jsonb, 'Those who are of faith are Abraham''s children and heirs in Christ', 'Paul says know therefore that those who are of faith are children of Abraham, and if you are Christ''s then you are Abraham''s offspring and heirs according to promise (Galatians 3:7, 29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Galatians 3 use Abraham to redefine who truly belongs to his family?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 3, 5, 'Why is Paul''s law-versus-promise contrast in Galatians 3 central to the doctrine of grace?', '["Because inheritance based on promise depends on God\u0027s gift rather than human performance","Because grace is simply another name for the law","Because promise and grace exclude Christ\u0027s death","Because law was given only to Gentiles"]'::jsonb, 'Because inheritance based on promise depends on God''s gift rather than human performance', 'Paul says if the inheritance is of the law, it is no longer of promise; but God granted it to Abraham by promise (Galatians 3:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Paul''s law-versus-promise contrast in Galatians 3 central to the doctrine of grace?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 3, 5, 'What deeper point is made by saying believers have ''put on Christ'' in Galatians 3?', '["Union with Christ defines identity more fundamentally than former divisions or badges of status","Believers stop having any moral obligations","Baptism works automatically without faith","The church replaces Christ as mediator"]'::jsonb, 'Union with Christ defines identity more fundamentally than former divisions or badges of status', 'Paul connects being baptized into Christ, putting on Christ, and being one in Christ Jesus, showing that Christ now defines covenant identity (Galatians 3:27-28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'What deeper point is made by saying believers have ''put on Christ'' in Galatians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 3, 5, 'How does Galatians 3 position Christ in relation to the entire biblical story from Abraham to Sinai and beyond?', '["Christ is the promised offspring in whom the blessing, redemption, and inheritance come to fruition","Christ is a late addition unrelated to Abraham","Christ came mainly to preserve ceremonial law","Christ serves only as an example of faith"]'::jsonb, 'Christ is the promised offspring in whom the blessing, redemption, and inheritance come to fruition', 'Paul centers the promise on Abraham''s offspring, identifies that offspring as Christ, and shows that redemption and blessing come through him (Galatians 3:16, 13-14, 29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Galatians 3 position Christ in relation to the entire biblical story from Abraham to Sinai and beyond?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 4, 1, 'According to Galatians 4, what does God send into believers'' hearts?', '["The Spirit of his Son","A new law of ceremonies","An angelic messenger","A spirit of slavery"]'::jsonb, 'The Spirit of his Son', 'Because they are children, God sent the Spirit of his Son into their hearts, crying, ''Abba, Father'' (Galatians 4:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 4, what does God send into believers'' hearts?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 4, 1, 'According to Galatians 4, what are believers no longer?', '["A bondservant","Children of God","Heirs through God","Known by God"]'::jsonb, 'A bondservant', 'Paul says you are no longer a bondservant, but a child; and if a child, then an heir through God (Galatians 4:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 4, what are believers no longer?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 4, 1, 'According to Galatians 4, what were the Galatians observing that troubled Paul?', '["Days, months, seasons, and years","Only the Sabbath","Marriage feasts","Roman holidays alone"]'::jsonb, 'Days, months, seasons, and years', 'Paul says, ''You observe days, months, seasons, and years'' (Galatians 4:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 4, what were the Galatians observing that troubled Paul?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 4, 1, 'According to Galatians 4, what physical problem did Paul mention when he first preached to them?', '["An infirmity of the flesh","Blindness from birth","A broken leg","A fever from the sea"]'::jsonb, 'An infirmity of the flesh', 'Paul says because of an infirmity of the flesh he preached the gospel to them the first time (Galatians 4:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 4, what physical problem did Paul mention when he first preached to them?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 4, 1, 'According to Galatians 4, whose son was the free woman''s child?', '["Isaac","Ishmael","Esau","Reuben"]'::jsonb, 'Isaac', 'Paul identifies Isaac as the son of promise born through the free woman (Galatians 4:28, 31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 4, whose son was the free woman''s child?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 4, 2, 'What happened when the fullness of the time came in Galatians 4?', '["God sent out his Son, born of a woman, born under the law","God gave a second law from heaven","The nations all came to Jerusalem","Paul was made an apostle in Antioch"]'::jsonb, 'God sent out his Son, born of a woman, born under the law', 'Paul says when the fullness of the time came, God sent forth his Son, born of a woman, born under the law (Galatians 4:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What happened when the fullness of the time came in Galatians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 4, 2, 'Why did God send his Son according to Galatians 4?', '["To redeem those under the law so that we might receive adoption","To teach Rome how to rule justly","To restore the temple sacrifices permanently","To separate Jews from Gentiles forever"]'::jsonb, 'To redeem those under the law so that we might receive adoption', 'Paul says God sent his Son to redeem those under the law that we might receive adoption as children (Galatians 4:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why did God send his Son according to Galatians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 4, 2, 'How had the Galatians once treated Paul according to Galatians 4?', '["As an angel of God, even as Christ Jesus","As a false teacher from Judea","As a Roman official","As a burden to be avoided"]'::jsonb, 'As an angel of God, even as Christ Jesus', 'Paul says they received him as an angel of God, even as Christ Jesus (Galatians 4:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'How had the Galatians once treated Paul according to Galatians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 4, 2, 'What does Paul fear in Galatians 4 because of the Galatians'' behavior?', '["That he may have labored over them in vain","That Titus had circumcised them already","That Barnabas will leave him","That the churches will move to Jerusalem"]'::jsonb, 'That he may have labored over them in vain', 'Paul fears for them and says he is afraid he may have labored over them in vain (Galatians 4:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul fear in Galatians 4 because of the Galatians'' behavior?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 4, 2, 'How does Paul describe Hagar and Sarah in Galatians 4?', '["As an allegory of two covenants","As examples of perfect harmony under law","As priestesses in Jerusalem","As symbols of Rome and Greece"]'::jsonb, 'As an allegory of two covenants', 'Paul says these things contain an allegory, for the women are two covenants (Galatians 4:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'How does Paul describe Hagar and Sarah in Galatians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 4, 3, 'What does Galatians 4 teach by comparing an heir who is still a child to a slave?', '["Before the appointed time, possession of the inheritance does not yet mean mature freedom","Children can never inherit anything from God","Slavery is the highest spiritual state","The promise to Abraham failed"]'::jsonb, 'Before the appointed time, possession of the inheritance does not yet mean mature freedom', 'Paul compares the pre-Christ era to an heir under guardians and managers until the time set by the father (Galatians 4:1-3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Galatians 4 teach by comparing an heir who is still a child to a slave?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 4, 3, 'Why is ''Abba, Father'' significant in Galatians 4?', '["It expresses the intimate sonship believers receive through the Spirit of the Son","It is a title reserved only for apostles","It replaces faith with emotion","It refers only to Abraham\u0027s household customs"]'::jsonb, 'It expresses the intimate sonship believers receive through the Spirit of the Son', 'Paul says God sent the Spirit of his Son into our hearts, crying, ''Abba, Father,'' showing adopted intimacy with God (Galatians 4:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is ''Abba, Father'' significant in Galatians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 4, 3, 'What is Paul warning against when he says the Galatians were turning back again to weak and miserable elemental principles?', '["Returning to religious bondage after knowing God in Christ","Abandoning all moral teaching","Rejecting the Hebrew Scriptures entirely","Leaving agriculture for trade"]'::jsonb, 'Returning to religious bondage after knowing God in Christ', 'Paul says they are turning back again to weak and miserable elemental principles to which they desire to be in bondage all over again (Galatians 4:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is Paul warning against when he says the Galatians were turning back again to weak and miserable elemental principles?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 4, 3, 'Why does Paul say, ''I am again in labor until Christ is formed in you''?', '["He longs for their inner conformity to Christ, not mere outward religious compliance","He wants them to imitate his travel plans","He is asking them to suffer physical pain","He wishes them all to become apostles"]'::jsonb, 'He longs for their inner conformity to Christ, not mere outward religious compliance', 'Paul''s maternal image shows his pastoral desire that Christ truly take shape in their lives (Galatians 4:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul say, ''I am again in labor until Christ is formed in you''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 4, 3, 'What contrast is Paul making between the son by the slave woman and the son by the free woman?', '["One was born according to the flesh and the other through promise","One was righteous and the other wicked from birth","One inherited Canaan and the other Egypt","One served angels and the other Moses"]'::jsonb, 'One was born according to the flesh and the other through promise', 'Paul says the son by the servant was born according to the flesh, but the son by the free woman through promise (Galatians 4:23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What contrast is Paul making between the son by the slave woman and the son by the free woman?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 4, 4, 'How does Galatians 4 connect redemption and adoption?', '["Christ redeems those under the law so that they may be brought into God\u0027s family as sons and heirs","Adoption replaces redemption as a separate path","Redemption applies to Jews while adoption applies to Gentiles only","Adoption is postponed until the law is kept fully"]'::jsonb, 'Christ redeems those under the law so that they may be brought into God''s family as sons and heirs', 'Paul joins the sending of the Son, redemption under the law, adoption as children, and heirship through God in one argument (Galatians 4:4-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Galatians 4 connect redemption and adoption?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 4, 4, 'Why does Paul shift from doctrinal argument to personal appeal in Galatians 4:12-20?', '["He wants the Galatians to feel the relational and pastoral urgency of their drift from the gospel","He has run out of theological arguments","He wants to avoid speaking about Christ any longer","He is changing to an unrelated topic about illness"]'::jsonb, 'He wants the Galatians to feel the relational and pastoral urgency of their drift from the gospel', 'Paul reminds them of their former welcome and his present anguish so they will see what is at stake in turning from gospel freedom (Galatians 4:12-20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul shift from doctrinal argument to personal appeal in Galatians 4:12-20?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 4, 4, 'What does the Hagar-Sarah allegory contribute to Paul''s case in Galatians 4?', '["It contrasts slavery under Sinai and present Jerusalem with the freedom of the promise and the Jerusalem above","It proves Abraham made a mistake that voided the covenant","It teaches that motherhood determines salvation","It says the law came from Sarah and promise from Hagar"]'::jsonb, 'It contrasts slavery under Sinai and present Jerusalem with the freedom of the promise and the Jerusalem above', 'Paul identifies Hagar with Sinai and present Jerusalem in slavery, while the Jerusalem above is free and is our mother (Galatians 4:24-26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does the Hagar-Sarah allegory contribute to Paul''s case in Galatians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 4, 4, 'How does Galatians 4 reinterpret true kinship with Abraham?', '["Believers are children of promise like Isaac rather than children defined by slavery to law","Physical descent alone determines the heirs","Only those in Jerusalem are Abraham\u0027s children","Abraham\u0027s line ended with Isaac"]'::jsonb, 'Believers are children of promise like Isaac rather than children defined by slavery to law', 'Paul tells the Galatians, ''Now we, brothers, as Isaac was, are children of promise'' (Galatians 4:28).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Galatians 4 reinterpret true kinship with Abraham?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 4, 5, 'What is the theological force of calling the Jerusalem above ''our mother'' in Galatians 4?', '["It locates the believers\u0027 identity in the heavenly order of promise and freedom rather than in earthly covenant bondage","It replaces God the Father with a heavenly mother goddess","It refers only to the future city and not present faith","It denies the history of Israel"]'::jsonb, 'It locates the believers'' identity in the heavenly order of promise and freedom rather than in earthly covenant bondage', 'Paul contrasts present Jerusalem in slavery with the Jerusalem above that is free and belongs to believers as their true mother (Galatians 4:25-26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the theological force of calling the Jerusalem above ''our mother'' in Galatians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 4, 5, 'Why is Paul''s language about knowing God, or rather being known by God, significant in Galatians 4?', '["It emphasizes that salvation rests finally on God\u0027s gracious initiative, not human achievement","It means human response is irrelevant","It teaches that knowledge replaces faith","It limits relationship with God to Jews"]'::jsonb, 'It emphasizes that salvation rests finally on God''s gracious initiative, not human achievement', 'Paul corrects himself to say they are known by God, underscoring divine initiative in their relationship to him (Galatians 4:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Paul''s language about knowing God, or rather being known by God, significant in Galatians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 4, 5, 'How does Galatians 4 deepen the meaning of sonship beyond a legal status?', '["Sonship includes the Spirit\u0027s cry of \u0027Abba, Father\u0027 and participation in God\u0027s family life","Sonship means only future inheritance with no present reality","Sonship is earned by calendar observance","Sonship belongs only to male believers"]'::jsonb, 'Sonship includes the Spirit''s cry of ''Abba, Father'' and participation in God''s family life', 'Paul joins adoption with the present gift of the Spirit crying ''Abba, Father,'' showing that sonship is lived relationally now (Galatians 4:5-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Galatians 4 deepen the meaning of sonship beyond a legal status?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 4, 5, 'What broader biblical pattern stands behind the contrast between Ishmael and Isaac in Galatians 4?', '["God\u0027s promise produces the true heir where human effort cannot secure the inheritance","The firstborn always loses because birth order is evil","Physical descent never matters in Scripture at all","God prefers wilderness life to covenant promise"]'::jsonb, 'God''s promise produces the true heir where human effort cannot secure the inheritance', 'Paul uses Ishmael and Isaac to contrast fleshly human arrangement with the child born through God''s promise, applying that contrast to law and gospel (Galatians 4:23, 28-31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What broader biblical pattern stands behind the contrast between Ishmael and Isaac in Galatians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 4, 5, 'Why does Galatians 4 treat a return to ceremonial observance as a return to slavery rather than spiritual maturity?', '["Because to seek status through such observances after Christ is to move backward from sonship into bondage","Because all times and seasons are sinful in themselves","Because God never established holy days in any sense","Because maturity requires isolation from all communities"]'::jsonb, 'Because to seek status through such observances after Christ is to move backward from sonship into bondage', 'Paul fears that their observance of days and seasons reflects a return to weak and miserable principles after receiving sonship in Christ (Galatians 4:9-11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does Galatians 4 treat a return to ceremonial observance as a return to slavery rather than spiritual maturity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 5, 1, 'According to Galatians 5, for what did Christ set us free?', '["Freedom","A return to Sinai","Temple service only","Political revolt"]'::jsonb, 'Freedom', 'Paul says, ''Stand firm therefore in the freedom by which Christ has made us free'' (Galatians 5:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 5, for what did Christ set us free?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 5, 1, 'According to Galatians 5, what would profit them nothing if they accepted it as necessary?', '["Christ","Prayer","Baptism","Hope"]'::jsonb, 'Christ', 'Paul warns that if they receive circumcision as necessary, Christ will profit them nothing (Galatians 5:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 5, what would profit them nothing if they accepted it as necessary?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 5, 1, 'According to Galatians 5, what works through love?', '["Faith","Circumcision","The flesh","Fear"]'::jsonb, 'Faith', 'Paul says in Christ Jesus neither circumcision nor uncircumcision avails anything, but faith working through love (Galatians 5:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 5, what works through love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 5, 1, 'According to Galatians 5, what fulfills the whole law in one word?', '["You shall love your neighbor as yourself","Keep the feasts faithfully","Offer sacrifices morning and evening","Honor Caesar in all things"]'::jsonb, 'You shall love your neighbor as yourself', 'Paul says the whole law is fulfilled in this: ''You shall love your neighbor as yourself'' (Galatians 5:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 5, what fulfills the whole law in one word?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 5, 1, 'According to Galatians 5, what is the first fruit of the Spirit listed?', '["Love","Courage","Knowledge","Power"]'::jsonb, 'Love', 'Paul begins the fruit of the Spirit with love (Galatians 5:22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 5, what is the first fruit of the Spirit listed?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 5, 2, 'What does Paul say a man becomes obligated to do if he receives circumcision in Galatians 5?', '["Keep the whole law","Only keep the food laws","Move to Jerusalem","Become a priest"]'::jsonb, 'Keep the whole law', 'Paul testifies again that every man who receives circumcision is a debtor to do the whole law (Galatians 5:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say a man becomes obligated to do if he receives circumcision in Galatians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 5, 2, 'How were the Galatians running according to Paul before being hindered?', '["Well","Slowly","In fear","Without any direction"]'::jsonb, 'Well', 'Paul says, ''You were running well. Who interfered with you that you should not obey the truth?'' (Galatians 5:7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'How were the Galatians running according to Paul before being hindered?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 5, 2, 'What proverb does Paul use in Galatians 5 about false influence?', '["A little yeast grows through the whole lump","A strong tower protects the city","Many waters cannot quench love","The wise store up knowledge"]'::jsonb, 'A little yeast grows through the whole lump', 'Paul warns that a little yeast leavens the whole lump (Galatians 5:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'What proverb does Paul use in Galatians 5 about false influence?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 5, 2, 'Why were some promoting circumcision according to Galatians 5?', '["So they would not be persecuted for the cross of Christ","So they could travel more easily","So they could collect temple taxes","So they could avoid the Gentiles entirely"]'::jsonb, 'So they would not be persecuted for the cross of Christ', 'Paul says if he still preached circumcision, the stumbling block of the cross would have been removed (Galatians 5:11).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why were some promoting circumcision according to Galatians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 5, 2, 'What command does Paul give to keep believers from fulfilling fleshly desire?', '["Walk by the Spirit","Separate from all sinners","Fast every week","Seek visions from angels"]'::jsonb, 'Walk by the Spirit', 'Paul says, ''Walk by the Spirit, and you won''t fulfill the lust of the flesh'' (Galatians 5:16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'What command does Paul give to keep believers from fulfilling fleshly desire?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 5, 3, 'Why does Paul see circumcision as spiritually dangerous in Galatians 5?', '["When treated as necessary for justification, it shifts trust from Christ to law-obligation","Because the physical act itself is uniquely sinful","Because Abraham never received circumcision","Because Gentiles were forbidden to discuss it"]'::jsonb, 'When treated as necessary for justification, it shifts trust from Christ to law-obligation', 'Paul warns that seeking justification through law severs one from Christ and obligates the whole law (Galatians 5:2-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul see circumcision as spiritually dangerous in Galatians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 5, 3, 'What does Galatians 5 teach about the relationship between freedom and love?', '["Freedom is not for self-indulgence but for serving one another through love","Love restricts freedom to a small elite","Freedom means avoiding obligations to others","Love is optional if faith is strong"]'::jsonb, 'Freedom is not for self-indulgence but for serving one another through love', 'Paul says they were called to freedom, but not for an occasion to the flesh; rather, through love serve one another (Galatians 5:13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Galatians 5 teach about the relationship between freedom and love?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 5, 3, 'Why does Paul list both fleshly works and the fruit of the Spirit in Galatians 5?', '["To contrast the kinds of life produced by self-rule and Spirit-rule","To give two equally valid paths to righteousness","To show that moral change is impossible","To replace doctrine with behavior alone"]'::jsonb, 'To contrast the kinds of life produced by self-rule and Spirit-rule', 'Paul contrasts the works of the flesh with the fruit of the Spirit to show the radically different outcomes of each way of life (Galatians 5:19-23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul list both fleshly works and the fruit of the Spirit in Galatians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 5, 3, 'What does it mean that ''against such things there is no law'' in Galatians 5?', '["The Spirit\u0027s fruit fulfills what the law sought and does not come under condemnation","The fruit of the Spirit abolishes all morality","Civil laws must never mention virtue","Believers no longer need discernment"]'::jsonb, 'The Spirit''s fruit fulfills what the law sought and does not come under condemnation', 'After naming the fruit of the Spirit, Paul says against such things there is no law, indicating that Spirit-shaped life stands in harmony with God''s moral will (Galatians 5:22-23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does it mean that ''against such things there is no law'' in Galatians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 5, 3, 'How does Paul describe the relation between the flesh and the Spirit in Galatians 5?', '["They are opposed to each other","They cooperate for maturity","They are identical in believers","They alternate every other day"]'::jsonb, 'They are opposed to each other', 'Paul says the flesh lusts against the Spirit and the Spirit against the flesh; these are contrary to one another (Galatians 5:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Paul describe the relation between the flesh and the Spirit in Galatians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 5, 4, 'How does Galatians 5 hold together justification by faith and ethical transformation?', '["The same gospel that rejects law-based justification also produces Spirit-led lives marked by love","Justification matters, but behavior does not","Ethics replace faith once a person matures","Only works of law can create holy living"]'::jsonb, 'The same gospel that rejects law-based justification also produces Spirit-led lives marked by love', 'Paul rejects reliance on circumcision for justification while calling believers to faith working through love and to walking by the Spirit (Galatians 5:5-6, 13-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Galatians 5 hold together justification by faith and ethical transformation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 5, 4, 'Why does Paul say the whole law is fulfilled in loving one''s neighbor?', '["Because Spirit-born love expresses the true moral aim that legalism fails to achieve","Because the rest of Scripture no longer matters","Because neighbor-love applies only to Gentiles","Because Paul wanted to simplify religion into one emotion"]'::jsonb, 'Because Spirit-born love expresses the true moral aim that legalism fails to achieve', 'Paul calls them away from fleshly self-seeking and toward love that fulfills the law''s intent (Galatians 5:13-14, 22).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul say the whole law is fulfilled in loving one''s neighbor?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 5, 4, 'What is the practical danger of the Galatians biting and devouring one another?', '["Community life collapses when freedom is distorted into rivalry and self-assertion","It only harms personal reputation","It proves the law has no value whatsoever","It has no relation to spiritual life"]'::jsonb, 'Community life collapses when freedom is distorted into rivalry and self-assertion', 'Paul warns that if they bite and devour one another, they may be consumed by one another, showing the communal damage of fleshly conflict (Galatians 5:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'What is the practical danger of the Galatians biting and devouring one another?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 5, 4, 'How does Galatians 5 connect the cross of Christ with the believer''s moral life?', '["Those who belong to Christ have crucified the flesh with its passions and desires","The cross matters only for forgiveness, not transformation","The cross mainly abolishes bodily existence","The cross requires social withdrawal from the world"]'::jsonb, 'Those who belong to Christ have crucified the flesh with its passions and desires', 'Paul says those who belong to Christ Jesus have crucified the flesh with its passions and lusts (Galatians 5:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Galatians 5 connect the cross of Christ with the believer''s moral life?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 5, 5, 'What deeper contrast structures Galatians 5 beyond simply ''bad deeds'' versus ''good deeds''?', '["It contrasts two ruling powers and identities: fleshly self-reliance versus Spirit-governed life in Christ","It contrasts Jews with Gentiles as moral categories","It contrasts private sins with public virtues only","It contrasts old age with youth"]'::jsonb, 'It contrasts two ruling powers and identities: fleshly self-reliance versus Spirit-governed life in Christ', 'Paul''s language about flesh, Spirit, belonging to Christ, and crucifying the flesh shows a deep contrast of governing powers and identities, not merely isolated behaviors (Galatians 5:16-25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What deeper contrast structures Galatians 5 beyond simply ''bad deeds'' versus ''good deeds''?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 5, 5, 'Why is ''faith working through love'' so central in Galatians 5?', '["It captures how true trust in Christ expresses itself in Spirit-shaped love rather than ceremonial boasting","It means love replaces faith as the basis of justification","It limits love to friends inside the church","It reduces the gospel to social activism alone"]'::jsonb, 'It captures how true trust in Christ expresses itself in Spirit-shaped love rather than ceremonial boasting', 'Paul dismisses circumcision as a basis of standing and instead highlights faith working through love as the true mark of life in Christ (Galatians 5:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is ''faith working through love'' so central in Galatians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 5, 5, 'How does Galatians 5 answer the accusation that freedom from law leads to moral chaos?', '["Paul shows that Spirit-led freedom produces the fruit the law desired while restraining fleshly desires","Paul agrees that moral chaos is inevitable","Paul says only fear can keep people moral","Paul postpones ethics to another letter"]'::jsonb, 'Paul shows that Spirit-led freedom produces the fruit the law desired while restraining fleshly desires', 'Rather than endorsing license, Paul calls for walking by the Spirit and lists the Spirit''s fruit, which stands over against the works of the flesh (Galatians 5:13, 16, 22-23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Galatians 5 answer the accusation that freedom from law leads to moral chaos?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 5, 5, 'What is the theological significance of saying believers should keep in step with the Spirit if they live by the Spirit?', '["The Spirit is both the source of new life and the guide for ongoing conduct","The Spirit gives life once but has no role afterward","Christian life depends on occasional spiritual feelings only","Only church leaders can follow the Spirit"]'::jsonb, 'The Spirit is both the source of new life and the guide for ongoing conduct', 'Paul moves from living by the Spirit to keeping in step with the Spirit, linking new birth and daily obedience under the same divine power (Galatians 5:25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the theological significance of saying believers should keep in step with the Spirit if they live by the Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 6, 1, 'According to Galatians 6, how should spiritual people restore someone caught in a trespass?', '["In a spirit of gentleness","With public shame","By ignoring the issue","With immediate expulsion in every case"]'::jsonb, 'In a spirit of gentleness', 'Paul says spiritual people should restore such a one in a spirit of gentleness, watching themselves lest they also be tempted (Galatians 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 6, how should spiritual people restore someone caught in a trespass?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 6, 1, 'According to Galatians 6, what should believers bear for one another?', '["One another\u0027s burdens","Only their own praise","The yoke of circumcision","The temple tax"]'::jsonb, 'One another''s burdens', 'Paul says, ''Bear one another''s burdens, and so fulfill the law of Christ'' (Galatians 6:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 6, what should believers bear for one another?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 6, 1, 'According to Galatians 6, what does a person reap if he sows to the flesh?', '["Corruption","Peace","Righteousness by law","Adoption"]'::jsonb, 'Corruption', 'Paul says the one who sows to his own flesh will reap corruption from the flesh (Galatians 6:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 6, what does a person reap if he sows to the flesh?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 6, 1, 'According to Galatians 6, in what does Paul say he will boast?', '["The cross of our Lord Jesus Christ","His own learning","His Jewish ancestry","The size of his churches"]'::jsonb, 'The cross of our Lord Jesus Christ', 'Paul says, ''Far be it from me to boast except in the cross of our Lord Jesus Christ'' (Galatians 6:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 6, in what does Paul say he will boast?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 6, 1, 'According to Galatians 6, what counts for anything?', '["A new creation","Circumcision alone","Uncircumcision alone","Tribal lineage"]'::jsonb, 'A new creation', 'Paul says neither circumcision amounts to anything, nor uncircumcision, but a new creation (Galatians 6:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 6, what counts for anything?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 6, 2, 'What caution accompanies restoring a sinner in Galatians 6?', '["Consider yourself, lest you also be tempted","Take two priests with you","Report the matter to Rome first","Require circumcision before restoration"]'::jsonb, 'Consider yourself, lest you also be tempted', 'Paul tells the spiritual person to restore gently while watching himself lest he too be tempted (Galatians 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'What caution accompanies restoring a sinner in Galatians 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 6, 2, 'What does Paul say each one should test in Galatians 6?', '["His own work","His neighbor\u0027s lineage","The weather signs","The temple records"]'::jsonb, 'His own work', 'Paul says each one should test his own work, and then he will have reason to boast in himself alone and not in his neighbor (Galatians 6:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say each one should test in Galatians 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 6, 2, 'With whom should the person taught in the word share in Galatians 6?', '["With the one who teaches","Only with his relatives","Only with the poor in Jerusalem","Only with government officials"]'::jsonb, 'With the one who teaches', 'Paul says the one who is taught in the word should share all good things with the one who teaches (Galatians 6:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'With whom should the person taught in the word share in Galatians 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 6, 2, 'What should believers not grow weary of doing in Galatians 6?', '["Doing good","Keeping ceremonial washings","Arguing over teachers","Boasting in the flesh"]'::jsonb, 'Doing good', 'Paul says, ''Let us not be weary in doing good, for we will reap in due season if we don''t give up'' (Galatians 6:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'What should believers not grow weary of doing in Galatians 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 6, 2, 'To whom should believers especially do good according to Galatians 6?', '["Those who are of the household of the faith","Only the wealthy","Only fellow Jews","Only traveling apostles"]'::jsonb, 'Those who are of the household of the faith', 'Paul says to do good to all, and especially to those who are of the household of the faith (Galatians 6:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'To whom should believers especially do good according to Galatians 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 6, 3, 'How does Galatians 6 balance personal responsibility and mutual care?', '["Believers bear one another\u0027s burdens while also carrying their own load before God","Mutual care cancels all personal accountability","Only leaders bear burdens in the church","Personal responsibility leaves no room for shared care"]'::jsonb, 'Believers bear one another''s burdens while also carrying their own load before God', 'Paul calls believers to bear one another''s burdens and also says each will carry his own load, balancing shared care with personal accountability (Galatians 6:2, 5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'How does Galatians 6 balance personal responsibility and mutual care?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 6, 3, 'What principle is Paul teaching with ''God is not mocked'' in Galatians 6?', '["Human choices before God have real moral consequences that cannot be evaded","God refuses to forgive anyone who sins","Only outward acts matter to God","Mockery is the worst possible sin"]'::jsonb, 'Human choices before God have real moral consequences that cannot be evaded', 'Paul says whatever a man sows, that he will also reap, showing the seriousness of life before God (Galatians 6:7-8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What principle is Paul teaching with ''God is not mocked'' in Galatians 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 6, 3, 'Why does Paul expose the motives of those pressing circumcision in Galatians 6?', '["To show they seek outward boasting and avoidance of persecution rather than the truth of the gospel","To prove they never read Scripture","To deny they were Jewish at all","To explain why they disliked Paul personally"]'::jsonb, 'To show they seek outward boasting and avoidance of persecution rather than the truth of the gospel', 'Paul says they compel circumcision so they may not be persecuted for the cross and so they may boast in the flesh of others (Galatians 6:12-13).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul expose the motives of those pressing circumcision in Galatians 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 6, 3, 'What does Paul mean when he says the world has been crucified to him, and he to the world?', '["The cross has severed his old relationship to worldly boasting and identity","He refuses to care about other people","He has withdrawn from all human society","He is speaking only about physical death"]'::jsonb, 'The cross has severed his old relationship to worldly boasting and identity', 'Paul''s boast in the cross means the world''s old system of value and pride has been broken in relation to him (Galatians 6:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Paul mean when he says the world has been crucified to him, and he to the world?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 6, 3, 'What is the significance of the ''marks of Jesus'' that Paul bears on his body?', '["They show his suffering identifies him as Christ\u0027s servant rather than a boaster in outward religion","They are ceremonial signs replacing baptism","They prove Paul had never been persecuted","They refer to priestly garments"]'::jsonb, 'They show his suffering identifies him as Christ''s servant rather than a boaster in outward religion', 'Paul contrasts his bodily marks from suffering for Christ with the false teachers'' boasting in fleshly signs (Galatians 6:12-13, 17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What is the significance of the ''marks of Jesus'' that Paul bears on his body?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 6, 4, 'How does Galatians 6 tie practical community life to the message of the cross?', '["The cross produces humble restoration, burden-bearing, generosity, perseverance, and a rejection of fleshly boasting","The cross matters only for private belief, not community behavior","Community ethics replace the need for Christ\u0027s death","The cross supports boasting in religious achievement"]'::jsonb, 'The cross produces humble restoration, burden-bearing, generosity, perseverance, and a rejection of fleshly boasting', 'Galatians 6 moves from restoration and burden-bearing to doing good and finally to boasting only in the cross, showing how gospel truth shapes communal life (Galatians 6:1-2, 6-10, 14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Galatians 6 tie practical community life to the message of the cross?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 6, 4, 'Why does Paul end Galatians by contrasting circumcision with new creation?', '["He summarizes the whole letter by showing that external badges do not define God\u0027s people, but Christ\u0027s renewing work does","He now thinks circumcision is acceptable if modest","He wants to minimize the importance of Christ\u0027s cross","He is changing topics to cosmology"]'::jsonb, 'He summarizes the whole letter by showing that external badges do not define God''s people, but Christ''s renewing work does', 'Paul concludes that neither circumcision nor uncircumcision counts, but a new creation, gathering up the letter''s argument against fleshly boasting (Galatians 6:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul end Galatians by contrasting circumcision with new creation?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 6, 4, 'What does the sowing-and-reaping principle contribute to Paul''s argument in Galatians?', '["It shows that grace does not cancel moral reality but redirects life toward the Spirit and its harvest","It teaches that salvation is earned by enough good deeds","It contradicts justification by faith","It applies only to financial giving"]'::jsonb, 'It shows that grace does not cancel moral reality but redirects life toward the Spirit and its harvest', 'Paul warns against sowing to the flesh and calls believers to sow to the Spirit, showing that the gospel leads into real moral consequences and hope (Galatians 6:7-9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'What does the sowing-and-reaping principle contribute to Paul''s argument in Galatians?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 6, 4, 'How does Paul''s command to do good to all, especially to the household of faith, fit the letter''s earlier teaching?', '["It shows that gospel freedom expresses itself in ordered love that starts within the church and reaches outward","It limits goodness to church members alone","It reverses the command to love one\u0027s neighbor","It replaces faith with philanthropy"]'::jsonb, 'It shows that gospel freedom expresses itself in ordered love that starts within the church and reaches outward', 'Paul''s command to do good to all, especially fellow believers, extends the letter''s call to faith working through love and mutual service (Galatians 5:6, 13; 6:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Paul''s command to do good to all, especially to the household of faith, fit the letter''s earlier teaching?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 6, 5, 'What is the theological significance of Paul''s phrase ''the Israel of God'' in Galatians 6 within this letter''s argument?', '["It belongs with his blessing on those who follow the rule of new creation rather than fleshly markers","It simply repeats the circumcision teachers\u0027 position","It means ethnic descent alone is the final issue of the letter","It denies peace and mercy to Gentile believers"]'::jsonb, 'It belongs with his blessing on those who follow the rule of new creation rather than fleshly markers', 'Paul pronounces peace and mercy on those who walk by this rule, in the immediate context of new creation over against circumcision or uncircumcision as grounds of boasting (Galatians 6:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'What is the theological significance of Paul''s phrase ''the Israel of God'' in Galatians 6 within this letter''s argument?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 6, 5, 'How does Galatians 6 show that grace creates responsibility without reverting to legalism?', '["Paul calls believers to concrete Spirit-shaped obedience while rooting identity and boasting only in Christ\u0027s cross","Grace removes every obligation from Christian life","Responsibility returns only through circumcision","Legalism is needed to produce generosity"]'::jsonb, 'Paul calls believers to concrete Spirit-shaped obedience while rooting identity and boasting only in Christ''s cross', 'The chapter combines restoration, burden-bearing, sowing to the Spirit, perseverance in doing good, and boasting only in the cross rather than in fleshly badges (Galatians 6:1-10, 14-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Galatians 6 show that grace creates responsibility without reverting to legalism?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 6, 5, 'Why is boasting in the cross the fitting final boast of Galatians?', '["Because the cross overturns all confidence in fleshly status and defines the believer\u0027s new world and identity","Because Paul wanted a dramatic closing phrase only","Because the cross matters less than new creation","Because boasting itself is spiritually neutral"]'::jsonb, 'Because the cross overturns all confidence in fleshly status and defines the believer''s new world and identity', 'Paul''s final boast rejects circumcision-centered pride and says the cross has crucified the world to him and him to the world (Galatians 6:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is boasting in the cross the fitting final boast of Galatians?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 6, 5, 'How does the theme of new creation in Galatians 6 gather together the whole letter?', '["It summarizes life by promise, Spirit, freedom, and cross rather than by law as a fleshly badge","It introduces a topic unrelated to justification and sonship","It means believers escape the material world entirely","It applies only after death"]'::jsonb, 'It summarizes life by promise, Spirit, freedom, and cross rather than by law as a fleshly badge', 'New creation captures the result of God''s work in Christ and the Spirit that the letter has defended against law-centered boasting from beginning to end (Galatians 3:2-5; 4:6-7; 5:1, 16; 6:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does the theme of new creation in Galatians 6 gather together the whole letter?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 1, 1, 'According to Galatians 1, whom did Paul say he saw besides Cephas when he visited Jerusalem?', '["James the Lord\u0027s brother","Barnabas","Titus","Stephen"]'::jsonb, 'James the Lord''s brother', 'Paul says he saw none of the other apostles except James, the Lord''s brother (Galatians 1:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 1, whom did Paul say he saw besides Cephas when he visited Jerusalem?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 1, 1, 'According to Galatians 1, to what regions did Paul later go after Jerusalem?', '["Syria and Cilicia","Asia and Bithynia","Macedonia and Achaia","Egypt and Libya"]'::jsonb, 'Syria and Cilicia', 'Paul says he came into the regions of Syria and Cilicia (Galatians 1:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 1
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 1, to what regions did Paul later go after Jerusalem?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 1, 2, 'What does Paul say he would not be if he were still pleasing men?', '["A servant of Christ","An apostle to the Gentiles","A child of Abraham","A Roman citizen"]'::jsonb, 'A servant of Christ', 'Paul says if he were still trying to please men, he would not be a servant of Christ (Galatians 1:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say he would not be if he were still pleasing men?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 1, 2, 'How long did Paul stay with Cephas according to Galatians 1?', '["Fifteen days","Three days","Forty days","One year"]'::jsonb, 'Fifteen days', 'Paul says he stayed with Cephas fifteen days (Galatians 1:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 1
    AND q.difficulty_stage = 2
    AND q.prompt = 'How long did Paul stay with Cephas according to Galatians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 1, 3, 'Why does Paul solemnly say before God that he is not lying in Galatians 1?', '["He wants to stress the truthfulness of his account about the source of his gospel","He is uncertain about his memories","He is answering a Roman legal charge","He wants to boast about traveling more than the others"]'::jsonb, 'He wants to stress the truthfulness of his account about the source of his gospel', 'Paul inserts a solemn truth claim while recounting his limited contact with Jerusalem, reinforcing that his gospel was not learned from men (Galatians 1:20).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul solemnly say before God that he is not lying in Galatians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 1, 3, 'What does the response of the Judean churches reveal in Galatians 1?', '["God\u0027s grace can transform a persecutor into a preacher of the faith","Jerusalem still rejected Paul completely","The gospel spread mainly by force","Former sins cancel future ministry forever"]'::jsonb, 'God''s grace can transform a persecutor into a preacher of the faith', 'The churches glorified God because the one who had once persecuted them was now preaching the faith he once destroyed (Galatians 1:23-24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 1
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does the response of the Judean churches reveal in Galatians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 1, 4, 'How does Paul''s limited contact with Jerusalem support his argument in Galatians 1?', '["It shows his gospel was not the product of extended dependence on the Jerusalem apostles","It proves Jerusalem opposed Christ\u0027s message","It shows Paul rejected all fellowship in the church","It means the apostles had nothing to teach anyone"]'::jsonb, 'It shows his gospel was not the product of extended dependence on the Jerusalem apostles', 'Paul emphasizes that after his calling he did not immediately consult with men and later saw only Cephas and James briefly (Galatians 1:16-19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Paul''s limited contact with Jerusalem support his argument in Galatians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 1, 4, 'Why does Galatians 1 begin with Christ giving himself for our sins before Paul defends his apostleship?', '["Paul roots the letter\u0027s authority dispute inside the prior reality of Christ\u0027s saving work and grace","Paul changes topics and abandons the gospel immediately","The cross is less important than the apostolic question","Apostleship creates the gospel rather than serving it"]'::jsonb, 'Paul roots the letter''s authority dispute inside the prior reality of Christ''s saving work and grace', 'The opening doxology centers on Christ''s self-giving deliverance, after which Paul defends the divine source of the gospel he serves (Galatians 1:3-5, 11-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 1
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Galatians 1 begin with Christ giving himself for our sins before Paul defends his apostleship?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 1, 5, 'How does Galatians 1 distinguish divine revelation from inherited religious tradition?', '["Paul\u0027s former zeal for tradition is overturned by God\u0027s direct revelation of his Son and gospel","Tradition always carries the same authority as Christ\u0027s revelation","Revelation exists only to confirm human systems unchanged","Inherited religion is sufficient to reveal Christ fully"]'::jsonb, 'Paul''s former zeal for tradition is overturned by God''s direct revelation of his Son and gospel', 'Paul contrasts his former zeal for the traditions of his fathers with God''s revelation of his Son and the gospel not received from man (Galatians 1:12, 14-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Galatians 1 distinguish divine revelation from inherited religious tradition?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 1, 5, 'Why is the curse on another gospel so severe in Galatians 1?', '["Because altering the gospel attacks the only God-given message of rescue in Christ","Because Paul dislikes disagreement of any kind","Because angels are forbidden to speak to humans","Because minor wording differences always destroy salvation"]'::jsonb, 'Because altering the gospel attacks the only God-given message of rescue in Christ', 'Paul''s strong language follows immediately after declaring Christ''s saving self-giving and insisting the gospel came by revelation, not human revision (Galatians 1:4, 8-12).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 1
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the curse on another gospel so severe in Galatians 1?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 2, 1, 'According to Galatians 2, which men were recognized as pillars?', '["James, Cephas, and John","Paul, Barnabas, and Titus","Peter, Andrew, and Philip","Moses, Elijah, and David"]'::jsonb, 'James, Cephas, and John', 'Paul says James, Cephas, and John were reputed to be pillars (Galatians 2:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 2, which men were recognized as pillars?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 2, 1, 'According to Galatians 2, what did Paul say he had died to through the law?', '["The law","The nations","His apostleship","The promise"]'::jsonb, 'The law', 'Paul says, ''Through the law, I died to the law, that I might live to God'' (Galatians 2:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 2
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 2, what did Paul say he had died to through the law?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 2, 2, 'Why did false brothers slip in according to Galatians 2?', '["To spy out the freedom believers have in Christ Jesus","To encourage Gentile mission","To collect an offering for Jerusalem","To defend Titus publicly"]'::jsonb, 'To spy out the freedom believers have in Christ Jesus', 'Paul says false brothers came in secretly to spy out the freedom believers have in Christ Jesus so they might bring them into bondage (Galatians 2:4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why did false brothers slip in according to Galatians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 2, 2, 'What did Paul say the leaders in Jerusalem add to him?', '["Nothing","The full law of Moses","A second gospel for Gentiles","A command to stop preaching"]'::jsonb, 'Nothing', 'Paul says those who were reputed to be something imparted nothing new to him (Galatians 2:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 2
    AND q.difficulty_stage = 2
    AND q.prompt = 'What did Paul say the leaders in Jerusalem add to him?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 2, 3, 'Why is Paul''s public rebuke of Cephas significant in Galatians 2?', '["Even leading apostles must be corrected when their conduct denies gospel truth","Paul wanted to prove he was harsher than Peter","Personal conflict is the main theme of the letter","Apostolic authority makes behavior irrelevant"]'::jsonb, 'Even leading apostles must be corrected when their conduct denies gospel truth', 'Paul opposed Cephas publicly because his withdrawal from Gentiles contradicted the truth of the gospel (Galatians 2:11-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why is Paul''s public rebuke of Cephas significant in Galatians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 2, 3, 'What does Galatians 2 show about justification and ethnic identity?', '["Neither Jews nor Gentiles are justified by works of law, but by faith in Christ","Jews are justified one way and Gentiles another","Ethnic privilege guarantees righteousness before God","Only Gentiles need faith in Christ"]'::jsonb, 'Neither Jews nor Gentiles are justified by works of law, but by faith in Christ', 'Paul says ''we, being Jews by nature'' know that a person is not justified by works of law but through faith in Christ Jesus (Galatians 2:15-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 2
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Galatians 2 show about justification and ethnic identity?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 2, 4, 'How does the Jerusalem meeting in Galatians 2 support gospel unity without flattening distinct callings?', '["The apostles shared one gospel while recognizing distinct spheres of labor among circumcised and uncircumcised hearers","Different groups received different standards of justification","Unity required Titus to be circumcised eventually","Paul\u0027s mission depended entirely on Jerusalem\u0027s permission"]'::jsonb, 'The apostles shared one gospel while recognizing distinct spheres of labor among circumcised and uncircumcised hearers', 'Paul describes shared fellowship and recognition of distinct entrusted ministries while maintaining one gospel truth (Galatians 2:7-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the Jerusalem meeting in Galatians 2 support gospel unity without flattening distinct callings?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 2, 4, 'Why is rebuilding what he destroyed a problem in Galatians 2?', '["Returning to law-based righteousness would expose Paul as a transgressor against the gospel he now preaches","Paul is talking only about physical buildings in Jerusalem","The old life under law was morally neutral to him","Rebuilding is condemned only for apostles"]'::jsonb, 'Returning to law-based righteousness would expose Paul as a transgressor against the gospel he now preaches', 'Paul says if he rebuilds what he destroyed, he proves himself a transgressor, in the context of rejecting justification by law (Galatians 2:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 2
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why is rebuilding what he destroyed a problem in Galatians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 2, 5, 'How does Galatians 2 show that the truth of the gospel is social as well as doctrinal?', '["Justification by faith must reshape table fellowship and communal life, not remain a private formula","Doctrine matters, but social behavior is unrelated","Only outward unity matters, regardless of truth","The gospel changes beliefs but never relationships"]'::jsonb, 'Justification by faith must reshape table fellowship and communal life, not remain a private formula', 'Paul treats Peter''s refusal to eat with Gentiles as a denial in practice of the gospel''s truth about justification and shared belonging in Christ (Galatians 2:12-16).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Galatians 2 show that the truth of the gospel is social as well as doctrinal?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 2, 5, 'Why is Paul''s statement ''I do not nullify the grace of God'' central to Galatians 2?', '["To seek righteousness through law would treat Christ\u0027s death as unnecessary and thus empty grace of its meaning","Grace is important only for weak believers","Law and grace are identical paths to life","Grace matters only after death"]'::jsonb, 'To seek righteousness through law would treat Christ''s death as unnecessary and thus empty grace of its meaning', 'Paul ends the chapter by saying that if righteousness were through the law, then Christ died for nothing (Galatians 2:21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 2
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is Paul''s statement ''I do not nullify the grace of God'' central to Galatians 2?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 3, 1, 'According to Galatians 3, what came on the Gentiles through Christ Jesus?', '["The blessing of Abraham","The bondage of Sinai","The yoke of circumcision","The power of Rome"]'::jsonb, 'The blessing of Abraham', 'Paul says the blessing of Abraham came on the Gentiles in Christ Jesus (Galatians 3:14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 3, what came on the Gentiles through Christ Jesus?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 3, 1, 'According to Galatians 3, what are believers if they belong to Christ?', '["Abraham\u0027s offspring and heirs according to promise","Debtors to the whole law","Children of Hagar","Strangers to the covenant"]'::jsonb, 'Abraham''s offspring and heirs according to promise', 'Paul says if you are Christ''s, then you are Abraham''s offspring and heirs according to promise (Galatians 3:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 3
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 3, what are believers if they belong to Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 3, 2, 'What Scripture does Paul cite to show the curse on those who rely on works of law?', '["Cursed is everyone who doesn\u0027t continue in all things written in the book of the law","The just shall live by faith","In you all nations shall be blessed","Honor your father and mother"]'::jsonb, 'Cursed is everyone who doesn''t continue in all things written in the book of the law', 'Paul cites Scripture saying everyone is cursed who does not continue in all things written in the book of the law (Galatians 3:10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'What Scripture does Paul cite to show the curse on those who rely on works of law?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 3, 2, 'How was the law ordained according to Galatians 3?', '["Through angels by the hand of a mediator","Directly through Paul in Arabia","By the nations agreeing together","Through the priests of Jerusalem"]'::jsonb, 'Through angels by the hand of a mediator', 'Paul says the law was ordained through angels by the hand of a mediator (Galatians 3:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 3
    AND q.difficulty_stage = 2
    AND q.prompt = 'How was the law ordained according to Galatians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 3, 3, 'Why does Paul ask whether they suffered so many things in vain in Galatians 3?', '["He warns that turning to law after beginning by faith would empty their earlier endurance of its proper meaning","He doubts they were ever converted","He thinks suffering itself justifies a person","He wants them to avoid remembering hardship"]'::jsonb, 'He warns that turning to law after beginning by faith would empty their earlier endurance of its proper meaning', 'Paul rebukes them for shifting from the Spirit to the flesh and then asks whether they suffered so many things in vain, if indeed it really was in vain (Galatians 3:3-4).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul ask whether they suffered so many things in vain in Galatians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 3, 3, 'What does Galatians 3 imply about the relationship between promise and inheritance?', '["Inheritance comes by God\u0027s promise rather than by law-based earning","Inheritance is secured mainly by circumcision","The law strengthens the promise by adding merit","Promise is only symbolic and not effective"]'::jsonb, 'Inheritance comes by God''s promise rather than by law-based earning', 'Paul says if the inheritance is of the law, it is no more of promise, but God granted it to Abraham by promise (Galatians 3:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 3
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Galatians 3 imply about the relationship between promise and inheritance?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 3, 4, 'How does Galatians 3 portray the law as temporary without making it meaningless?', '["The law served as a guardian and was added because of transgressions until Christ came","The law failed because God regretted giving it","The law has value only for ethnic Israel and no broader purpose","The law and promise are contradictory revelations from different gods"]'::jsonb, 'The law served as a guardian and was added because of transgressions until Christ came', 'Paul says the law was added because of transgressions until the offspring should come, and later calls it a tutor until Christ (Galatians 3:19, 24-25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Galatians 3 portray the law as temporary without making it meaningless?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 3, 4, 'Why does Paul move from Abraham to baptism in Galatians 3?', '["To show that the promise given to Abraham now defines the identity of those united to Christ","To replace faith with ritual action","To suggest Abraham was outside God\u0027s covenant","To argue that baptism alone makes law unnecessary"]'::jsonb, 'To show that the promise given to Abraham now defines the identity of those united to Christ', 'Paul argues from Abraham''s promise and then says those baptized into Christ have put on Christ and belong to Abraham''s offspring (Galatians 3:27-29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 3
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul move from Abraham to baptism in Galatians 3?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 3, 5, 'How does Galatians 3 present Christ as the turning point of redemptive history?', '["The law\u0027s temporary guardianship gives way to the promised offspring in whom blessing, faith, and sonship come to fulfillment","Christ simply repeats Sinai under a gentler form","History remains unchanged after Christ\u0027s coming","Faith in Christ matters only for Gentiles"]'::jsonb, 'The law''s temporary guardianship gives way to the promised offspring in whom blessing, faith, and sonship come to fulfillment', 'Paul presents Christ as Abraham''s offspring, the redeemer from the curse, and the one after whose coming believers are no longer under the law''s tutor (Galatians 3:13-14, 16, 24-26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Galatians 3 present Christ as the turning point of redemptive history?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 3, 5, 'Why is the unity formula in Galatians 3:28 theologically important?', '["It declares equal covenant standing in Christ without erasing the reality of embodied human life","It abolishes all earthly callings and relationships entirely","It teaches social sameness is the basis of salvation","It applies only inside public worship services"]'::jsonb, 'It declares equal covenant standing in Christ without erasing the reality of embodied human life', 'Paul''s point is that all alike are one in Christ Jesus and equally heirs according to promise, not that creaturely distinctions cease to exist physically (Galatians 3:28-29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 3
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why is the unity formula in Galatians 3:28 theologically important?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 4, 1, 'According to Galatians 4, what do the children of God cry?', '["Abba, Father","Lord of hosts","Give us the law","Return us to Sinai"]'::jsonb, 'Abba, Father', 'Paul says God sent the Spirit of his Son into our hearts, crying, ''Abba, Father'' (Galatians 4:6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 4, what do the children of God cry?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 4, 1, 'According to Galatians 4, who persecuted the child born according to the Spirit?', '["The one born according to the flesh","The apostles in Jerusalem","The Romans","The prophets of Baal"]'::jsonb, 'The one born according to the flesh', 'Paul says the one born according to the flesh persecuted the one born according to the Spirit (Galatians 4:29).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 4
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 4, who persecuted the child born according to the Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 4, 2, 'What does Paul say the Galatians would have done for him at first if possible?', '["They would have plucked out their eyes and given them to him","They would have sent him back to Jerusalem","They would have made him a magistrate","They would have hidden his message"]'::jsonb, 'They would have plucked out their eyes and given them to him', 'Paul says they would have plucked out their eyes and given them to him if possible (Galatians 4:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say the Galatians would have done for him at first if possible?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 4, 2, 'Why do the false teachers zealously seek the Galatians according to Galatians 4?', '["They want to shut them out so the Galatians will seek them","They want to free them from every burden","They want to remember the poor","They want to strengthen them in the Spirit"]'::jsonb, 'They want to shut them out so the Galatians will seek them', 'Paul says the false teachers court the Galatians not well, but want to shut them out so the Galatians will seek them (Galatians 4:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 4
    AND q.difficulty_stage = 2
    AND q.prompt = 'Why do the false teachers zealously seek the Galatians according to Galatians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 4, 3, 'What does Galatians 4 imply about spiritual slavery after Christ has come?', '["Returning to law-centered bondage after adoption is a regression from sonship to servitude","Slavery is necessary for maturity in Christ","Only Gentiles face the danger of bondage","Sonship and slavery are identical in practice"]'::jsonb, 'Returning to law-centered bondage after adoption is a regression from sonship to servitude', 'Paul contrasts sonship and heirship with bondage under elemental principles, warning against going backward after God''s saving action in Christ (Galatians 4:3-7, 9-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Galatians 4 imply about spiritual slavery after Christ has come?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 4, 3, 'Why does Paul use maternal language about labor in Galatians 4?', '["He expresses pastoral anguish until Christ\u0027s character is formed in the believers","He wants to redefine himself biologically","He is changing topics to family history","He is rejecting doctrinal teaching for emotion"]'::jsonb, 'He expresses pastoral anguish until Christ''s character is formed in the believers', 'Paul says he is in labor again until Christ is formed in them, showing deep pastoral concern (Galatians 4:19).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 4
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul use maternal language about labor in Galatians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 4, 4, 'How does Galatians 4 connect the sending of the Son and the sending of the Spirit?', '["The Son secures redemption and adoption, and the Spirit confirms sonship within believers\u0027 hearts","The Spirit replaces the Son once redemption is finished","The Son and Spirit perform unrelated works","Only the Spirit matters in sonship"]'::jsonb, 'The Son secures redemption and adoption, and the Spirit confirms sonship within believers'' hearts', 'Paul says God sent forth his Son to redeem those under the law, and because believers are sons he sent the Spirit of his Son into their hearts (Galatians 4:4-6).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Galatians 4 connect the sending of the Son and the sending of the Spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 4, 4, 'Why does Paul shift from doctrinal allegory to intensely personal appeal in Galatians 4?', '["He wants the Galatians to feel both the theological truth and the pastoral urgency of their crisis","He can no longer argue from Scripture effectively","He thinks emotions are more important than truth","He abandons concern for the churches\u0027 future"]'::jsonb, 'He wants the Galatians to feel both the theological truth and the pastoral urgency of their crisis', 'The chapter moves from sonship and allegory to memories of their earlier affection and Paul''s present anguish, blending doctrine and pastoral appeal (Galatians 4:12-20, 21-31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul shift from doctrinal allegory to intensely personal appeal in Galatians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 4, 4, 'How does the command to cast out the servant woman and her son function in Galatians 4?', '["It dramatizes that inheritance does not remain with the line of slavery but with the promise","It calls believers to literal family expulsion","It means Abraham rejected God\u0027s promise","It teaches the church should abandon Scripture\u0027s history"]'::jsonb, 'It dramatizes that inheritance does not remain with the line of slavery but with the promise', 'Paul uses Sarah and Hagar typologically, quoting the command to cast out the slave woman to show the incompatibility of slavery and promised inheritance (Galatians 4:30-31).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 4
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the command to cast out the servant woman and her son function in Galatians 4?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 4, 5, 'How does Galatians 4 deepen Paul''s doctrine of adoption beyond legal standing?', '["Adoption includes intimate filial communion with God through the indwelling Spirit of the Son","Adoption means only a future change of status with no present experience","Adoption belongs only to Jewish believers","Adoption is earned through observance of sacred times"]'::jsonb, 'Adoption includes intimate filial communion with God through the indwelling Spirit of the Son', 'Paul connects adoption with the Spirit crying ''Abba, Father,'' showing a lived relationship with God, not a merely formal status (Galatians 4:5-7).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Galatians 4 deepen Paul''s doctrine of adoption beyond legal standing?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 4, 5, 'What does Galatians 4 suggest about reading Old Testament history after Christ?', '["The history of Hagar and Sarah can be read as bearing forward-looking significance for covenant identity in Christ","Old Testament narratives lose all relevance after Christ","Historical events should never be interpreted theologically","Only literal geography matters in Abraham\u0027s story"]'::jsonb, 'The history of Hagar and Sarah can be read as bearing forward-looking significance for covenant identity in Christ', 'Paul explicitly says these things contain an allegory, using the historical account to illuminate slavery, promise, and the Jerusalem above (Galatians 4:24-26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 4
    AND q.difficulty_stage = 5
    AND q.prompt = 'What does Galatians 4 suggest about reading Old Testament history after Christ?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 5, 1, 'According to Galatians 5, what will a little leaven do?', '["Leaven the whole lump","Purify the whole lump","Strengthen the whole law","Remove every offense"]'::jsonb, 'Leaven the whole lump', 'Paul warns that a little leaven leavens the whole lump (Galatians 5:9).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 5, what will a little leaven do?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 5, 1, 'According to Galatians 5, what have those who belong to Christ Jesus crucified?', '["The flesh with its passions and lusts","The law and the prophets","Their neighbors and enemies","The promise given to Abraham"]'::jsonb, 'The flesh with its passions and lusts', 'Paul says those who belong to Christ Jesus have crucified the flesh with its passions and lusts (Galatians 5:24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 5
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 5, what have those who belong to Christ Jesus crucified?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 5, 2, 'What does Paul say about waiting in Galatians 5?', '["By the Spirit, believers wait for the hope of righteousness by faith","Believers wait for righteousness through circumcision","The church should wait for the law to justify it","Hope is unnecessary once faith begins"]'::jsonb, 'By the Spirit, believers wait for the hope of righteousness by faith', 'Paul says through the Spirit, by faith, believers wait for the hope of righteousness (Galatians 5:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say about waiting in Galatians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 5, 2, 'What warning does Paul give if the Galatians bite and devour one another?', '["They may be consumed by one another","They will become more spiritually mature","They will fulfill the whole law","They will gain freedom through conflict"]'::jsonb, 'They may be consumed by one another', 'Paul warns that if they bite and devour one another, they should watch out lest they be consumed by one another (Galatians 5:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 5
    AND q.difficulty_stage = 2
    AND q.prompt = 'What warning does Paul give if the Galatians bite and devour one another?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 5, 3, 'Why does Paul say ''the whole law is fulfilled in one word'' in Galatians 5?', '["True Spirit-shaped freedom expresses the law\u0027s moral aim in love for neighbor","The law no longer speaks to behavior at all","One command replaces the gospel of Christ","Neighbor-love is mainly ceremonial obedience"]'::jsonb, 'True Spirit-shaped freedom expresses the law''s moral aim in love for neighbor', 'Paul ties freedom to serving one another through love and says the whole law is fulfilled in loving your neighbor as yourself (Galatians 5:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Paul say ''the whole law is fulfilled in one word'' in Galatians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 5, 3, 'What does Galatians 5 imply about the works of the flesh and inheriting God''s kingdom?', '["Persistent fleshly practice is incompatible with the kingdom believers are called to inherit","The kingdom belongs mainly to those with stronger personalities","Works of the flesh do not affect spiritual destiny","Only food laws determine inheritance"]'::jsonb, 'Persistent fleshly practice is incompatible with the kingdom believers are called to inherit', 'Paul warns that those who practice the works of the flesh will not inherit God''s kingdom (Galatians 5:19-21).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 5
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Galatians 5 imply about the works of the flesh and inheriting God''s kingdom?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 5, 4, 'How does Galatians 5 answer the fear that freedom from circumcision leads to chaos?', '["Freedom is directed by the Spirit into love, self-control, and communal service rather than fleshly indulgence","Paul agrees lawlessness is inevitable without circumcision","Freedom has no moral direction at all","Chaos is solved only by stricter ceremonies"]'::jsonb, 'Freedom is directed by the Spirit into love, self-control, and communal service rather than fleshly indulgence', 'Paul rejects using freedom as an opportunity for the flesh and instead commands walking by the Spirit, which produces fruit like love and self-control (Galatians 5:13, 16, 22-23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Galatians 5 answer the fear that freedom from circumcision leads to chaos?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 5, 4, 'Why does Paul link faith and hope with the Spirit in Galatians 5?', '["The Christian life relies on the Spirit not only for present conduct but also for expectant confidence in God\u0027s final vindication","Hope replaces the need for faith once the Spirit comes","The Spirit functions only in moral discipline, not assurance","Faith, hope, and Spirit are unrelated topics in the chapter"]'::jsonb, 'The Christian life relies on the Spirit not only for present conduct but also for expectant confidence in God''s final vindication', 'Paul says believers through the Spirit wait by faith for the hope of righteousness, showing present and future dependence on God''s work (Galatians 5:5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul link faith and hope with the Spirit in Galatians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 5, 4, 'What is the significance of Paul''s warning against becoming conceited, provoking, and envying one another?', '["Life by the Spirit must produce humility in community, not competitive self-exaltation","Paul is changing to an unrelated social topic","Conceit matters less than doctrinal error","These sins are neutral if love is present"]'::jsonb, 'Life by the Spirit must produce humility in community, not competitive self-exaltation', 'Paul closes the chapter by warning against conceit, provocation, and envy immediately after calling believers to live and walk by the Spirit (Galatians 5:25-26).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 5
    AND q.difficulty_stage = 4
    AND q.prompt = 'What is the significance of Paul''s warning against becoming conceited, provoking, and envying one another?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 5, 5, 'How does Galatians 5 redefine obedience after rejecting justification by law?', '["Obedience becomes Spirit-produced conformity to Christ rather than an attempt to secure righteousness by law","Obedience disappears once faith begins","Lawkeeping remains the basis of acceptance before God","Only public morality matters under the Spirit"]'::jsonb, 'Obedience becomes Spirit-produced conformity to Christ rather than an attempt to secure righteousness by law', 'Paul rejects law-based justification yet commands Spirit-led living that yields the fruit of a transformed life (Galatians 5:4-6, 16-25).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Galatians 5 redefine obedience after rejecting justification by law?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 5, 5, 'Why does Paul place the fruit of the Spirit in the singular in Galatians 5?', '["It suggests a unified Spirit-shaped life rather than disconnected virtues chosen at random","Only one virtue in the list really matters","Paul made a grammatical mistake with no theological value","The Spirit gives different fruits to different classes of believers"]'::jsonb, 'It suggests a unified Spirit-shaped life rather than disconnected virtues chosen at random', 'Paul presents the fruit of the Spirit as one organic pattern of life in contrast to the many works of the flesh (Galatians 5:19-23).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does Paul place the fruit of the Spirit in the singular in Galatians 5?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 5, 5, 'How does Galatians 5 portray Christian freedom as cruciform?', '["Those who belong to Christ exercise freedom through a life marked by the death of the flesh and love for others","Freedom means the self may finally rule without restraint","The cross matters only for justification, not for daily life","Believers escape all inner conflict immediately"]'::jsonb, 'Those who belong to Christ exercise freedom through a life marked by the death of the flesh and love for others', 'Paul says believers belong to Christ, have crucified the flesh, and use freedom not for the flesh but for serving one another through love (Galatians 5:13, 24).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 5
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Galatians 5 portray Christian freedom as cruciform?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 6, 1, 'According to Galatians 6, what will the one who sows to the Spirit reap?', '["Eternal life","Corruption","Only earthly reward","The yoke of the law"]'::jsonb, 'Eternal life', 'Paul says the one who sows to the Spirit will reap eternal life from the Spirit (Galatians 6:8).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 6, what will the one who sows to the Spirit reap?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 6, 1, 'According to Galatians 6, what does Paul bear on his body?', '["The marks of Jesus","The sign of circumcision","The robes of apostleship","The seal of Jerusalem"]'::jsonb, 'The marks of Jesus', 'Paul says he bears in his body the marks of Jesus (Galatians 6:17).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 6
    AND q.difficulty_stage = 1
    AND q.prompt = 'According to Galatians 6, what does Paul bear on his body?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 6, 2, 'What law is fulfilled by bearing one another''s burdens according to Galatians 6?', '["The law of Christ","The ceremonial law","The law of Moses alone","The law of the nations"]'::jsonb, 'The law of Christ', 'Paul says bearing one another''s burdens fulfills the law of Christ (Galatians 6:2).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'What law is fulfilled by bearing one another''s burdens according to Galatians 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 6, 2, 'What does Paul say a person deceives if he thinks he is something when he is nothing?', '["Himself","The whole church","God","The Roman rulers"]'::jsonb, 'Himself', 'Paul says if a person thinks he is something when he is nothing, he deceives himself (Galatians 6:3).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 6
    AND q.difficulty_stage = 2
    AND q.prompt = 'What does Paul say a person deceives if he thinks he is something when he is nothing?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 6, 3, 'Why does Galatians 6 balance burden-bearing with each person carrying his own load?', '["Christian life joins compassionate mutual care with personal responsibility before God","The two commands cancel each other out completely","Paul forgot what he had written in the previous verse","Believers should avoid helping others in serious trouble"]'::jsonb, 'Christian life joins compassionate mutual care with personal responsibility before God', 'Paul tells believers to bear one another''s burdens and also says each one will carry his own load, balancing solidarity and accountability (Galatians 6:2, 5).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'Why does Galatians 6 balance burden-bearing with each person carrying his own load?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 6, 3, 'What does Galatians 6 suggest about boasting?', '["Legitimate boasting is found only in the cross, not in outward fleshly markers","Boasting is encouraged if it is religious","Paul rejects all kinds of glorying, including in Christ","Boasting is acceptable when others notice it"]'::jsonb, 'Legitimate boasting is found only in the cross, not in outward fleshly markers', 'Paul contrasts the false teachers'' desire to boast in the flesh with his own boast only in the cross of Christ (Galatians 6:13-14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 6
    AND q.difficulty_stage = 3
    AND q.prompt = 'What does Galatians 6 suggest about boasting?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 6, 4, 'How does Galatians 6 connect restoration and self-watchfulness?', '["The work of gently restoring others requires humility because the restorer is also vulnerable to temptation","Restoration belongs only to those beyond temptation","Gentleness is less important than speed in correction","Self-watchfulness replaces the need to help others"]'::jsonb, 'The work of gently restoring others requires humility because the restorer is also vulnerable to temptation', 'Paul tells spiritual believers to restore gently while watching themselves lest they too be tempted (Galatians 6:1).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does Galatians 6 connect restoration and self-watchfulness?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 6, 4, 'Why does Paul expose the circumcision party''s motives again at the end of Galatians 6?', '["He closes the letter by contrasting external religious boasting with the cross-centered identity of the gospel","He now agrees with their message but not their style","He thinks motives matter more than doctrine","He has stopped caring about the truth of justification"]'::jsonb, 'He closes the letter by contrasting external religious boasting with the cross-centered identity of the gospel', 'Paul says they want to boast in the flesh and avoid persecution, while he boasts only in the cross and in new creation (Galatians 6:12-15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'Why does Paul expose the circumcision party''s motives again at the end of Galatians 6?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 6, 4, 'How does the sowing and reaping principle in Galatians 6 protect the doctrine of grace from distortion?', '["Grace does not erase moral consequence but redirects believers toward Spirit-shaped living and patient endurance","Grace means actions have no lasting significance","Grace turns salvation into mere self-improvement","Grace works only through visible religious badges"]'::jsonb, 'Grace does not erase moral consequence but redirects believers toward Spirit-shaped living and patient endurance', 'Paul warns that God is not mocked and then urges sowing to the Spirit and persevering in doing good (Galatians 6:7-10).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 6
    AND q.difficulty_stage = 4
    AND q.prompt = 'How does the sowing and reaping principle in Galatians 6 protect the doctrine of grace from distortion?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 6, 5, 'How does Galatians 6 present new creation as the answer to fleshly religion?', '["The gospel\u0027s true badge is God\u0027s renewing work in Christ, not visible status markers in the flesh","New creation means the body no longer matters","Fleshly religion can produce new creation if pursued intensely enough","New creation is postponed until the law is fully kept"]'::jsonb, 'The gospel''s true badge is God''s renewing work in Christ, not visible status markers in the flesh', 'Paul says neither circumcision nor uncircumcision counts for anything, but a new creation (Galatians 6:15).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Galatians 6 present new creation as the answer to fleshly religion?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 6, 5, 'Why does Paul end Galatians with grace to the believers'' spirit?', '["The letter closes where it began, with divine grace as the sustaining reality for those who belong to Christ","Grace is only a polite ending formula with no connection to the argument","Paul now shifts from grace back to law in his conclusion","The spirit matters, but the gospel has no bodily implications"]'::jsonb, 'The letter closes where it began, with divine grace as the sustaining reality for those who belong to Christ', 'Paul''s closing benediction of grace matches the letter''s opening emphasis on Christ''s gracious self-giving and the whole argument against law-based boasting (Galatians 1:3-4; 6:18).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'Why does Paul end Galatians with grace to the believers'' spirit?'
);

INSERT INTO quiz_question_bank (book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)
SELECT 48, 6, 5, 'How does Galatians 6 unite pastoral care, moral seriousness, and gospel boasting?', '["The chapter calls believers to restore gently, sow to the Spirit, persevere in good, and boast only in the cross","Pastoral care and moral seriousness replace the need for the cross","Boasting in the cross makes practical obedience unnecessary","The chapter is mainly a miscellaneous ending without coherent focus"]'::jsonb, 'The chapter calls believers to restore gently, sow to the Spirit, persevere in good, and boast only in the cross', 'Galatians 6 combines restoration, burden-bearing, sowing and reaping, perseverance in doing good, and boasting only in the cross as one coherent conclusion (Galatians 6:1-2, 7-10, 14).'
WHERE NOT EXISTS (
  SELECT 1 FROM quiz_question_bank q
  WHERE q.book_number = 48
    AND q.chapter = 6
    AND q.difficulty_stage = 5
    AND q.prompt = 'How does Galatians 6 unite pastoral care, moral seriousness, and gospel boasting?'
);

