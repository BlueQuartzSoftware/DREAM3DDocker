#!/bin/sh

script_dir="`cd $(dirname $0); pwd`"

docker build -t dream3d/data $script_dir
