echo off
cd videos
cls

set vid=1
set loop=500
set cuntr=1
set file= 0.ts 
set num=0

if not exist 0.ts  (goto :nothing)



 :counter
:: Make a copy for each 500 files
if %cuntr%==%loop% (
set /a loop=loop+500
copy /B %file% vid_%vid%.mp4
set /a vid=vid+1
set file=
goto :fix
)


:: Collecter
if exist %cuntr%.ts (
set file= %file% + %cuntr%.ts 
set /a cuntr=cuntr+1
goto :counter
) else (goto :finish)


:: One time before Collecter
 :fix
if exist %cuntr%.ts (
set file=  %cuntr%.ts 
set /a cuntr=cuntr+1
goto :counter
) else (goto :finish)


:: Copy resulted file into one final File
 :finish
:: Last file of 500s
copy /B %file% vid_%vid%.mp4


:: All To One File
set all=2
set A_file= vid_1.mp4 


:: Final Collecter
 :again
if  exist vid_%all%.mp4 (
set A_file= %A_file% + vid_%all%.mp4 
set /a all=all+1
goto :again 
) else (goto :last)


:: Copy all to one file
 :last
copy /B  %A_file%  video.mp4
move /y video.mp4   ../video.mp4


:: Delet all files
set d=0
 :delete_1
if exist %d%.ts (
del %d%.ts
set /a d=d+1
goto :delete_1
)

:: Delete Resulted Files
set d=1
 :delete_2
if exist vid_%d%.mp4 (
del vid_%d%.mp4
set /a d=d+1
goto :delete_2
)

:: Delet not wanted files
set d=0
 :delete_3
if exist %d%.ts.1 (
del %d%.ts
set /a d=d+1
goto :delete_3
)
set d=0
 :delete_4
if exist %d%.ts.2 (
del %d%.ts
set /a d=d+1
goto :delete_4
)



:: 
 :end
 echo.  end
 pause
 exit
 
::
  :nothing
echo.                   - - - - - - - -  - - - - - - - - - 
echo.                       . . . nothing to do . . .
echo.                   - - - - - - - -  - - - - - - - - - 
pause
exit