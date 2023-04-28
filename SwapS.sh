#! /bin/bash

if [[ $#  != 2 ]] ; then
        echo "must give two arguements: OLD SUFFIX NEW SUFFIX">&2
        exit 0
fi
old_suffix=$1
new_suffix=$2

#check if there are duplicates first with both extensions
for i in *;
do
   if [[ -f ${i%.*}.$new_suffix && -f ${i%.*}.$old_suffix ]]
    then
    echo "duplicate files name with same extension-exiting...">&2
    exit 1
fi
done
for f in *.$old_suffix
do

    new_name=${f%.*}.$new_suffix
    mv  ${f%.*}.$old_suffix $new_name
    echo Renamed $f to $new_name....
done
