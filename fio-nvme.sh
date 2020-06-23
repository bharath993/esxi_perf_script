#!/bin/bash
#RAW_DISK1=$(ssh pf2 echo /dev/nvme*n1|tr ' ' ':') 

#RAW_DISK5=$(ssh t6p2 echo /dev/nvme*n1|tr ' ' ':') 
#echo $RAW_DISK5
#RAW_DISK1=/dev/nvme0n1:/dev/nvme1n1
#RAW_DISK1=/dev/nvme0n1:/dev/nvme1n1:/dev/nvme2n1:/dev/nvme3n1
#RAW_DISK1=/dev/nvme0n1:/dev/nvme1n1:/dev/nvme2n1:/dev/nvme3n1:/dev/nvme4n1:/dev/nvme5n1:/dev/nvme6n1:/dev/nvme7n1
#RAW_DISK1=/dev/nvme0n1:/dev/nvme1n1:/dev/nvme2n1:/dev/nvme3n1:/dev/nvme4n1:/dev/nvme5n1:/dev/nvme6n1:/dev/nvme7n1:/dev/nvme8n1:/dev/nvme9n1:/dev/nvme10n1:/dev/nvme11n1:/dev/nvme12n1:/dev/nvme13n1:/dev/nvme14n1:/dev/nvme15n1
#RAW_DISK1=/dev/nvme0n1:/dev/nvme1n1:/dev/nvme2n1:/dev/nvme3n1:/dev/nvme4n1:/dev/nvme5n1:/dev/nvme6n1:/dev/nvme7n1:/dev/nvme8n1:/dev/nvme9n1:/dev/nvme10n1:/dev/nvme11n1:/dev/nvme12n1:/dev/nvme13n1:/dev/nvme14n1:/dev/nvme15n1:/dev/nvme16n1:/dev/nvme17n1:/dev/nvme18n1:/dev/nvme19n1:/dev/nvme20n1:/dev/nvme21n1:/dev/nvme22n1:/dev/nvme23n1:/dev/nvme24n1:/dev/nvme25n1:/dev/nvme26n1:/dev/nvme27n1:/dev/nvme28n1:/dev/nvme29n1:/dev/nvme30n1:/dev/nvme31n1

#RAW_DISK2=/dev/nvme0n1:/dev/nvme1n1:/dev/nvme2n1:/dev/nvme3n1:/dev/nvme4n1:/dev/nvme5n1:/dev/nvme6n1:/dev/nvme7n1
#:/dev/nvme8n1:/dev/nvme9n1:/dev/nvme10n1:/dev/nvme11n1:/dev/nvme12n1:/dev/nvme13n1:/dev/nvme14n1:/dev/nvme15n1
 RAW_DISK=$(echo `lsscsi | grep LIO-ORG| awk '{print $6}' ` | tr ' ' ':') #use for iscsi
#RAW_DISK=$(echo `lsscsi | grep NVMe | awk '{print $6}' ` | tr ' ' ':')      #use for esxi nvme

#RAW_DISK3=$(echo /dev/nvme*n1|tr ' ' ':') 
echo $RAW_DISK
#RAW_DISK3=/dev/nvme0n1:/dev/nvme1n1
#RAW_DISK3=/dev/nvme0n1:/dev/nvme1n1:/dev/nvme2n1:/dev/nvme3n1
#RAW_DISK3=/dev/nvme0n1:/dev/nvme1n1:/dev/nvme2n1:/dev/nvme3n1:/dev/nvme4n1:/dev/nvme5n1:/dev/nvme6n1:/dev/nvme7n1
#RAW_DISK3=/dev/nvme0n1:/dev/nvme1n1:/dev/nvme2n1:/dev/nvme3n1:/dev/nvme4n1:/dev/nvme5n1:/dev/nvme6n1:/dev/nvme7n1:/dev/nvme8n1:/dev/nvme9n1:/dev/nvme10n1:/dev/nvme11n1:/dev/nvme12n1:/dev/nvme13n1:/dev/nvme14n1:/dev/nvme15n1
#RAW_DISK3=/dev/nvme0n1:/dev/nvme1n1:/dev/nvme2n1:/dev/nvme3n1:/dev/nvme4n1:/dev/nvme5n1:/dev/nvme6n1:/dev/nvme7n1:/dev/nvme8n1:/dev/nvme9n1:/dev/nvme10n1:/dev/nvme11n1:/dev/nvme12n1:/dev/nvme13n1:/dev/nvme14n1:/dev/nvme15n1:/dev/nvme16n1:/dev/nvme17n1:/dev/nvme18n1:/dev/nvme19n1:/dev/nvme20n1:/dev/nvme21n1:/dev/nvme22n1:/dev/nvme23n1:/dev/nvme24n1:/dev/nvme25n1:/dev/nvme26n1:/dev/nvme27n1:/dev/nvme28n1:/dev/nvme29n1:/dev/nvme30n1:/dev/nvme31n1
#:/dev/sdj:/dev/sdk:/dev/sdl:/dev/sdm:/dev/sdn:/dev/sdo:/dev/sdp:/dev/sdq

BLOCK_SIZE=$2
DEPTH=$3
JOBS=$4

#ssh pf2 fio --rw=$1 --name=random --norandommap --ioengine=libaio --size=400m --group_reporting --exitall --fsync_on_close=1 --invalidate=1 --direct=1 --filename=$RAW_DISK1 --time_based --runtime=30 --iodepth=$DEPTH --numjobs=$JOBS --unit_base=1 --bs=$BLOCK_SIZE --kb_base=1000 --ramp_time=2 &
#ssh t6p2 numactl -m 0 fio --rw=$1 --name=random --norandommap --ioengine=libaio --size=400m --group_reporting --exitall --fsync_on_close=1 --invalidate=1 --direct=1 --filename=$RAW_DISK5 --time_based --runtime=30 --iodepth=$DEPTH --numjobs=$JOBS --unit_base=1 --bs=$BLOCK_SIZE --kb_base=1000 --ramp_time=2 &
#--ramp_time=2 --cpumask=0xff &
#ssh viper3 fio --rw=$1 --name=random --norandommap --ioengine=libaio --size=400m --group_reporting --exitall --fsync_on_close=1 --invalidate=1 --direct=1 --filename=$RAW_DISK2 --time_based --runtime=30 --iodepth=$DEPTH --numjobs=$JOBS --unit_base=1 --bs=$BLOCK_SIZE --kb_base=1000 --ramp_time=2 &
  fio --rw=$1 --name=random --norandommap --ioengine=libaio --size=400m --group_reporting --exitall --fsync_on_close=1 --invalidate=1 --direct=1 --filename=$RAW_DISK --time_based --runtime=20 --iodepth=$DEPTH --numjobs=$JOBS --unit_base=1 --bs=$BLOCK_SIZE --kb_base=1000 --ramp_time=2 &
#taskset -c 0-23 fio --rw=$1 --name=random --norandommap --ioengine=libaio --size=400m --group_reporting --exitall --fsync_on_close=1 --invalidate=1 --direct=1 --filename=$RAW_DISK3 --time_based --runtime=30 --iodepth=$DEPTH --numjobs=$JOBS --unit_base=1 --bs=$BLOCK_SIZE --kb_base=1000 --ramp_time=2 &
#--ramp_time=2 --cpumask=0xff &

sleep 2
sh /root/iscsi_perf/collect_cpu.sh &
