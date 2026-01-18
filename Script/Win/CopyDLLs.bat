REM Copy DLLs to working directory for Windows debugging

set THIS_DIR=%cd%
set TOP_DIR=%THIS_DIR%\..\..
set COMPILED_ASSETS=%TOP_DIR%\Build\CompiledAssets

mkdir %COMPILED_ASSETS%

copy %TOP_DIR%\Source\SDL\lib\*.dll   %COMPILED_ASSETS%
copy %TOP_DIR%\Source\SoundBass\Bass2.3\Win\*.dll   %COMPILED_ASSETS%
REM TODO DX9 -- use Depends to find all deps ?!

