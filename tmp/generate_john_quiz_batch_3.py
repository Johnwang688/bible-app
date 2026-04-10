import json
import os
import random
from collections import Counter

random.seed(43)

actor_pool = [
    "Jesus",
    "Mary",
    "Martha",
    "Lazarus",
    "Judas Iscariot",
    "Philip",
    "Andrew",
    "the Greeks",
    "chief priests",
    "Pharisees",
    "rulers",
    "Isaiah",
    "Simon Peter",
    "Thomas",
    "Nicodemus",
    "Annas",
    "Caiaphas",
    "Pilate",
    "Barabbas",
    "Joseph of Arimathaea",
    "Mary Magdalene",
    "the disciple whom Jesus loved",
    "the Samaritan woman",
    "a nobleman",
    "disciples",
    "the crowd",
    "Satan",
    "the devil",
    "the Father",
    "the Spirit",
    "the Counselor",
    "the world",
    "the prince of this world",
    "Moses",
    "John the Baptist",
    "the Jews",
    "the Romans",
    "the believers",
]

place_pool = [
    "Bethany",
    "Jerusalem",
    "Galilee",
    "Judea",
    "Samaria",
    "Sychar",
    "Cana",
    "Bethesda",
    "Kidron",
    "Golgotha",
    "the Praetorium",
    "the garden",
    "the temple",
    "Capernaum",
    "Bethsaida",
    "Salim",
    "the Sea of Tiberias",
    "the Sea of Galilee",
    "the upper room",
    "the synagogue",
    "the tomb",
    "Nazareth",
    "Bethlehem",
    "the Mount of Olives",
    "the countryside of Judea",
    "the wilderness",
    "the pool of Bethesda",
]

thing_pool = [
    "nard",
    "palm branches",
    "a donkey's colt",
    "a money box",
    "a grain of wheat",
    "a basin of water",
    "a towel",
    "a dipped piece of bread",
    "bread",
    "fish",
    "a net",
    "a charcoal fire",
    "linen cloths",
    "spices",
    "wine",
    "water pots",
    "a serpent",
    "living water",
    "the vine",
    "branches",
    "a lamp",
    "a cup",
    "the cross",
    "a rooster",
    "a stone",
    "a burial cloth",
    "the face cloth",
    "a horse",
    "a chariot",
    "a camel",
    "a boat",
    "a sword",
    "a basket",
    "a scroll",
    "a crown of thorns",
    "perfume",
    "a jar",
    "the temple curtain",
]

time_pool = [
    "six days before Passover",
    "the next day",
    "at night",
    "the hour",
    "three times",
    "eight days later",
    "before dawn",
    "immediately",
    "while it was still dark",
    "after this",
    "during the feast",
    "on the third day",
    "before Passover",
    "when the rooster crowed",
    "at once",
]

concept_pool = [
    "burial",
    "glory",
    "belief",
    "unbelief",
    "light",
    "darkness",
    "eternal life",
    "judgment",
    "peace",
    "love",
    "unity",
    "fruitfulness",
    "abiding",
    "witness",
    "truth",
    "freedom",
    "service",
    "cleansing",
    "obedience",
    "prayer",
    "the world",
    "the Father",
    "the Son",
    "the Spirit",
    "fear",
    "confession",
    "humility",
    "sacrificial death",
    "sending",
    "revelation",
    "fulfillment",
    "hardening",
    "wrath",
    "joy",
    "overcoming",
    "resurrection",
    "ascension",
    "conviction",
    "pruning",
    "self-giving love",
    "cross-shaped glory",
    "humble kingship",
    "Spirit-led witness",
    "the world's hostility",
    "shared life with the Father",
    "fruit through death",
    "quiet faith",
    "public confession",
    "messianic hope",
    "new commandment",
    "true discipleship",
    "divine mission",
    "relational peace",
]

title_pool = [
    "King of Israel",
    "Son of God",
    "Messiah",
    "Son of Man",
    "Teacher",
    "Lamb of God",
    "Savior of the world",
    "the way, the truth, and the life",
    "true vine",
    "Counselor",
    "Holy Spirit",
    "Lord and God",
    "the bread of life",
    "light of the world",
]

