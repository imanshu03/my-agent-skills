# Upstream sources

`deslop` merges two upstream skills and the global writing rules. Pinned snapshots of both live in `upstream/`. The files have a `.SKILL.md` suffix so that no skill loader registers them as skills.

| Upstream | Path | Snapshot |
|---|---|---|
| [cursor/plugins](https://github.com/cursor/plugins) | `pstack/skills/unslop/SKILL.md` | `upstream/unslop.SKILL.md` |
| [petergyang/no-ai-slop](https://github.com/petergyang/no-ai-slop) | `skills/no-ai-slop/SKILL.md` | `upstream/no-ai-slop.SKILL.md` |
| [petergyang/no-ai-slop](https://github.com/petergyang/no-ai-slop) | `skills/no-ai-slop/eval.md` | `upstream/no-ai-slop.eval.md` |

The house style section is the only copy of the writing rules. The global instruction files (`~/.claude/CLAUDE.md`, `~/.claude-pl/CLAUDE.md`, `~/.codex/AGENTS.md` and `~/AGENTS.md`) only tell the agent to apply this skill. Change the writing rules here, in `SKILL.md` and `eval.md`.

The pinned commit for each file is in `upstream/sources.tsv`. `agent-skill update` does not touch this skill, because no lockfile tracks it.

## Sync procedure

1. Run `scripts/check-upstream.sh`. It prints each file that changed since its pinned commit, with a diff.
2. For each change, port it into `SKILL.md` or `eval.md`, or skip it. Use the pattern map below to find the matching entry. Add a line to the sync log.
3. Run `scripts/check-upstream.sh --refresh`. It replaces the snapshots and the pins with the latest upstream.

## Pattern map

`u` is an unslop rule number. `n` is a no-ai-slop section. `legacy` is a rule that unslop has since removed. `global` is the global CLAUDE.md and AGENTS.md files.

| deslop | Source |
|---|---|
| Register: technical | Local edit to the old unslop "Process" paragraph |
| Register: personal | n: Editing principles (voice, edge and character) |
| House style | global: ASD-STE100, Zinsser, banned patterns, code comments |
| Editing principles | n: Editing principles; u: intro; local "Process" paragraph |
| 1 Puffery and promotion | n: Importance puffery; legacy u1, u4 |
| 2 Superficial -ing analysis | u3; n: Superficial analysis |
| 3 Weasel attribution | u5; n: Weasel attribution |
| 4 Feelings in place of facts | u27; n: Be concrete and specific, Protect the specific fact |
| 5 Generic and recap endings | u25; n: Summary-recap endings |
| 6 Fake-profound kickers | n: Fake-profound kickers |
| 7 Cutoff disclaimers | legacy u21 |
| 8 Binary contrasts | u9; n: Binary contrasts; global: antithesis reframe, negative parallelism |
| 9 Negative listing | n: Negative listing |
| 10 Forced threes | u10 |
| 11 Dramatic fragments and staccato pairs | n: Dramatic fragmentation; global: staccato pairs |
| 12 Robotic rhythm and isocolon pairs | n: Robotic rhythm; global: isocolon metaphor-pairs |
| 13 Throat-clearing and rhetorical setups | n: Throat-clearing openers, Rhetorical setups |
| 14 Faux-insight setups | n: Faux-insight setups |
| 15 Colon reveals and connectors | u14; n: Colon reveals |
| 16 Metadiscourse and backward-references | n: Interpretive metadiscourse; global: backward-references |
| 17 AI vocabulary and inflated words | u7, u31; n: Words to cut |
| 18 Fancy ways to say "is" | u8; n: Fake-strong verbs |
| 19 Abstract metaphor nouns | u26 |
| 20 Mannered prose | u32 |
| 21 Weak verb phrases | n: Make verbs do the work |
| 22 Empty adverbs | u30; n: Often-empty adverbs |
| 23 Filler phrases | u23; n: Often-empty phrases |
| 24 Excessive hedging | u24 |
| 25 Synonym cycling | u11; n: Synonym cycling |
| 26 False ranges | u12 |
| 27 Passive voice | u29; n: Use active voice |
| 28 Dense sentences | u28; n: Untangle sentences |
| 29 Over-compression | u33 |
| 30 Dashes | u13 (relaxed by a local edit); n: Em dashes |
| 31 Boldface overuse | u15; n: Formatting slop |
| 32 Inline-header lists | u16 |
| 33 Structure over small content | n: Formatting slop |
| 34 Title-case headings | u17 |
| 35 Decorative emojis | u18; n: Formatting slop |
| 36 Curly quotes | u19 |
| 37 Chatbot phrases and flattery | u20, u22 |
| Modes, workflow, eval.md | n: Two jobs, What to ask for, Workflow, eval.md |

## Sync log

- 2026-10-15: Created from unslop `bc697d0` and no-ai-slop `000650b`.
- 2026-10-15: Added the house style from the global CLAUDE.md and AGENTS.md files.
- 2026-10-15: Removed the writing rules from the global instruction files. This skill now holds the only copy.
