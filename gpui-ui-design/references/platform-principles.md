# Cross-Platform Principles for GPUI

Apple's Human Interface Guidelines offer a useful evaluation lens for clarity, user agency, platform fit, accessibility, consistency, and feedback. Apply these principles to the product's actual users and desktop environment; do not treat Apple visual conventions as the default GPUI look.

## Apply through the user's task

- Make the purpose of a view and its next useful action easy to find.
- Keep navigation, data changes, and consequential actions understandable and under user control. Confirm destructive or hard-to-reverse actions proportionally.
- Establish hierarchy with the product's typography, spacing, contrast, semantic theme roles, and layout. Add material or decoration when it clarifies structure or supports the brief.
- Use familiar desktop patterns when they lower learning cost. Preserve explicit keyboard actions, focus, pointer behavior, and window conventions for the target environment.
- Give immediate, proportional feedback. Use motion to preserve context and explain a change; respect reduced-motion or other applicable accessibility settings.
- Support text scaling, legible contrast, visible focus, and the input methods the product needs.

## Translate, do not imitate

Do not default to SF Pro, translucent materials, pill controls, Apple-like radii, large whitespace, or an Apple-styled marketing surface. In GPUI Kit, use its semantic theme and components; let the product brief and actual platform decide visual direction. If the product specifically targets macOS or another Apple platform, consult the [current official Apple Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/) for platform-specific conventions, then reconcile them with the project's component system.

For GPUI Kit, the Longbridge Design Guides remain the direct design authority and its Coding Guides/current project source remain the implementation authority. This reference is an evaluation lens, not a replacement for either guide. Apple-owned HIG text is linked rather than copied.
