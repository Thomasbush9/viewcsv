#!/bin/bash

# viewcsv.sh — Pretty-print CSV files with colored headers

if [[ -z "$1" ]]; then
  echo "Usage: viewcsv <filename.csv>"
  exit 1
fi

# ANSI color for bold yellow
YELLOW='\033[1;33m'
NC='\033[0m' # No color

# Use awk to color the first line, then format with column
{
  head -n 1 "$1" | sed -e 's/,,/, ,/g' | awk -v Y="$YELLOW" -v N="$NC" '{print Y $0 N}'
  tail -n +2 "$1" | sed -e 's/,,/, ,/g'
} | column -s, -t 2>/dev/null | less -#5 -N -S

