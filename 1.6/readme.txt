The SQRL team is happy to bring you the third release of the ETH bitstream for HBM2 based FPGA’s including the FK33, JCC2L-33, JCC2L-35 and JCC4P-35. This release is mainly focused on updates to the bridge and miner. 

Expected Hashrate:
FK33: 49 Mh/s
JCC2L-33: 49 Mh/s (per module)
JCC2L-35: 49 Mh/s (per module)
JCC4P-35: 49 Mh/s (per module)

All hashrates are based on the default settings in the startminer scripts. 
The new version of the miner has an --auto-tune option that will adjust the cclk and other settings to the optimum settings. 

This software has no dev fee, and is provided "as-is" without warranty or support. Community assistance is available in the "FPGA" Discord, #sqrl channel: come say hi!

             SQRL Research - http://squirrelsresearch.com/
    ETH Donation Address: 0x48E31e6B7A2696dcb7733C974A4B498fAa3234F6

Steps for mining:

Linux:
1. Extract all files to directory
2. chmod executable file:
        chmod +x ethminer* sqrl* start*
3. Modify startminer.sh with atleast ethaddress and number of FPGA. 
4. Modify startbridge.sh and set the appropriate line for your bridge.
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

After running the startminer batch or script the miner should start building the DAG which takes about 7 minutes. Once complete the miner will start mining. 

Changelog:
20200919 Release 1.6
	Ethminer 1.6.1
		- Improved performance and bug fixes for FPGA communication
		- Prevented bogus telemetry and errors if communication is lost with the FPGA
		- Includes VRM performance hot-fixes for JungleCat modules
		- Setting a specific clock now selects the correct clock instead of rounding
		- Performance averages are more accurate.
		- Autotune is improved in performance and adds more modes
		- Fixed a bug where specifying an FK voltage lower than available would not set any voltage at all (now sets the lowest available voltage)
		- DAG Generation speed is significantly improved
	Bridge 2.0.2
		- Prevented a communication failure on one FPGA from causing all others to fail
		- Added multi-client support to enable dual mining and external board management utilities 
		- Replaced legacy command line arguments with more flexible / standard flags (check -h or —help for details)
		- Added support for FK and JCC4P VRM telemetry
		- Added support for FK and JCC4P voltage setting
		- Added voltage control for VCCBRAM and VCCHBM rails
		- Added optional CLI GUI mode (-g) with real time voltage control (Arrows to select fpga, v/V for VCCINT up/down, .... )
		- Additional Intel module support
		- Bridge automatically applies the latest PMIC/VRM firmware hot-fixes for JungleCat Modules
		- FTDI latency timers are now configurable individually for JTAG and UART channels
		- Added an option to suppress telemetry printing on the command line / in logs.
		- Added the option to record a log file
		- General improvements for FPGA communication performance and reliability
		- Added estimated power consumption per FPGA
20200827 Release
	Ethminer 1.5.1
		- Updated scripts and instructions to make it easier to start mining. 
		- Many updates to miner and bridge to improve stability
		- Added support for armv7 (RaspberryPi and similar)
		- Resolved an issue where ethminer required >4GB of system ram, despite not using it
		- Added JCC4P/JTAG-UART support
		- Added JCM Voltage Control (--sqrl-jc-vccint)
		- Added support for monitoring healthcheck shares below pool difficulty, supports -v 2 option for per-chip stats
		- Added --auto-tune parameter to the miner to let the miner auto-tune the best settings for each FPGA board. Auto-tuning takes 60-90 minutes to complete.