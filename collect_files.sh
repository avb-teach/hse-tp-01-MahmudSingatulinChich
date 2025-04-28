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
def check(output_dir, file):
    one, two = os.path.splitext(file)
    i = 1
    flag = file
    while os.path.exists(os.path.join(output_dir, flag)):
        flag = f"{one}_{i}{two}"
        i += 1
    return flag
def main(inp, out, now):
    if now > max_depth:
        return
    if not os.path.exists(out):
        os.makedirs(out)
    arr = []
    for i in os.listdir(inp):
        arr.append((os.path.join(inp, i), i))
    arr.sort(key=lambda x: (os.path.isdir(x[0]), x[1]))
    for k, j in arr:
        chich = os.path.join(out, j)
        if os.path.isdir(k):
            main(k, chich, now + 1)
        else:
            shutil.copy2(k, os.path.join(out, check(out, j)))
main(input_dir, output_dir, 0)
' "$input_dir" "$output_dir" "$max_depth"