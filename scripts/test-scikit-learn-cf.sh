#!/bin/bash
set -eux

# Install scikit-learn from conda-forge

conda config --add channels defaults
conda config --add channels conda-forge
conda create --quiet -n scikit-learn-cf python

mkdir -p list/ log/ time/

/usr/bin/time -f "%e %U %S %P %M" -o time/scikit-learn-cf-${VER}.txt \
  conda install --quiet -vv -n scikit-learn-cf scikit-learn \
  2> log/scikit-learn-cf-${VER}.txt

conda list -n scikit-learn-cf > list/scikit-learn-cf-${VER}.txt

# Cleanup
conda env remove -n scikit-learn-cf
conda clean --all
conda config --remove-key channels

