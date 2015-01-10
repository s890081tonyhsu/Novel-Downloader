@echo off
chcp | findstr 65001
if NOT %ERRORLEVEL% == 0 GOTO Error

:Start
ruby bin\%1.rb %2 %3
GOTO End

:Error
ECHO Please using utf-8 code page by typing "chcp 65001"

:End