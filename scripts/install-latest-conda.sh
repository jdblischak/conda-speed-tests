#!/bin/bash
set -eux

# Install latest version of conda (most recent commit)

conda update conda
conda install conda-build git
git clone https://github.com/conda/conda.git /tmp/conda
conda build --no-test /tmp/conda/conda.recipe/
conda install --use-local conda
conda --version

