# Decision log

- Variant filter: report results at minimum read depth 2 and 10, and decide which to keep once we can compare them (Ada wanted 5 to reduce false calls; Ben 10, about the mean depth).

- 2026-11-03: Pixi practice rebuilt the locked environment and reproduced a manifest/lock mismatch. Adding BWA to the LTEE default environment fails for win-64. Keep Windows support for reports and put the pipeline tools in a separate Linux/macOS feature next; that feature is not configured yet.
