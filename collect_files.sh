#!/bin/bash
python3 -c '
import sys
import os
import shutil
import_dir = sys.argv[1]
output_dir = sys.argv[2]
for frst, sec, thrd in os.walk(import_dir):
    for chich in thrd:
        shutil.copy(frst + '/' + chich, output_dir + '/' + chich)
' "$1" "$2"