# COPY GLUE

export PLATFORM=Mac
export THIS_DIR=`pwd`
export TOP_DIR=$THIS_DIR/../..
export COMPILED_ASSETS=$TOP_DIR/Build/CompiledAssets
export DEST_DIR=$COMPILED_ASSETS/$PLATFORM
export SRC_DIR=$TOP_DIR/Assets
export GLUE_EXE=$THIS_DIR/glue
export GLUE_FILE=$DEST_DIR/../data-$PLATFORM.glue
export SRC_FONT2D=$TOP_DIR/../amjulib/Assets/font2d

mkdir $COMPILED_ASSETS
mkdir $DEST_DIR
mkdir $DEST_DIR/font2d
mkdir $DEST_DIR/levels

cp $SRC_DIR/*.txt $DEST_DIR
cp $SRC_DIR/levels/*.txt $DEST_DIR/levels
cp $SRC_DIR/gui/common/*.txt $DEST_DIR
cp $SRC_DIR/gui/$PLATFORM/*.txt $DEST_DIR
cp $SRC_FONT2D/*.png $DEST_DIR/font2d
cp $SRC_FONT2D/*.txt $DEST_DIR/font2d
cp $SRC_DIR/tex/common/*.png $DEST_DIR
cp $SRC_DIR/tex/$PLATFORM/*.png $DEST_DIR
cp $SRC_DIR/md2/*.md2 $DEST_DIR
cp $DEST_DIR/obj/* $DEST_DIR


cd $THIS_DIR

