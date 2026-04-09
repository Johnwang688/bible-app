# People and places

This list matches what the **All People** and **All Places** bank pages load from the API (`GET /api/v1/summary-entities/list/{kind}` → `list_summary_entities` in `app/services/summary_entity_service.py`).

- **People:** `summary_entities` rows with `kind = person`, after the same `_is_valid_person_label` filter used on the bank page.
- **Places:** same for `kind = place` (or the place fallback index when place indexing is disabled).

Total: **467** people, **91** places.

Regenerate this file after changing summary data or entity rules:

```bash
python scripts/generate_people_places_doc.py
```

## People

- Aaron
- Abaddon
- Abdon
- Abednego
- Abel
- Abiathar
- Abigail
- Abihu
- Abijah
- Abijam
- Abimelech
- Abiram
- Abishai
- Abner
- Abraham
- Abram
- Absalom
- Achan
- Achish
- Achsah
- Adam
- Adoni-bezek
- Adonijah
- Aeneas
- Agabus
- Agag
- Agrippa
- Agur
- Ahab
- Ahasuerus
- Ahaz
- Ahaziah
- Ahijah
- Ahimaaz
- Ahimelech
- Ahinoam
- Ahithophel
- Alexander
- Amasa
- Amaziah
- Ammon
- Amnon
- Amon
- Amos
- Ananias
- Andrew
- Anna
- Annas
- Apollos
- Aquila
- Aram
- Arameans
- Araunah
- Aristarchus
- Artaxerxes
- Asa
- Asahel
- Asaph
- Asher
- Ashpenaz
- Athaliah
- Augustus
- Azariah
- Baal
- Baal-zebub
- Baanah
- Baasha
- Balaam
- Balak
- Barabbas
- Barak
- Barnabas
- Bartholomew
- Bartimaeus
- Baruch
- Barzillai
- Bathsheba
- Belshazzar
- Ben-Abinadab
- Ben-hadad
- Benaiah
- Benjamin
- Bernice
- Bethel
- Bethsaida
- Bezalel
- Bildad
- Blastus
- Boaz
- Brothers
- Caiaphas
- Cain
- Caleb
- Candace
- Capernaum
- Cephas
- Chemosh
- Chilion
- Chorazin
- Christ
- Claudius
- Clement
- Cleopas
- Cornelius
- Counselor
- Cretans
- Crispus
- Cyrus
- Dagon
- Damaris
- Dan
- Daniel
- Darius
- Dathan
- David
- Deborah
- Delilah
- Demetrius
- Diotrephes
- Doeg
- Drusilla
- Ebed-melech
- Edom
- Eglon
- Egyptians
- Ehud
- Eleazar
- Eli
- Eliakim
- Eliashib
- Elihu
- Elijah
- Elimelech
- Eliphaz
- Elisha
- Elizabeth
- Elkanah
- Elon
- Elymas Bar Jesus
- Enoch
- Epaphras
- Epaphroditus
- Ephraim
- Erastus
- Esau
- Esther
- Ethiopia
- Euodia
- Eutychus
- Ezekiel
- Ezra
- Felix
- Festus
- Foreigners
- Gaal
- Gabriel
- Gad
- Gaius
- Gallio
- Gamaliel
- Gedaliah
- Gehazi
- Gentiles
- Gerasenes
- Gibeon
- Gideon
- God
- Gog
- Goliath
- Gomer
- Greeks
- Habakkuk
- Hadad
- Hadadezer
- Hagar
- Haggai
- Haman
- Hammuel
- Hanamel
- Hanani
- Hananiah
- Hannah
- Hanun
- Hathach
- Hazael
- Heldai
- Heman
- Herod
- Herodians
- Herodias
- Hezekiah
- Hezron
- Hilkiah
- Hiram
- Holy Spirit
- Hophni
- Hosea
- Hoshea
- Huldah
- Hushai
- Hymenaeus
- Ibzan
- Isaac
- Isaiah
- Ish-bosheth
- Ishmael
- Issachar
- Ithamar
- Ithiel
- Ittai
- Jabez
- Jabin
- Jacob
- Jael
- Jahaziel
- Jair
- Jairus
- Jambres
- James
- Jannes
- Jason
- Jeconiah
- Jeduthun
- Jehoahaz
- Jehoash
- Jehoiachin
- Jehoiada
- Jehoiakim
- Jehonadab
- Jehoram
- Jehoshaphat
- Jehovah
- Jehu
- Jephthah
- Jeremiah
- Jeroboam
- Jeroboam II
- Jeshua
- Jesse
- Jesus
- Jesus Christ
- Jethro
- Jews
- Jezebel
- Joab
- Joash
- Job
- Joel
- Johanan
- John
- John Mark
- Jonadab
- Jonah
- Jonathan
- Joram
- Joseph
- Joses Barnabas
- Josheb-basshebeth
- Joshua
- Josiah
- Jotham
- Jubilee
- Judas
- Judas Barsabbas
- Judas Iscariot
- Jude
- Julius
- Jupiter
- Justus
- Kish
- Kohath
- Korah
- Laban
- Lamb
- Lazarus
- Leah
- Legion
- Lemuel
- Levi
- Leviathan
- Levite
- Levites
- Lot
- Luke
- Lydia
- Lysias
- Macedonians
- Magi
- Magog
- Maher-shalal-hash-baz
- Mahlon
- Malchus
- Manasseh
- Manoah
- Many
- Martha
- Mary
- Mary Magdalene
- Matthew
- Matthias
- Melchizedek
- Menahem
- Mephibosheth
- Merchants
- Mercury
- Meshach
- Mica
- Micah
- Micaiah
- Michael
- Michal
- Midian
- Miriam
- Mishael
- Mnason
- Moab
- Mordecai
- Moses
- Mount Zion
- Naaman
- Nabal
- Naboth
- Nadab
- Nahash
- Nahum
- Naomi
- Naphtali
- Nathan
- Nathanael
- Nebuchadnezzar
- Nebuzaradan
- Nehemiah
- Nicanor
- Nicodemus
- Nicolaus
- No-Amon
- Noah
- Obed
- Obed-edom
- Og
- Omri
- Onesimus
- Onesiphorus
- Ornan
- Orpah
- Othniel
- Parmenas
- Pashhur
- Paul
- Pekah
- Pekahiah
- Peter
- Pharaoh Neco
- Pharisee
- Pharisees
- Philemon
- Philetus
- Philip
- Philistia
- Phinehas
- Phoebe
- Pilate
- Pontius Pilate
- Porcius Festus
- Priscilla
- Prochorus
- Publius
- Rabshakeh
- Rachel
- Rahab
- Rebekah
- Rechab
- Rehoboam
- Rehum
- Reuben
- Rhoda
- Rizpah
- Ruth
- Sabbath
- Sadducees
- Salome
- Samaritan
- Samaritans
- Samson
- Samuel
- Sanballat
- Sapphira
- Sarah
- Satan
- Saul
- Saul Paul
- Sceva
- Secundus
- Sennacherib
- Seraiah
- Sergius Paulus
- Shadrach
- Shamgar
- Shammah
- Shaphan
- Sheba
- Shebna
- Shecaniah
- Shelah
- Shemaiah
- Shimei
- Shimshai
- Shishak
- Sidon
- Sihon
- Silas
- Silvanus
- Simeon
- Simon
- Simon Peter
- Sisera
- Sodom
- Solomon
- Son
- Sopater
- Sosthenes
- Stephanas
- Stephen
- Syntyche
- Tabitha
- Tamar
- Tattenai
- Tertius
- Tertullus
- Thaddaeus
- Theophilus
- Theudas
- Thomas
- Timon
- Timothy
- Titus
- Tobiah
- Tobijah
- Toi
- Tola
- Trophimus
- Tychicus
- Tyrannus
- Tyre
- Tyrians
- Ucal
- Uriah
- Uzzah
- Uzziah
- Vashti
- Watchmen
- Zabud
- Zacchaeus
- Zadok
- Zalmunna
- Zebah
- Zebulun
- Zechariah
- Zedekiah
- Zelophehad
- Zenas
- Zephaniah
- Zerah
- Zerubbabel
- Ziba
- Zimri
- Zophar

