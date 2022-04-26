#! /bin/bash

data_path=/home/debian/Desktop/data_files/
while [ 1 ]
do
  ls $data_path | grep ".dat$" > ${data_path}last_moved.log
  moved_num=`wc -l ${data_path}last_moved.log | awk '{print $1}'`
  if [ $moved_num -gt 0 ]; then
    bash te.ss ${data_path}last_moved.log # output: move_file_format
    ag=$(cat move_file_format)
    /usr/bin/expect trans.exp ${ag} # send to remote
    for filename in `cat ${data_path}"last_moved.log"`
    do
      echo "$filename will be moved to data_files_sent..."
      mv ${data_path}${filename} /home/debian/data_files_sent/	# mv to another folder
    done
  else
    sleep 1
  fi
done
  

