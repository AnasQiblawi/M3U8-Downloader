:: For Test
::http://hls.younow.com/hlsarchives/live/2b/6b/113539057/playlist.m3u8
:: - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
echo off
title M3U8 Downloader - Anas Qiblawi
if not exist "videos" md videos
cd _bin
cls

set numper=0
set stop=0


:: Delete Previus Files
set delete=1
 :delete
if exist downloader_%delete%.bat (
del downloader_%delete%.bat
set /a delete=delete+1
goto :delete
) else (goto :set)


 :set
:: Enter URL
echo Enter URL  :
set /P url=

:: Edit URL
setlocal enabledelayedexpansion
set url=!url:/playlist.m3u8=!
set url=!url:https://=!
set url=!url:http://=!
set url=!url:www.=!
set url=!url://=/!
set url=!url:.m3u8=!
setlocal disabledelayedexpansion


:: Set amount
echo How many downloaders do you want to use :  
set /P num=

echo.
echo. --------------------------------------------
echo.

:: Creating New Downloader
 :copy
if %num%==0 (goto :nothing)
copy downloader.bat downloader_%num%.bat
start /min downloader_%num%.bat %url%  %num%
set /a num=num-1
goto :copy




:: End
 :end

color 0a
echo.
echo. --------------------------------------------
echo.  . . . Started downloading Successfuly . . .
echo. --------------------------------------------
echo.
pause
exit


 :nothing
color 0a
echo.
echo. ---------------------------------------------
echo.  . . . Thanks for using my Application . . .
Echo.                         Regards,
echo.                          Anas Qiblawi
echo. ---------------------------------------------
echo.
pause
exit
