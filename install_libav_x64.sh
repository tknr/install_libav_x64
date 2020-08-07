#!/bin/bash -x
if [ $(whoami) != "root" ]; then
        echo "This script must be run as root"
        exit 1
fi

cd `dirname $0`

curl https://johnvansickle.com/libav/builds/libav-git-64bit-static.tar.xz -O || exit 1
tar xvf libav-git-64bit-static.tar.xz || exit 1
rm libav-git-64bit-static.tar.xz
mv libavf-* libav-git || exit 1
cp -f libav-git/av* /usr/local/bin/ || exit 1
chmod 755 /usr/local/bin/av* || exit 1
cp -f libav-git/qt-faststart /usr/local/bin/ || exit 1
chmod 755 /usr/local/bin/qt-faststart || exit 1
mkdir -p /usr/local/share/libav || exit 1
cp -Rf libav-git/manpages /usr/local/share/libav/ || exit 1
chmod -R 755 /usr/local/share/libav || exit 1
rm -Rf libav-git


