#!/bin/bash
set -eu

echo "Remember to update version in:"
echo "  vim NEWS README configure.ac doc/zsync.1 doc/zsyncmake.1"

if [ $(uname) = Darwin ]; then
    trg_ext='.darwin'
elif [ ! -f /etc/os-release ]; then
     echo "ERROR: Unsupported platform."
     exit 1
else
    source /etc/os-release
    trg_ext=".$ID"
fi

echo "Building $trg_ext..."

rm -f configure
./build.sh

echo "Publishing $trg_ext..."
for name in zsync zsyncmake; do
    if [ ! -x $name ]; then
        echo "ERROR: Missing artifact:" $name
        exit 1
    fi
    aws s3 cp $name s3://sfdc-ansible/common/zsync/$name$trg_ext
done
