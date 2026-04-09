'use client';

import Link from 'next/link';
import { useSearchParams } from 'next/navigation';
import { useEffect, useMemo, useRef, useState } from 'react';

function safeReaderReturnHref(raw: string | null): string {
  if (!raw || typeof raw !== 'string') return '/app';
  const t = raw.trim();
  if (!t.startsWith('/') || t.startsWith('//')) return '/app';
  if (t.length > 2048) return '/app';
  try {
    const u = new URL(t, 'http://reader.local');
    if (u.pathname !== '/app') return '/app';
    return `${u.pathname}${u.search}`;
  } catch {
    return '/app';
  }
}

function parseChapterContext(returnTo: string | null): { book: string; chapter: number } | null {
  if (!returnTo) return null;
  try {
    const u = new URL(returnTo, 'http://reader.local');
    const book = u.searchParams.get('book');
    const chapter = parseInt(u.searchParams.get('chapter') ?? '', 10);
    if (book && chapter > 0) return { book, chapter };
  } catch {
    /* ignore */
  }
  return null;
}

type Reference = {
  commentary_id: number;
  book_number: number;
  book_name: string;
  chapter: number;
};

type EntityPayload = {
  kind: string;
  slug: string;
  label: string;
  references: Reference[];
};

type AIMessage = { role: 'user' | 'assistant'; content: string };
type TimelineItem = {
  era: string;
  title: string;
  summary: string;
  developments: string[];
  significance: string;
};

const KIND_META: Record<string, { label: string; bankPath: string; color: string }> = {
  theme:  { label: 'Theme',    bankPath: '/themes/bank',  color: 'theme'  },
  person: { label: 'Person',   bankPath: '/people/bank',  color: 'person' },
  place:  { label: 'Place',    bankPath: '/places/bank',  color: 'place'  },
};

function buildDescriptionPrompt(kind: string, label: string): string {
  if (kind === 'theme') {
    return `In 3–4 sentences, explain the biblical theme of "${label}": what it means in Scripture, how it develops across the Old and New Testaments, and why it matters for understanding the Christian faith. Write in flowing prose — do not list verse citations like "Romans 3:23" in the text. Be specific and substantive.`;
  }
  if (kind === 'person') {
    return `In 4–6 sentences, describe who ${label} is in the Bible. Include a brief historical timeline in prose: their background, the major events they are involved in in chronological flow, and how their role or significance develops over time. End with why they matter to the biblical story. Write in flowing prose without listing verse citations like "Genesis 12:1" in the text.`;
  }
  return `In 4–6 sentences, describe ${label} as a biblical place. Cover where it is, what key events happened there, and how its role changes across Scripture when relevant (for example, Jerusalem in David's era compared with Jerusalem in the Gospels). Briefly narrate that progression so the reader gets a mini-history of what happened to the place and why it matters in the biblical story. Write in flowing prose without listing verse citations like "Genesis 12:1" in the text.`;
}

function buildChapterContributionPrompt(kind: string, label: string, book: string, chapter: number): string {
  if (kind === 'person') {
    return `In 2–3 focused sentences, describe what ${label} specifically does or contributes in ${book} chapter ${chapter}. Focus only on this chapter — their actions, words, decisions, or narrative role in this particular passage. Do not summarize their whole life story. Write in flowing prose without verse citations.`;
  }
  return `In 2–3 focused sentences, describe how ${label} features specifically in ${book} chapter ${chapter}. Focus only on what role the place plays in this chapter's events. Write in flowing prose without verse citations.`;
}

function buildTimelineReferenceContext(refs: Reference[]): string {
  if (refs.length === 0) return 'No indexed references provided.';
  const grouped = new Map<string, { min: number; max: number }>();
  for (const r of refs) {
    const curr = grouped.get(r.book_name);
    if (!curr) {
      grouped.set(r.book_name, { min: r.chapter, max: r.chapter });
    } else {
      curr.min = Math.min(curr.min, r.chapter);
      curr.max = Math.max(curr.max, r.chapter);
    }
  }
  return Array.from(grouped.entries())
    .slice(0, 14)
    .map(([book, span]) => (span.min === span.max ? `${book} ${span.min}` : `${book} ${span.min}-${span.max}`))
    .join('; ');
}

