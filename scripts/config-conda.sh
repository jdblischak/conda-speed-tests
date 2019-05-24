#!/bin/bash
set -eux

# Configure conda

conda config --set always_yes yes
conda config --set quiet yes
conda config --set changeps1 no
conda config --set auto_update_conda no

if [ $VER = "latest_release" ]
then

  conda update conda

elif [ $VER = "latest_commit" ]
then

  # Install latest version of conda (most recent commit)
  conda update conda
  conda install conda-build git
  git clone https://github.com/conda/conda.git /tmp/conda
  conda build --no-test /tmp/conda/conda.recipe/
  conda install --use-local conda
  conda --version

else

  conda install conda=$VER

fi

conda --version
