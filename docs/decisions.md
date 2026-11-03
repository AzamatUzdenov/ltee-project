# Decision log

- Variant filter: report results at minimum read depth 2 and 10, and decide which to keep once we can compare them (Ada wanted 5 to reduce false calls; Ben 10, about the mean depth).

- 2026-11-03: Pixi practice rebuilt the locked environment and reproduced a manifest/lock mismatch. Adding BWA to the LTEE default environment fails for win-64. Keep Windows support for reports and put the pipeline tools in a separate Linux/macOS feature next; that feature is not configured yet.

- 2026-11-03: Configured a Linux/macOS pipeline feature and environment for FastQC, MultiQC, BWA, samtools and bcftools; the default environment retains Windows support. Verified that all five tools start on macOS.

- 2026-11-03: Replaced the reproduce placeholder with data verification, QC and variant calling. The local run at minimum read depth 2 produced 25, 775 and 10 variants for SRR2584863, SRR2584866 and SRR2589044, matching the current course example. FastQC flagged base composition as FAIL for three FASTQs and GC/length warnings for all six; these flags remain in the MultiQC report. The earlier plan to compare depths 2 and 10 remains a separate analysis step.
