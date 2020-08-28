@echo off
rem ### What is your ETH Address?
set ethaddress=0x48E31e6B7A2696dcb7733C974A4B498fAa3234F6

rem ### What is your worker name?
set workername=FKworker

rem ### How many FPGAs do you have?
set workernumber=1

rem ### Set FK Voltage - rem or un-rem as needed
set fkvccint=900
rem ### Set JC Voltage - rem or un-rem as needed
rem set jcvccint=900

rem ### Freqency in mhz of FPGA
set cclk=437

rem ### Advanced Tuneables
set patience=2
set sqin=38
set sqid=8
set delay=40000

rem ### Pools. Defaults to ethminer rem these lines and remove rem from lines below if you want nanopool
set stratum1=-P stratum+ssl://%ethaddress%.%workername%@us1.ethermine.org:5555 
set stratum2=-P stratum+ssl://%ethaddress%.%workername%@us2.ethermine.org:5555

rem ### nanopool
rem set stratum1=-P stratum1+tcp://%ethaddress%@eth-us-east1.nanopool.org:9999/%workername%
rem set stratum2=-P stratum1+tcp://%ethaddress%@eth-us-west1.nanopool.org:9999/%workername%

rem ### Autotune paramater - Rem out to not use. Auto-tune can take 60-90 minutes to complete tuning. 
set autotune=--auto-tune 3

rem ###################### Generated code below no need to modify ###############################
set miner=ethminer_sq.exe
set /a tonumber=1999+%workernumber%
set hosts=127.0.0.1:2000-%tonumber%
set jcvcccmd=
set fkvcccmd=
if [%fkvccint%] NEQ [] set fkvcccmd=--sqrl-fk-vccint %fkvccint%
if [%jcvccint%] NEQ [] set jcvcccmd=--sqrl-jc-vccint %jcvccint%

:loop
	%miner% -v 2 --sqrl --sqrl-hosts %hosts% --sqrl-patience %patience% --sqin %sqin% --sqid %sqid% --sqrl-work-delay %delay% %fkvcccmd% %jcvcccmd% --HWMON 1 --cclk %cclk% %autotune% %stratum1% %stratum2%
	timeout 5
goto loop