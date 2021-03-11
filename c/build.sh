#!/bin/sh
set -eux
export CFLAGS="-std=c99"
[ -x ./configure ] || autoreconf --install
./configure
make
make install || sudo make install
