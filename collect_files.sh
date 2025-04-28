#!/bin/bash
input_dir=$1
output_dir=$2
max_depth=0
if [[ "$3" == "--max_depth" && "$4" =~ ^[0-9]+$ ]]; then
  max_depth=$4
fi
if [ ! -d "$input_dir" ]; then
  exit 1
fi
if [ ! -d "$output_dir" ]; then
  mkdir -p "$output_dir"
fi
python3 -c '

import sys
import os
import shutil
input_dir = sys.argv[1]
output_dir = sys.argv[2]
max_depth = int(sys.argv[3])
def main(input_dir, output_dir, max_depth, now=1):
    if now > max_depth:
        return
    for frst, sec, thrd in os.walk(input_dir):
        if frst[len(input_dir):].count(os.sep) >= max_depth:
            continue
        for i in thrd:
            shutil.copy2(os.path.join(frst, i), os.path.join(output_dir, i))
if not os.path.exists(output_dir):
    os.makedirs(output_dir)
main(input_dir, output_dir, max_depth)
' "$input_dir" "$output_dir" "$max_depth"
