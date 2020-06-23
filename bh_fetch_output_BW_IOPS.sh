for k in 'TOTAL BW' 'TOTAL IOPs' ;
do
echo "###################### ${k} DATA  ############################"
for j in 4K 8K 16K 32K 64K 128K 256K 512K; 
do 
#for j in 4K;  
for i in randread; 
do 
echo "####################"; 
echo "${i} ${j}"; 
echo "####################"; 
cat $1 | grep "${i} ${j}" -A6 | grep "${k}" | grep -Po '\d+.\d+' ;
#cat $1 | grep "${i} ${j}" -A9 | grep Average | grep -Po '\d+.\d+';
#cat nvme-toe/spdk_nvme-cli/local_spdk_latency_sweep_for_nvme_toe_with_2_nvme_ssds_nov21_2018_1.txt | grep "${i} ${j}" -A9 | grep Average | grep -Po '\d+.\d+';
echo;
echo; 
done; 

for i in randwrite;
do
echo "####################";
echo "${i} ${j}";
echo "####################";
cat $1 | grep "${i} ${j}" -A6 | grep "${k}" | grep -Po '\d+.\d+' ;
#cat $1 | grep "${i} ${j}" -A9 | grep Average | grep -Po '\d+.\d+';
#cat nvme-toe/spdk_nvme-cli/local_spdk_latency_sweep_for_nvme_toe_with_2_nvme_ssds_nov21_2018_1.txt | grep "${i} ${j}" -A9 | grep Average | grep -Po '\d+.\d+';
echo;
echo;
done;




done
echo;
echo; 
done

for k in 'Target' ;
#for k in 'Target t6p3 idle %CPU' ;
do
echo "###################### ${k} DATA  ############################"
for j in 4K 8K 16K 32K 64K 128K 256K 512K; 
do 
#for j in 4K;  
for i in randread randwrite; 
do 
echo "####################"; 
echo "${i} ${j}"; 
echo "####################"; 
cat $1 | grep "${i} ${j}" -A6 | grep "${k}"  | awk '{print $4}' ;
echo;
echo; 
done; 
done
echo;
echo; 
done

for k in 'Initiator';
#for k in 'Initiator pf1 idle %CPU' 'Initiator pf2 idle %CPU';
do
echo "###################### ${k} DATA  ############################"
for j in 4K 8K 16K 32K 64K 128K 256K 512K; 
do 
#for j in 4K;  
for i in randread randwrite; 
do 
echo "####################"; 
echo "${i} ${j}"; 
echo "####################"; 
cat $1 | grep "${i} ${j}" -A6 | grep "${k}"   | awk '{print $4}' ;
#cat $1 | grep "${i} ${j}" -A9 | grep Average | grep -Po '\d+.\d+';
#cat nvme-toe/spdk_nvme-cli/local_spdk_latency_sweep_for_nvme_toe_with_2_nvme_ssds_nov21_2018_1.txt | grep "${i} ${j}" -A9 | grep Average | grep -Po '\d+.\d+';
echo;
echo; 
done; 
done
echo;
echo; 
done
