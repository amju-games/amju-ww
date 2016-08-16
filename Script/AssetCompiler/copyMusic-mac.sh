# makemusicglue-mac.sh

export PLATFORM=Mac
export THIS_DIR=`pwd`
export TOP_DIR=$THIS_DIR/../..
export COMPILED_ASSETS=$TOP_DIR/Build/CompiledAssets
export DEST_DIR=$COMPILED_ASSETS/$PLATFORM
export SRC_DIR=$TOP_DIR/Assets
export GLUE_EXE=$THIS_DIR/glue
export GLUE_FILE=$DEST_DIR/../music-$PLATFORM.glue

mkdir $COMPILED_ASSETS
mkdir -p $DEST_DIR/sound

cp $SRC_DIR/sound/*.it $DEST_DIR/sound
cp $SRC_DIR/sound/windows/* $DEST_DIR/sound

cd $THIS_DIR



