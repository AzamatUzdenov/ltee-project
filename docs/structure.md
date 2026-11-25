# Project structure

| Path | Contents |
| --- | --- |
| `metadata/` | Sample sheet, source URLs and checksums |
| `data/raw/` | Downloaded inputs, excluded from Git |
| `data/processed/` | Prepared reference and indices, regenerated |
| `scripts/` | Downloads, shell pipeline, VCF comparison |
| `workflow/`, `config/`, `profiles/` | Snakemake, Nextflow, settings and Slurm profile |
| `notebooks/`, `reports/` | Exploratory notebook and executable Quarto report |
| `results/` | QC, alignments, variants, depth sensitivity, regenerated |
| `containers/`, `envs/` | Container recipe and Conda exports |
| `docs/` | Decisions, practice notes, versions and rule graph |

`pixi.toml` defines tasks; `pixi.lock` pins each supported platform.
The native bioinformatics environment supports Linux and macOS; Windows needs WSL2.
`docs/software-versions.txt` records the installed macOS ARM64 pipeline environment;
the lock contains the corresponding Linux and macOS Intel packages.

Measured on 25 November 2026: Apple M3 Pro, 18 GiB RAM; default environment
1.1 GiB, pipeline environment 2.6 GiB, raw inputs 332 MiB. Stored outputs depend
on whether temporary alignments and earlier workflow runs are retained.
On an MBZUAI Slurm allocation (4 CPUs, 16 GiB), the clean locked pipeline and
report took 3m11.24s; GNU time reported maximum RSS 408,216 KiB (about 399 MiB).
This excludes initial environment installation and is not a minimum RAM claim.
See the completion checks in `docs/decisions.md`.

The README describes one-command reproduction. The report derives its tables
and figures from generated results. External data remain at figshare/NCBI,
with exact URLs and checksums in `metadata/`.
