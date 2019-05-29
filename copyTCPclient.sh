#!/bin/bash

DIRECTORY="original/*"
COUNT=0

SAVE="TCP.txt"

if [ -f $SAVE ]
then
    rm $SAVE
fi

for FILE in $DIRECTORY
do
    COUNT=$((COUNT+1))
done

echo $COUNT | nc -q 0 localhost 1234

for FILENAME in $DIRECTORY
do
    PRINT=`stat --printf="%s" $FILENAME`
    PRINT+=" "
    PRINT+=`(time nc -q 0 localhost 1234 < $FILENAME) 2>&1>/dev/null | grep real | awk '{print $2}' | awk 'BEGIN {FS="[m,s]";}{ print (($1*60)+$2)"."$3}'`
    echo $PRINT >> $SAVE
done
