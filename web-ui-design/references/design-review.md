# Web Design Review

Review the changed interface against the brief, real content, repository design system, and the target browser/device.

## Product and visual direction

- Is the primary task, its object, and the next action clear?
- Does the page look and read like this product and audience?
- Is the first viewport useful for the task rather than merely decorative?
- Do hierarchy, typography, spacing, and grouping make scanning easy?
- Does every prominent effect or card have a purpose?

## Interaction and states

- Are controls semantic and named for their result?
- Can the full task be completed with a keyboard? Is focus visible and unobscured?
- Are hover, focus, pressed, selected, disabled, loading, and expanded states distinct where needed?
- Are empty, loading, partial, success, validation, permission, and error paths accurate and recoverable?
- Do dialogs and menus support escape/cancel and logical focus return?

## Responsive and accessible behavior

- Does the hierarchy survive narrow and wide viewports, portrait/landscape where relevant, and browser zoom?
- Do long strings, larger text, and translated content fit or have a clear inspection path?
- Are contrast, non-text boundaries, color-independent status, labels, chart alternatives, and reduced motion covered?
- Are sticky elements and overlays clear of focused content?

## Data and performance

- Do charts communicate units, timeframe, series, and comparison with an accessible alternative?
- Are sorting/filtering/selection reversible and understandable?
- Do images and asynchronous content reserve space to limit layout shift?
- Are expensive resources deferred or split when that materially improves the task?

Inspect a live preview or screenshots when available. Use automated accessibility checks as one input alongside keyboard and visual checks. If a behavior was not observable, report that limit accurately.
