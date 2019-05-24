#!/bin/bash
set -eux

# Usage: bash test.sh id pkg channel-lowest channel-highest

id=$1
pkg=$2
shift
shift
channels=$@

# Setup

for channel in $channels
do
  conda config --add channels $channel
done

conda create -n env-$id python

mkdir -p log/

# Install package

CONDA_INSTRUMENTATION_ENABLED=1 conda install -n env-$id $pkg -vv | tee conda-debug-output.txt

# Record results

mv conda-debug-output.txt log/conda-debug-output_${id}_${VER}.txt
mv ~/.conda/instrumentation-record.csv log/instrumentation-record_${id}_${VER}.csv
conda info > log/conda-info_${id}_${VER}.txt
conda config --show-sources > log/conda-config_${id}_${VER}.txt
conda list --show-channel-urls -n env-$id > log/conda-config_${id}_${VER}.txt

# Cleanup

conda env remove -n env-$id
conda clean --all
conda config --remove-key channels
