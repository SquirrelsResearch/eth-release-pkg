#!/bin/bash

### What is your Tellor Address?
address=0xADDRESS
### What is your Tellor Pool password?
tellorpassword=password

### What is your worker name?
workername=FKworker

### How many FPGAs do you have?
workernumber=1

### Frequency in MHz of FPGA
cclk=593

### Pool Stratum
stratum1=eu.tellorpool.org:1138

### If running on a Raspberry Pi 32bit please uncomment
# rpi=arm
### If running on a Raspberry Pi 64bit please uncomment
# rpi=arm64

###################### Generated code below no need to modify ###############################
miner=telminer-1.6.0-fix
if [ "$rpi" == "arm" ]; then miner=telminer-1.6.0-fix_arm; fi
if [ "$rpi" == "arm64" ]; then miner=telminer-1.6.0-fix_arm64; fi
tonumber=$(echo "$((1999+$workernumber))")
hosts=$(echo "127.0.0.1:2000-$tonumber")

while true; do
	./$miner --stratum $stratum1 --user $address.fpga_$workername --pass $tellorpassword --freq $cclk --tcp $hosts
	echo "Restarting the $miner in 10 seconds..."
	sleep 10
done