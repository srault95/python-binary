# Python Portable Build

[![Travis](https://img.shields.io/travis/srault95/python-binary.svg)](https://github.com/srault95/python-binary)

**Construction d'un Python 2.7 sans dépendances**

> Python 2.7.14 64bits est compilé sous **Centos 5** pour garantir une compatiblité avec la GLIBC 2.6.32 (Centos5+, RHEL5+, Ubuntu:14+, Debian:8+)

## Utilisation

```
$ curl -L -O -k https://github.com/srault95/python-binary/releases/download/0.1.0/python2.7-x86-64.tar.gz 

# Python sera disponible dans /usr/local/python2.7
$ tar -xzf python2.7-x86-64.tar.gz -C /

$ export LD_LIBRARY_PATH=/usr/local/python2.7/lib
$ /usr/local/python2.7/bin/python -V
```

> pip et virtualenv sont également disponibles dans /usr/local/python2.7/bin

## Paramètres de compilation de Python 2.7.14

> Le python est compilé avec un OpenSSL 1.0.2n.

> Les dépendances sont copiés dans /usr/local/python2.7/lib

```
./configure \
  --prefix=/usr/local/python2.7 \
  --with-thread \
  --enable-unicode=ucs4 \
  --enable-shared \
  --enable-ipv6 \
  --with-system-expat \
  --with-system-ffi \
  --with-signal-module

echo "SSL=/usr/local/openssl" > Modules/Setup.local

make && make install
```
