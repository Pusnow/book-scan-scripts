#!/bin/bash
i=1
IFS=$'\n'
for file in `ls *.png | sort -V`;
do
        printf -v j "%05d" $i
        mv $file  "$j.png"
        #j=$( printf "%03" "$i" )
        #mv "$file" "$j.mp3"
       (( i++ ))
done