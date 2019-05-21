#!/bin/bash

DIRECTORY="original/"
COPY="copy"

for FILENAME in $DIRECTORY*.txt
do
    BEGIN=`date +%s%N`
    cp $FILENAME $COPY/${FILENAME#"$DIRECTORY"}
    END=`date +%s%N`
    PRINT=`stat --printf="%s" $FILENAME`
    PRINT+=' '$(((END-BEGIN)/1000000))'.'$(((END-BEGIN)%1000000))
    echo $PRINT >> "local.txt"
done
