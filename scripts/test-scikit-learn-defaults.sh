#!/bin/bash
set -eux

# Install scikit-learn from defaults

conda config --add channels defaults
conda create -n scikit-learn-defaults python

mkdir -p list/ log/ time/

/usr/bin/time -f "%e %U %S %P %M" -o time/scikit-learn-defaults-${VER}.txt \
  conda install -vv -n scikit-learn-defaults scikit-learn \
  2> log/scikit-learn-defaults-${VER}.txt

conda list -n scikit-learn-defaults > list/scikit-learn-defaults-${VER}.txt

# Cleanup
conda env remove -n scikit-learn-defaults
conda clean --all
conda config --remove-key channels

