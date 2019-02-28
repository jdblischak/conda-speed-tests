#!/bin/bash
set -eux

# Install r-workflowr from jdblischak

conda config --add channels jdblischak
conda config --add channels defaults
conda config --add channels conda-forge
conda create -n r-workflowr-jdb python

mkdir -p list/ log/ time/

/usr/bin/time -f "%e %U %S %P %M" -o time/r-workflowr-jdb-${VER}.txt \
  conda install -vv -n r-workflowr-jdb r-workflowr=0.11.0 \
  2> log/r-workflowr-jdb-${VER}.txt

conda list -n r-workflowr-jdb > list/r-workflowr-jdb-${VER}.txt

# Cleanup
conda env remove -n r-workflowr-jdb
conda clean --all
conda config --remove-key channels

