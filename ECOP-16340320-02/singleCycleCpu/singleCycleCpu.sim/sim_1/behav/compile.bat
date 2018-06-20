@echo off
set xv_path=D:\\vivado\\vivado\\Vivado\\2015.2\\bin
echo "xvlog -m64 --relax -prj MainCPU_vlog.prj"
call %xv_path%/xvlog  -m64 --relax -prj MainCPU_vlog.prj -log compile.log
if "%errorlevel%"=="1" goto END
if "%errorlevel%"=="0" goto SUCCESS
:END
exit 1
:SUCCESS
exit 0
