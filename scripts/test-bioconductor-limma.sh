#!/bin/bash
set -eux

# Install bioconductor-limma from bioconda

conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda create --quiet -n limma python

mkdir -p list/ log/ time/

/usr/bin/time -f "%e %U %S %P %M" -o time/limma-${VER}.txt \
  conda install --quiet -vv -n limma bioconductor-limma \
  2> log/limma-${VER}.txt

conda list -n limma > list/limma-${VER}.txt

# Cleanup
conda env remove -n limma
conda clean --all
conda config --remove-key channels

