# makemusicglue-ios.sh

export PLATFORM=iOS
export THIS_DIR=`pwd`
export TOP_DIR=$THIS_DIR/../..
export COMPILED_ASSETS=$TOP_DIR/Build/CompiledAssets
export DEST_DIR=$COMPILED_ASSETS/$PLATFORM
export SRC_DIR=$TOP_DIR/Assets
export GLUE_EXE=$THIS_DIR/glue
export GLUE_FILE=$DEST_DIR/../music-iphone.glue

mkdir $COMPILED_ASSETS
mkdir -p $DEST_DIR/sound

cp $SRC_DIR/sound/* $DEST_DIR/sound
cp $SRC_DIR/sound/windows/* $DEST_DIR/sound

cd $DEST_DIR

# Create empty glue file
$GLUE_EXE -c $GLUE_FILE

for f in sound/*.wav sound/*.mod
do
  echo "Adding file: " $f
  $GLUE_EXE -a $GLUE_FILE $f
done

# Verify glue file contents
$GLUE_EXE -d $GLUE_FILE
cd $THIS_DIR



