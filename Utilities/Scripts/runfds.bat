@echo off

:: $Date: 2015-01-18 17:33:22 -0500 (Sun, 18 Jan 2015) $ 
:: $Revision: 21454 $
:: $Author: gforney $

:: set number of openmp threads

set OMP_NUM_THREADS=1

call %SVNROOT%\Utilities\Scripts\getopts.bat %*

set fulldir=%BASEDIR%/%dir%

set in=%infile%.fds
set out=%infile%.err
set stopfile=%infile%.stop

Rem test existence of %FDS%

Rem test existence of %fulldir%

Rem test existence of FDS input file %fulldir%/%in%

cd %fulldir%
echo %in% started

if exist %stopfile% (
   erase %stopfile%
)
if "%rundebug%" == "1" (
   echo 2 > %stopfile%
)

%FDS% %in%  2> %out%

cd %BASEDIR%
