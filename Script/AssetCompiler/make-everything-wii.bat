set THIS_DIR=%cd%
set TOP_DIR=%THIS_DIR%\..\..
set COMPILED_ASSETS=%TOP_DIR%\Build\CompiledAssets
set DEST_DIR=%COMPILED_ASSETS%\Wii
set SRC_DIR=%TOP_DIR%\Assets

mkdir %COMPILED_ASSETS%
mkdir %DEST_DIR%
del /S /Q %DEST_DIR%\*.*

REM Convert obj files to binary format, copy to compiled dir
call MakeObjsBin-wii.bat

REM Make data.glue
call makeglue-wii.bat

REM Now make music glue file
call makemusicglue-wii.bat


