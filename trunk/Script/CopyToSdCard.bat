echo Copying game to SD Card...


rem TODO Compile assets
rem TODO Remove DLLs from assets dir!!!
rem TODO Update meta.xml with version


set SD_DIR="g:\apps"
set APP_NAME="amju_ww"


mkdir %SD_DIR%\%APP_NAME%
copy WiiProject\Build\boot.dol %SD_DIR%\%APP_NAME%
copy ..\Assets\wii\icon.png %SD_DIR%\%APP_NAME%
copy ..\Assets\wii\meta.xml %SD_DIR%\%APP_NAME%

mkdir %SD_DIR%\%APP_NAME%\data

rem Copy Asset dir tree
REM Compile assets and copy glue file
xcopy /Y /S ..\Assets\*.* %SD_DIR%\%APP_NAME%\data\

pause
