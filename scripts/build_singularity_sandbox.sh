#!/bin/bash
#
# Build the Singularity container called `ormr.sif`
# from the Singularity recipe `Singularity` (which is a default
# name for a Singularity recipe)
#
# Usage:
#
# ./scripts/build_singularity_sandbox.sh
#
#
sudo -E singularity --quiet build --sandbox sandbox.sif Singularity


