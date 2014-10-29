#!/bin/sh

#make distclean
WDIR=`pwd`
mkdir -p autobuildlogs
find * -iname "defconfig" -exec $WDIR/config_and_build.sh {} \;