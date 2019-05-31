#!/bin/bash

COPY="copyUDP/"

FILE="copy"

if [ -d $COPY ]
then
    rm -r $COPY
fi
mkdir $COPY

COUNT=$(nc -4 -lvu 1234)
START=1

for((i=$START;i<=$COUNT;i++))
do
    FILENAME="$COPY$FILE$i.txt"
    netcat -4 -lvu 1234 > $FILENAME
    echo "Received file $i out of $COUNT"
done
echo "Server done"
