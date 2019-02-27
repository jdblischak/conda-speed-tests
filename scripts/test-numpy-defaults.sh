#!/bin/bash
set -eux

# Install numpy from defaults

conda config --add channels defaults
conda create --quiet -n numpy-defaults python

mkdir -p list/ log/ time/

/usr/bin/time -f "%e %U %S %P %M" -o time/numpy-defaults-${VER}.txt \
  conda install --quiet -vv -n numpy-defaults numpy \
  2> log/numpy-defaults-${VER}.txt

conda list -n numpy-defaults > list/numpy-defaults-${VER}.txt

# Cleanup
conda env remove -n numpy-defaults
conda clean --all
conda config --remove-key channels

