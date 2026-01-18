REM makeglue.bat
REM glue every file (which we want) in this directory into a Glue file.

set THIS_DIR=%cd%
set TOP_DIR=%THIS_DIR%\..\..
set COMPILED_ASSETS=%TOP_DIR%\Build\CompiledAssets
set DEST_DIR=%COMPILED_ASSETS%\Win
set SRC_DIR=%TOP_DIR%\Assets
set SRC_FONT2D=%TOP_DIR%\..\amjulib\Assets\font2d

mkdir %COMPILED_ASSETS%
mkdir %DEST_DIR%
mkdir %DEST_DIR%\font2d
rem del /S /Q %DEST_DIR%\*.*

REM Copy other files to compiled dir
REM /Y when we would get overwrite confirm prompt

xcopy /Y /S %SRC_DIR%\*.txt %DEST_DIR%
xcopy /Y /S %SRC_DIR%\gui\common\*.txt %DEST_DIR%
xcopy /Y /S %SRC_DIR%\gui\win\*.txt %DEST_DIR%
xcopy /Y /S %SRC_FONT2D%\* %DEST_DIR%\font2d\
xcopy /Y /S %SRC_DIR%\tex\common\*.png %DEST_DIR%
xcopy /Y /S %SRC_DIR%\tex\win\*.png %DEST_DIR%
xcopy /Y /S %SRC_DIR%\md2\*.md2 %DEST_DIR%



cd %THIS_DIR%

