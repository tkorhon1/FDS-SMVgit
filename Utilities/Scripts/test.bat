@echo off
set stopfile=xxx.txt
set rundebug=0
if exist %stopfile% (
   erase %stopfile%
)
if "%rundebug%" == "1" (
   echo 5 > %stopfile%
)
