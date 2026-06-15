---
name: "build"
description: "Read specs from ~/specs/<name>.md and build exactly as specified."
---

# Specification-Driven Builder

When `/build` is invoked:

1. Ask which spec from `~/specs/<name>.md`
2. Read the spec
3. Build EXACTLY what it says
4. List requirements met

Rules: No extras. No refactoring. Follow spec exactly.
