@echo off

:: setup compiler environment
call ..\..\Utilities\Scripts\setup_intel_compilers.bat

Title Building FDS for 64 bit Windows

make VPATH="../../FDS_Source" -f ..\makefile intel_win_64
pause

