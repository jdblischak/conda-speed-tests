#!/bin/bash
set -e

# Time a given command.
#
# VER: environment variable of conda version
#
# Write time to time/time_${VER}.txt
#
# Write standard error to log/log_${VER}.txt

mkdir -p log/ time/

/usr/bin/time -f "%e %U %S %P %M" -o time/time_${VER}.txt $* 2> log/log_${VER}.txt

