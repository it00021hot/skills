# Web UI Design Sources

Audit snapshot date: 2026-09-29. Complete source snapshots and full file inventories are preserved under `~/.agents/skill-archives/product-design-2026-09-29/product-design/sources/`. That archive is for provenance and selective audit; it is not loaded as an active instruction set. Restricted-source indexes and per-file inventories are retained in the archive.

| Source | Snapshot | Audited material | License and handling |
|---|---|---|---|
| [Anthropic frontend-design](https://github.com/anthropics/claude-code/tree/dec92bc/plugins/frontend-design/skills/frontend-design) | `dec92bc`, 2026-09-28 | Full skill read from temporary audit checkout; file index retained | Repository says all rights reserved / commercial terms. No source text copied; source and audit notes retained. |
| [UI UX Pro Max](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill/tree/09170ee/.claude/skills/ui-ux-pro-max) | `09170ee`, 2026-09-27 | Complete Skill folder, including references, scripts, tests, and data | MIT; original LICENSE retained in archive. |
| [Frontend UI/UX Skill](https://github.com/overseek944/frontend-ui-ux-skill/tree/fa25478) | `fa25478`, 2026-08-02 | Complete repository snapshot, including skill and references | MIT; original LICENSE retained in archive. |
| [Apple Design Skill](https://github.com/dickwu/apple-design-skill/tree/39ea3fb) | `39ea3fb`, 2026-09-22 | Workflow and source index audited from temporary checkout; HIG source pages indexed | No general license for the skill was identified; Apple HIG text belongs to Apple. No HIG text copied. Official HIG linked in `platform-principles.md`. |
| [Desktop UI Design Skills Pack](https://github.com/palamut62/ui-design-skills-pack/tree/4ffc9d6) | `4ffc9d6`, 2026-06-04 | README, license, and all 19 style Skills | MIT; original LICENSE retained in archive. Styles reviewed as conditional visual options. |

## Extraction and conflict decisions

- The user brief determines purpose, audience, real content, and desired direction.
- Existing product conventions are kept when they serve users and the task.
- Applicable accessibility requirements and browser behavior constrain the implementation; aesthetic preferences can be adapted within those constraints.
- Catalogue recommendations, style recipes, and anti-template advice remain optional. No catalogue has authority to override the user's direction or project design system.
- Web/mobile thresholds in source snapshots are not transferred to desktop GPUI controls. For web, use CSS pixel units and current WCAG text; a recommended 44px touch target is not mislabeled as the WCAG 2.2 AA 24px minimum.
- Apple principles inform evaluation. Apple-specific appearance and copyrighted HIG content are not copied.
- Restricted source text and full archived materials remain outside this active Skill. The active references here are an original synthesis; source-specific reuse remains subject to the licenses recorded above.

## Scenario routing check

- **Web marketing page:** use `web-ui-design`; read Web method, Design intelligence, Anti-template review, and final review. Tie hero/content style to the actual product and brief.
- **Web data interface:** use `web-ui-design`; read Web method, Accessibility, Design intelligence for charts/data, and final review. Check units, filtering, non-color status, keyboard access, responsive tables/charts, and empty/error states.
- **GPUI application:** this Skill does not own it; route to the separate `gpui-ui-design` Skill, whose Design Guides and Coding Guides are normative for GPUI Kit work.
