#!/bin/bash

ARRAY=('' 'K' 'M' 'G')

DIRECTORY="original/*"
COUNT=0

SAVE="UDP.txt"
FILE="test"

if [ -f $SAVE ]
then
    rm $SAVE
fi

for F in $DIRECTORY
do
    COUNT=$((COUNT+1))
done

echo "Count : $COUNT"
echo $COUNT | nc -q 0 localhost 1234

i=1
for j in {1..3}
do
    for k in {1..5}
    do
        FILENAME="${DIRECTORY#"*"}$FILE$k${ARRAY[j]}B.txt"
        PRINT=`stat --printf="%s" $FILENAME`
        PRINT+=" "
        PRINT+=`(time nc -u -q 0 localhost 1234 < $FILENAME) 2>&1>/dev/null | grep real | awk '{print $2}' | awk 'BEGIN {FS="[m,s]";}{ print (($1*60)+$2)"."$3}'`
        echo $PRINT >> $SAVE
        echo "Copied file $i/$COUNT"
        i=$((i+1))
    done
done

echo "Client done"
