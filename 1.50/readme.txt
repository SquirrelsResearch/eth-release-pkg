The SQRL team is happy to bring you the second release of the ETH bitstream for HBM2 based FPGA’s including the FK33, JCC2L-33, JCC2L-35 and JCC4P-35. 

Expected Hashrate:
FK33: 44 Mh/s
JCC2L-33: 44 Mh/s (per module)
JCC2L-35: 46 Mh/s (per module)
JCC4P-35: 46 Mh/s (per module)

All hashrates are based on the default settings in the startminer scripts. 
The new version of the miner has an --auto-tune option that will adjust the cclk and other settings to the optimum settings. 

This software has no dev fee, and is provided "as-is" without warranty or support. Community assistance is available in the "FPGA" Discord, #sqrl channel: come say hi!

             SQRL Research - http://squirrelsresearch.com/
    ETH Donation Address: 0x48E31e6B7A2696dcb7733C974A4B498fAa3234F6

Steps for mining:

Linux:
1. Extract all files to directory
2. chmod executable file:
        chmod +x ethminer_sq sqrl_bridge startbridge.sh startminer.sh
3. Modify startminer.sh with atleast ethaddress and number of FPGA. 
4. Open two different shell windows 
5. In first window run: sudo ./startbridge.sh 
6. In second window run: sudo ./startminer.sh

Windows:
1. Extract all files to directory
2. Modify startminer.bat with atleast ethaddress and number of FPGA.
3. First Run: startbridge.bat 
4. Wait for it to finish and start showing Telemetry
5. Second run: startminer.bat

After running the startminer batch or script the miner should start building the DAG which takes about 7 minutes. Once complete the miner will start mining. 

Changelog:
20200827 Release 1.50
    Updated scripts and instructions to make it easier to start mining. 
    Many updates to miner and bridge to improve stability
    Added support for armv7 (RaspberryPi and similar)
    Resolved an issue where ethminer required >4GB of system ram, despite not using it
    Added JCC4P/JTAG-UART support
    Added JCM Voltage Control (--sqrl-jc-vccint)
    Added support for monitoring healthcheck shares below pool difficulty, supports -v 2 option for per-chip stats
    Added --auto-tune paramater to the miner to let the miner auto-tune the best settings for each FPGA board. Auto-tuning takes 60-90 minutes to complete.