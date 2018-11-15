#!/bin/bash
#set -x

[ $# != 1 ] && echo "Supply Input File" && exit 9

infile=$1
outfile=$1.out
logfile=$0.log
records="`wc -l $infile|cut -d" " -f1`"
oldIFS=IFS
IFS=","
#perm="`head -1 $infile|cut -d, -f1`"
perm=""
dir="`head -1 $infile|cut -d, -f2`"
pdir=""
count=0
>$outfile
#printf "`date`: $0 - Initiating Permissions Processing Engine\n" >>$logfile
echo "`date`: $0 - Initiating Process Engine" >>$logfile
#printf "`date`: Processing Permissions for - $infile\n" >>$logfile
echo "`date`: Processing Permissions for - $infile" >>$logfile
cat $infile|
while read f1 f2
do
        count=$(($count+1))
#       printf "$count Processing Dir: $dir\n" >> $logfile
        echo "$count Processing Dir: $dir" >> $logfile
        if [ "$dir" = "$f2" ]
        then
                #perm="`echo $perm` $f1"
                perm="$perm`echo ', '`$f1"
                if [ "$count" = "$records" ]
                then
                        #printf "$dir;$perm\n">>$outfile
                        echo "$dir;$perm">>$outfile
                fi
        else

                #printf "Dir: $dir; AG: $perm\n" >>$outfile
                #printf "$dir;$perm\n">>$outfile
                echo "$dir;$perm">>$outfile
                dir=$f2
                perm=$f1
        fi
done
echo "`date`: Permissions Process completed for - $infile" >>$logfile
echo "`date`: $0 - Halting Process Engine" >>$logfile
//g' -e 's/\//\\/g' $outfile >"$outfile.new"
rm $outfile
IFS=oldIFS
