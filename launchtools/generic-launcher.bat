@echo off
setlocal enabledelayedexpansion

set CUDA_VISIBLE_DEVICES=%1
set COMMANDLINE_ARGS=%4

cd /D %2

echo Generic launcher starting, device=%1, path=%2, cd=%cd%, batchPath=%~dp0, command=%3, args=%4, launch mode=%5, caller tool path=%6

set PYTHONUNBUFFERED=true

set "argument=%~4"
set "argument=!argument: =^ !"

rem This is utterly cursed windows batch BS. How is batch this bad at quotes and spaces?
set argument=%argument:'="%
set argument=%argument:^=%

if "%5" neq "py" (
    call %3 %argument%
) ELSE (
    call %6 %3 %argument%
)
