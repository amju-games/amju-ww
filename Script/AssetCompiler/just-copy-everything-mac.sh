# just-copy-everything-mac.sh

export PLATFORM=Mac
export THIS_DIR=`pwd`
export TOP_DIR=$THIS_DIR/../..
export COMPILED_ASSETS=$TOP_DIR/Build/CompiledAssets/
export DEST_DIR=$COMPILED_ASSETS/$PLATFORM/

mkdir -p $COMPILED_ASSETS
mkdir -p $DEST_DIR

rm -rf $DEST_DIR/*

#. makeobjsbin-mac.sh
. copyObjs-mac.sh

#. makeglue-mac.sh
. copyGlue-mac.sh

#. makemusicglue-mac.sh
. copyMusic-mac.sh

