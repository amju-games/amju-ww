rem Make binary versions of .obj files

set RESTORE_DIR=%cd%
set TOP_DIR=%RESTORE_DIR%\..\..
set DEST_DIR=%TOP_DIR%\Build\CompiledAssets\Win
mkdir %DEST_DIR%
set SRC_DIR=%TOP_DIR%\Assets

cd %SRC_DIR%

cd obj
REM Need this mtl file to load the text-format obj files
copy default.mtl font3d
copy ..\tex\common\wh8.png font3d

mkdir %DEST_DIR%\obj\font3d
cd font3d
for %%f in (*.obj) do %RESTORE_DIR%\obj2bin %%f %DEST_DIR%\obj\font3d\%%f
del default.mtl
del wh8.png

mkdir %DEST_DIR%\obj
cd ..
for %%f in (*.obj) do %RESTORE_DIR%\obj2bin %%f %DEST_DIR%\%%f

cd %RESTORE_DIR%
