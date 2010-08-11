REM makeglue.bat
REM glue every file (which we want) in this directory into a Glue file.

set THIS_DIR=%cd%
set TOP_DIR=%THIS_DIR%\..\..
set COMPILED_ASSETS=%TOP_DIR%\Build\CompiledAssets
set DEST_DIR=%COMPILED_ASSETS%\Win
set SRC_DIR=%TOP_DIR%\Assets

mkdir %COMPILED_ASSETS%
mkdir %DEST_DIR%
del /S /Q %DEST_DIR%\*.*

REM Convert obj files to binary format, copy to compiled dir
call MakeObjsBin-win.bat

REM Copy other files to compiled dir
xcopy /S %SRC_DIR%\*.txt %DEST_DIR%
xcopy /S %SRC_DIR%\*.bmp %DEST_DIR%
xcopy /S %SRC_DIR%\*.md2 %DEST_DIR%

cd %DEST_DIR%

set GLUE_EXE=%THIS_DIR%\glue.exe
set GLUE_FILE=%DEST_DIR%\..\data-win.glue
REM make glue file
%GLUE_EXE% -c %GLUE_FILE%

REM for each file, add to glue file.
for %%f in (*.txt, *.bmp, *.md2) do %GLUE_EXE% -a %GLUE_FILE% %%f

REM obj files are in sub dir
for %%f in (obj\*.obj) do %GLUE_EXE% -a %GLUE_FILE% %%f

REM Add files in font3d dir
for %%f in (obj\font3d\*.obj) do %GLUE_EXE% -a %GLUE_FILE% %%f

REM Add files in font2d dir
for %%f in (font2d\*.txt, font2d\*.bmp) do %GLUE_EXE% -a %GLUE_FILE% %%f

REM Add files in levels dir
for %%f in (levels\*.txt) do %GLUE_EXE% -a %GLUE_FILE% %%f


REM Verify contents
%GLUE_EXE% -d %GLUE_FILE%


cd %THIS_DIR%

REM Now make music glue file
call makemusicglue-win.bat
