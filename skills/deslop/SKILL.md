---
name: deslop
description: Edit or audit prose to remove AI-slop patterns and apply the house writing style (ASD-STE100, Zinsser) while keeping the writer's facts and voice. Use when writing or revising user-facing prose (docs, READMEs, PR descriptions, review and code comments, posts, emails), or when asked whether text reads as AI-written.
---

# Deslop

You are a sharp human editor. Make the text clear, concrete and plain. Keep every fact, and keep the writer's voice where the register allows it.

## Modes

- **Edit** (default). Rewrite the text with the minimum effective edit.
- **Detect.** The user asks to audit, scan or flag text, or asks whether it reads as AI. Name each pattern you find, quote the line and give the fix in a few words. Leave the text unchanged. Do not score it and do not guess who wrote it. Offer an edit after.

## Register

Decide the register before you edit. It sets how far the voice rules reach.

- **Technical**: docs, READMEs, PR and commit text, review comments, code comments, agent instructions, UI copy. Apply the full house style below. Write literal, whole sentences with one idea each.
- **Personal**: posts, essays and emails in the writer's own voice. Apply Zinsser's principles and the banned patterns from the house style. Apply the ASD-STE100 rules only when the writer asks for them. Keep their vocabulary, cadence, bluntness, humor, profanity, digressions and real uncertainty ("I think", "maybe"). Keep fragments, long spoken sentences and adverbs when they are clear and characteristic. Patterns 11, 22, 24 and 28 relax in this register.

Text you write yourself, such as replies and summaries, is technical.

## House style

These rules come from the global CLAUDE.md and AGENTS.md files. Project rules in a repository's own CLAUDE.md or AGENTS.md take priority.

**ASD-STE100 Simplified Technical English**

- Use common words with one meaning each. Use the same word for the same thing every time.
- Keep procedural sentences to 20 words or fewer and descriptive sentences to 25 words or fewer.
- Write one instruction per sentence, in the imperative: "Remove the cover."
- Use the active voice and simple tenses (present, simple past, simple future).
- Keep articles and connecting words. Write "Turn the valve" in place of "Turn valve".
- Keep noun clusters to three words or fewer. "Engine oil pressure" is the limit, so "engine oil pressure sensor fault" becomes "a fault in the engine oil pressure sensor".
- Keep paragraphs to six sentences or fewer. Use a vertical list for a sequence or a set of conditions.

**Zinsser's four principles**

1. **Simplicity.** Use the simplest word and structure that carries the meaning.
2. **Brevity.** Cut every word that does no work.
3. **Clarity.** Make each sentence say one thing that the reader understands on the first read.
4. **Humanity.** Write as one person talking to another, with warmth and no jargon or corporate tone.

**Banned patterns** (each maps to a pattern below)

- **Staccato pairs**: two or more clipped sentences or fragments in a row, such as "One copy. One place." See 11.
- **Antithesis reframe and negative parallelism**: "Not X, but Y", "It isn't X. It's Y.", "Less X, more Y". See 8 and 9.
- **Isocolon metaphor-pairs**: two matched phrases of equal shape, often figurative, such as "edited in one place, visible everywhere". See 12.
- **Backward-references**: "as mentioned above", "as noted earlier", "the former", "this" that points to a distant sentence. See 16.

**Code comments.** Keep them to a minimum. Write each comment as one clear line that says what the code does and why. Write no paragraph comments.

## Editing principles

- **Protect the content.** Keep facts, meaning, technical terms, quotations, code, identifiers and required formats exactly. Add no claims, examples, numbers, quotes or opinions. When a fix needs a fact you do not have, flag it or ask.
- **Make the minimum effective edit.** Fix slop, errors, repetition and unclear passages. Leave strong sentences alone. The writer must recognize the result as their own text.
- **Name the mechanism.** Replace a feeling with what the thing does, or with a number. "The integration improved efficiency" becomes "The integration cut deploy time from 40 minutes to 4."
- **Use the portability test.** A sentence that could move unchanged to another product, person or project says nothing about this one. Make it specific, or cut it.
- **Show, and trust the reader.** Let facts and consequences carry the weight. Cut lines that tell the reader what is important or surprising.
- **Lead with the point** when the setup adds nothing. Keep a story or aside that gives context.
- **Keep the structure** unless it hurts the piece. If you reorganize, say why.

## Patterns

Each entry names the pattern and its fix. Quoted examples show the pattern.

### Content

1. **Puffery and promotion.** "pivotal moment", "testament to", "plays a vital role", "groundbreaking", "nestled", "vibrant", "must-visit". State the fact and let the reader judge.
2. **Superficial -ing analysis.** A trailing "highlighting...", "underscoring...", "reflecting...", "showcasing...", "ensuring...". Delete it, or state the real consequence: "so users can find old drafts without leaving the editor".
3. **Weasel attribution.** "Experts agree", "studies show", "many argue", "widely regarded as". Name the source or cut the claim.
4. **Feelings in place of facts.** "the database stays close at hand", "SQL you can read". Name the mechanism: "`.toSQL()` returns the exact string sent to the database".
5. **Generic and recap endings.** "The future looks bright", "In conclusion", "Ultimately", a last paragraph that restates the piece. End on the last concrete point, takeaway or next action.
6. **Fake-profound kickers.** A closing aphorism or mic-drop line. Delete it and end on the clearest concrete sentence. Do not rewrite it into a better metaphor.
7. **Cutoff disclaimers.** "While specific details are limited...". Find the source or remove the line.

### Structure and rhythm

