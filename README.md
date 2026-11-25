# LTEE variant calling

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.24536932.svg)](https://doi.org/10.5281/zenodo.24536932)

Mutations in three *E. coli* LTEE clones (Ara-3, 5,000–50,000 generations).
We compare variant counts and their sensitivity to minimum read depth.
Course project by Azamat Uzdenov; based on
[Tenaillon et al. (2016)](https://doi.org/10.1038/nature18959) and
[Data Carpentry](https://datacarpentry.github.io/wrangling-genomics/).

Requires [Pixi](https://pixi.prefix.dev/), internet, Linux/macOS or WSL2.
Hardware: CPU only. Software occupied 3.7 GiB and raw data 332 MiB on an Apple M3 Pro
with 18 GiB RAM; keep at least 10 GiB free for installation and analysis.
Containers need additional space. [Structure and measurements](docs/structure.md).

```sh
git clone https://github.com/AzamatUzdenov/ltee-project.git
cd ltee-project
pixi install --locked
pixi run reproduce
```

Downloads are checksum-verified; Snakemake runs the analysis and Quarto renders
`reports/ltee-report.html`. Outputs are regenerated in `results/`.
At minimum depth 2, variant counts are 25, 775 and 10 for SRR2584863,
SRR2584866 and SRR2589044. `pixi run compare-workflows` checks Nextflow
against Snakemake. CI also compares all records from the Docker pipeline.

[Data and sources](metadata/) · [Code](scripts/) · [Report](reports/ltee-report.qmd) ·
[Container](containers/) · [Saved image and HTML report](https://github.com/AzamatUzdenov/ltee-project/releases/tag/v1.0.0) · [Software versions](docs/software-versions.txt) ·
[Workflow](docs/rulegraph.svg) · [Cite](CITATION.cff) ·
[Questions](https://github.com/AzamatUzdenov/ltee-project/issues) ·
[Contribute](CONTRIBUTING.md)

Code: [MIT](LICENSE). Original report text and figures:
[CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).
[Teaching reads](https://doi.org/10.6084/m9.figshare.7726454.v3) retain the provider's CC0 terms; the NCBI reference keeps its source terms. Adapted Data Carpentry material retains
CC BY 4.0 attribution. Based on the
[course template](https://github.com/khan-lab/cbio7501-f26/tree/main/templates/cookiecutter-repro-project).