quote_pool = [
    "She has kept this for the day of my burial",
    "Hosanna! Blessed is he who comes in the name of the Lord",
    "Sir, we want to see Jesus",
    "The time has come for the Son of Man to be glorified",
    "I have both glorified it, and will glorify it again",
    "If anyone is thirsty, let him come to me and drink",
    "He who believes in me, as the scripture has said",
    "I am the way, the truth, and the life",
    "Peace I leave with you",
    "I have overcome the world",
    "My Father is still working",
    "This is my commandment, that you love one another",
    "Receive the Holy Spirit",
    "If I don't wash you, you have no part with me",
    "You also should wash one another's feet",
    "Whoever has seen me has seen the Father",
    "It is to your advantage that I go away",
    "Apart from me you can do nothing",
    "Greater love has no one than this",
    "You did not choose me, but I chose you",
]

action_pool = [
    "wash feet",
    "go out into the night",
    "believe secretly",
    "remain in me",
    "bear much fruit",
    "convict the world",
    "keep my commandments",
    "ask in my name",
    "take up your cross",
    "follow me",
    "glorify the Father",
    "testify about me",
    "feed my sheep",
    "prepare a place",
    "love one another",
    "denied Jesus",
    "give life",
    "judge the world",
    "seek the lost",
    "draw all people",
    "remove a branch",
    "prune the branches",
    "cast out the ruler of this world",
    "sent the Counselor",
    "overcome the world",
]

phenomenon_pool = [
    "a voice from heaven",
    "thunder",
    "an angel",
    "a cloud",
    "a bright sign",
    "a loud cry",
    "the rooster crowing",
    "the Spirit descending",
    "an earthquake",
]

outcome_pool = [
    "believed secretly",
    "went out into the night",
    "were scattered",
    "were put out of the synagogue",
    "were not condemned",
    "passed from death to life",
    "returned to their own homes",
    "drew back and fell",
    "could not arrest him",
    "had no excuse for their sin",
    "kept silent",
    "confessed him openly",
    "followed him at a distance",
    "rejoiced at his voice",
    "refused to confess him",
]

long_pool_map = {
    "actor": [
        "the chief priests and Pharisees",
        "the disciples in the upper room",
        "the rulers who feared public opinion",
        "the Greek visitors through Philip",
        "the people gathered for the feast",
        "the unbelieving crowd in Jerusalem",
    ],
    "place": [
        "the village of Bethany near Jerusalem",
        "the courtyard of the high priest",
        "the road into the city",
        "the upper room in Jerusalem",
        "the shore of the Sea of Galilee",
        "the courtyard of the Praetorium",
    ],
    "thing": [
        "a jar of costly perfume",
        "a basin filled with water",
        "a piece of bread dipped in the dish",
        "a charcoal fire on the shore",
        "a branch cut from the vine",
        "a cloak laid on the road",
    ],
    "time": [
        "six days before the Passover feast",
        "at the very hour of the sign",
        "after the rooster had crowed",
        "on the evening of the feast",
        "before dawn on the third day",
        "while the crowd was still gathered",
    ],
    "concept": [
        "self-giving love that lays down life for friends",
        "the Father's glory revealed through the Son",
        "the world's hostility toward Jesus' witness",
        "Spirit-guided testimony in the church",
        "humble kingship that avoids force",
        "the cross as judgment and salvation together",
    ],
    "title": [
        "the way, the truth, and the life for all believers",
        "the true vine from whom fruit really comes",
        "the Counselor promised by the Father",
        "the King of Israel who comes in peace",
        "the Son of Man lifted up in glory",
        "the bread of life given for the world",
    ],
    "quote": [
        "I have both glorified it, and will glorify it again",
        "Whoever has seen me has seen the Father",
        "If I don't wash you, you have no part with me",
        "You did not choose me, but I chose you",
        "I have overcome the world",
        "It is to your advantage that I go away",
    ],
    "action": [
        "wash one another's feet in humility",
        "draw all people to himself when lifted up",
        "remain in Jesus and bear lasting fruit",
        "testify about Jesus by the Spirit's power",
        "keep his commandments and love one another",
        "go out into the night after the meal",
    ],
    "phenomenon": [
        "a voice from heaven answering the Son",
        "the rooster crowing before dawn",
        "the Spirit descending and remaining",
        "a bright sign given to the crowd",
        "thunder mistaken for a heavenly voice",
        "an audible witness from above",
    ],
    "outcome": [
        "believed secretly but would not confess",
        "went out into the night in darkness",
        "were scattered to their own places",
        "were put out of the synagogue for faith",
        "had no excuse for their sin anymore",
        "passed from death to life through belief",
    ],
}

