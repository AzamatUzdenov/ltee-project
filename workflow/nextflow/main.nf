// LTEE variant calling with Nextflow.
//
// Same steps and tool options as workflow/Snakefile, which follow Data
// Carpentry "Wrangling Genomics" (variant calling episode, CC BY 4.0,
// https://datacarpentry.github.io/wrangling-genomics/04-variant_calling.html),
// with FastQC and MultiQC added at the start.
//
// Run from the project folder, with the same settings file as Snakemake:
//   pixi run run-nextflow
// (or: pixi run -e pipeline nextflow run workflow/nextflow/main.nf -params-file config/config.yaml)
// Results go to results/nextflow/ (set in workflow/nextflow/nextflow.config).

params {
    // Tab-separated sample sheet with sample, fastq_1 and fastq_2 columns
    samples: Path = 'metadata/samples.tsv'
    // Gzipped reference genome (E. coli REL606)
    reference_gz: Path = 'data/raw/reference/ecoli_rel606.fasta.gz'
    // Extra bwa mem options (-K makes alignments independent of the thread count)
    bwa_extra: String = '-K 10000000'
    // Minimum read depth for the final filter (vcfutils.pl varFilter -d)
    min_depth: Integer = 2
    // Depth thresholds compared for the analysis question
    sensitivity_depths: List<Integer> = [2, 5, 10, 15]
}

process FASTQC {
    tag "${sample}"

    input:
    tuple val(sample), path(reads)

    output:
    path '*_fastqc.html', emit: html
    path '*_fastqc.zip', emit: zip

    script:
    """
    fastqc --quiet ${reads}
    """
}

process MULTIQC {
    input:
    path zips

    output:
    path 'multiqc_report.html'

    script:
    """
    multiqc --force ${zips}
    """
}

workflow {
    main:
    ch_samples = channel.fromPath(params.samples)
        .splitCsv(header: true, sep: '\t')
        .map { row -> tuple(row.sample, [file(row.fastq_1), file(row.fastq_2)]) }

    ch_fastqc = FASTQC(ch_samples)
    ch_multiqc = MULTIQC(ch_fastqc.zip.collect())

    publish:
    fastqc = ch_fastqc.html.mix(ch_fastqc.zip)
    multiqc = ch_multiqc
}

output {
    fastqc {
        path 'qc/fastqc'
    }
    multiqc {
        path 'qc/multiqc'
    }
}
