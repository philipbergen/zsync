#!/bin/sh
set -eux
[ -x ./configure ] || autoreconf --install
./configure
make 
make install
