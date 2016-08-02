#!/bin/sh

script_dir="`cd $(dirname $0); pwd`"

docker build -t dream3d/dream3d-ubuntu-16.04 $script_dir
