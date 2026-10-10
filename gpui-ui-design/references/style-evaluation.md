# Desktop Style Pack Evaluation

The MIT desktop pack contains 19 named looks. They were each assessed as visual options. A style name is not a product brief; apply a direction only when the user or product context calls for it. The GPUI Kit theme and platform behavior still govern implementation.

| Style | Suitable when the brief calls for | Design judgment and guardrail |
|---|---|---|
| Glassmorphism dashboard | A calm, atmospheric analytics shell | Use transparency only where the underlying surface stays legible; keep tables and forms more opaque; provide a low-blur fallback. |
| Dark developer UI | Editor, terminal, repository or developer workflow | Reserve monospace for code/data; keep status meaning textual and focus visible. |
| Minimal sidebar | Business CRUD and straightforward navigation | Quiet structure can help; choose sidebar width and density from content, not fixed template dimensions. |
| Command palette | Keyboard-first command or navigation discovery | Must remain a supplement to visible navigation and actions; implement full focus, arrow, enter and escape behavior. |
| Card dashboard | KPI and chart summary workflows | Cards are useful only when each groups a decision; avoid repeated identical modules that obscure priorities. |
| Neumorphism | Low-risk personal tools with tactile controls | Its low-contrast shading is a risk; never use shadow as the only boundary, state, or focus cue. |
| Fluent Windows | Product intentionally aligned with Windows conventions | Prefer actual platform integration and system colors/controls; acrylic is optional material, not the whole design. |
| Split-panel workspace | Editing, inspection, and master/detail work | Define pane minima, resize behavior, persistence, focus, and per-pane scrolling. |
| Kanban board | Status flow and movable work items | Drag needs visible alternative commands and keyboard support; selection and drop targets must be distinct. |
| Terminal plus GUI | Operational controls attached to command output | Make the executed command, working directory, cancellation, and log state clear; do not hide essential controls in terminal text. |
| Floating tool window | One fast auxiliary task | Preserve draggable chrome, pin state, window controls, keyboard reopening, and unobstructed primary content. |
| Workspace | Dense multi-tool editing environment | Use persistent panels and stable focus/scroll ownership; don't borrow a generic IDE layout without matching tasks. |
| Settings-first | Configuration, integrations, credentials | Mask secrets, show unsaved changes, keep validation near controls, and make test/save/reset distinct. |
| Data-table admin | Search, filter, compare, select, and operate on records | Keep row identity stable, selection separate from hover, status textual, and bulk actions scoped. |
| AI chat plus tool panel | Conversation paired with controllable generation | Show tool-running states, sources, current parameters and results; keep composer reachable and errors recoverable. |
| Classic Windows form | Explicit retro/legacy product direction | Use only when requested; preserve legibility, keyboard access, and current safety expectations. |
| Cyberpunk HUD | Fictional, game, telemetry, or explicitly branded control room | Neon and glow can damage reading; reserve alarm colors for real alarms and keep text crisp. |
| Neo-brutalism | Explicitly bold, playful creator/product direction | Hard edges and saturated color need a readable hierarchy and restrained status semantics. |
| Claymorphism | Friendly creative or personal low-risk tool | Large soft surfaces consume space; keep contrast and focus rings independent of shadows. |

The pack repeats template measurements, fixed palettes, all-state lists, and generic acceptance criteria. Those measurements are not GPUI design tokens. Use the current GPUI Kit Design Guides for density, spacing, color, radii, zoom, geometry and interaction. Exact style may override defaults only when the brief supports it and accessibility/platform behavior remains intact.