function buildTimelinePrompt(kind: 'person' | 'place', label: string, refs: Reference[]): string {
  const refContext = buildTimelineReferenceContext(refs);
  if (kind === 'person') {
    return `Return ONLY valid JSON (no markdown) with shape {"events":[{"era":"...","title":"...","summary":"...","developments":["..."],"significance":"..."}]}. Build a highly specific chronological life timeline for ${label} with 10-14 milestones. Use book/chapter progress for chronology, not calendar dates. Requirements per event: (1) "era" must be book/chapter based, like "Exodus 1-2" or "Deuteronomy 31-34", (2) "title" must be a concrete life-phase or event title, (3) "summary" must be 2-3 sentences describing what happens in Scripture and why this changes the person's role, (4) "developments" must have 3-5 concrete details with explicit scriptural anchors like "(Exodus 3-4)", (5) "significance" must be 1-2 sentences. Avoid vague wording entirely. If ${label} is a major biblical figure (for example Moses, David, Abraham, Peter, Paul), include the best-known narrative milestones in canonical order (birth/early life, calling, major conflicts, leadership moments, covenant moments, failures, transition, and legacy where applicable). Indexed reference context: ${refContext}.`;
  }
  return `Return ONLY valid JSON (no markdown) with shape {"events":[{"era":"...","title":"...","summary":"...","developments":["..."],"significance":"..."}]}. Build a chronological timeline for ${label} with 8-12 milestones showing how the place's role changes over time. Use book/chapter progress for chronology, not calendar dates. Requirements per event: (1) "era" must be book/chapter based, (2) "title" names that period's role, (3) "summary" is 2-3 sentences explaining what happened there and why the role shifted, (4) "developments" has 3-5 concrete scriptural details with anchors like "(Nehemiah 2-6)", and (5) "significance" is 1-2 sentences. Keep details scripture-grounded and specific, not generic. Indexed reference context: ${refContext}.`;
}

function parseTimelinePayload(raw: string): TimelineItem[] {
  try {
    const cleaned = raw.trim().replace(/^```json\s*/i, '').replace(/^```\s*/i, '').replace(/\s*```$/, '');
    const obj = JSON.parse(cleaned) as {
      events?: Array<{
        title?: string;
        era?: string;
        period?: string;
        summary?: string;
        detail?: string;
        developments?: string[];
        significance?: string;
      }>
    };
    const events = (obj.events ?? [])
      .map((e) => ({
        era: (e.era ?? e.period ?? '').trim(),
        title: (e.title ?? '').trim(),
        summary: (e.summary ?? e.detail ?? '').trim(),
        developments: (Array.isArray(e.developments) ? e.developments : [])
          .map((d) => (typeof d === 'string' ? d.trim() : ''))
          .filter(Boolean)
          .slice(0, 5),
        significance: (e.significance ?? '').trim(),
      }))
      .filter((e) => e.title && e.summary)
      .slice(0, 12);
    return events;
  } catch {
    return [];
  }
}

function parseLooseTimeline(raw: string): TimelineItem[] {
  const lines = raw
    .replace(/^```[\s\S]*?\n/, '')
    .replace(/\n```$/, '')
    .split('\n')
    .map((line) => line.trim())
    .filter(Boolean);
  const events: TimelineItem[] = [];
  for (const line of lines) {
    const normalized = line.replace(/^[-*]\s*/, '');
    const [head, ...rest] = normalized.split(':');
    if (!head || rest.length === 0) continue;
    const detail = rest.join(':').trim();
    if (!detail) continue;
    const title = head.replace(/^\d+[\).\s-]*/, '').trim();
    if (!title) continue;
    events.push({
      era: `Milestone ${events.length + 1}`,
      title,
      summary: detail,
      developments: [],
      significance: '',
    });
  }
  return events.slice(0, 12);
}

function buildReferenceTimeline(
  entityKind: 'person' | 'place',
  label: string,
  refs: Reference[],
): TimelineItem[] {
  const books = [...new Set(refs.sort((a, b) => a.book_number - b.book_number).map((r) => r.book_name))].slice(0, 6);
  if (entityKind === 'person') {
    const firstBook = books[0] ?? 'Exodus';
    const midBook = books[Math.min(2, books.length - 1)] ?? books[0] ?? 'Exodus';
    const lastBook = books[books.length - 1] ?? 'Deuteronomy';
    return [
      {
        era: `${firstBook} (early references)`,
        title: 'Birth and early formation',
        summary: `${label} first appears in a formative context that sets up later calling and responsibility within the biblical narrative.`,
        developments: books.length
          ? [`Early scriptural context appears in ${firstBook}.`, `Broader indexed references include: ${books.join(', ')}.`]
          : ['Primary textual context is being indexed.'],
        significance: `This milestone introduces the conditions that shape ${label}'s later role in Scripture.`,
      },
      {
        era: `${midBook} (central narrative)`,
        title: 'Calling and assignment',
        summary: `${label} receives a defining assignment that changes their role from private formation to public mission.`,
        developments: ['A clear shift in responsibility appears in the narrative.', 'Decisions in this phase direct later events.'],
        significance: `This milestone explains why ${label} becomes central to later developments.`,
      },
      {
        era: `${lastBook} (later references)`,
        title: 'Leadership and legacy',
        summary: `${label}'s later period shows the long-term effects of earlier decisions, conflicts, and acts of faithfulness.`,
        developments: ['The narrative highlights consequences across the community.', 'Later texts reflect the enduring impact of this role.'],
        significance: `This milestone frames how ${label}'s influence continues within the biblical story.`,
      },
    ];
  }
  return [
    {
      era: `${books[0] ?? 'Genesis'} (early references)`,
      title: 'Early significance',
      summary: `${label} emerges as a meaningful location connected to formative biblical events.`,
      developments: books.length ? [`Primary textual context: ${books.join(', ')}.`] : ['Primary textual context is being indexed.'],
      significance: `This milestone establishes why ${label} matters in Scripture.`,
    },
    {
      era: `${books[Math.min(2, books.length - 1)] ?? books[0] ?? 'Kings'} (central narrative)`,
      title: 'Role transition',
      summary: `${label}'s role shifts as different people and events redefine how the place functions in the story.`,
      developments: ['The location moves from background setting to strategic focus.', 'Its use changes with broader covenant and kingdom developments.'],
      significance: `This milestone clarifies how the place gains new narrative weight.`,
    },
    {
      era: `${books[books.length - 1] ?? 'Gospels'} (later references)`,
      title: 'Ongoing legacy',
      summary: `${label} continues to carry theological and narrative meaning in later biblical periods.`,
      developments: ['Later narratives preserve and reinterpret the place\'s significance.'],
      significance: `This milestone shows why ${label} remains important beyond a single episode.`,
    },
  ];
}

