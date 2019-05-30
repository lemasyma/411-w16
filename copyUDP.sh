#!/bin/bash

COPY="copyUDP/"

FILE="copy"

if [ -d $COPY ]
then
    rm -r $COPY
fi
mkdir $COPY

COUNT=$(nc -l -p 1234)
START=1

for((i=$START;i<=$COUNT;i++))
do
    FILENAME="$COPY$FILE$i.txt"
    nc -u -l -p 1234 > $FILENAME
    echo "Recieved file $i out of $COUNT"
done
echo "Server done"
