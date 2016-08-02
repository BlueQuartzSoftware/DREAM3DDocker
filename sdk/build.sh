#!/bin/sh

script_dir="`cd $(dirname $0); pwd`"

docker build -t dream3d/sdk-ubuntu-16.04 $script_dir
