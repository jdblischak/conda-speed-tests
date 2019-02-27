#!/bin/bash
set -eux

# Install bioconductor-biobase from bioconda

conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda create --quiet -n biobase python

mkdir -p list/ log/ time/

/usr/bin/time -f "%e %U %S %P %M" -o time/biobase-${VER}.txt \
  conda install --quiet -vv -n biobase bioconductor-biobase \
  2> log/biobase-${VER}.txt

conda list -n biobase > list/biobase-${VER}.txt

# Cleanup
conda env remove -n biobase
conda clean --all
conda config --remove-key channels

