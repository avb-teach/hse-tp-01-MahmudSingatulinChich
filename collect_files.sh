#!/bin/bash
python3 -c '
import sys
import os
import shutil
import_dir = sys.argv[1]
output_dir = sys.argv[2]
max_depth = int(sys.argv[4])
flag = 0
for frst, sec, thrd in os.walk(import_dir):
    if flag < max_depth:
        flag += 1
        for chich in thrd:
            shutil.copy(os.path.join(frst, chich), os.path.join(output_dir, chich))
' "$1" "$2"