pool_map = {
    "actor": actor_pool,
    "place": place_pool,
    "thing": thing_pool,
    "time": time_pool,
    "concept": concept_pool,
    "title": title_pool,
    "quote": quote_pool,
    "action": action_pool,
    "phenomenon": phenomenon_pool,
    "outcome": outcome_pool,
}

facts = [
    # John 12
    {
        "chapter": 12,
        "scene": "Mary's anointing of Jesus in Bethany",
        "answers": ["Bethany", "nard", "for burial", "devotion before burial", "foreshadowing Jesus' burial and death"],
        "kinds": ["place", "thing", "concept", "concept", "concept"],
    },
    {
        "chapter": 12,
        "scene": "Judas's complaint about the ointment",
        "answers": ["Judas Iscariot", "money box", "he was a thief", "false concern for the poor", "greed masquerading as mercy"],
        "kinds": ["actor", "thing", "concept", "concept", "concept"],
    },
    {
        "chapter": 12,
        "scene": "the chief priests' plot against Lazarus",
        "answers": ["Lazarus", "many Jews believed through him", "hostility toward a living sign", "signs can provoke murder", "witness and rejection together"],
        "kinds": ["actor", "concept", "concept", "concept", "concept"],
    },
    {
        "chapter": 12,
        "scene": "Jesus's entry into Jerusalem on a donkey's colt",
        "answers": ["a donkey's colt", "palm branches", "King of Israel", "humble kingship", "Zechariah's messianic king"],
        "kinds": ["thing", "thing", "title", "concept", "concept"],
    },
    {
        "chapter": 12,
        "scene": "the Greeks' request to see Jesus",
        "answers": ["the Greeks", "Philip and Andrew", "the hour had come", "Gentile interest in the Messiah", "the nations being drawn toward Jesus"],
        "kinds": ["actor", "actor", "concept", "concept", "concept"],
    },
    {
        "chapter": 12,
        "scene": "the Father's voice from heaven",
        "answers": ["a voice from heaven", "the Father's name", "I have glorified it", "divine affirmation", "heavenly witness to the Son"],
        "kinds": ["phenomenon", "concept", "quote", "concept", "concept"],
    },
    {
        "chapter": 12,
        "scene": "John's closing note on unbelief",
        "answers": ["Isaiah", "blinded hearts", "secret belief", "unbelief after signs", "fulfilled hardening and hidden confession"],
        "kinds": ["actor", "concept", "outcome", "concept", "concept"],
    },
    # John 13
    {
        "chapter": 13,
        "scene": "Jesus washing the disciples' feet",
        "answers": ["the disciples' feet", "a basin of water", "humble service", "servant love", "the Lord serving before the cross"],
        "kinds": ["thing", "thing", "concept", "concept", "concept"],
    },
    {
        "chapter": 13,
        "scene": "Judas receiving the dipped bread",
        "answers": ["Judas Iscariot", "a dipped piece of bread", "Satan entered into him", "betrayal in the darkness", "treachery after shared bread"],
        "kinds": ["actor", "thing", "outcome", "concept", "concept"],
    },
    {
        "chapter": 13,
        "scene": "Jesus saying not everyone is clean",
        "answers": ["not all of you", "the one who has bathed", "inner cleansing", "outward closeness is not enough", "true purity comes from Jesus"],
        "kinds": ["concept", "concept", "concept", "concept", "concept"],
    },
    {
        "chapter": 13,
        "scene": "Jesus giving the new commandment",
        "answers": ["love one another", "as I have loved you", "the mark of discipleship", "self-giving love", "a community shaped by the cross"],
        "kinds": ["action", "quote", "concept", "concept", "concept"],
    },
    {
        "chapter": 13,
        "scene": "Judas going out into the night",
        "answers": ["at night", "the night", "darkness and rejection", "the chapter's moral darkness", "the betrayer leaving the light"],
        "kinds": ["time", "concept", "concept", "concept", "concept"],
    },
    {
        "chapter": 13,
        "scene": "Jesus predicting Peter's denial",
        "answers": ["three times", "the rooster crowing", "Peter's courage failing", "even the bold disciple needs grace", "discipleship depends on mercy"],
        "kinds": ["time", "phenomenon", "concept", "concept", "concept"],
    },
    {
        "chapter": 13,
        "scene": "Jesus explaining foot washing and betrayal",
        "answers": ["If I don't wash you", "you have no part with me", "Scripture's betrayal pattern", "love must be shown in service", "John's portrait of the cross-shaped Lord"],
        "kinds": ["quote", "quote", "concept", "concept", "concept"],
    },
    # John 14
    {
        "chapter": 14,
        "scene": "Jesus promising rooms in the Father's house",
        "answers": ["many dwelling places", "prepare a place", "return for his own", "shared life with the Father", "hope of being with Jesus"],
        "kinds": ["concept", "action", "action", "concept", "concept"],
    },
    {
        "chapter": 14,
        "scene": "Thomas asking about the way",
        "answers": ["Thomas", "the way, the truth, and the life", "access to the Father through the Son", "the exclusive path to God", "Jesus as revelation and life"],
        "kinds": ["actor", "title", "concept", "concept", "concept"],
    },
    {
        "chapter": 14,
        "scene": "Philip asking to see the Father",
        "answers": ["Philip", "Whoever has seen me has seen the Father", "the Father is revealed in the Son", "visible Jesus reveals invisible God", "the Son as the Father's image"],
        "kinds": ["actor", "quote", "concept", "concept", "concept"],
    },
    {
        "chapter": 14,
        "scene": "Jesus promising greater works and prayer",
        "answers": ["greater works", "ask in my name", "the Father's glory", "the mission continues after Jesus goes", "the disciples' work expanding by the Spirit"],
        "kinds": ["concept", "quote", "concept", "concept", "concept"],
    },
    {
        "chapter": 14,
        "scene": "the Counselor being promised",
        "answers": ["another Counselor", "the Spirit of truth", "teach and remind them", "Jesus will not leave them alone", "the Spirit continuing Jesus' presence"],
        "kinds": ["title", "title", "action", "concept", "concept"],
    },
    {
        "chapter": 14,
        "scene": "Jesus tying love to obedience",
        "answers": ["love me by keeping my commandments", "the Father will make his home", "relational obedience", "indwelling love", "a shared life of love and obedience"],
        "kinds": ["quote", "concept", "concept", "concept", "concept"],
    },
    {
        "chapter": 14,
        "scene": "Jesus giving peace before departure",
        "answers": ["my peace", "not as the world gives", "the prince of the world has nothing in me", "courage in trouble", "peace grounded in victory"],
        "kinds": ["concept", "quote", "quote", "concept", "concept"],
    },
    # John 15
    {
        "chapter": 15,
        "scene": "Jesus as the true vine",
        "answers": ["the true vine", "remain in me", "bear much fruit", "dependence on Jesus", "fruit through abiding"],
        "kinds": ["title", "action", "action", "concept", "concept"],
    },
    {
        "chapter": 15,
        "scene": "the Father pruning the branches",
        "answers": ["prunes them", "branches not remaining are burned", "fruitfulness through pruning", "discipline that increases fruit", "the Father's care for the vine"],
        "kinds": ["action", "outcome", "concept", "concept", "concept"],
    },
    {
        "chapter": 15,
        "scene": "Jesus commanding love one another",
        "answers": ["love one another", "greater love lays down life", "joy made full", "self-giving love", "the new shape of discipleship"],
        "kinds": ["action", "concept", "concept", "concept", "concept"],
    },
    {
        "chapter": 15,
        "scene": "Jesus calling them friends",
        "answers": ["friends", "what he heard from the Father", "intimacy through obedience", "shared knowledge", "not mere servants"],
        "kinds": ["actor", "concept", "concept", "concept", "concept"],
    },
    {
        "chapter": 15,
        "scene": "the world hating the disciples",
        "answers": ["the world", "hates them without cause", "chosen out of the world", "hostility to witness", "election sets them apart"],
        "kinds": ["actor", "concept", "concept", "concept", "concept"],
    },
    {
        "chapter": 15,
        "scene": "the world having no excuse after Jesus' works",
        "answers": ["no excuse for sin", "they hated me without cause", "the evidence is already clear", "light rejected by darkness", "responsibility after revelation"],
        "kinds": ["concept", "quote", "concept", "concept", "concept"],
    },
    {
        "chapter": 15,
        "scene": "the Counselor and the disciples testifying",
        "answers": ["the Counselor", "the Spirit of truth", "testify about Jesus", "shared witness", "Spirit-empowered testimony"],
        "kinds": ["actor", "title", "action", "concept", "concept"],
    },
    # John 16
    {
        "chapter": 16,
        "scene": "disciples facing expulsion and hostility",
        "answers": ["put out of the synagogues", "killing while thinking they serve God", "fearful persecution", "religious violence in God's name", "hardness without knowledge of the Father"],
        "kinds": ["outcome", "concept", "concept", "concept", "concept"],
    },
    {
        "chapter": 16,
        "scene": "the Counselor convicting the world",
        "answers": ["sin, righteousness, and judgment", "unbelief in Jesus", "the Spirit's rebuke", "Jesus going to the Father", "the prince of this world judged"],
        "kinds": ["concept", "concept", "concept", "concept", "concept"],
    },
    {
        "chapter": 16,
        "scene": "sorrow turning to joy",
        "answers": ["a woman in labor", "joy after the child is born", "pain giving way to joy", "resurrection-shaped sorrow", "grief transformed by seeing Jesus again"],
        "kinds": ["thing", "concept", "concept", "concept", "concept"],
    },
    {
        "chapter": 16,
        "scene": "the Father answering prayer in Jesus' name",
        "answers": ["whatever you ask", "in my name", "the Father's love", "bold asking after Jesus' departure", "prayer joined to mission"],
        "kinds": ["concept", "quote", "concept", "concept", "concept"],
    },
    {
        "chapter": 16,
        "scene": "Jesus saying he came from and returns to the Father",
        "answers": ["I go to the Father", "you will scatter", "the Father is with me", "the return of the Son", "departure that leads to victory"],
        "kinds": ["quote", "outcome", "concept", "concept", "concept"],
    },
    {
        "chapter": 16,
        "scene": "Jesus promising peace in trouble",
        "answers": ["my peace", "I have overcome the world", "courage in tribulation", "victory over the world", "peace that outlasts trouble"],
        "kinds": ["concept", "quote", "concept", "concept", "concept"],
    },
    {
        "chapter": 16,
        "scene": "the disciples scattering",
        "answers": ["you will be scattered", "each to his own place", "leaving Jesus alone", "human weakness under pressure", "the Father's presence with the Son"],
        "kinds": ["outcome", "place", "concept", "concept", "concept"],
    },
]

