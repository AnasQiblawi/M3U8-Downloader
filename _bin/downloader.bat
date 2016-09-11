::http://hls.younow.com/hlsarchives/live/f9/f8/113511697/playlist.m3u8
echo off
mode con cols=80 lines=1
set url=%1
set num=%2

set title=%num%
title Downloader #%title%
if not exist "../videos" md "../videos"

cls

set /a number=num-1
set stop=0


:: Text
echo.
echo. Number of this Downloader is %num%
echo.


:: Downlading
 :top
cls
if not exist "../videos/%number%.ts" (goto :again)
set /a number=number+num
if exist  "../videos/%number%.ts" (set /a number=number+num)
if exist "../videos/%number%.ts" (goto :top)
wget  --no-clobber --no-check-certificate -nd -P "../videos" %url%/%number%.ts"
if exist "../videos/%number%.ts.1" (del "../videos/%number%.ts.1")
if exist "../videos/%number%.ts.1" (del "../videos/%number%.ts.2")
if exist "../videos/%number%.ts.1" (del "../videos/%number%.ts.3")
goto :top


:: Download again if not exist
 :again
set /a stop=stop+1
:: if can't download the file for 10 times then goto end
if %stop%==10 (goto :end)
wget -nd -P "../videos" %url%/%number%.ts"
goto :top


:: End
 :end
 color 0a
echo. --------------------------------------------
echo.  . . . File is downloaded Successfuly . . .
::msg * Downloader #%title% is finished
echo.
::pause

start /min deleter.bat %title%

exit

