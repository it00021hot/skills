# GPUI UI Design Sources

Audit snapshot date: 2026-09-29. The complete original audit package, file inventories, MIT notices, and restricted-source indexes are preserved under `~/.agents/skill-archives/product-design-2026-09-29/product-design/sources/`. The archive is not automatically loaded as instructions.

| Source | Snapshot | Material read and preserved | License/authority |
|---|---|---|---|
| [Longbridge GPUI Kit](https://github.com/longbridge/gpui-kit) | Local installed Skill snapshot, 2026-09-29; upstream commit not recorded in installed snapshot | GPUI Kit and Design Guides Skills; complete Design Guides and Coding Guides were read in full and copied unedited. Skill entrypoints, conventions, usage, recipes, and targeted GPUI API references were reviewed. Remaining low-level API examples and test references are inventoried in the archive for task-specific lookup; they are not promoted to normative design rules. | Design and Coding documentation CC BY 4.0; full guide copies included and unedited in `references/`, attribution at `NOTICE.md`. Normative for GPUI Kit design and code. |
| [AprilNEA GPUI Skills](https://github.com/AprilNEA/gpui-skills/tree/3961d8c) | `3961d8c`, 2026-01-21 | README, GPUI Skill entrypoint and core rule groups, gpui-component Skill entrypoint and component patterns; all original files retained in archive | README declares MIT; no standalone LICENSE file in snapshot. This Skill contains an original synthesis. Longbridge guide/API resolves conflicts for GPUI Kit. |
| [Desktop UI Design Skills Pack](https://github.com/palamut62/ui-design-skills-pack/tree/4ffc9d6) | `4ffc9d6`, 2026-06-04 | README, LICENSE, all 19 individual style Skills | MIT; full source and LICENSE retained in archive. Every style assessed in `references/style-evaluation.md`; none is an unconditional default. |
| [UI UX Pro Max](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill/tree/09170ee/.claude/skills/ui-ux-pro-max) | `09170ee`, 2026-09-27 | Skill, quick reference, pro rules, stack metadata and catalog schema/data inventory | MIT, preserved in archive. Web/mobile rules and units are not copied onto desktop controls by default. |
| [Apple Design Skill](https://github.com/dickwu/apple-design-skill/tree/39ea3fb) | `39ea3fb`, 2026-09-22 | Workflow and index audited; its cross-platform evaluation lens is synthesized in this Skill's `references/platform-principles.md`; Apple HIG pages indexed | No general license identified for the Skill and HIG text belongs to Apple. No copied HIG text; official HIG link is provided for Apple-specific decisions. |

## Upstream re-verification

Re-checked against upstream on 2026-10-10 (gpui-kit `main` at commit `ed27c62`, crates at 0.7.1; v0.7.1 released 2026-10-05, v0.7.0 on 2026-09-28, so the 2026-09-29 snapshot corresponds to v0.7.0):

- The verbatim guide copies in this Skill (`references/design-guides.md`, `references/coding-guides.md`) remain byte-identical to upstream HEAD; no re-copy was needed. The `getting-started.md` pointer target is still live.
- The repository formerly at `longbridge/gpui-component` now redirects to `longbridge/gpui-kit`; `gpui-component` remains the component crate inside that repository, so the name stays valid in this Skill's description and source table.
- Upstream changes since the snapshot are additive and confined to the API-reference tier this Skill deliberately does not copy (archived for inventory; current source decides exact signatures): new `Diff` readonly patch viewer, `SpeechButton` dictation (speech feature), standalone `resize_handle`/`ResizeHandle`, configurable tooltip delays (`TooltipDefaults`), focus-recovery guidance (`cx.on_focus_lost`, `window.focus_lost_restore_target`), and an extended UI-test harness (semantic accessibility queries, `find_all`, `ClickOptions`/`click_with_options`).
- The released `Root` owns the dialog, sheet and notification layers; the manual `Root::render_*_layer` APIs are gone. Neither guide copy referenced them, so no conflict arises. Upstream's root `release-notes.md` still heads all of this "0.7.0 (unreleased)"; on 2026-10-10 each entry was attributed against the tagged sources — everything in it except the standalone `resize_handle` had already shipped in v0.7.0/v0.7.1. No upstream contribution was made; until upstream rolls the heading forward itself, treat that file's "unreleased" labels as unreliable and verify against tags and GitHub Releases.

## Source areas reviewed

The comparison covered user-brief discovery, visual direction, layout/hierarchy, typography, color/theme, density, components, state and feedback, accessibility, keyboard/pointer interaction, responsive/window resizing, overlays, data displays, motion, interface copy, GPUI ownership/rendering/events/focus/async, public API and testing. The archived `SOURCES.md` and `sources/restricted-source-index.md` retain file-level inventories for all collected sources. Data catalogs, fixtures and scripts remain source material and were not copied into active instruction references.

## Resolution

- User task, object, audience and requested visual direction define product intent.
- Accessibility and familiar desktop interaction constrain how intent is realized.
- The current Longbridge Design Guides are normative for GPUI Kit visual and interaction decisions; Coding Guides and current source APIs govern implementation.
- AprilNEA adds clear framework reminders on entities, notifications, task/subscription lifecycle, actions, focus, and component patterns. Where an old example diverges from the current kit, verify against Longbridge/current source.
- Visual style families remain explicit, conditional options. Their fixed colors, dimensions, desktop/browser assumptions, and repeated component recipes do not become universal tokens.
- Web/mobile guidance does not automatically determine native desktop target sizes or window behavior.
- Archived examples that disagree with current guidance are resolved in the [source conflict audit](references/source-conflicts.md).
- Apple-derived principles are an evaluation lens for clarity, user control, feedback, consistency, accessibility and platform fit; Longbridge remains normative for GPUI Kit, and Apple appearance is not a default.

## Scenario routing check

- **Web marketing page:** use `web-ui-design`; this Skill is not the entry point for web implementation.
- **Web data interface:** use `web-ui-design` and its web accessibility/data references.
- **GPUI desktop interface:** use this Skill. Read the entire Design Guides. For implementation, read the Coding Guides and current component docs; use the conflict audit when examples differ. Then inspect pointer, keyboard, focus, window resizing, themes, overlays, states and layout in a real window where available.
