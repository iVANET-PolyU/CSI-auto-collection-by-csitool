#! /bin/bash
lc=$(wc -l $1 | awk '{print $1}')
count=1
out=""
while read line
do
  if [ $lc -eq 1 ]; then
    out=${line}
  elif [ $count -eq $lc ]; then
    out=${out}${line}"}"
  elif [ $count -eq 1 ]; then
    out="{"${line}","
  else
    out=${out}${line}","
  fi
  ((count++))
done<$1
echo $out> move_file_format
   
