# reticulate_on_singularity

This repo shows how to work with the R package `reticulate` 
to run a Python script on Singularity.

## Steps

 1. The [Singularity](Singularity) `%post` section contains the build
 2. The [Singularity](Singularity) `%test` section contains the test
 3. The [.github/workflows/build_sandbox.yaml](.github/workflows/build_sandbox.yaml)
   and [.github/workflows/build_singularity.yaml](.github/workflows/build_singularity.yaml)
   show the final usage


