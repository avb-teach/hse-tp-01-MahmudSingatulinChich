#!/bin/bash
python3 -c '
import sys
import os
import shutil
import_dir = sys.argv[1]
output_dir = sys.argv[2]
max_depth = int(sys.argv[4])
def main(now, dim1, dim2):
    if now > max_depth:
        return
    for i in os.listdir(dim1):
        shutil.copy(os.path.join(dim1, i), dim2)
main(1, import_dir, output_dir)
' "$@"