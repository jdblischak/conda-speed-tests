#!/bin/bash
set -eux

# Install r-base from defaults

conda config --add channels defaults
conda create --quiet -n r-base-defaults python

mkdir -p list/ log/ time/

/usr/bin/time -f "%e %U %S %P %M" -o time/r-base-defaults-${VER}.txt \
  conda install --quiet -vv -n r-base-defaults r-base \
  2> log/r-base-defaults-${VER}.txt

conda list -n r-base-defaults > list/r-base-defaults-${VER}.txt

# Cleanup
conda env remove -n r-base-defaults
conda clean --all
conda config --remove-key channels

