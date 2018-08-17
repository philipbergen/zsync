#!/bin/bash
set -uex
here="$(cd $(dirname $(readlink ${BASH_SOURCE[0]} || echo ${BASH_SOURCE[0]})); pwd -P)"
cd $here
echo "Running NGINX in $PWD"
mkdir -p logs
mkdir -p html
nginx -p $PWD -c nginx.conf -g 'daemon off;'
