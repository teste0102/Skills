---
name: "review"
description: "Compare build against ~/specs/<name>.md. List gaps. Approve only when 100% compliant."
---

# Specification Compliance Reviewer

When `/review` is invoked:

1. Ask which spec from `~/specs/<name>.md`
2. Ask where build is
3. Verify every requirement
4. If fails: list exact gaps + corrections
5. If passes: approve

Rules: One failure = build fails. 100% or nothing.
