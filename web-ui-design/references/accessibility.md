# Web Accessibility

Use WCAG 2.2 AA as a practical baseline for public web interfaces, and follow stronger legal, contractual, or product requirements when they apply. Refer to the current standard and supporting understanding docs rather than assuming archived catalogue data is current.

- **Semantics:** Use native headings, landmarks, buttons, links, lists, tables, and form controls. Keep heading order meaningful. Use a link for navigation to a resource/location and a button for an action. Supply an accessible name and expose state for icon-only controls.
- **Keyboard:** Every action must work without a pointer. Keep tab order aligned with reading/task order, show a clear focus indicator, avoid traps except within a modal dialog, and return focus to a logical location after dismissal or navigation. Provide non-drag and non-gesture ways to complete essential actions.
- **Focus visibility:** Sticky UI, banners, and overlays must not cover the focused element. Keep focus rings out of clipped overflow. Dialogs need a close/cancel path and correct focus entry/return.
- **Text and contrast:** Verify text contrast against its actual surface (4.5:1 for normal text; 3:1 for large text under WCAG AA). Check meaningful non-text boundaries and indicators against the relevant non-text contrast requirement. Never use color as the only status cue.
- **Target size:** WCAG 2.2 AA includes a 24 by 24 CSS pixel minimum with defined exceptions. A larger 44 by 44 CSS pixel target is a useful touch-friendly design goal, not a replacement unit or universal WCAG minimum. Space nearby targets to prevent accidental activation.
- **Reflow and zoom:** Preserve content and functionality at 200% zoom and the applicable 400% reflow test width. Avoid two-dimensional scrolling except where the content genuinely requires it, such as a data table or diagram. Use flexible containers and allow long user-provided strings to wrap.
- **Forms:** Give each input a persistent programmatic label. Associate instructions and errors with the field. Explain how to fix errors; after failed submission, make the error summary and affected fields easy to find without moving focus unexpectedly.
- **Dynamic updates:** Announce meaningful asynchronous status without stealing focus. Use live regions only when they add needed context; avoid announcing every small change.
- **Motion:** Respect `prefers-reduced-motion`; do not make motion necessary to understand state or block interaction during a transition.
- **Images and charts:** Provide useful alternatives for informative images. Give charts a concise text summary and access to the underlying data or equivalent description.
- **Authentication:** Allow password managers and paste unless a specific, justified security rule requires otherwise.

Verification should combine automated checks with keyboard use, browser zoom/reflow, contrast measurement, and screen-reader spot checks where available. Automated tools do not establish complete conformance.

Primary references: [W3C WCAG 2.2](https://www.w3.org/TR/WCAG22/), [Understanding WCAG 2.2](https://www.w3.org/WAI/WCAG22/Understanding/), and [WAI ARIA Authoring Practices](https://www.w3.org/WAI/ARIA/apg/).