## Places

- Achaia
- Ai
- Antioch
- Arabia
- Aram
- Armageddon
- Assyria
- Babylon
- Bethany
- Bethel
- Bethlehem
- Bethsaida
- Caesarea
- Canaan
- Capernaum
- Carmel
- Chorazin
- Corinth
- Crete
- Cyprus
- Damascus
- Dead Sea
- Decapolis
- Edom
- Egypt
- Elam
- Emmaus
- Ephesus
- Euphrates
- Galilee
- Gethsemane
- Gibeah
- Gibeon
- Gilgal
- Golgotha
- Goshen
- Haran
- Hebron
- Horeb
- Israel
- Jericho
- Jerusalem
- Joppa
- Jordan
- Jordan River
- Judah
- Judea
- Kidron
- Land of Edom
- Land of Egypt
- Land of Gilead
- Land of Goshen
- Land of Jazer
- Land of Magog
- Land of Moab
- Land of Shinar
- Land of Sihon
- Land of Uz
- Lydda
- Macedonia
- Malta
- Midian
- Moab
- Moriah
- Mount Moriah
- Mount Nebo
- Mount of Olives
- Mount Sinai
- Mount Zion
- Nazareth
- Nebo
- Nineveh
- Patmos
- Persia
- Philippi
- Ramah
- Red Sea
- Rome
- Samaria
- Sea of Galilee
- Sea of Tiberias
- Shechem
- Shiloh
- Sidon
- Siloam
- Sinai
- Susa
- Thessalonica
- Tyre
- Ur
- Zion

