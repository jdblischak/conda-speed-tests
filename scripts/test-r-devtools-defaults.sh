#!/bin/bash
set -eux

# Install r-devtools from defaults

conda config --add channels defaults
conda create -n r-devtools-defaults python

mkdir -p list/ log/ time/

/usr/bin/time -f "%e %U %S %P %M" -o time/r-devtools-defaults-${VER}.txt \
  conda install -vv -n r-devtools-defaults r-devtools \
  2> log/r-devtools-defaults-${VER}.txt

conda list -n r-devtools-defaults > list/r-devtools-defaults-${VER}.txt

# Cleanup
conda env remove -n r-devtools-defaults
conda clean --all
conda config --remove-key channels

