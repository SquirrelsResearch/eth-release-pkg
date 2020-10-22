#!/bin/bash

### What is your ETH Address?
ethaddress=0x48E31e6B7A2696dcb7733C974A4B498fAa3234F6

### What is your worker name?
workername=FKworker

### How many FPGAs do you have?
workernumber=1

### Frequency in MHz of FPGA
cclk=480

### Advanced Tuneables
patience=8
sqin=71
sqid=8
delay=1000000

### Pools. Defaults to ethminer rem these lines and remove comment from lines below if you want nanopool
stratum1=$(echo "-P stratum+ssl://$ethaddress.$workername@us1.ethermine.org:5555")
stratum2=$(echo "-P stratum+ssl://$ethaddress.$workername@us2.ethermine.org:5555")

### nanopool
# stratum1=$(echo "-P stratum1+tcp://$ethaddress@eth-us-east1.nanopool.org:9999/$workername")
# stratum2=$(echo "-P stratum1+tcp://$ethaddress@eth-us-west1.nanopool.org:9999/$workername")

### Autotune parameter - Comment out to not use. Auto-tune can take 60-90 minutes to complete tuning. 
autotune=$(echo "--auto-tune 3")

###API - Uncomment if you would like to enable the ethminer API:
#apicommand=$(echo "--api-port 3333")

### If running on a Raspberry Pi 32bit please uncomment
# rpi=arm
### If running on a Raspberry Pi 64bit please uncomment
# rpi=arm64

### Voltage is now set on the bridge.
### You can still use these as needed.  
### Set FK Voltage - Comment or Uncomment as needed
# fkvccint=850
### Set JC Voltage - Comment or Uncomment as needed
# jcvccint=850

###################### Generated code below no need to modify ###############################
miner=ethminer_sq_1.6.4
if [ "$rpi" == "arm" ]; then miner=ethminer_sq_arm; fi
if [ "$rpi" == "arm64" ]; then miner=ethminer_sq_arm64; fi
tonumber=$(echo "$((1999+$workernumber))")
hosts=$(echo "127.0.0.1:2000-$tonumber")
jcvcccmd=
fkvcccmd=
if [ $fkvccint -gt 0 ]; then fkvcccmd=$(echo "--sqrl-fk-vccint $fkvccint"); fi
if [ $jcvccint -gt 0 ]; then jcvcccmd=$(echo "--sqrl-jc-vccint $jcvccint"); fi

while true; do
	./$miner -v 2 --sqrl --sqrl-hosts $hosts --sqrl-patience $patience --sqin $sqin --sqid $sqid --sqrl-work-delay $delay $fkvcccmd $jcvcccmd --HWMON 1 --cclk $cclk $autotune -R $stratum1 $stratum2 $apicommand --sqrl-die-on-error
	echo "Restarting the $miner in 10 seconds..."
	sleep 10
done
