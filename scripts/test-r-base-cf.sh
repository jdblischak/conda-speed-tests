#!/bin/bash
set -eux

# Install r-base from conda-forge

conda config --add channels defaults
conda config --add channels conda-forge
conda create --quiet -n r-base-cf python

mkdir -p list/ log/ time/

/usr/bin/time -f "%e %U %S %P %M" -o time/r-base-cf-${VER}.txt \
  conda install --quiet -vv -n r-base-cf r-base \
  2> log/r-base-cf-${VER}.txt

conda list -n r-base-cf > list/r-base-cf-${VER}.txt

# Cleanup
conda env remove -n r-base-cf
conda clean --all
conda config --remove-key channels

