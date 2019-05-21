#!/bin/bash

ARRAY=('' 'K' 'M' 'G')
DIRECTORY="original/"
FILE="test"

for i in {1..5} 
do
    for j in {1..3}
    do
        FILENAME="$DIRECTORY$FILE${i}_${j}.txt"
        head -c $i${ARRAY[j]}B /dev/urandom > $FILENAME
    done
done