prompt_templates = {
    1: {
        "actor": "Who is central to {scene}?",
        "place": "Where does {scene} happen?",
        "thing": "What object is mentioned in {scene}?",
        "time": "When does {scene} happen?",
        "title": "What title appears in {scene}?",
        "concept": "What detail is emphasized in {scene}?",
        "outcome": "What happens in {scene}?",
        "action": "What action is described in {scene}?",
        "phenomenon": "What sign appears in {scene}?",
        "quote": "What words are quoted in {scene}?",
    },
    2: {
        "actor": "Which person is named in {scene}?",
        "place": "What location detail is named in {scene}?",
        "thing": "What specific object is mentioned in {scene}?",
        "time": "What timing detail is mentioned in {scene}?",
        "title": "What title is used in {scene}?",
        "concept": "What detail in {scene} is important?",
        "outcome": "What result is described in {scene}?",
        "action": "What action is the focus of {scene}?",
        "phenomenon": "What visible or audible sign appears in {scene}?",
        "quote": "What line is quoted in {scene}?",
    },
    3: {
        "concept": "Why does {scene} matter?",
        "actor": "Why is {scene} significant?",
        "place": "Why is {scene} significant?",
        "thing": "Why does {scene} matter?",
        "time": "Why does {scene} matter?",
        "title": "Why does {scene} matter?",
        "outcome": "Why does {scene} matter?",
        "action": "Why does {scene} matter?",
        "phenomenon": "Why does {scene} matter?",
        "quote": "Why does {scene} matter?",
    },
    4: {
        "concept": "What theme does {scene} highlight?",
        "actor": "What theme does {scene} highlight?",
        "place": "What theme does {scene} highlight?",
        "thing": "What theme does {scene} highlight?",
        "time": "What theme does {scene} highlight?",
        "title": "What theme does {scene} highlight?",
        "outcome": "What theme does {scene} highlight?",
        "action": "What theme does {scene} highlight?",
        "phenomenon": "What theme does {scene} highlight?",
        "quote": "What theme does {scene} highlight?",
    },
    5: {
        "concept": "How does {scene} connect to John's Gospel?",
        "actor": "How does {scene} connect to John's Gospel?",
        "place": "How does {scene} connect to John's Gospel?",
        "thing": "How does {scene} connect to John's Gospel?",
        "time": "How does {scene} connect to John's Gospel?",
        "title": "How does {scene} connect to John's Gospel?",
        "outcome": "How does {scene} connect to John's Gospel?",
        "action": "How does {scene} connect to John's Gospel?",
        "phenomenon": "How does {scene} connect to John's Gospel?",
        "quote": "How does {scene} connect to John's Gospel?",
    },
}


