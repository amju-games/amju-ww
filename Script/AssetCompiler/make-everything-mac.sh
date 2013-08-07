# make-everything-mac.sh

export PLATFORM=Mac
export THIS_DIR=`pwd`
export TOP_DIR=$THIS_DIR/../..
export COMPILED_ASSETS=$TOP_DIR/Build/CompiledAssets
export DEST_DIR=$COMPILED_ASSETS/$PLATFORM

mkdir $COMPILED_ASSETS
mkdir $DEST_DIR

rm -rf $DEST_DIR/*

. makeobjsbin.sh

. makeglue-mac.sh

. makemusicglue-mac.sh

