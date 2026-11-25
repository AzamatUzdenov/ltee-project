# Openness audit

Course worked example, independently checked on 25 November 2026 for Azamat Uzdenov.
Paper: [Scorza et al. (2022), SARS-CoV-2 RNA levels in Scotland’s wastewater](https://doi.org/10.1038/s41597-022-01788-3).
Code inspected at [RC-1.2.2, ebb62d9](https://github.com/BioRDM/COVID-Wastewater-Scotland/tree/RC-1.2.2).

| Row | Score | Verified evidence |
| --- | --- | --- |
| Paper | 2 | Full open article, three figures, CC BY 4.0 |
| Data | 2 | Original SEPA downloads and curated CSVs in the [versioned archive](https://doi.org/10.5281/zenodo.6349579) |
| Code | 2 | Same archive contains release RC-1.2.2 |
| Environment | 1 | Paper states R 4.1.2; `Installation.R` installs packages without versions; no lock/container found in this release |
| Methods | 2 | Paper methods and public [normalization protocol](https://doi.org/10.17504/protocols.io.b4eqqtdw), including decision tree and code |
| Licenses | 2 | Article, archive and repository identify CC BY 4.0 |

Total: 11/12. Lowest row: environment, an avoidable gap.
Ladder: rung 2, data and code with several manual commands, without a pinned environment.
Best improvement: record package versions in a lock and add one reproducible entry point.
Unlike the lesson's worked table, the paper does state its R version.

A direct CSV check reproduced 162 distinct sites and 14 health boards from
`data/sampling_sites.csv` and the main table (10,316 rows). The archived README
still says 122 sites. This checks dataset structure, not the full R analysis or
laboratory validity. No full R rerun or classroom group discussion was performed.

Availability statement, rewritten (under 60 words):

> Data and analysis code (CC BY 4.0) are archived at https://doi.org/10.5281/zenodo.6349579 (release RC-1.2.2). Detailed normalization is available at https://doi.org/10.17504/protocols.io.b4eqqtdw. Analyses used R 4.1.2; package versions were not recorded.

The concept DOI `10.5281/zenodo.6339631` currently resolves to version DOI
`10.5281/zenodo.6349579`, V1.2, 12 March 2022. Results should cite that exact
version rather than a moving latest-version identifier.
