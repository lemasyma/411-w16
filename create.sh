#!/bin/bash

ARRAY=('' 'K' 'M' 'G')
DIRECTORY="original/"
FILE="test"

if [ -d $DIRECTORY ]
then
	rm -r $DIRECTORY
fi
mkdir $DIRECTORY

for i in {1..3}
do
    for j in {1..5}
    do
        FILENAME="$DIRECTORY$FILE$j${ARRAY[i]}B.txt"
        head -c $j${ARRAY[i]}B /dev/urandom > $FILENAME
    done
done
