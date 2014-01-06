@echo off

REM default server port
@set server_port=9001 

REM default server path is the current path
@set server_path=%~dp0


:get_iisdir
if "%PROGRAMFILES(x86)%"=="" goto x86
set iis_dir=%PROGRAMFILES(x86)%\IIS Express\
goto iis_done

:x86
set iis_dir=%PROGRAMFILES%\IIS Express\

:iis_done
if not exist "%iis_dir%iisexpress.exe" GOTO iis_missing

q"%iis_dir%\iisexpress.exe" /port:%server_port% -path:"%server_path:~0,-1%" /systray:false

:iis_missing
echo can't find "%iis_dir%iisexpress.exe"
exit /b 3