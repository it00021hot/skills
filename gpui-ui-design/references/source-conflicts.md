# Source Conflict Audit for GPUI

This is an original synthesis of conflicts found while reviewing the archived GPUI Kit guides, AprilNEA Skills, and desktop style pack. Resolve disagreements in this order: the user's brief; accessibility and desktop interaction constraints; the target project's current component/API and established conventions; then optional style examples.

## Design and implementation authority

For a GPUI Kit or gpui-component application, follow the Longbridge Design Guides for visual and interaction decisions and its Coding Guides for architecture. Check signatures and behavior against the version of GPUI Kit and GPUI actually present in the project. AprilNEA examples are useful for concepts, but older snippets do not establish current API behavior. For bare GPUI or another component system, use that project’s own design system and current API.

## Conflicts resolved

| Topic | Older or generic source pattern | Resolution |
|---|---|---|
| Color | Examples use literal RGB values or direct color fields as ordinary styling. | Use semantic theme roles and component variants. Reserve literal color values for a documented boundary such as a specific asset or required branded mark. |
| Spacing and dimensions | Examples frequently use hard-coded `px(...)` measurements. | Prefer the current kit's spacing, sizing, and text-scale helpers. Use pixel values where the API or a measured geometry calculation requires them; avoid them as a substitute for the design tokens. |
| Elevation and material | Style recipes use shadow, blur, glass, or neumorphic depth as a visual default. | Establish hierarchy with layout, contrast, and component surfaces first. Add elevation/material only when it communicates a real layer or the brief requests that visual direction. |
| List identity | Some examples derive IDs from an item's current list index. | Use stable domain identity for reorderable or mutable collections. Index identity is acceptable only when position itself is the stable identity and that constraint is explicit. |
| Error handling | Demonstration snippets sometimes discard results with `.ok()` or `let _ =`. | Handle failure intentionally at the feature boundary: show, recover, propagate, or document why it is safe to ignore. Do not copy a demo's omission as a project rule. |
| Focus and keyboard input | Generic snippets attach focus, key actions, or event handlers without the target component's full ownership context. | Follow the current component's focus handle, action propagation, subscription lifecycle, and window ownership. Test the user path through the real control. |
| Async tasks and entities | Examples vary in where they spawn work, retain handles, notify, or update entities. | Use the current Coding Guides and API docs for entity access, task ownership/cancellation, and notification. Avoid retaining strong handles or updating entities across the wrong app/window context. |
| Desktop density and target size | Web/mobile catalogues recommend fixed touch targets and responsive breakpoints. | Derive size and density from the desktop platform, input method, scaling, and the application’s conventions. Keep pointer and keyboard interaction usable without imposing mobile dimensions on every desktop control. |
| Style pack consistency | Each style family includes its own palette, radius, effects, and component recipe. | A selected family may guide a coherent visual direction, but use it as a brief-level choice. Do not mix recipe fragments blindly or replace semantic component states and platform behavior. |

## What remains binding across styles

Every control needs a visible state and a usable input path. Preserve readable hierarchy, focus indication, keyboard access where applicable, predictable selection, clear feedback, and recoverable error states. A visual direction can change palette, density, surface, and composition; it cannot remove the user's ability to understand or operate the interface.

## Review implications

Before completion, verify the exact component and style APIs against the checked-out dependency; review empty, loading, error, disabled, focused, selected, and destructive states as relevant; use stable identities in mutable lists; and exercise keyboard and pointer flows at the minimum supported window size. Treat archived samples as evidence and inspiration, not executable specifications.
