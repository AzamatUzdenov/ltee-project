# Analysis notes

## 2026-11-10: Quarto practice

- **16:37 (Dubai):** Compared the first 2,000 and 10,000 reads per FASTQ file. Mean read lengths were 128 and 127 bases, respectively, and mean GC content rounded to 50.5% in both reports.
- **16:56 (Dubai):** Checked the PDF export and ran the notebook from a fresh kernel, then cleared its outputs. `pixi run reproduce` verified all seven input files and reproduced the same variant records (25 for SRR2584863, 775 for SRR2584866 and 10 for SRR2589044).

[Download the PDF and both HTML reports](https://github.com/AzamatUzdenov/ltee-project/releases/tag/quarto-practice-2026-11-10) · [Course exercise](https://khanlab.bio/cbio7501-f26/pages/07-quarto.html#a-helper-module-for-the-report)

## 2026-11-25: workflow continuation

- 17:15:15 Asia/Dubai. Resumed the full Nextflow workflow, completing 28 tasks and reusing four QC tasks.
- 17:16:07. Raised the minimum depth to 10. Six tasks ran and 26 were cached. Counts of 5, 16 and 415 matched the depth-10 sensitivity outputs.
- 17:16:09. `pixi run compare-workflows` reproduced the same VCF records with Snakemake and Nextflow (10, 25, 775 variants). At 17:18:47 the execution report reused all 32 tasks. The wrong-launch-directory exercise failed as expected, and the Quarto report was rebuilt.
- 17:17:35. Slurm started the pinned nf-core/demo 1.2.0 checkout (`32893afe`) with Singularity. All eight tasks passed. The demo ended at 17:18:49, and the LTEE continuation at 17:19:44.

[Nextflow tutorial](https://khanlab.bio/cbio7501-f26/pages/10-nextflow.html)
