This is a beta release. 1.6 Is still the official release. 

Note: The Raspberry Pi executables are compiled for Ubuntu 20.10.

Steps for mining:

Linux:
1. Extract all files to directory
2. chmod executable file:
        chmod +x ethminer* sqrl* start*
3. Modify startminer.sh with atleast ethaddress and number of FPGA. (Uncomment rpi lines if needed)
4. Modify startbridge.sh and set the appropriate line for your bridge. (Uncomment rpi lines if needed)
5. Open two different shell windows 
		In first window run: sudo ./startbridge.sh and wait for the bridge to start showing telemetry data
		In second window run: sudo ./startminer.sh

Windows:
1. Extract all files to directory
2. Modify startminer.bat with atleast ethaddress and number of FPGA.
3. Modify startbridge.bat and set the appropriate line for your bridge.
4. Run two different batch files windows 
		First Run: startbridge.bat Wait for it to finish and start showing Telemetry
		Second Run: startminer.bat