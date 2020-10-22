#!/bin/bash

### Set the voltage of your device
vccint=0.85
vccbram=0.85
vcchbm=1.22
### Set Device type:
### Forest Kitten 33 = fk33
### JCC2L-33 = jcc2l_33
### JCC2L-35 = jcc2l_35
### JCC4p_35 = jcc4p_35
devicetype=fk33

### Uncomment and set the IPs for your ethernet connected JCC2L Device if needed
# jcips=192.168.1.20,192.168.1.21

### If running on a Raspberry Pi 32bit please uncomment
# rpi=arm
### If running on a Raspberry Pi 64bit please uncomment
# rpi=arm_64


#############################################################################################
###################### Generated code below no need to modify ###############################
if lsmod | grep "ftdi_sio" &> /dev/null ; then rmmod ftdi_sio; fi
bit_33=sq33_eth_trb_106e_0.246_2200.bit
bit_35=sq35_eth_trb_99d_2200.bit
bridge=sqrl_bridge_2.1.2_32AHBM
if [ "$rpi" == "arm" ]; then bridge=sqrl_bridge_arm; fi
if [ "$rpi" == "arm_64" ]; then bridge=sqrl_bridge_arm64; fi
if [ "$devicetype" == "fk33" ]; then bridgeoptions=$(echo "-u -a -x -g -q -v $vccint -w $vcchbm -y $vccbram -b $bit_33"); fi
if [ "$devicetype" == "jcc2l_33" ]; then bridgeoptions=$(echo "-c $jcips -x -g -q -v $vccint -w $vcchbm -y $vccbram -b $bit_33"); fi
if [ "$devicetype" == "jcc2l_35" ]; then bridgeoptions=$(echo "-c $jcips -x -g -q -v $vccint -w $vcchbm -y $vccbram -b $bit_35"); fi
if [ "$devicetype" == "jcc4p_35" ]; then bridgeoptions=$(echo "-a -x -g -q -v $vccint -w $vcchbm -y $vccbram -b $bit_35"); fi

### Run Bridge
./$bridge $bridgeoptions
### Pause after bridge stops
read -n 1 -s -r -p "Press any key to continue . . ."