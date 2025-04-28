#!/bin/bash
input_dir=$1
output_dir=$2
max_depth=0
if [ "$3" == "--max_depth" ]; then
  if [ -z "$4" ]; then
    exit 1
  fi
  max_depth=$4
fi
    python3 -c '
import sys
import os
import shutil
import_dir = sys.argv[1]
output_dir = sys.argv[2]
max_depth = int(sys.argv[3])
def main(max_depth, dim1, dim2, now=1):
    if now > max_depth:
        return
    for fsrt, sec, thrd in os.walk(import_dir):
        new = frst[len(import_dir):].count(os.sep)
        if new >= max_depth:
            continue
        for i in thrd:
            shutil.copy2(os.path.join(frst, i), os.path.join(output_dir, i))
if not os.path.exists(output_dir):
    os.makedirs(output_dir)
main(max_depth, import_dir, output_dir)
' "$import_dir" "$output_dir"