#!/bin/sh

script_dir="`cd $(dirname $0); pwd`"

docker build -t dream3d/sdk $script_dir
