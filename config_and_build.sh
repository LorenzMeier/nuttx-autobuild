#!/bin/sh

BUILD_FAILED=false

#git clean -d -f -x
cd tools
CONFIG=`echo $1 | cut -d"/" -f2- | cut -d"/" -f-2`
echo BUILDING: $CONFIG
./configure.sh $CONFIG
$CONFIGFILE=.config
cd ..
CONFIGLOG=autobuildlogs/`echo $CONFIG | tr / _`.log

# Disable codesourcery build config
sed -i '/.*CODESOURCERY.*/c\' $CONFIGFILE

make &> $CONFIGLOG
echo $CONFIGLOG
if [ $? -gt 0 ]; then
	#FAILMSG=FAILED:`tail -6 $CONFIGLOG`
	#echo $FAILMSG
        BUILD_FAILED=true
fi

echo $BUILD_FAILED