# Python Portable Build

[![Travis](https://img.shields.io/travis/srault95/python-binary.svg)](https://github.com/srault95/python-binary)

**Construction de Python sans dépendances**

> Python 2.7.14 64bits est compilé sous **Centos 5** pour garantir une compatibilité avec la GLIBC 2.6.32 (Centos5+, RHEL5+, Ubuntu:14+, Debian:8+)

> Python 3.5.5 64bits est compilé sous **Centos 6** pour garantir une compatibilité avec la GLIBC 2.6.18 (Centos6+, RHEL6+, Ubuntu:14+, Debian:8+)


```
$ curl -L -O -k https://github.com/srault95/python-binary/releases/download/0.1.0/python3.5-x86-64.tar.gz

# Python sera disponible dans /usr/local/python3.5
$ tar -xzf python3.5-x86-64.tar.gz -C /

$ export LD_LIBRARY_PATH=/usr/local/python3.5/lib
$ /usr/local/python3.5/bin/python -V

# OR
$ LD_LIBRARY_PATH=/usr/local/python3.5/lib /usr/local/python3.5/bin/python -V

# OR Permanent link
$ echo "/usr/local/python3.5/lib" > /etc/ld.so.conf.d/python35.conf
$ ldconfig
```

> pip et virtualenv sont également disponibles dans /usr/local/python3.5/bin


## Utilisation - Python 2.7

```
$ curl -L -O -k https://github.com/srault95/python-binary/releases/download/0.1.0/python2.7-x86-64.tar.gz 

# Python sera disponible dans /usr/local/python2.7
$ tar -xzf python2.7-x86-64.tar.gz -C /

$ export LD_LIBRARY_PATH=/usr/local/python2.7/lib
$ /usr/local/python2.7/bin/python -V

# OR
$ LD_LIBRARY_PATH=/usr/local/python2.7/lib /usr/local/python2.7/bin/python -V

# OR Permanent link
$ echo "/usr/local/python2.7/lib" > /etc/ld.so.conf.d/python27.conf
$ ldconfig
```

> pip et virtualenv sont également disponibles dans /usr/local/python2.7/bin

## Paramètres de compilation utilisé pour Python 2.7.14

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

## TODO

- Script bash d'installation
- Tests multi plateforme dans travis
- Module python pour tester les dépendances (ssl, db, ...)
- Version Windows ?
