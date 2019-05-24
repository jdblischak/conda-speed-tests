#!/bin/bash
set -eux

# Usage: bash test.sh id pkg channel-lowest channel-highest

id=$1
pkg=$2
shift
shift
channels=$@

version=`conda --version | cut -d' ' -f2`

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

echo $pkg > log/package_${id}_${version}.txt
conda config --get channels > log/channels_${id}_${version}.txt
mv conda-debug-output.txt log/conda-debug-output_${id}_${version}.txt
mv ~/.conda/instrumentation-record.csv log/instrumentation-record_${id}_${version}.csv
conda info > log/conda-info_${id}_${version}.txt
conda config --show-sources > log/conda-config_${id}_${version}.txt
conda list --show-channel-urls -n env-$id > log/conda-list_${id}_${version}.txt

# Cleanup

conda env remove -n env-$id
conda clean --all
conda config --remove-key channels
