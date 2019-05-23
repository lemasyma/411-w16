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
        BEGIN=`date +%s%N`
        FILENAME="$DIRECTORY$FILE$j${ARRAY[i]}B.txt"
        cp $FILENAME $COPY${FILENAME#"$DIRECTORY"}
        END=`date +%s%N`
        PRINT=`stat --printf="%s" $FILENAME`
        PRINT+=' '$(((END-BEGIN)/1000000))'.'$(((END-BEGIN)%1000000))
        echo $PRINT >> $SAVE
    done
done