<!-- END AUTO-GENERATED LISTS -->
## Agent prompts: JSON for `people/` and `places/`

Use these prompts with an LLM to produce **one JSON file per entity**, e.g. `people/{slug}.json` and `places/{slug}.json`, where **`slug`** matches the app (same as in `GET /api/v1/summary-entities/{kind}/{slug}` — see [`slugify_label`](../app/core/slugify.py)). **`label`** is the display name from the lists above.

For each entity, fetch **`GET /api/v1/summary-entities/{kind}/{slug}`** (or your export) and pass the **`references`** array into **reference context** for timeline prompts so the model stays aligned with indexed chapters.

### Suggested on-disk JSON shape (one file per slug)

Combine overview prose, timeline, and optional per-chapter blurbs (keys must match how you will load them in the app later).

```json
{
  "kind": "person",
  "slug": "moses",
  "label": "Moses",
  "overview": "<plain prose — same role as the overview paragraph on the entity page>",
  "timeline": {
    "events": [
      {
        "era": "Exodus 1-2",
        "title": "Title for this milestone",
        "summary": "Two or three sentences.",
        "developments": ["Detail with anchor (Exodus 1)", "..."],
        "significance": "One or two sentences."
      }
    ]
  },
  "chapter_contributions": {
    "Genesis:50": "Optional: 2–3 sentences for this book+chapter only when the user navigated from that chapter.",
    "Exodus:2": "..."
  }
}
```

Use `"kind": "place"` for place files. Omit `timeline` for data you do not pre-generate; omit `chapter_contributions` if unused.

---

### Person — overview prompt (`buildDescriptionPrompt`, `kind === 'person'`)

Replace `{label}` with the person’s name (e.g. `Moses`). Send as **`prompt`** to `POST /api/v1/ai/entity-content` with **`max_tokens`: 500** (or generate offline and store the string in `overview`).

```
In 4–6 sentences, describe who {label} is in the Bible. Include a brief historical timeline in prose: their background, the major events they are involved in in chronological flow, and how their role or significance develops over time. End with why they matter to the biblical story. Write in flowing prose without listing verse citations like "Genesis 12:1" in the text.
```

---

### Person — timeline prompt (`buildTimelinePrompt`, `kind === 'person'`)

