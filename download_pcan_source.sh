#!/bin/sh

DEV_PACK=PEAK-DevPack.zip
DPHW_PATH=PEAK-DevPack/Hardware
DEV_PACK_URL=https://www.peak-system.com/fileadmin/media/files/$DEV_PACK
DOWNLOAD_DIR=downloads_$$
HW_DIR=hw

if [ -d $DOWNLOAD_DIR ]; then
    echo "Download directory '"$DOWNLOAD_DIR"' already exists!"
    exit 1
fi

echo Downloading latest $DEV_PACK to $DOWNLOAD_DIR directory
wget -P $DOWNLOAD_DIR $DEV_PACK_URL

if [ ! -f $DOWNLOAD_DIR/$DEV_PACK ]; then
    echo "Download failed!"
    rm -rf $DOWNLOAD_DIR
    exit 1
fi

echo "Unpack PCAN Router source code to target directory '"$HW_DIR"'"
if [ -d $HW_DIR ]; then
    echo "Target directory '"$HW_DIR"' already exists!"
    rm -rf $DOWNLOAD_DIR
    exit 1
fi

mkdir $HW_DIR

echo Unzipping $DEV_PACK
unzip -d $HW_DIR $DOWNLOAD_DIR/$DEV_PACK $DPHW_PATH/*

echo Remove download directory $DOWNLOAD_DIR
rm -rf $DOWNLOAD_DIR

echo Remove PEAK-DevPack/Hardware path segment
cd $HW_DIR
mv $DPHW_PATH/* .
rmdir -p $DPHW_PATH
cd ..

echo done.
