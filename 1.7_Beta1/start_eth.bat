@echo off
rem ### What is your ETH Address?
set ethaddress=0x48E31e6B7A2696dcb7733C974A4B498fAa3234F6

rem ### What is your worker name?
set workername=FKworker

rem ### How many FPGAs do you have?
set workernumber=1

rem ### Frequency in MHz of FPGA
set cclk=480

rem ### Advanced Tuneables
set patience=8
set sqin=71
set sqid=8
set delay=1000000

rem ### Pools. Defaults to ethminer rem these lines and remove rem from lines below if you want nanopool
set stratum1=-P stratum+ssl://%ethaddress%.%workername%@us1.ethermine.org:5555 
set stratum2=-P stratum+ssl://%ethaddress%.%workername%@us2.ethermine.org:5555

rem ### nanopool
rem set stratum1=-P stratum1+tcp://%ethaddress%@eth-us-east1.nanopool.org:9999/%workername%
rem set stratum2=-P stratum1+tcp://%ethaddress%@eth-us-west1.nanopool.org:9999/%workername%

rem ### Autotune parameter - Rem out to not use. Auto-tune can take 60-90 minutes to complete tuning. 
set autotune=--auto-tune 3

rem ###API - Uncomment if you would like to enable the ethminer API:
rem set apicommand=--api-port 3333

rem ### Voltage is now set on the bridge. No need to uncomment these. 
rem ### Set FK Voltage - rem or un-rem as needed
rem set fkvccint=850
rem ### Set JC Voltage - rem or un-rem as needed
rem set jcvccint=850

rem ###################### Generated code below no need to modify ###############################
set miner=ethminer_sq_1.6.4.exe
set /a tonumber=1999+%workernumber%
set hosts=127.0.0.1:2000-%tonumber%
set jcvcccmd=
set fkvcccmd=
if [%fkvccint%] NEQ [] set fkvcccmd=--sqrl-fk-vccint %fkvccint%
if [%jcvccint%] NEQ [] set jcvcccmd=--sqrl-jc-vccint %jcvccint%

:loop
	%miner% -v 2 --sqrl --sqrl-hosts %hosts% --sqrl-patience %patience% --sqin %sqin% --sqid %sqid% --sqrl-work-delay %delay% %fkvcccmd% %jcvcccmd% --HWMON 1 --cclk %cclk% %autotune% -R %stratum1% %stratum2% %apicommand% --sqrl-die-on-error
	echo "Restarting %miner% in 10 seconds..."
	timeout 10
goto loop