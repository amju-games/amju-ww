# Make binary versions of all .obj files

export RESTORE_DIR=`pwd`
export TOP_DIR=$RESTORE_DIR/../..
export DEST_DIR=$TOP_DIR/Build/CompiledAssets/Mac
export OBJ2BIN=$RESTORE_DIR/obj2bin
export SRC_DIR=$TOP_DIR/Assets

mkdir $DEST_DIR
mkdir $DEST_DIR/obj
mkdir $DEST_DIR/obj/font3d

cd $SRC_DIR

cd obj
cp default.mtl font3d
cp ../tex/common/wh8.png font3d

cd font3d
for f in *.obj
do
    echo "Found this file: " $f
    $OBJ2BIN $f $DEST_DIR/obj/font3d/$f
done

rm default.mtl
rm wh8.png

cd ..
cp ../tex/common/*.png . 

for f in *.obj
do
    echo "Found this file: " $f
    $OBJ2BIN $f $DEST_DIR/obj/$f
done

rm *.png

cd $RESTORE_DIR

