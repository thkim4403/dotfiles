#!/bin/bash
if [ -z "$1" ]
then 
    echo "Must specify some JDK in /usr/lib/jvm"
    exit 0
fi

FILE=$1.jinfo
PATH_TO_JDK=/usr/lib/jvm/$1

touch $FILE
if [ -n "$2" ]
then
    PATH_TO_JDK=/usr/lib/jvm/$2
    echo "alias=$2" >> $FILE
fi

echo "priority=1" >> $FILE
echo "section=non-free" >> $FILE

echo "Using PATH_TO_JDK as $PATH_TO_JDK"
echo "Found the following files in jre"
ls $PATH_TO_JDK/jre/bin

for file in `ls $PATH_TO_JDK/jre/bin`
do
    echo "jre $file $PATH_TO_JDK/jre/bin/$file" >> $FILE
done

for file in `ls $PATH_TO_JDK/bin`
do
    echo "jdk $file $PATH_TO_JDK/bin/$file" >> $FILE
done
