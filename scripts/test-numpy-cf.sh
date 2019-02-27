#!/bin/bash
set -eux

# Install numpy from conda-forge

conda config --add channels defaults
conda config --add channels conda-forge
conda create --quiet -n numpy-cf python

mkdir -p list/ log/ time/

/usr/bin/time -f "%e %U %S %P %M" -o time/numpy-cf-${VER}.txt \
  conda install --quiet -vv -n numpy-cf numpy \
  2> log/numpy-cf-${VER}.txt

conda list -n numpy-cf > list/numpy-cf-${VER}.txt

# Cleanup
conda env remove -n numpy-cf
conda clean --all
conda config --remove-key channels

