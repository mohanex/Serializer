@echo off
REM ****************************************************************************
REM Vivado (TM) v2020.2 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Thu May 11 17:40:56 +0200 2023
REM SW Build 3064766 on Wed Nov 18 09:12:45 MST 2020
REM
REM Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
REM elaborate design
echo "xelab -wto 5355f362bf0942e193c9549069400cd0 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tb_SERIAL_behav xil_defaultlib.tb_SERIAL -log elaborate.log"
call xelab  -wto 5355f362bf0942e193c9549069400cd0 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tb_SERIAL_behav xil_defaultlib.tb_SERIAL -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
