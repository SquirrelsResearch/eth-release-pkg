@echo off

REM ### Set the voltage of your device
set vccint=0.85
REM ### Set Device type:
REM ### Forest Kitten 33 = fk33
REM ### JCC2L-33 = jcc2l-33
REM ### JCC2L-35 = jcc2l-35
REM ### JCC4p-35 = jcc2l-35
set devicetype=fk33

REM ### Uncomment and set the IPs for your ethernet connected JCC2L Device if needed
REM set jcips=192.168.1.20,192.168.1.21

REM #############################################################################################
REM ###################### Generated code below no need to modify ###############################
set bit33=sq33_d0008.bit
set bit35=sq35_d0008.bit
set bridge=sqrl_bridge.exe
REM ### Set bridgeoptions
if [%devicetype%] EQU [fk33] set bridgeoptions=-u -a -x -g -q -v %vccint% -b %bit33%
if [%devicetype%] EQU [jcc2l-33] set bridgeoptions=-c %jcips% -x -g -q -v %vccint% -b %bit33%
if [%devicetype%] EQU [jcc2l-35] set bridgeoptions=-c %jcips% -x -g -q -v %vccint% -b %bit35%
if [%devicetype%] EQU [jcc4p-35] set bridgeoptions=-u -a -x -g -q -v %vccint% -b %bit35%
REM ### Run Bridge
%bridge% %bridgeoptions%
REM ### Pause after bridge stops
pause