def make_choices(correct, kind):
    pool = [x for x in pool_map[kind] if x != correct]
    deduped = []
    for item in pool:
        if item not in deduped:
            deduped.append(item)
    long_pool = [x for x in long_pool_map[kind] if x != correct and x not in deduped]
    if len(deduped) + len(long_pool) < 3:
        raise RuntimeError(f"Not enough distractors for {correct} ({kind})")
    use_long = random.random() < 0.61
    if use_long:
        long_count = 2 if kind in {"concept", "quote", "title", "action", "outcome"} else 1
        if len(long_pool) < long_count:
            long_count = len(long_pool)
        long_choices = random.sample(long_pool, long_count) if long_count else []
        needed = 3 - len(long_choices)
        short_choices = random.sample(deduped, needed) if needed else []
        choices = short_choices + long_choices + [correct]
    else:
        choices = random.sample(deduped, 3) + [correct]
    random.shuffle(choices)
    return choices


def explain(chapter, scene, answer, stage):
    if stage == 1:
        return f"John {chapter} gives this detail in {scene.lower()}."
    if stage == 2:
        return f"The chapter names {answer} in {scene.lower()}."
    if stage == 3:
        return f"{scene} points toward {answer}."
    if stage == 4:
        return f"{scene} highlights {answer}."
    return f"John uses {scene.lower()} to show {answer}."


