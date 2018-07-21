#!/bin/bash


MIN_W=999999999999
MIN_H=999999999999

for file in deskewed_*.png
do
echo "$file"
W=$(identify -format '%w' "$file")
H=$(identify -format '%h' "$file")

MIN_W=$(($W<$MIN_W?$W:$MIN_W))
MIN_H=$(($H<$MIN_H?$H:$MIN_H))
done

echo $MIN_W
echo $MIN_H

for file in deskewed_*.png
do
echo "$file"
W=$(identify -format '%w' "$file")
H=$(identify -format '%h' "$file")

START_W=$((($W - $MIN_W) / 2))
START_H=$((($H - $MIN_H) / 2))
convert "$file"  -fill black -draw 'point 1,1' "tmp1_$file.tiff"
convert "tmp1_$file.tiff" -crop "$MIN_W"x"$MIN_H"+"$START_W"+"$START_H" -monochrome -compress group4  "tmp2_$file.tiff"
convert "tmp2_$file.tiff" -fill white -draw 'point 1,1' "final_$file.tiff"

rm "tmp1_$file.tiff"
rm "tmp2_$file.tiff"


done