// Kept as emergency fallback for the specific Moses case where AI repeatedly fails.
function buildKnownPersonTimeline(label: string): TimelineItem[] | null {
  const key = label.trim().toLowerCase();
  if (key !== 'moses') return null;
  return [
    {
      era: 'Exodus 1-2',
      title: 'Birth under oppression',
      summary: 'Moses is born when Pharaoh orders Hebrew sons killed, and his mother hides him before placing him in the Nile. Pharaoh\'s daughter adopts him, placing him between Hebrew identity and Egyptian power from the start.',
      developments: [
        'Hebrew male children are targeted by royal decree (Exodus 1).',
        'Moses is hidden for three months, then set in a basket on the Nile (Exodus 2:1-3).',
        'Miriam watches and helps arrange Moses\' own mother as nurse (Exodus 2:4-9).',
        'Moses is raised in Pharaoh\'s household (Exodus 2:10).',
      ],
      significance: 'Moses\' origin story frames him as a deliverer shaped by both covenant people and imperial context.',
    },
    {
      era: 'Exodus 2',
      title: 'Crisis, violence, and exile',
      summary: 'Seeing an Egyptian beating a Hebrew, Moses kills the Egyptian and hides the body. When the act becomes known, he flees to Midian, moving from palace security into wilderness exile.',
      developments: [
        'Moses identifies with Hebrews under oppression (Exodus 2:11).',
        'He kills an Egyptian and attempts concealment (Exodus 2:12).',
        'His action is exposed among Hebrews (Exodus 2:13-14).',
        'He escapes Pharaoh and settles in Midian (Exodus 2:15-22).',
      ],
      significance: 'This phase exposes Moses\' zeal and limitations, preparing him for later transformation.',
    },
    {
      era: 'Exodus 3-4',
      title: 'Burning bush calling',
      summary: 'God reveals His name at Horeb and commissions Moses to confront Pharaoh and bring Israel out. Moses resists repeatedly, but God equips him with signs and appoints Aaron as spokesman.',
      developments: [
        'God appears in the burning bush and declares holy ground (Exodus 3:1-6).',
        'Moses receives mission to deliver Israel (Exodus 3:7-10).',
        'God reveals the divine name and covenant continuity (Exodus 3:13-15).',
        'Signs and Aaron\'s partnership answer Moses\' objections (Exodus 4:1-17).',
      ],
      significance: 'Calling redefines Moses from exile survivor to covenant mediator and deliverer.',
    },
    {
      era: 'Exodus 5-12',
      title: 'Confrontation with Pharaoh',
      summary: 'Moses repeatedly demands release of Israel and becomes central in the plagues narrative. Judgment escalates until Passover and the death of Egypt\'s firstborn force Pharaoh\'s temporary surrender.',
      developments: [
        'Initial demand worsens Israel\'s labor burden (Exodus 5).',
        'Series of plagues exposes Pharaoh\'s hard-hearted resistance (Exodus 7-11).',
        'Passover instructions mark Israel for protection (Exodus 12:1-28).',
        'Exodus begins after firstborn judgment (Exodus 12:29-42).',
      ],
      significance: 'Moses is established as God\'s appointed agent of liberation and judgment.',
    },
    {
      era: 'Exodus 13-15',
      title: 'Sea deliverance and worship',
      summary: 'Moses leads Israel out, and God parts the sea while Egypt\'s army is destroyed. The people move from panic to praise as Moses and Miriam lead victory worship.',
      developments: [
        'Israel departs with guidance by cloud and fire (Exodus 13:17-22).',
        'Sea crossing and defeat of Egypt\'s forces (Exodus 14).',
        'Moses\' song celebrates God\'s kingship and deliverance (Exodus 15:1-18).',
      ],
      significance: 'Moses becomes the public leader of redeemed Israel at a foundational salvation moment.',
    },
    {
      era: 'Exodus 16-18',
      title: 'Wilderness leadership formation',
      summary: 'Moses navigates recurring community complaints over food, water, and security while relying on God\'s provision. Jethro then helps him establish a delegated justice system for sustainable leadership.',
      developments: [
        'Manna and quail provision amid grumbling (Exodus 16).',
        'Water from the rock at Massah and Meribah (Exodus 17:1-7).',
        'Intercession during Amalek conflict (Exodus 17:8-16).',
        'Jethro advises judicial delegation (Exodus 18:13-26).',
      ],
      significance: 'Moses\' role expands from deliverer to covenant community organizer and intercessor.',
    },
    {
      era: 'Exodus 19-24',
      title: 'Sinai covenant mediator',
      summary: 'At Sinai, Moses ascends the mountain, receives God\'s words, and mediates covenant terms to Israel. The covenant is ratified with blood, formally shaping Israel\'s identity and obligations.',
      developments: [
        'Israel arrives at Sinai and is called to holy vocation (Exodus 19).',
        'Ten Commandments and covenant laws are delivered (Exodus 20-23).',
        'Moses reads the covenant book to the people (Exodus 24:3-7).',
        'Covenant ratification through sacrificial blood (Exodus 24:8).',
      ],
      significance: 'Moses stands at the center of Israel\'s covenant formation and obedience framework.',
    },
    {
      era: 'Exodus 32-34',
      title: 'Golden calf crisis and intercession',
      summary: 'When Israel turns to idol worship, Moses confronts sin, pleads for mercy, and seeks renewed presence. God renews covenant commitments, and Moses descends with radiant face after divine encounter.',
      developments: [
        'Golden calf rebellion while Moses is on the mountain (Exodus 32:1-6).',
        'Moses intercedes to avert total destruction (Exodus 32:11-14).',
        'Judgment and covenant breach consequences unfold (Exodus 32:25-35).',
        'Covenant is renewed and Moses receives new tablets (Exodus 34).',
      ],
      significance: 'Moses is portrayed as both uncompromising leader and persistent intercessor for a sinful people.',
    },
    {
      era: 'Numbers 11-14',
      title: 'National rebellion and burdened leadership',
      summary: 'Moses faces intensified communal unrest, leadership strain, and national unbelief after the spies report. He pleads for mercy again as judgment falls on the unbelieving generation.',
      developments: [
        'Complaints and leadership pressure intensify (Numbers 11).',
        'Miriam and Aaron challenge Moses\' unique role (Numbers 12).',
        'Spies\' report triggers national fear and revolt (Numbers 13-14).',
        'Moses intercedes; wilderness judgment is pronounced (Numbers 14:13-35).',
      ],
      significance: 'This phase shows Moses carrying covenant leadership under sustained resistance.',
    },
    {
      era: 'Numbers 16-20',
      title: 'Authority challenges and personal failure',
      summary: 'Moses faces direct challenges to his authority and continued communal unrest. At Meribah he disobeys God\'s instruction, and the consequence is that he will not enter the promised land.',
      developments: [
        'Korah rebellion contests priestly and leadership order (Numbers 16-17).',
        'Miriam dies and water crisis erupts at Meribah (Numbers 20:1-5).',
        'Moses strikes the rock instead of speaking as commanded (Numbers 20:7-11).',
        'God declares Moses and Aaron will not enter the land (Numbers 20:12).',
      ],
      significance: 'Moses\' greatness is paired with accountability, highlighting holiness and obedience.',
    },
    {
      era: 'Deuteronomy 1-30',
      title: 'Final teaching and covenant renewal',
      summary: 'Near death, Moses delivers extended covenant teaching, recounts Israel\'s history, and calls for covenant loyalty. He frames blessing and curse before the people and urges wholehearted obedience.',
      developments: [
        'Historical rehearsal for a new generation (Deuteronomy 1-4).',
        'Core covenant instruction is restated and applied (Deuteronomy 5-26).',
        'Blessings, curses, and life-or-death covenant choice are set forth (Deuteronomy 27-30).',
      ],
      significance: 'Moses transitions from active field leader to enduring teacher shaping Israel\'s future identity.',
    },
    {
      era: 'Deuteronomy 31-34',
      title: 'Commissioning Joshua and death',
      summary: 'Moses publicly commissions Joshua, blesses the tribes, and dies on Mount Nebo after viewing the land from afar. The narrative closes by honoring Moses as uniquely known by the Lord.',
      developments: [
        'Joshua is commissioned before all Israel (Deuteronomy 31).',
        'Moses delivers final song and blessing (Deuteronomy 32-33).',
        'Moses dies and is mourned by Israel (Deuteronomy 34:1-8).',
        'Scripture affirms Moses\' unparalleled prophetic status (Deuteronomy 34:10-12).',
      ],
      significance: 'Moses\' legacy endures as deliverer, lawgiver, and prophetic benchmark in Israel\'s memory.',
    },
  ];
}

