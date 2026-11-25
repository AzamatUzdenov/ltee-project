# Container

Build the pipeline environment from `pixi.lock`:

```sh
docker build --platform linux/amd64 -f containers/Dockerfile --build-arg ENV_NAME=pipeline -t ltee-project:0.1.0 .
docker run --rm --platform linux/amd64 -v "$PWD":/work -w /work ltee-project:0.1.0 bash scripts/run_variant_calling.sh 2 results/container-check
pixi run -e pipeline python scripts/compare_vcfs.py results/vcf results/container-check/vcf
```

The image contains software; the bind mount supplies code and data. Without it,
`bash scripts/run_variant_calling.sh` fails because the script is not in the image.
CI rebuilds the image, compares all VCF records with the native pipeline, and
publishes passing main builds to `ghcr.io/azamatuzdenov/ltee-project:0.1.0`.
Its immutable digest is recorded in the run artifact; the SHA tag identifies the
source commit. The package is public. The checked build from `df10851` is
`ghcr.io/azamatuzdenov/ltee-project@sha256:eeee51ac87b48d1fdb428afbd21e1612b28b94e2594521740703f210afd4811c`.

The local amd64 build on 25 November 2026 used Ubuntu base
`sha256:562111b88caa79c71391c0c4d3c2114a7d5c35915c20561fd893cb1e07929e6b`
and produced image ID
`sha256:cf49390e9864182044a7f14b569a0f47d099b1fe5d8169c1d9408bc0f0fe0fb9`.
This is a local image ID, not a registry digest. Its first full run exhausted local
disk space. The clean Linux CI run completed and matched all records (25, 775,
10). The saved local image archive has SHA-256
`c66394758c57b9b707550c47b6e83eb5387705d59c6bac4178289e8d34305bd6`.

For an offline archive (outside Git):

```sh
docker save ltee-project:0.1.0 | gzip > containers/ltee-project-0.1.0.tar.gz
```

On a cluster with Apptainer/Singularity, use `apptainer.def` after the registry
image is available. Run image conversion and analysis inside a scheduler allocation.


The saved image and self-contained report are public [release assets](https://github.com/AzamatUzdenov/ltee-project/releases/tag/v1.0.0).
GitHub confirmed the archive SHA-256 above; report SHA-256:
`1cac7f3194d25d4146bd76dab6205f1af1983dc7213a379ddd7005dd23cbbf3c`.
The saved image was converted to SIF with SingularityCE 4.1.1 on MBZUAI Slurm
and ran the unchanged pipeline with identical variant records. For that route:

```sh
gunzip -c ltee-project-0.1.0.tar.gz > ltee-project-0.1.0.tar
singularity build ltee-project-0.1.0.sif docker-archive:$PWD/ltee-project-0.1.0.tar
singularity exec --cleanenv --bind "$PWD:/work" --pwd /work ltee-project-0.1.0.sif bash scripts/run_variant_calling.sh 2 results/container-check
```
