REM makeglue.bat
REM glue Levels only into a Glue file.

set THIS_DIR=%cd%
set TOP_DIR=%THIS_DIR%\..\..
set COMPILED_ASSETS=%TOP_DIR%\Build\CompiledAssets
set DEST_DIR=%COMPILED_ASSETS%\Win
set SRC_DIR=%TOP_DIR%\Assets

rem mkdir %COMPILED_ASSETS%
rem mkdir %DEST_DIR%
rem mkdir %DEST_DIR%\font2d
rem del /S /Q %DEST_DIR%\*.*

REM Copy other files to compiled dir
REM /Y when we would get overwrite confirm prompt

xcopy /Y /S %SRC_DIR%\levels\*.txt %DEST_DIR%\levels\

cd %DEST_DIR%

set GLUE_EXE=%THIS_DIR%\glue.exe
set GLUE_FILE=%DEST_DIR%\..\data-win.glue
REM DON'T trash glue file
REM %GLUE_EXE% -c %GLUE_FILE%

REM Add files in levels dir -- PATCH, so replace old versions
for %%f in (levels\*.txt) do %GLUE_EXE% -p %GLUE_FILE% %%f


REM Verify contents
REM %GLUE_EXE% -d %GLUE_FILE%


cd %THIS_DIR%

