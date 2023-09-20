#!/usr/bin/env bash

set -x
export CMD_PATH=$PWD
export PROJECT_NAME="${CMD_PATH##*/}"
echo $PROJECT_NAME
cd $CMD_PATH

echo "============================================================================"
pwd

echo "============================================================================"
whoami

echo "============================================================================"
env

echo "============================================================================"
cd ~
rm -rf
git clone --depth=1 git@github.com:openos365/openos365-00002-ci-github-actions-template.git
rm -rf openos365-00002-ci-github-actions-template/.git/

rsync -avzP ~/openos365-00002-ci-github-actions-template/ $CMD_PATH/

echo "============================================================================"
