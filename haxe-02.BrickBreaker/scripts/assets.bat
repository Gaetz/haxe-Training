@echo off

set buildDir=%~dp0..\bin
set assetsDir=%~dp0..\src\res

:: Copy assets
if not exist %buildDir%\res mkdir %buildDir%\res
xcopy /y /s %assetsDir% %buildDir%\res