// ── Vertical Timeline Component ───────────────────────────────────────────────

function VerticalTimeline({
  timeline,
}: {
  timeline: TimelineItem[];
}) {
  const [openItems, setOpenItems] = useState<Record<number, boolean>>({});

  function toggleOpen(idx: number) {
    setOpenItems((prev) => ({ ...prev, [idx]: !prev[idx] }));
  }

  return (
    <div className="htl htl--vertical htl--centered" aria-label="Chronological timeline">
      <div className="htl-center-line" aria-hidden />
      {timeline.map((item, idx) => (
        <div className={`htl-c-row ${idx % 2 === 0 ? 'is-left' : 'is-right'}`} key={`${item.title}-${idx}`}>
          <div className="htl-c-panel">
            <button
              type="button"
              className="htl-c-toggle"
              onClick={() => toggleOpen(idx)}
              aria-expanded={!!openItems[idx]}
              aria-controls={`milestone-panel-${idx}`}
            >
              <span className="htl-c-milestone">Milestone {idx + 1}</span>
              <span className="htl-c-era">{item.era || 'Scripture context'}</span>
            </button>
            {!!openItems[idx] && (
              <div id={`milestone-panel-${idx}`} className="htl-v-content">
                <div className="htl-detail-title">{item.title}</div>
                <p className="htl-detail-summary">{item.summary}</p>
                {item.developments.length > 0 && (
                  <ul className="htl-detail-points">
                    {item.developments.map((pt, i) => (
                      <li key={i}>{pt}</li>
                    ))}
                  </ul>
                )}
                {item.significance && (
                  <p className="htl-detail-significance">{item.significance}</p>
                )}
              </div>
            )}
          </div>
          <button
            type="button"
            className={`htl-c-dot${openItems[idx] ? ' is-open' : ''}`}
            onClick={() => toggleOpen(idx)}
            aria-label={`Toggle milestone ${idx + 1}`}
            aria-expanded={!!openItems[idx]}
            aria-controls={`milestone-panel-${idx}`}
          />
          <div className="htl-c-gap" aria-hidden />
        </div>
      ))}
    </div>
  );
}

