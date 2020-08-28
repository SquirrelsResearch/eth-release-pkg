#!/bin/bash

if lsmod | grep "ftdi_sio" &> /dev/null ; then rmmod ftdi_sio; fi

### This line is for a FK33. Comment "#" if this is not your card
./sqrl_bridge U A sq33_d0007.bit

### This line is for a JCC2L-33 running via ethernet. Uncomment if needed.
# ./sqrl_bridge C<ip1,ip2> sq33_d0007.bit 0.900

### This line is for a JCC2L-35 running via ethernet. Uncomment if needed.
# ./sqrl_bridge C<ip1,ip2> sq35_d0007.bit 0.900

### This line is for a JCC4P-35. Uncomment if needed.
#./sqrl_bridge A sq35_d0007.bit

read -n 1 -s -r -p "Press any key to continue"