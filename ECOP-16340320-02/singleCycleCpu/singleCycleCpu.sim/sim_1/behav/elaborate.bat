@echo off
set xv_path=D:\\vivado\\vivado\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto 0e1c6b321af2493797b8b4b27116c03b -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot MainCPU_behav xil_defaultlib.MainCPU xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
