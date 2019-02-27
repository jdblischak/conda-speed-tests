#!/bin/bash
set -e

# Time a given command.
#
# VER: environment variable of conda version
#
# Write time to time_${VER}.txt
#
# Write standard error to log_${VER}.txt

/usr/bin/time -f "%e %U %S %P %M" -o time_${VER}.txt $* 2> log_${VER}.txt

