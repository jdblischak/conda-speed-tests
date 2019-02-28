#!/bin/bash
set -eux

# Configure conda

conda config --set always_yes yes
conda config --set quiet yes
conda config --set changeps1 no
conda config --set auto_update_conda no

