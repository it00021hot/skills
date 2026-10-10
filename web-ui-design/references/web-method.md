# Web Design Method

## Direction and structure

Begin with the user’s job, domain objects, real copy, and data. Make the first viewport show the page’s distinctive value and a useful next action; a large hero is one possible layout, not a requirement. Choose a type scale, palette, spacing rhythm, and grid that reinforce the product. Use color, borders, cards, shadows, and labels when they explain grouping, state, or depth. Keep one clear focal point per region.

Let content determine the layout. Decide which information is primary, supporting, or optional before choosing a component. Use page sections, navigation, cards, and progressive disclosure only where they explain relationships. Repeated patterns should be consistent, but do not turn every item into an identical card.

## Responsive behavior

Design the content hierarchy to survive a narrow viewport, then add room for wider layouts. Do not simply shrink a desktop canvas. Establish sensible content widths and breakpoints from where the content stops working. Keep essential actions available, reflow toolbars and chip groups, and give tables an intentional strategy such as column prioritization, horizontal scrolling with context, or a compact list view. Avoid fixed widths that cause page-level horizontal overflow.

At browser zoom and larger text sizes, keep the same task possible. Let long labels wrap where practical. If text must truncate, retain a way to inspect the full value with pointer and keyboard. Sticky bars and overlays must leave focused controls visible.

## Interaction and content states

Use native semantic controls when they fit. A control’s name, role, state, and result must agree. Provide visible focus, hover and pressed feedback, clear selected and disabled states, and keyboard alternatives for drag or gesture actions. Never make hover the sole route to an essential action.

Design the states the real workflow can reach: initial, empty, loading, partial, success, validation failure, network or server failure, permission denied, and disabled/read-only where relevant. Keep errors next to the affected content and give a recovery action. Preserve user input during recoverable failures. Avoid showing a skeleton for content that is already available or a spinner without explaining a long wait.

Keep interface copy concise and specific. Use the product’s vocabulary consistently. Label actions by outcome; name the object or scope when the surrounding context does not make it clear. Do not make placeholders carry the only field label. Keep translated text natural rather than mechanically preserving another language’s word order.

## Data interfaces

Organize a dashboard around a question or decision. Make the summary, important change, and needed action visible before decorative metrics. Choose chart types to match the comparison, trend, or distribution; label units, time range, and series. Use locale-aware numbers and dates. Provide a textual summary and an accessible data alternative for chart information. Make chart focus and exact values available without hover alone.

For tables, make sorting, filtering, selection, bulk actions, pagination, and row details understandable and reversible. Separate row hover from selection. Keep active filters visible and removable. Preserve selection by record identity as results reorder. Do not use color alone for status. Long datasets may need virtualization; ensure the accessible and keyboard model still describes the full collection.

## Visual restraint without sameness

Question familiar generated defaults instead of banning them. For each large card group, gradient, blur, shadow, badge, animation, oversized heading, or decorative label, ask what user need it serves. Remove effects that do not strengthen hierarchy, identity, feedback, or comprehension. Distinctive does not mean novel at any cost; quiet does not mean generic.
