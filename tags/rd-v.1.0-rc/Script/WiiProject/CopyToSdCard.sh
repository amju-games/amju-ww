echo "Copying to SD card...."

# NB Need double quotes around name, then double quotes *again* when we use $SD_DIR!!
# http://hintsforums.macworld.com/archive/index.php/t-45007.html

export SD_DIR="/Volumes/NO NAME/apps"
export APP_NAME='amju_ww'
export FULL="$SD_DIR"/$APP_NAME

echo "$FULL"

mkdir -p "$FULL"

cp ../../Build/Wii/boot.dol "$FULL"
cp ../../Assets/wii/icon.png "$FULL"
cp ../../Assets/wii/meta.xml "$FULL"

mkdir -p "$FULL"/data

cp ../../Build/CompiledAssets/data-wii.glue "$FULL"/data/
cp ../../Build/CompiledAssets/music-wii.glue "$FULL"/data/

ls -l "$FULL"
ls -l "$FULL"/data