Replace `{label}` with the person’s name. Replace `{refContext}` with **indexed reference context** (e.g. `Exodus 2; Exodus 3-4; ...`) built like `buildTimelineReferenceContext` in [`SummaryEntityPage.tsx`](../frontend-next/src/components/SummaryEntityPage.tsx): group `references` by `book_name`, emit up to 14 spans `Book chapter` or `Book min-max`. **Use `max_tokens`: 3500** for this call when using the live API.

```
Return ONLY valid JSON (no markdown) with shape {"events":[{"era":"...","title":"...","summary":"...","developments":["..."],"significance":"..."}]}. Build a highly specific chronological life timeline for {label} with 10-14 milestones. Use book/chapter progress for chronology, not calendar dates. Requirements per event: (1) "era" must be book/chapter based, like "Exodus 1-2" or "Deuteronomy 31-34", (2) "title" must be a concrete life-phase or event title, (3) "summary" must be 2-3 sentences describing what happens in Scripture and why this changes the person's role, (4) "developments" must have 3-5 concrete details with explicit scriptural anchors like "(Exodus 3-4)", (5) "significance" must be 1-2 sentences. Avoid vague wording entirely. If {label} is a major biblical figure (for example Moses, David, Abraham, Peter, Paul), include the best-known narrative milestones in canonical order (birth/early life, calling, major conflicts, leadership moments, covenant moments, failures, transition, and legacy where applicable). Indexed reference context: {refContext}.
```

Parse the model output as JSON and store under `timeline` (or merge into the file shape above).

---

### Place — overview prompt (`buildDescriptionPrompt`, place branch)

Replace `{label}` with the place name (e.g. `Jerusalem`). **`max_tokens`: 500** for API parity.

```
In 4–6 sentences, describe {label} as a biblical place. Cover where it is, what key events happened there, and how its role changes across Scripture when relevant (for example, Jerusalem in David's era compared with Jerusalem in the Gospels). Briefly narrate that progression so the reader gets a mini-history of what happened to the place and why it matters in the biblical story. Write in flowing prose without listing verse citations like "Genesis 12:1" in the text.
```

---

### Place — timeline prompt (`buildTimelinePrompt`, `kind === 'place'`)

Replace `{label}` and `{refContext}` as for the person timeline. **`max_tokens`: 3500** for API parity.

```
Return ONLY valid JSON (no markdown) with shape {"events":[{"era":"...","title":"...","summary":"...","developments":["..."],"significance":"..."}]}. Build a chronological timeline for {label} with 8-12 milestones showing how the place's role changes over time. Use book/chapter progress for chronology, not calendar dates. Requirements per event: (1) "era" must be book/chapter based, (2) "title" names that period's role, (3) "summary" is 2-3 sentences explaining what happened there and why the role shifted, (4) "developments" has 3-5 concrete scriptural details with anchors like "(Nehemiah 2-6)", and (5) "significance" is 1-2 sentences. Keep details scripture-grounded and specific, not generic. Indexed reference context: {refContext}.
```

---

### Optional: chapter-specific blurbs (`buildChapterContributionPrompt`)

When you pre-generate text for **one book + chapter** (e.g. for `chapter_contributions`), use the same wording as the app when the user opens the entity page from the reader with `returnTo` set.

**Person:**

```
In 2–3 focused sentences, describe what {label} specifically does or contributes in {book} chapter {chapter}. Focus only on this chapter — their actions, words, decisions, or narrative role in this particular passage. Do not summarize their whole life story. Write in flowing prose without verse citations.
```

**Place:**

```
In 2–3 focused sentences, describe how {label} features specifically in {book} chapter {chapter}. Focus only on what role the place plays in this chapter's events. Write in flowing prose without verse citations.
```

Repeat for each `(book, chapter)` pair you want to ship (for example every chapter in `references` from the API).

---

### Source of truth in code

Prompts are defined in [`frontend-next/src/components/SummaryEntityPage.tsx`](../frontend-next/src/components/SummaryEntityPage.tsx) (`buildDescriptionPrompt`, `buildTimelinePrompt`, `buildChapterContributionPrompt`, `buildTimelineReferenceContext`). If the app changes, update this appendix or regenerate from that file.
