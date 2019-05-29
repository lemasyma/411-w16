#!/bin/bash

ARRAY=('' 'K' 'M' 'G')

DIRECTORY="original/"
COPY="copy/"

SAVE="local.txt"
FILE="test"

 if [ -d $COPY ]
 then
     rm -r $COPY
 fi
 mkdir $COPY

if [ -f $SAVE ]
then
    rm -r $SAVE
fi

for i in {1..3}
do
    for j in {1..5}
    do
        FILENAME="$DIRECTORY$FILE$j${ARRAY[i]}B.txt"
        PRINT=`stat --printf="%s" $FILENAME`
        PRINT+=" "
        PRINT+=`(time cp $FILENAME $COPY${FILENAME#"$DIRECTORY"}) 2>&1 >/dev/null | grep real | awk '{print $2}' | awk 'BEGIN {FS="[m,s]";}{ print (($1*60)+$2)"."$3}'`
        echo $PRINT >> $SAVE
        echo "Copied file $FILENAME"
    done
done

