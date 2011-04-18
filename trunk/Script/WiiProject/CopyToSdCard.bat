echo Copying game to SD Card...


rem TODO Compile assets
rem TODO Update meta.xml with version


set SD_DIR="g:\apps"
set APP_NAME="amju_ww"


mkdir %SD_DIR%\%APP_NAME%
copy ..\..\Build\Wii\boot.dol %SD_DIR%\%APP_NAME%
copy ..\..\Assets\wii\icon.png %SD_DIR%\%APP_NAME%
copy ..\..\Assets\wii\meta.xml %SD_DIR%\%APP_NAME%

mkdir %SD_DIR%\%APP_NAME%\data

REM Compile assets and copy glue file

REM TODO Build wii-specific glue files

xcopy /Y ..\..\Build\CompiledAssets\data-wii.glue %SD_DIR%\%APP_NAME%\data\data-wii.glue
xcopy /Y ..\..\Build\CompiledAssets\music-wii.glue %SD_DIR%\%APP_NAME%\data\music-wii.glue


dir %SD_DIR%\%APP_NAME%
dir %SD_DIR%\%APP_NAME%\data


pause
