#!/bin/bash
python3 -c '
import sys
import os
import shutil
import_dir = sys.argv[1]
output_dir = sys.argv[2]
' "$1" "$2"