// ── Main Page ─────────────────────────────────────────────────────────────────

export default function SummaryEntityPage({
  kind,
  slug,
}: {
  kind: 'theme' | 'person' | 'place';
  slug: string;
}) {
  const searchParams = useSearchParams();
  const returnToRaw = searchParams.get('returnTo');
  const readerBackHref = safeReaderReturnHref(returnToRaw);
  const chapterCtx = useMemo(() => parseChapterContext(returnToRaw), [returnToRaw]);

  const [data, setData] = useState<EntityPayload | null>(null);
  const [error, setError] = useState(false);

  // Chapter-specific contribution summary
  const [chapterSummary, setChapterSummary] = useState('');
  const [chapterSummaryLoading, setChapterSummaryLoading] = useState(false);

  // Overall description
  const [description, setDescription] = useState('');
  const [descLoading, setDescLoading] = useState(false);

  // Timeline
  const [timeline, setTimeline] = useState<TimelineItem[]>([]);
  const [timelineLoading, setTimelineLoading] = useState(false);

  // AI chat
  const [history, setHistory] = useState<AIMessage[]>([]);
  const [chatInput, setChatInput] = useState('');
  const [chatLoading, setChatLoading] = useState(false);
  const [chatError, setChatError] = useState('');
  const [chatOpen, setChatOpen] = useState(false);
  const chatBottomRef = useRef<HTMLDivElement>(null);
  const inputRef = useRef<HTMLTextAreaElement>(null);

  const meta = KIND_META[kind] ?? KIND_META.theme;

  useEffect(() => {
    let cancelled = false;
    setData(null);
    setError(false);
    setDescription('');
    setChapterSummary('');
    setTimeline([]);
    setHistory([]);
    setChatOpen(false);

    fetch(`/api/v1/summary-entities/${kind}/${encodeURIComponent(slug)}`)
      .then((r) => {
        if (!r.ok) throw new Error('not found');
        return r.json() as Promise<EntityPayload>;
      })
      .then((j) => {
        if (!cancelled) {
          setData(j);
          loadDescription(j.label, j.references, cancelled);
          if ((kind === 'person' || kind === 'place') && chapterCtx) {
            loadChapterSummary(kind, j.label, chapterCtx.book, chapterCtx.chapter, cancelled);
          }
          if (kind === 'person' || kind === 'place') {
            loadTimeline(kind, j.label, j.references, cancelled);
          }
        }
      })
      .catch(() => {
        if (!cancelled) setError(true);
      });
    return () => { cancelled = true; };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [kind, slug]);

  function loadChapterSummary(
    entityKind: string,
    label: string,
    book: string,
    chapter: number,
    cancelled: boolean,
  ) {
    if (cancelled) return;
    setChapterSummaryLoading(true);
    fetch('/api/v1/ai/chat', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        message: buildChapterContributionPrompt(entityKind, label, book, chapter),
        context: { book, chapter, translation: 'WEB' },
        personality: 'jessica',
        conversation_history: [],
      }),
    })
      .then((r) => r.json())
      .then((j) => { if (!cancelled && j?.message) setChapterSummary(j.message); })
      .catch(() => {/* silently skip */})
      .finally(() => { if (!cancelled) setChapterSummaryLoading(false); });
  }

  function loadDescription(label: string, _refs: Reference[], cancelled: boolean) {
    if (cancelled) return;
    setDescLoading(true);
    fetch('/api/v1/ai/entity-content', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        prompt: buildDescriptionPrompt(kind, label),
        max_tokens: 500,
      }),
    })
      .then((r) => r.json())
      .then((j) => { if (!cancelled && j?.content) setDescription(j.content); })
      .catch(() => {/* silently skip */})
      .finally(() => { if (!cancelled) setDescLoading(false); });
  }

  function loadTimeline(entityKind: 'person' | 'place', label: string, refs: Reference[], cancelled: boolean) {
    if (cancelled) return;
    setTimelineLoading(true);
    fetch('/api/v1/ai/entity-content', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        prompt: buildTimelinePrompt(entityKind, label, refs),
        max_tokens: 3500,
      }),
    })
      .then((r) => r.json())
      .then((j) => {
        if (cancelled) return;
        const raw = j?.content ?? '';
        const structured = parseTimelinePayload(raw);
        const loose = structured.length > 0 ? structured : parseLooseTimeline(raw);
        if (loose.length >= 3) {
          setTimeline(loose.slice(0, 14));
        } else {
          // AI failed to produce a usable timeline — use emergency fallbacks
          const known = entityKind === 'person' ? buildKnownPersonTimeline(label) : null;
          setTimeline(known ?? buildReferenceTimeline(entityKind, label, refs));
        }
      })
      .catch(() => {
        if (cancelled) return;
        const known = entityKind === 'person' ? buildKnownPersonTimeline(label) : null;
        setTimeline(known ?? buildReferenceTimeline(entityKind, label, refs));
      })
      .finally(() => { if (!cancelled) setTimelineLoading(false); });
  }

  useEffect(() => {
    chatBottomRef.current?.scrollIntoView({ behavior: 'smooth' });
  }, [history, chatLoading]);

  async function sendChat(e: React.SyntheticEvent) {
    e.preventDefault();
    const msg = chatInput.trim();
    if (!msg || chatLoading || !data) return;
    const firstRef = data.references[0];
    const ctx = firstRef
      ? { book: firstRef.book_name, chapter: firstRef.chapter, translation: 'WEB' }
      : { book: 'Genesis', chapter: 1, translation: 'WEB' };
    const newHistory: AIMessage[] = [...history, { role: 'user', content: msg }];
    setHistory(newHistory);
    setChatInput('');
    setChatError('');
    setChatLoading(true);
    try {
      const r = await fetch('/api/v1/ai/chat', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          message: msg,
          context: ctx,
          personality: 'jessica',
          conversation_history: history.map(h => ({ role: h.role, content: h.content })),
        }),
      });
      const j = await r.json().catch(() => null);
      if (!r.ok || !j?.message) throw new Error(j?.detail || 'AI unavailable');
      setHistory(prev => [...prev, { role: 'assistant', content: j.message }]);
    } catch (err) {
      setChatError((err as Error).message || 'Something went wrong.');
    } finally {
      setChatLoading(false);
    }
  }

  const title = meta.label;

  // Group references by book
  const refsByBook: Record<string, Reference[]> = {};
  for (const r of (data?.references ?? [])) {
    (refsByBook[r.book_name] ??= []).push(r);
  }

  return (
    <div className={`entity-page entity-page--${kind}`}>
    <div className="entity-page-inner">
      <header className="entity-page-header">
        <div className="entity-page-nav">
          <Link href={readerBackHref} className="entity-page-back">← Reader</Link>
          <Link href={meta.bankPath} className="entity-page-bank-link">All {title}s</Link>
        </div>
        <div className="entity-page-kind-badge" data-kind={kind}>{title}</div>
        <h1 className="entity-page-title">
          {data ? data.label : error ? 'Not found' : '…'}
        </h1>
        {data && data.references.length > 0 && (
          <div className="entity-page-ref-count">
            Appears in {data.references.length} chapter{data.references.length !== 1 ? 's' : ''}
          </div>
        )}
      </header>

      {error && <p className="entity-page-error">This {title.toLowerCase()} could not be loaded.</p>}

      {data && (
        <>
          {/* Chapter-specific contribution — shown only when navigating from a chapter */}
          {chapterCtx && (kind === 'person' || kind === 'place') && (
            <section className="entity-page-section entity-chapter-section">
              <div className="entity-chapter-context-label">
                In {chapterCtx.book} {chapterCtx.chapter}
              </div>
              {chapterSummaryLoading && !chapterSummary ? (
                <div className="entity-desc-loading">
                  <span className="spinner" />
                  <span>Loading chapter context…</span>
                </div>
              ) : chapterSummary ? (
                <p className="entity-desc-text">{chapterSummary}</p>
              ) : null}
            </section>
          )}

          {/* Overall description */}
          <section className="entity-page-section entity-page-desc-section">
            <div className="entity-page-subheading">
              {chapterCtx && (kind === 'person' || kind === 'place') ? `About ${data.label}` : 'Summary'}
            </div>
            {descLoading && !description ? (
              <div className="entity-desc-loading">
                <span className="spinner" />
                <span>Loading overview…</span>
              </div>
            ) : description ? (
              <p className="entity-desc-text">{description}</p>
            ) : null}
          </section>

          {/* Vertical Timeline */}
          {(kind === 'person' || kind === 'place') && (
            <section className="entity-page-section entity-timeline-section">
              <div className="entity-page-subheading">Timeline</div>
              {timelineLoading && timeline.length === 0 && (
                <div className="entity-desc-loading">
                  <span className="spinner" />
                  <span>Building timeline…</span>
                </div>
              )}
              {!timelineLoading && timeline.length === 0 && (
                <p className="entity-page-muted">Timeline not available yet.</p>
              )}
              {timeline.length > 0 && (
                <VerticalTimeline timeline={timeline} />
              )}
            </section>
          )}

          {/* AI Chat */}
          <section className="entity-page-section entity-chat-section">
            <button
              className="entity-chat-toggle"
              onClick={() => { setChatOpen(o => !o); setTimeout(() => inputRef.current?.focus(), 100); }}
            >
              <span className="entity-chat-toggle-icon">{chatOpen ? '▾' : '▸'}</span>
              Ask AI about {data.label}
            </button>
            {chatOpen && (
              <div className="entity-chat-body">
                {history.length === 0 && !chatLoading && (
                  <div className="entity-chat-suggestions">
                    {[
                      `What does ${data.label} mean in the Bible?`,
                      `How does ${data.label} relate to Jesus?`,
                      `Give me a key verse about ${data.label}.`,
                    ].map((q, i) => (
                      <button
                        key={i}
                        className="entity-chat-suggestion"
                        onClick={() => { setChatInput(q); inputRef.current?.focus(); }}
                      >
                        {q}
                      </button>
                    ))}
                  </div>
                )}
                {history.length > 0 && (
                  <div className="entity-chat-transcript">
                    {history.map((m, i) => (
                      <div key={i} className={`entity-chat-msg entity-chat-msg--${m.role}`}>
                        <div className="entity-chat-msg-content">{m.content}</div>
                      </div>
                    ))}
                    {chatLoading && (
                      <div className="entity-chat-msg entity-chat-msg--assistant">
                        <div className="entity-chat-msg-content entity-chat-thinking">
                          <span className="spinner" />
                        </div>
                      </div>
                    )}
                    <div ref={chatBottomRef} />
                  </div>
                )}
                {chatError && <div className="entity-chat-error">{chatError}</div>}
                <form className="entity-chat-form" onSubmit={sendChat}>
                  <textarea
                    ref={inputRef}
                    className="entity-chat-input"
                    value={chatInput}
                    onChange={e => setChatInput(e.target.value)}
                    onKeyDown={e => { if (e.key === 'Enter' && !e.shiftKey) { e.preventDefault(); void sendChat(e as unknown as React.SyntheticEvent); } }}
                    placeholder={`Ask about ${data.label}…`}
                    rows={2}
                    maxLength={1500}
                    disabled={chatLoading}
                  />
                  <button
                    type="submit"
                    className="entity-chat-send"
                    disabled={chatLoading || !chatInput.trim()}
                  >
                    Send
                  </button>
                </form>
              </div>
            )}
          </section>

          {/* References at bottom */}
          {data.references.length > 0 && (
            <section className="entity-page-section entity-refs-section">
              <div className="entity-page-subheading">Scripture references</div>
              <div className="entity-refs-grid">
                {Object.entries(refsByBook).map(([book, refs]) => (
                  <div key={book} className="entity-refs-book">
                    <div className="entity-refs-book-name">{book}</div>
                    <div className="entity-refs-chapters">
                      {refs.map((r) => (
                        <Link
                          key={`${r.book_number}-${r.chapter}-${r.commentary_id}`}
                          href={`/app?book=${encodeURIComponent(r.book_name)}&chapter=${r.chapter}`}
                          className="entity-ref-chip"
                        >
                          {r.chapter}
                        </Link>
                      ))}
                    </div>
                  </div>
                ))}
              </div>
            </section>
          )}
          {data.references.length === 0 && (
            <section className="entity-page-section">
              <p className="entity-page-muted">No chapter references indexed yet.</p>
            </section>
          )}
        </>
      )}
    </div>
    </div>
  );
}