entries = []
for fact in facts:
    chapter = fact["chapter"]
    scene = fact["scene"]
    answers = fact["answers"]
    kinds = fact["kinds"]
    for stage in range(1, 6):
        kind = kinds[stage - 1]
        correct = answers[stage - 1]
        prompt = prompt_templates[stage][kind].format(scene=scene)
        entries.append(
            {
                "book_number": 43,
                "chapter": chapter,
                "difficulty_stage": stage,
                "prompt": prompt,
                "choices_json": make_choices(correct, kind),
                "correct_answer": correct,
                "explanation": explain(chapter, scene, correct, stage),
            }
        )

entries.sort(key=lambda x: (x["chapter"], x["difficulty_stage"], x["prompt"]))

out_path = os.path.join("tmp", "john_quiz_batch_3.json")
with open(out_path, "w", encoding="utf-8") as f:
    json.dump(entries, f, ensure_ascii=False, indent=2)
    f.write("\n")

by_stage = Counter((e["chapter"], e["difficulty_stage"]) for e in entries)
longest_correct = 0
for e in entries:
    lens = [len(c) for c in e["choices_json"]]
    if len(e["correct_answer"]) == max(lens) and lens.count(max(lens)) == 1:
        longest_correct += 1

print(
    json.dumps(
        {
            "entries": len(entries),
            "by_stage_ok": all(by_stage[(ch, stage)] == 7 for ch in range(12, 17) for stage in range(1, 6)),
            "longest_correct": longest_correct,
            "ratio": round(longest_correct / len(entries), 3) if entries else 0,
        },
        indent=2,
    )
)
