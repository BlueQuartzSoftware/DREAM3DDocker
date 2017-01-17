#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

current_date=`date +%Y-%m-%d`
git checkout -b update_DREAM3D_Ubuntu_16.04_$current_date

sha=`git ls-remote https://github.com/BlueQuartzSoftware/DREAM3D.git| grep HEAD | awk '{ print $1}'`
echo "New DREAM3D SHA: $sha"
sed -i "s/ENV DREAM3D_VERSION.*$/ENV DREAM3D_VERSION $sha/" Dockerfile

sha=`git ls-remote https://github.com/BlueQuartzSoftware/CMP.git| grep HEAD | awk '{ print $1}'`
echo "New CMP SHA: $sha"
sed -i "s/ENV CMP_VERSION.*$/ENV CMP_VERSION $sha/" Dockerfile

sha=`git ls-remote https://github.com/BlueQuartzSoftware/SIMPL.git| grep HEAD | awk '{ print $1}'`
echo "New SIMPL SHA: $sha"
sed -i "s/ENV SIMPL_VERSION.*$/ENV SIMPL_VERSION $sha/" Dockerfile

sha=`git ls-remote https://github.com/BlueQuartzSoftware/SIMPLView.git| grep HEAD | awk '{ print $1}'`
echo "New SIMPLView SHA: $sha"
sed -i "s/ENV SIMPLView_VERSION.*$/ENV SIMPLView_VERSION $sha/" Dockerfile

git commit Dockerfile -m "ENH: Update DREAM.3D repos to $current_date develop branch."
