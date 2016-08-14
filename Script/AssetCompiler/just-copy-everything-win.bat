REM Use this for asset development
REM Copies obj files and other assets to Build/CompiledAssets/Win
REM So you can run with no glue file

set THIS_DIR=%cd%
set TOP_DIR=%THIS_DIR%\..\..
set COMPILED_ASSETS=%TOP_DIR%\Build\CompiledAssets
set DEST_DIR=%COMPILED_ASSETS%\Win
set SRC_DIR=%TOP_DIR%\Assets

mkdir %COMPILED_ASSETS%
mkdir %DEST_DIR%
del /S /Q %DEST_DIR%\*.*


call CopyObjsNoBin-win.bat

call makeglue-win-JustCopy.bat

call makemusicglue-win-JustCopy.bat


