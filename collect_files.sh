#!/bin/bash
if [ "$1" == "--max_depth" ]; then
    import_dir=$3
    output_dir=$4
    max_depth=$2
    python3 -c '
import sys
import os
import shutil
import_dir = sys.argv[2]
output_dir = sys.argv[3]
max_depth = int(sys.argv[1])
def main(now, dim1, dim2):
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
fi