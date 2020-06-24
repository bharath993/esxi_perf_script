#!/bin/bash
cd /root/iscsi_perf
cat data.txt
total=0
i=0
#for i in `cat data.txt | awk '{print $4}'  | grep -o -E '[0-9]+.[0-9]+'` ; do
#for i in `cat data.txt | grep -Po 'BW=\d+.\d+' | grep -Po '\d+.\d+'` ; do
#for U in `cat data.txt | grep -Poi 'BW=\d+.?\d+M?' | grep -Poi '\d+.?\d+M?'` ; do
for U in `cat /root/iscsi_perf/data.txt | grep -Poi 'BW=\d+.?\d+[M,k]?' | grep -Poi '\d+.?\d+[M,K]?'` ; do
BU=`echo $U |grep -Poi M`
if [ $? -ne 0 ]
then
BU=`echo $U |grep -Poi K`
if [ $? -ne 0 ]
then
BU="G"
fi
fi
if [ "$BU" == "M" ]
then
U=`echo $U |grep -Poi "\d+.\d+"`
U=`echo "$U / 1000.0"|bc -l`
fi

if [ "$BU" == "K" ]
then
U=`echo $U |grep -Poi "\d+.\d+"`
U=`echo "$U / 1000.0"|bc -l`
U=`echo "$U / 1000.0"|bc -l`
fi

total="$(echo "$total + $U" | bc -l)"
#    echo $i
#    total="$(echo "$total + $i" | bc -l)"
done
echo 'TOTAL BW is:' $total 'Gbit/s' | tee -a $OUT
#cat tmp | awk '{ print $2 }' | grep -o -E '[0-9]+' >> tmp1.txt
total=0
i=0
#for i in `cat data.txt | awk '{print $5}'  | grep -o -E '[0-9]+'` ; do
for i in `cat data.txt |grep -Poi 'IOPS=\d+.\d+K?'|grep -Poi '\d+.\d+K?'`;do

#cat data.txt | grep -Po 'iops=\d+.\d+' | grep -Po '\d+.\d+'` ; do
#    echo $i
j=`echo $i |grep -Poi K`
if [ $? -ne 0 ]
then
j="NO"
fi
if [ "$j" == "K" ] || [ "$j" == "k" ]
then
i=`echo $i |grep -Poi "\d+.\d+"`
i=`echo "$i * 1000.0"|bc -l`

fi
    total=`echo "$total + $i"|bc -l`
done
echo 'TOTAL IOPs are:' $total  | tee -a $OUT
cat host_cpustat.csv | cut -d "," -f 1,`head -1 host_cpustat.csv | tr "," "\12" | grep -Fn "Physical Cpu(_Total)\% Util Time" | cut -d ":" -f 1 | tr "\12" "," | sed "s/,$//"` | tail -6 |cut -d "," -f 2  | sed 's/"//g' > temp #Comment this for Linux perf
cat host_cpustat.csv | cut -d "," -f 1,`head -1 host_cpustat.csv | tr "," "\12" | grep -Fn "Physical Cpu(_Total)\% Core Util Time" | cut -d ":" -f 1 | tr "\12" "," | sed "s/,$//"` | tail -6 |cut -d "," -f 2  | sed 's/"//g' > temp1 #Comment this when hyperthreading is disabled also for linux perf
sh average.sh #Comment this for Linux perf
