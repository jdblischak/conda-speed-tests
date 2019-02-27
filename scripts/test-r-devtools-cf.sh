#!/bin/bash
set -eux

# Install r-devtools from conda-forge

conda config --add channels defaults
conda config --add channels conda-forge
conda create --quiet -n r-devtools-cf python

mkdir -p list/ log/ time/

/usr/bin/time -f "%e %U %S %P %M" -o time/r-devtools-cf-${VER}.txt \
  conda install --quiet -vv -n r-devtools-cf r-devtools \
  2> log/r-devtools-cf-${VER}.txt

conda list -n r-devtools-cf > list/r-devtools-cf-${VER}.txt

# Cleanup
conda env remove -n r-devtools-cf
conda clean --all
conda config --remove-key channels

