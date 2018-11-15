#!/bin/bash
#sh -x
inputdir="/mnt/c/ProjectFiles"
count=1
echo -e "\n`date`: Running permission processor for all files..."
echo -e "Please refere to log file: process_perms.sh.log for more details.\n"
for csv in `ls $inputdir/*.csv`
do
        printf "$count Working on file: $csv ..."
        $inputdir/process_perms.sh $csv >> process_perms.sh.log 2>&1
        printf " Done\n"
        count=$(($count+1))
done
echo -e "\n`date`: Permission processor completed.\n"
