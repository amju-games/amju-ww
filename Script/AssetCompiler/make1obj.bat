rem Add/amend one obj file
rem %1 is obj filename given as arg

set THIS_DIR=%cd%
set TOP_DIR=%THIS_DIR%\..\..
set DEST_DIR=%TOP_DIR%\Build\CompiledAssets\Win
set SRC_DIR=%TOP_DIR%\Assets

cd %SRC_DIR%
cd obj

%RESTORE_DIR%\obj2bin %1 %DEST_DIR%\obj\%1

cd %DEST_DIR%

set GLUE_EXE=%THIS_DIR%\glue.exe
set GLUE_FILE=%DEST_DIR%\..\data-win.glue

%GLUE_EXE% -p %GLUE_FILE% obj\%1

cd %THIS_DIR%

