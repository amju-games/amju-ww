# Make release of Amju Rainbow Drop for Wii

export PLAT=wii
export VERSION=`../MakeVersionString.pl ../../Source/Version.h`
export DEST_DIR=../../Releases/amju_rd-$VERSION-$PLAT
echo MAKING RELEASE FOR $DEST_DIR

# Create release dir 
mkdir -p $DEST_DIR
rm $DEST_DIR/*

# Build (release mode)
#export EXTRA_CFLAGS='-g -O2 -DNDEBUG'
#make clean
make

cd ../AssetCompiler
# ./make-everything-wii.sh
cd ../WiiProject

cp ../../Build/Wii/boot.dol $DEST_DIR
cp ../../Assets/wii/icon.png $DEST_DIR
cp ../../Assets/wii/meta.xml $DEST_DIR

mkdir -p $DEST_DIR/data
rm $DEST_DIR/data/*

cp ../../Build/CompiledAssets/data-wii.glue $DEST_DIR/data/
cp ../../Build/CompiledAssets/music-wii.glue $DEST_DIR/data/

ls -l $DEST_DIR 
ls -l $DEST_DIR/data





