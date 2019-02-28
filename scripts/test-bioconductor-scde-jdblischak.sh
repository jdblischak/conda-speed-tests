#!/bin/bash
set -eux

# Install bioconductor-scde from jdblischak

conda config --add channels jdblischak
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda create -n scde python

mkdir -p list/ log/ time/

/usr/bin/time -f "%e %U %S %P %M" -o time/scde-${VER}.txt \
  conda install -vv -n scde bioconductor-scde=1.99.1 \
  2> log/scde-${VER}.txt

conda list -n scde > list/scde-${VER}.txt

# Cleanup
conda env remove -n scde
conda clean --all
conda config --remove-key channels

