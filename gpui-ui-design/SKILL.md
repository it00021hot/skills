---
name: gpui-ui-design
description: Design, implement, or review user interfaces for GPUI desktop applications, including GPUI Kit and gpui-component screens, components, layout, theming, focus, input, overlays, data views, accessibility, and interaction quality.
---

# GPUI UI Design

Shape the interface around the user's desktop workflow, then implement it with the actual GPUI project architecture and components. Preserve a clear product identity while meeting accessibility, desktop interaction, and framework constraints.

## Start with the normative guide

Before any visible GPUI change or design review, read the complete [GPUI Kit Design Guides](references/design-guides.md). It is the governing design source for GPUI Kit and gpui-component apps. For narrow tasks, read the whole guide as requested by its source skill; do not infer the rules from this summary.

Before implementing GPUI Kit code, also read the complete [GPUI Kit Coding Guides](references/coding-guides.md), or the sections relevant to the task after first reading the architecture overview and rules for coding agents. Current source code and API docs decide exact signatures.

For a project using bare GPUI or a different component library, inspect its existing APIs and conventions. Use GPUI Kit specific component and theme rules only when that library is actually in use. The AprilNEA framework and component materials are preserved in the audit archive; they inform the merged principles below, but Longbridge's current guides govern GPUI Kit work here.

## Workflow

1. Inspect the application shell, target feature, relevant components, theme, window model, content, and current input/keyboard behavior.
2. Name the primary user task, the product object, immediate actions, decision information, and required states: empty, loading, error, offline, read-only, and permission-denied as applicable.
3. Choose a desktop shell and panel proportions from the workflow: single workspace, persistent sidebar, master/detail, document workspace, or utility window. Define minimum, comfortable, and surplus behavior for major panes.
4. Compose established semantic controls and GPUI Kit components first. Define application-specific visual direction through theme tokens and composition. Create a new primitive only for genuinely new reusable behavior.
5. Implement visible and behavioral states together: focus, selection, hover, pressed/open, disabled, loading, validation, error, and destructive confirmation as relevant. Give each scroll region, overlay, and keyboard command a clear owner.
6. Review in a real window or preview when available. Complete the workflow with pointer and keyboard, resize the window, inspect the actual content states, and run the Design review checklist.

## Conflict and priority order

- The user's task, audience, product meaning, and requested visual direction determine the design goal.
- Accessibility and desktop platform interaction requirements constrain how that goal is expressed.
- In a GPUI Kit or gpui-component project, its existing component API, theme system, and normative Design/Coding Guides constrain implementation.
- Existing application conventions should be preserved when they support the task and users.
- Style packs, catalogues, and framework examples suggest options only; they do not override the brief or current project APIs.

A requested visual style can change palette, density, material, and component composition. It does not authorize broken keyboard flow, unreadable text, invented GPUI APIs, or unstable ownership. If the project is not using GPUI Kit, do not import GPUI Kit conventions as if they were GPUI framework rules.

## Focused references

- Full normative GPUI Kit design principles, layout, semantics, interaction, motion, copy, accessibility and review: [Design Guides](references/design-guides.md)
- Full GPUI Kit architecture and implementation constraints: [Coding Guides](references/coding-guides.md)
- Cross-platform evaluation principles, including Apple's HIG lens: [Platform principles](references/platform-principles.md)
- Cross-source synthesis and GPUI mechanics: [Implementation method](references/implementation-method.md)
- Findings where archived examples conflict with current design and API guidance: [Source conflict audit](references/source-conflicts.md)
- Assessment of the 19 desktop visual styles: [Style evaluation](references/style-evaluation.md)
- Source versions, attribution and conflicts: [Sources](SOURCES.md) and [Longbridge notice](NOTICE.md)

## Review before completion

Verify that the primary task is visible; actions name the object, scope, and outcome; emphasis is limited; components preserve their focus and keyboard behavior; theme, density, zoom, and platform remain coherent; every scrollable region and overlay has one owner; all important states are represented; and the feature remains usable at minimum window size and increased text scale. Compare peer alignments at the resolved window sizes rather than patching structural errors with arbitrary pixel offsets.
