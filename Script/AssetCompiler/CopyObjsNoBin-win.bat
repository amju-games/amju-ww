rem Don't make binary versions of .obj files, just copy text versions

set RESTORE_DIR=%cd%
set TOP_DIR=%RESTORE_DIR%\..\..
set DEST_DIR=%TOP_DIR%\Build\CompiledAssets\Win

mkdir %DEST_DIR%
mkdir %DEST_DIR%\obj
mkdir %DEST_DIR%\obj\font3d

set SRC_DIR=%TOP_DIR%\Assets

set SRC_FONT3D=%TOP_DIR%\..\amjulib\Assets\font3d\

cd %SRC_DIR%

cd obj
REM Need this mtl file to load the text-format obj files
copy default.mtl %SRC_FONT3D%
copy ..\tex\common\wh8.png %SRC_FONT3D%

cd %SRC_FONT3D%
REM No conversion, just copy
REM for %%f in (*.obj) do %RESTORE_DIR%\obj2bin %%f %DEST_DIR%\obj\font3d\%%f
COPY *.obj  %DEST_DIR%\obj\font3d\
COPY *.mtl  %DEST_DIR%\obj\font3d\

REM del default.mtl
REM del wh8.png

cd %SRC_DIR%\obj\

REM No conversion, just copy
REM for %%f in (*.obj) do %RESTORE_DIR%\obj2bin %%f %DEST_DIR%\%%f
COPY *.obj %DEST_DIR%\
COPY *.mtl %DEST_DIR%\


cd %RESTORE_DIR%