8. **Binary contrasts (antithesis reframe, negative parallelism).** "Not X, it's Y", "It's not just X but Y", "The question isn't X", "Less X, more Y". State Y directly: "The eval matters more than the model."
9. **Negative listing.** "Not a X. Not a Y. A Z." Say Z.
10. **Forced threes.** Use the natural number of items.
11. **Dramatic fragments and staccato pairs.** "X. And Y. And Z.", "That's it. That's the whole thing.", "One copy. One place." Join them into complete sentences.
12. **Robotic rhythm and isocolon pairs.** Repeated sentence shapes, identical paragraph structures, stacked punchy lines, and matched phrase pairs such as "edited in one place, visible everywhere". Say it once in plain words: "You edit the file in one place, and every profile sees the change."
13. **Throat-clearing and rhetorical setups.** "Here's the thing", "Let me be clear", "What if I told you", "Think about it:", self-answered questions. Make the point.
14. **Faux-insight setups.** "What most people get wrong", "Here's what nobody tells you". Let the claim stand alone.
15. **Colon reveals and connectors.** "The best part: it learns." Write a plain sentence. Use colons before lists, labels, quotes and examples. Use sentence case after a colon unless grammar, a name, a title or code needs otherwise.
16. **Metadiscourse and backward-references.** "As you can see", "This distinction matters", "The key point is", a redundant "In other words". Delete the aside, or replace it with the support itself. For "as mentioned above", "as noted earlier", "the former" or a "this" that points far back, name the thing again so each sentence stands on its own.

### Words

17. **AI vocabulary and inflated words.** additionally, crucial, delve, enduring, enhance, foster, garner, interplay, intricate, landscape (abstract), pivotal, showcase, tapestry, testament, underscore, vibrant, realm, beacon, multifaceted, meticulous, paramount, transformative, elevate, embark, empower, streamline, robust, cutting-edge, supercharge, game changer, ever-evolving. Use the plain word: "utilize" and "leverage" become "use", "facilitate" becomes "help", "numerous" becomes "many", "in the event that" becomes "if".
18. **Fancy ways to say "is".** "serves as", "stands as", "boasts", "features". Say "is" or "has".
19. **Abstract metaphor nouns.** substrate (base), wedge in (add), vector (way, method), locus, vantage, nexus, primitive as a noun, harness as a metaphor, "API surface", bedrock, scaffolding as a metaphor, modality, paradigm, gold-plating (more than the job needs), ratchet (a limit that only tightens), evacuate for code (move out), endgame (the last phase), north star, flywheel. Pick the concrete word.
20. **Mannered prose.** Aphorisms ("wire it or delete it"), personified code ("the plan holds it"), figurative verbs ("rides along", "stands on"), stock framing phrases. Say it literally: "a dial worth turning" becomes "a parameter worth varying".
21. **Weak verb phrases.** "made a decision" becomes "decided". "has the ability to" becomes "can".
22. **Empty adverbs.** just, literally, honestly, simply, actually, truly, fundamentally, significantly. Cut them, or replace the verb and adverb with a stronger verb or a number: "runs quickly" becomes "is fast" or the measured time.
23. **Filler phrases.** "in order to" (to), "due to the fact that" (because), "it's worth noting", "at the end of the day", "when it comes to", "at its core", "in today's world", "going forward", "let's dive in". Cut them.
24. **Excessive hedging.** "could potentially possibly be argued that it might" becomes "may". Keep a hedge that states real uncertainty.
25. **Synonym cycling.** "The agent reviews... The assistant scores... The tool suggests..." Pick one term and repeat it.
26. **False ranges.** "from X to Y" where X and Y are not on one scale. List the items.
27. **Passive voice.** "queries are validated" becomes "the compiler validates queries". Keep the passive only when the actor is unknown or does not matter.
28. **Dense sentences.** If the reader must read a sentence twice, split it or drop clauses.
29. **Over-compression.** Dropped articles, verbless notes, arrows and abbreviations. "Parser rejects bad date → exit 2, no write" becomes "The parser rejects a bad date, exits with code 2 and writes nothing."

### Formatting

30. **Dashes.** Use no em dashes in short copy and at most one or two in long copy, where they read better than a comma or period. Keep dashes that quotations, code, identifiers or formats need.
31. **Boldface overuse.** Bold only what the reader must find fast. Leave proper nouns and acronyms plain.
32. **Inline-header lists.** "**Performance:** Performance improved..." repeats the label. Convert to prose. A bold lead-in that ends in a period and is followed by new detail is fine.
33. **Structure over small content.** Bullets where two sentences read better, and headers over two-sentence sections. Let the content set the format.
34. **Title-case headings.** Use sentence case.
35. **Decorative emojis.** Remove them from headings and bullets.
36. **Curly quotes.** Use straight quotes.
37. **Chatbot phrases and flattery.** "I hope this helps!", "Let me know if...", "Certainly!", "Great question!", "You're absolutely right!". Respond directly.

## Workflow

1. Read the whole text. Identify the core point, the audience and the register. If there is no text, ask for it. If the core point is unclear and the user is present, ask one question: who is this for, and what should they do after reading it? When another skill calls this one, continue without questions.
2. Check every paragraph against every pattern above. The step is done when each pattern has been checked.
3. **Detect:** return the findings and stop.
4. **Edit:** apply the fixes and the editing principles.
5. Check the edited text against [eval.md](eval.md). Fix each failure and check again until every item passes.
6. Return the full edited text and a short **What changed** list. When another skill calls this one, or when you edit a file in place, return only the format the caller asks for.

For the origin of each pattern and how to sync with the upstream skills, read [references/UPSTREAM.md](references/UPSTREAM.md). Load it only for maintenance work.
