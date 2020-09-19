#!/bin/bash

### Set the voltage of your device
vccint=0.85
### Set Device type:
### Forest Kitten 33 = fk33
### JCC2L-33 = jcc2l-33
### JCC2L-35 = jcc2l-35
### JCC4p-35 = jcc2l-35
devicetype=fk33

### Uncomment and set the IPs for your ethernet connected JCC2L Device if needed
# jcips=192.168.1.20,192.168.1.21

### If running on a Raspberry Pi 32bit please uncomment
# rpi=arm
### If running on a Raspberry Pi 64bit please uncomment
# rpi=arm64


#############################################################################################
###################### Generated code below no need to modify ###############################
if lsmod | grep "ftdi_sio" &> /dev/null ; then rmmod ftdi_sio; fi
bit33=sq33_d0008.bit
bit35=sq35_d0008.bit
bridge=sqrl_bridge
if [ "$rpi" == "arm" ]; then bridge=sqrl_bridge_arm; fi
if [ "$rpi" == "arm64" ]; then bridge=sqrl_bridge_arm64; fi
if [ "$devicetype" == "fk33" ]; then bridgeoptions=$(echo "-u -a -x -g -q -v $vccint -b $bit33"); fi
if [ "$devicetype" == "jcc2l-33" ]; then bridgeoptions=$(echo "-c $jcips -x -g -q -v $vccint -b $bit33"); fi
if [ "$devicetype" == "jcc2l-35" ]; then bridgeoptions=$(echo "-c $jcips -x -g -q -v $vccint -b $bit35"); fi
if [ "$devicetype" == "jcc4p-35" ]; then bridgeoptions=$(echo "-u -a -x -g -q -v $vccint -b $bit35"); fi

### Run Bridge
./$bridge $bridgeoptions
### Pause after bridge stops
read -n 1 -s -r -p "Press any key to continue . . ."