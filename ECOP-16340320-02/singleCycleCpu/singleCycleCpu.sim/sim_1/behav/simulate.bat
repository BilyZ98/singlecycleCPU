@echo off
set xv_path=D:\\vivado\\vivado\\Vivado\\2015.2\\bin
call %xv_path%/xsim MainCPU_behav -key {Behavioral:sim_1:Functional:MainCPU} -tclbatch MainCPU.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
