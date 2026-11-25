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


## Reproducibility exercises, 25 November 2026

- The lesson 01a `hits.py` produced five different file hashes from the same
  gene set. Sorting yielded three identical files, SHA-256
  `11e23c29197d7debdf90a8289d968699ccd65fc0369677e499fae4680d54bd89`.
- A missing input is an access problem; missing package versions or notebook
  state is a reproducibility problem. Selecting genes before cross-validation
  leaks test information and can inflate accuracy even if the code reruns.
  Select features inside each training fold; preserve splits and the environment.
- The forensic methods paragraph leaves accessions, controls/replicates, genome
  build, blacklist/annotation, adapters/trimming, mapping filters, duplicate
  removal, peak consensus/counting, design formula and motif background unstated.
  Record them in a workflow and lock. See [the openness audit](audit.md).
- Lesson 11: a malformed ORCID was rejected by `cffconvert`; the actual citation
  passed validation. The rule graph rendered successfully.
- Lesson 12: an untracked `scripts/settings.py` was present locally and absent
  from a fresh GitHub clone. The disposable helper was removed afterwards.

- Git extras: a separate disposable clone contained no raw inputs; verification
  reported all seven missing. Deleting and committing the download script and
  sample sheet, then restoring them from `HEAD~1`, returned the tree exactly to
  its original contents. These practice commits were not pushed to the project.
  The last prior decision-log change was `4a6502a` (17 November).
- Pixi Part C: `pixi global install cookiecutter` installed Cookiecutter 2.7.1;
  the exposed command runs from outside a project. The same Linux/macOS lock
  has also been exercised through the MBZUAI Slurm scheduler.
