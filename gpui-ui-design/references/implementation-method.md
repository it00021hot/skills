# GPUI Implementation Method

This reference merges the GPUI framework and component guidance from AprilNEA with the current GPUI Kit rules. It is a workflow aid. The included Longbridge guides govern GPUI Kit design and code; current project source governs exact APIs.

## Choose the actual component model

Start from the user's domain and the real control semantics. Prefer Button for an in-app command, Link for an external resource, native navigation controls for destinations, and the GPUI Kit component that matches the behavior. Menus, popovers, selects, dialogs, sheets, and command palettes have different focus, selection, keyboard, and dismissal contracts; do not substitute a generic surface because it looks similar.

For a new GPUI Kit view, initialize the library and use its Root/window flow. Use `RenderOnce` for a value-like element and an `Entity<T>`/`Render` view for retained behavior, observation, subscriptions, focus, or async work. Keep retained state in its narrowest owner. Do not rebuild it in `render`.

## Framework mechanics to carry forward

- GPUI entities are accessed through the provided contexts. Read for observation; update for mutation. Notify once after a coherent visible state change. Emit typed events for semantic changes.
- Use weak entity handles to prevent ownership cycles and to cope with a view being dropped during async work. Keep tasks and subscriptions alive by storing or detaching them intentionally.
- Keep render declarative. Start async work from an event or lifecycle method, represent loading and failure, reject stale results, and move expensive computation off the UI thread.
- Give repeated elements stable domain-derived IDs. Never use a changing list position or a freshly generated random value as identity.
- Use actions and key contexts for keyboard commands. Keep focus ownership explicit, show focus, and restore focus after an overlay closes. Essential actions cannot depend on hover or dragging alone.
- Establish one owner for scrolling, pane sizing, and overlay geometry. Use GPUI layout before measuring; keep measurement in the behavior that needs it and invalidate cached geometry when its inputs change.
- In GPUI Kit, use active theme semantic roles and relative scale helpers. Do not place raw palette colors or arbitrary product geometry at each call site. A deliberate exception belongs in the theme or product token layer.
- Prefer application composition over adding a new library primitive for one screen. Put reusable behavior in Base and product presentation in GPUI Component or the application.

These principles overlap substantially between AprilNEA and Longbridge. Longbridge resolves the differences for GPUI Kit: it refines state ownership, public API, focus restoration, exact layout, localization, testing and theme behavior. Older examples are not authority for current method names.

## State and interaction map

For each interactive feature, write down:

- **Owner:** which entity/model holds the domain value and which component handles presentation.
- **Identity:** which stable ID distinguishes this item when order or labels change.
- **Input:** pointer, keyboard actions, focus traversal, and any drag alternative.
- **State:** rest, hover, focus-visible, selected, disabled/read-only, open, loading, success, and recoverable error states.
- **Result:** what visible object changes, how the outcome is announced, and where focus goes next.
- **Layout:** which pane may shrink, wrap, clip, or scroll; where the scrollbar belongs.
- **Theme:** semantic theme roles and justified product token additions.

## Implementation review

Before completion, check the full Design Guides checklist and the applicable Coding Guides checklist. In particular, inspect source signatures rather than guessing; verify the UI in an actual window when possible; and report separately which functional, automated, and visual checks were performed.
