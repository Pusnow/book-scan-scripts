#!/bin/bash

for file in *.png
do
echo "$file"
unpaper "$file" "$file.pbm" -t pbm --no-deskew
/root/Deskew/Bin/deskew -b FFFFFF -o "deskewed_$file.png" "$file.pbm" &
done