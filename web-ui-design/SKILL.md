---
name: web-ui-design
description: Design, implement, or review user-facing web interfaces, including sites, web apps, dashboards, forms, components, responsive layouts, design systems, accessibility, and interaction quality. Use for visual or interaction changes; skip backend-only work.
---

# Web UI Design

Create a web interface that expresses this product's purpose, serves its real users, and works across input methods and screen sizes. The user's brief and the existing product context lead the design; references provide candidates and checks, not preset answers.

## Workflow

1. **Understand the product.** Inspect the repository, current screens, component system, tokens, content, and build/preview workflow. Identify the users, primary task, real data, target browsers/devices, and constraints.
2. **Set the design intent.** For a new page or substantial redesign, state a concise product-specific visual direction and the hierarchy it supports. For a narrow fix, make the smallest design decision needed. Ask only when an unresolved choice would materially change the result; otherwise make a grounded assumption.
3. **Plan the experience.** Define information order, responsive behavior, controls, navigation, focus path, content, and relevant empty/loading/success/error/validation states. Pick a visual system from the product and brief. Catalog styles, palettes, typography, and examples are options to evaluate, not defaults to apply.
4. **Build in the project’s idiom.** Reuse the actual framework, components, tokens, and naming conventions. Keep semantics, keyboard behavior, responsive layout, and visual states together. Avoid speculative abstractions.
5. **Review the rendered interface.** Compare it with the brief and the review checklist. Inspect a live preview at narrow and wide sizes when available. Fix the largest hierarchy, readability, or interaction problems before reporting.

## Read the focused references

- Product flow, layout, typography, responsive behavior, and accessibility: [Web method](references/web-method.md)
- Practical Web accessibility and standards: [Accessibility](references/accessibility.md)
- Design catalogues and how to use them without copying their defaults: [Design intelligence](references/design-intelligence.md)
- Apple HIG principles without Apple-specific visual imitation: [Platform principles](references/platform-principles.md)
- Common template patterns to question: [Anti-template review](references/anti-template.md)
- Final visual and interaction pass: [Design review](references/design-review.md)
- Source versions, license decisions, and conflict audit: [Sources](SOURCES.md)

For a marketing page, read Web method, Design intelligence, Anti-template review, then Design review. For a data interface, also read Accessibility and the data-interface section in Web method. For a component fix, read only the relevant method and review sections.

## Decision order

1. The user's explicit goal, audience, content, and brand direction.
2. Product and repository conventions that already serve users.
3. Applicable accessibility requirements, browser behavior, and platform conventions.
4. A coherent visual direction and the smallest implementation that supports it.
5. Source catalogues and style examples as optional evidence.

A visual preference can shape the interface within accessibility and platform constraints. If a request appears to conflict with an applicable requirement, retain the user's intent where possible and explain the smallest adjustment that preserves access.

## Finish

Report what changed and what you could inspect. Do not claim a visual or accessibility check that was not performed. The complete source bundle lives in the audit archive listed in `SOURCES.md`; it is provenance material, not instructions to load wholesale during ordinary work.
