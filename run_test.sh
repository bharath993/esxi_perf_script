export OUT="/root/result/test.txt"
#!/bin/bash/
#for j in 128 256 512 
#for j in  2 4 8 16 32 64 128 256 512 
#for j in 4 8 16 64 256 512 
#for j in 512 
#for j in 4 
#for j in 32 64
for j in 512 
#for j in  4 8 16 32 64 128 256 512
#for j in 1 2 4 8 16 32 64 128 256 512
#for j in 4 8 64 256 
do 
	#for i in randread
	for i in randread randwrite  
	#for i in randwrite
	do
		echo '#####################' | tee -a $OUT
		echo  $i $(($j))K IO size   | tee -a $OUT
		echo '#####################'  | tee -a  $OUT
		#ssh t6p3 cat /sys/kernel/debug/cxgb4/0000\:05\:00.4/devlog_level
		#sh /root/fio-iscsi.sh $i $(($j))K 64 8 | grep IOPS > data.txt 
		#sh /root/fio-nvme.sh $i $(($j))K 64 16  | grep iops > data.txt 
		sh /root/iscsi_perf/fio-nvme.sh $i $(($j))K 32 4  | grep IOPS > /root/iscsi_perf/data.txt
	#	sh /root/fio_rand.sh $i $j 64 16  | grep IOPS > data.txt
	#	sh /root/fio_rand.sh $i "$j" 64 16  | grep IOPS > data.txt
		#for i in `seq 1 30`
		#do
		#ssh t6p3 'cat /sys/kernel/debug/cxgb4/0000\:02\:00.4/upload' >> temp.txt
		#ssh t6p3 'cat /sys/kernel/debug/cxgb4/0000\:02\:00.4/upload'
		#sleep 0.5
		#done
 
		#sh sum.sh
		sh /root/iscsi_perf/sum_2.sh 
		#echo 
		echo -n '----Target devbagh %CPU----  ' | tee -a $OUT
		#cat target_cpustat.txt | grep Average
		sleep 1
		#var=$( cat /root/target_cpustat.txt | grep Average | awk '{print $12}' )
                echo " 100 - $( cat /root/iscsi_perf/target_cpustat.txt | grep Average | awk '{print $12}' )" | bc | tee -a $OUT
		sleep 2
		#var=$( cat /root/shiva/nvme-scripts/target_cpustat.txt | grep Average | tr -s ' '| cut -d ' ' -f1,13 )
		#cat target_cpustat.txt | grep Average | awk '{print $12}' 
		#echo $var
		sleep 0.5
		echo -n '----Initiator karwar %CPU----  ' | tee -a $OUT
		#var=$( cat /root/t6p1_cpustat.txt | grep Average | awk '{print $12}' )
		echo " 100 - $( cat /root/iscsi_perf/initiator_cpustat.txt | grep Average | awk '{print $12}' )" | bc  | tee -a $OUT
		sleep 0.5
		#echo $var
	#	echo -n '----Initiator pf1 %CPU----  '
		#var=$( cat /root/pf1_cpustat.txt | grep Average | awk '{print $12}' )
         #       echo " 100 - $( cat /root/pf1_cpustat.txt | grep Average | awk '{print $12}' )" | bc
	#	sleep 0.5
		#echo $var
		#echo -n '----target t6p3 upload----  '
		#cat /root/upload.txt | grep 'uP' > up.txt
		#cat up.txt
		#sleep 0.5
		#echo "100 - $var" | bc -l
		#echo % CPU `expr 100 - $var`
		echo
		#echo '##### TP info #####'
		#ssh t6p3 cat /sys/kernel/debug/cxgb4/0000\:05\:00.4/upinfo
		#echo 
		#ssh t6p3 cat /sys/kernel/debug/cxgb4/0000\:05\:00.4/upinfo_recv 
		#echo
		#sleep 12
	done
done
