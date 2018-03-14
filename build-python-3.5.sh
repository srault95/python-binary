#!/usr/bin/env bash

set -xe

TARGET=/usr/local/python3.5
TARGET_ARCHIVE_DIR=/app/build
TARGET_ARCHIVE_PATH=${TARGET_ARCHIVE_DIR}/python3.5-x86-64.tar.gz

yum groupinstall -y "Development tools"

yum install -y wget zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel expat-devel

cd /tmp
wget --no-check-certificate https://www.openssl.org/source/openssl-1.0.2n.tar.gz
tar -xzf openssl-*.tar.gz
cd openssl-*
./config --prefix=/usr/local/openssl shared && make && make install

mkdir -vp ${TARGET}

cd /tmp
wget --no-check-certificate https://www.python.org/ftp/python/3.5.5/Python-3.5.5.tgz
tar -xzf Python-*.tgz
cd Python-*
./configure --prefix=${TARGET} --with-thread --enable-unicode=ucs4 --enable-shared --enable-ipv6 --with-system-expat --with-system-ffi --with-signal-module
echo "SSL=/usr/local/openssl" > Modules/Setup.local
make && make install

rm -rf ${TARGET}/lib/python3.5/test

cd ${TARGET}/lib

cp -av /usr/local/openssl/lib/*so* .
cp -av /usr/local/openssl/lib/engines .
ln -vsf libcrypto.so.1.0.0 libcrypto.so.6
ln -vsf libssl.so.1.0.0 libssl.so.6

cp -av /lib64/libdb-4.7.so .
ln -vsf libdb-4.7.so libdb.so
cp -av /lib64/libreadline.so.6* .
cp -av /lib64/libbz2.so* .
cp -av /lib64/libcrypt-2.12.so /lib64/libcrypt.so.1 .
cp -av /usr/lib64/libgdbm.so* .
cp -av /usr/lib64/libsqlite3.so* .
cp -av /lib64/libz.so* .
cp -av /lib64/libncursesw.so* .

find * -maxdepth 0 -name "*.so" -exec strip {} \;

#wget https://bootstrap.pypa.io/get-pip.py

cd ${TARGET}/bin
ln -svf python3 python

LD_LIBRARY_PATH=${TARGET}/lib ${TARGET}/bin/python /app/get-pip.py

ln -svf pip3 pip

LD_LIBRARY_PATH=${TARGET}/lib ${TARGET}/bin/pip install virtualenv

mkdir -vp ${TARGET_ARCHIVE_DIR}

rm -vf ${TARGET_ARCHIVE_PATH}

tar -czf ${TARGET_ARCHIVE_PATH} ${TARGET}

