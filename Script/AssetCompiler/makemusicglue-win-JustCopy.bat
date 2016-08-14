REM makemusicglue.bat
REM glue sound files into a Glue file.

set THIS_DIR=%cd%
set TOP_DIR=%THIS_DIR%\..\..
set DEST_DIR=%TOP_DIR%\Build\CompiledAssets\Win
set SRC_DIR=%TOP_DIR%\Assets\sound

mkdir %DEST_DIR%
mkdir %DEST_DIR%\sound


xcopy /S /Y %SRC_DIR%\windows\*.wav %DEST_DIR%\sound
xcopy /S /Y %SRC_DIR%\*.it %DEST_DIR%\sound


cd %THIS_DIR%
