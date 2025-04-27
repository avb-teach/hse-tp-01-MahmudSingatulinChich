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
    if not os.path.exists(dim2):
        os.makedirs(dim2)
    for i in os.listdir(dim1):
        shutil.copy(os.path.join(dim1, i), dim2)
main(1, import_dir, output_dir)
' "$import_dir" "$output_dir"
fi