@echo off

call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"

ml64 /nologo /Zi /c count_to_n.asm
link /nologo /DEBUG /MACHINE:x64 /OUT:count_to_n.exe /ENTRY:main count_to_n.obj kernel32.lib user32.lib legacy_stdio_definitions.lib ucrt.lib msvcrt.lib

ml64 /nologo /Zi /c count.asm
link /nologo /DEBUG /MACHINE:x64 /OUT:count.exe /ENTRY:main count.obj kernel32.lib user32.lib legacy_stdio_definitions.lib ucrt.lib msvcrt.lib

ml64 /nologo /Zi /c calc.asm
link /nologo /DEBUG /MACHINE:x64 /OUT:calc.exe /ENTRY:main calc.obj kernel32.lib user32.lib legacy_stdio_definitions.lib ucrt.lib msvcrt.lib
