# Decision log

- Variant filter: report results at minimum read depth 2 and 10, and decide which to keep once we can compare them (Ada wanted 5 to reduce false calls; Ben 10, about the mean depth).

- 2026-11-03: Pixi practice rebuilt the locked environment and reproduced a manifest/lock mismatch. Adding BWA to the LTEE default environment fails for win-64. Keep Windows support for reports and put the pipeline tools in a separate Linux/macOS feature next; that feature is not configured yet.

- 2026-11-03: Configured a Linux/macOS pipeline feature and environment for FastQC, MultiQC, BWA, samtools and bcftools; the default environment retains Windows support. Verified that all five tools start on macOS.

- 2026-11-03: Replaced the reproduce placeholder with data verification, QC and variant calling. The local run at minimum read depth 2 produced 25, 775 and 10 variants for SRR2584863, SRR2584866 and SRR2589044, matching the current course example. FastQC flagged base composition as FAIL for three FASTQs and GC/length warnings for all six; these flags remain in the MultiQC report. The earlier plan to compare depths 2 and 10 remains a separate analysis step.

- 2026-11-04. Re-ran `pixi run reproduce` in the VS Code terminal. Data verification, QC and variant calling completed. Counts remained 25, 775 and 10 for SRR2584863, SRR2584866 and SRR2589044. All six BAM files passed `samtools quickcheck`, and the VCF records matched the previous run. Three base-composition FAIL flags and the GC/length warnings remain in the QC reports.

- 2026-11-17. Report minimum depth 2 for comparability with Data Carpentry. The increase in variant counts over generations holds at all four depths (2, 5, 10, 15). See the sensitivity figure in the report.


- 2026-11-25. Completed the environment portability exercises. The local amd64
  container built at 18:41:42–18:44:50 Asia/Dubai, but its first full analysis hit
  disk exhaustion. The image archive was transferred to MBZUAI at
  18:54:27–18:54:55; only the new temporary Colima VM was removed, restoring
  11 GiB locally. [PR #10](https://github.com/AzamatUzdenov/ltee-project/pull/10)
  compares every container VCF record with native results; both clean Linux
  checks passed (25, 775, 10). Commit `df10851` is dated 18:53:47; it entered
  main at 19:02:22. These are different events, not backdated work.
- 2026-11-25. Slurm 325840 started at 19:01:46 Asia/Dubai; its clean-clone stage
  began at 19:01:52. Reproduction passed. Its exact command start was not logged separately from installation. GNU time: 3m11.24s, maximum RSS 408,216 KiB, exit 0. Citation validation and
  clean tracked state passed. Initial scheduling attempts exposed a missing
  GNU time utility and already read-only raw files; the corrected run used
  an isolated `pixi exec` tool and preserved the protected inputs.
