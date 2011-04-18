REM makeglue.bat
REM glue every file (which we want) in this directory into a Glue file.

set THIS_DIR=%cd%
set TOP_DIR=%THIS_DIR%\..\..
set COMPILED_ASSETS=%TOP_DIR%\Build\CompiledAssets
set DEST_DIR=%COMPILED_ASSETS%\Wii
set SRC_DIR=%TOP_DIR%\Assets

mkdir %COMPILED_ASSETS%
mkdir %DEST_DIR%
mkdir %DEST_DIR%\font2d
rem del /S /Q %DEST_DIR%\*.*

REM Copy other files to compiled dir
REM /Y when we would get overwrite confirm prompt

xcopy /Y /S %SRC_DIR%\*.txt %DEST_DIR%
xcopy /Y /S %SRC_DIR%\gui\common\*.txt %DEST_DIR%
REM TODO copying from Win dir
xcopy /Y /S %SRC_DIR%\gui\win\*.txt %DEST_DIR%
xcopy /Y /S %SRC_DIR%\font2d\*.bmp %DEST_DIR%\font2d\
xcopy /Y /S %SRC_DIR%\font2d\*.png %DEST_DIR%\font2d\
xcopy /Y /S %SRC_DIR%\tex\common\*.bmp %DEST_DIR%
xcopy /Y /S %SRC_DIR%\tex\common\*.png %DEST_DIR%
REM TODO copying from Win dir
xcopy /Y /S %SRC_DIR%\tex\win\*.bmp %DEST_DIR%
REM TODO copying from Win dir
xcopy /Y /S %SRC_DIR%\tex\win\*.png %DEST_DIR%
xcopy /Y /S %SRC_DIR%\md2\*.md2 %DEST_DIR%

cd %DEST_DIR%

set GLUE_EXE=%THIS_DIR%\glue.exe
set GLUE_FILE=%DEST_DIR%\..\data-wii.glue
REM make glue file
%GLUE_EXE% -c %GLUE_FILE%

REM for each file, add to glue file.
for %%f in (*.txt, *.md2) do %GLUE_EXE% -a %GLUE_FILE% %%f

REM texture files
for %%f in (*.bmp, *.png) do %GLUE_EXE% -a %GLUE_FILE% %%f

REM obj files are in sub dir
for %%f in (obj\*.obj) do %GLUE_EXE% -a %GLUE_FILE% %%f

REM Add files in font3d dir
for %%f in (obj\font3d\*.obj) do %GLUE_EXE% -a %GLUE_FILE% %%f

REM Add files in font2d dir
for %%f in (font2d\*.txt, font2d\*.bmp, font2d\*.png) do %GLUE_EXE% -a %GLUE_FILE% %%f

REM Add files in levels dir
for %%f in (levels\*.txt) do %GLUE_EXE% -a %GLUE_FILE% %%f


REM Verify contents
%GLUE_EXE% -d %GLUE_FILE%


cd %THIS_DIR%

