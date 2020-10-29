#!/bin/bash
if [ $# -ne 1 ]
then
echo $0 basepath
echo
fi
path=$1
declare -A statearray
while read line
do
   ftype=$(file -b "$line")
   let statearray["$ftype"]++
done < <(find $path -type f -print)

echo -e "==================文件信息=====================\n"
for ftype in "${!statearray[@]}"
do
  echo $ftype : ${statearray["$ftype"]}
done 