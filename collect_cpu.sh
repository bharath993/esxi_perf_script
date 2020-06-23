#!/bin/bash
ssh 10.193.184.42 mpstat 3 10 > /root/iscsi_perf/target_cpustat.txt &
ssh 10.193.184.40 esxtop -b -d 3 -n 6 > /root/iscsi_perf/host_cpustat.csv & #Uncomment this for esxi perf
mpstat 3 10 > /root/iscsi_perf/initiator_cpustat.txt
