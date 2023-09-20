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

git clone https://ghproxy.com/github.com/openos365/openos365-00002-ci-github-actions-template.git
cd openos365-00002-ci-github-actions-template
git pull origin main

rsync -avzP --exclude=".git" ~/openos365-00002-ci-github-actions-template/ $CMD_PATH/

echo "============================================================================"
