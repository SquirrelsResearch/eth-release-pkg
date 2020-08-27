#!/bin/bash

### What is your ETH Address?
ethaddress=0x48E31e6B7A2696dcb7733C974A4B498fAa3234F6

### What is your worker name?
workername=FKworker

### How many FPGAs do you have?
workernumber=1

### Set FK Voltage - Comment or Uncomment as needed
fkvccint=900
### Set JC Voltage - Comment or Uncomment as needed
#jcvccint=900

### Freqency in mhz of FPGA
cclk=437

### Advanced Tuneables
patience=2
sqin=38
sqid=8
delay=40000

### Autotune paramater - Comment out to not use. Auto-tune can take 60-90 minutes to complete tuning. 
autotune=$(echo "--auto-tune 3")

### Pools. Defaults to ethminer rem these lines and remove comment from lines below if you want nanopool
stratum1=$(echo "-P stratum+ssl://$etheaddress.$workername@us1.ethermine.org:5555")
stratum2=$(echo "-P stratum+ssl://$etheaddress.$workername@us2.ethermine.org:5555")

### nanopool
# stratum1=$(echo "-P stratum1+tcp://$etheaddress@eth-us-east1.nanopool.org:9999/$workername")
# stratum2=$(echo "-P stratum1+tcp://$etheaddress@eth-us-west1.nanopool.org:9999/$workername")


###################### Generated code below no need to modify ###############################
miner=ethminer_sq
tonumber=$(echo "$((1999+$workernumber))")
hosts=$(echo "127.0.0.1:2000-$tonumber")
jcvcccmd=
fkvcccmd=
if [ $fkvccint -gt 0 ]; then fkvcccmd=$(echo "--sqrl-fk-vccint $fkvccint"); fi
if [ $jcvccint -gt 0 ]; then jcvcccmd=$(echo "--sqrl-jc-vccint $jcvccint"); fi

while true; do
	./$miner -v 2 --sqrl --sqrl-hosts $hosts --sqrl-patience $patience --sqin $sqin --sqid $sqid --sqrl-work-delay $delay $fkvcccmd $jcvcccmd --HWMON 1 --cclk $cclk $autotune -R $stratum1 $stratum2
	echo "Restarting the miner in 10 seconds..."
	sleep 10
done