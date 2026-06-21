---
name: "iterate"
description: "Automated loop: build → review → correct → repeat until approved."
---

# Automated Iteration Loop

When `/iterate` is invoked:

1. Ask which spec from `~/specs/<name>.md`
2. Loop (max 5 times):
   - Run `/build`
   - Run `/review`
   - If approved: STOP and report
   - If rejected: extract corrections, rebuild

Rules: No skipping. Always build → review → correct. Max 5 iterations.
