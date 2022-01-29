#!/bin/sh

HEX2BIN=Hex2bin-1.0.9
HEX2BIN_TAR=$HEX2BIN.tar.bz2
HEX2BIN_URL=https://master.dl.sourceforge.net/project/hex2bin/hex2bin/$HEX2BIN_TAR
DOWNLOAD_DIR=downloads_$$

if [ -d $DOWNLOAD_DIR ]; then
    echo "Download directory '"$DOWNLOAD_DIR"' already exists!"
    exit 1
fi

echo Downloading $HEX2BIN_TAR to $DOWNLOAD_DIR directory
wget -P $DOWNLOAD_DIR $HEX2BIN_URL

if [ ! -f $DOWNLOAD_DIR/$HEX2BIN_TAR ]; then
    echo "Download failed!"
    rm -rf $DOWNLOAD_DIR
    exit 1
fi

echo "Unpack source code to target directory '"$HEX2BIN"'"
if [ -d $HEX2BIN ]; then
    echo "Target directory '"$HEX2BIN"' already exists!"
    rm -rf $DOWNLOAD_DIR
    exit 1
fi

echo Unpacking $HEX2BIN_TAR
tar xvf $DOWNLOAD_DIR/$HEX2BIN_TAR

echo Remove download directory $DOWNLOAD_DIR
rm -rf $DOWNLOAD_DIR

echo Build tools for current architecture
cd $HEX2BIN
make clean
make
cd ..

echo done.
echo
echo "NOTE: =====> Please copy $HEX2BIN/hex2bin to /usr/local/bin <===== !!!!!!"
echo
echo "Alternatively 'cd "$HEX2BIN"' and 'make install' as root"
echo
