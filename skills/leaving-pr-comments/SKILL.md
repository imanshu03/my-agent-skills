---
name: leaving-pr-comments
description: Use whenever leaving comments on GitHub. Review pull requests and code changes, then write or revise feedback with Conventional Comments labels and clear resolution requirements. Use for requests such as "review these PRs", review findings delivered in chat, draft comments awaiting approval, replies to reviewers and review bots, and requested posting of review comments. Apply deslop to write clear, natural English. Excludes comments inside source code, commit messages, and PR descriptions.
---

# Leaving PR Comments

Use this skill to turn code review findings into comments that the author can act on.

## When to use

Apply this skill from the start of a pull request or code review, including reviews whose findings stay in chat. Use it when drafting or revising feedback, even when the user has not asked to post comments or requires approval before posting.

Also use it for replies to reviewers and review bots, and for the explanation you post before you resolve or dismiss feedback. A label is optional in these replies. Start with the conclusion, such as "Fixed in `abc123`" or "Not changed, because ...".

Keep the user's requested scope and output format. When the user asks for a specific review format, apply the comment guidance within that format.

Do not apply this skill to PR descriptions, commit messages, or text the user asks you to post verbatim.

## Write the comment

1. Read the relevant diff and enough surrounding code to check the finding. Identify the trigger, effect, and file location. Cite the code, behavior, check, or reproduction that supports it. Use a question when the evidence is incomplete.
2. Read and apply [deslop](../deslop/SKILL.md) to write the comment in clear, natural English. Keep the technical facts, evidence, uncertainty, labels, decorations, and requested action. Use its editing guidance and deliver the requested review format without an editing summary.
3. Choose one label from the table. Select a decoration when it helps the author decide what to do before merge.
4. Write a short subject. Add discussion only when it helps explain the evidence or next step. Keep each comment focused on one finding.
5. For a problem, give a practical fix or a clear condition for resolution. Include a patch only when enough context exists to make it correct.
6. Check that the label, decoration, and requested action agree. Use plain words and discuss the code. Keep verified facts separate from judgment, and state uncertainty directly. Remove filler, such as canned thanks or status narration.

## Format

```text
<label> (<decoration>,<decoration>): <subject>

<discussion>
```

Use one lowercase label. Parentheses and discussion are optional. Separate decorations with commas. Omit empty parentheses. Use the subject for the main point; use discussion for reasons and next steps.

## Labels

| Label | Use |
| --- | --- |
| `praise` | Identify a specific strength. Give sincere praise when warranted. |
| `nitpick` | Request a small preference change; non-blocking. |
| `suggestion` | Propose an improvement and explain its benefit. |
| `issue` | Identify a concrete problem and suggest a solution. |
| `todo` | Request a small, necessary change. |
| `question` | Ask for clarification about an uncertain concern. |
| `thought` | Share an idea; non-blocking. |
| `chore` | Request a required process task; link its instructions. |
| `note` | Supply information; always non-blocking. |
| `typo` | Identify a spelling error. |
| `polish` | Suggest a quality improvement. |
| `quibble` | Alternative to `nitpick`. |

## Decorations

- `blocking`: Resolve before acceptance.
- `non-blocking`: Acceptance can proceed without resolution.
- `if-minor`: Resolve only if the change is small.

Use a small set of topic decorations, such as `security`, `test`, or `ux`, when useful. Follow established team conventions.

A decoration states whether the comment must be resolved before merge. It does not state defect severity. Do not combine `blocking` with `non-blocking` or `if-minor`. Keep `nitpick`, `quibble`, `thought`, and `note` non-blocking. When team defaults are unclear, make the resolution requirement explicit for requested changes. Use `if-minor` for optional improvements whose effort is uncertain.

## Original code review examples

```text
issue (blocking): An empty list causes this request to fail.

When `items` is empty, `items[0].id` throws before the request is sent. Return the empty result before reading the first item.
```

```text
question (test,non-blocking): Does this test cover an expired token?

The fixture appears to use a valid token. Please confirm where the expired-token path is checked.
```

```text
suggestion (if-minor): Use the shared date formatter here.

This would keep the displayed date consistent with the account page. If it requires a larger change, we can handle it separately.
```

```text
nitpick (non-blocking): Rename `x` to `retryCount` for clarity.
```

```text
praise: The rollback test checks the database state after failure.
```

## Deliver or post

For drafts, provide the comment text and its file and line when available. Keep location metadata outside the comment body unless the review tool requires it there.

Post comments only when the user has asked for that action. Use the repository's required CLI or connector. Check the current PR diff and existing threads before posting, and place each comment on the relevant changed line.

Before posting:

- Check the entire comment, including quoted text and attachments, for secrets and private details.
- Preview the final Markdown, so that quotes, code blocks, and blank lines render as intended.

After posting:

- Confirm that GitHub returned the URL of the comment or review. If a write result is uncertain, read the threads before retrying to prevent duplicate comments.
- Resolve a review thread only after its reply was posted successfully.

Finish when each supported finding has one clear comment and each requested post is confirmed. Report any comment that could not be posted and why.

## Source

Adapted from [Conventional Comments](https://conventionalcomments.org/) by Paul Slaughter, licensed under [CC BY 3.0](https://creativecommons.org/licenses/by/3.0/). Read on 2026-10-06. Label and decoration guidance is condensed; code review steps, posting checks, and examples are added for this skill. Reply scope and some posting checks are adapted from `leaving-pr-comments` in [tstack](https://github.com/t3dotgg/tstack) (MIT), read on 2026-11-05.
