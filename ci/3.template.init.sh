#!/usr/bin/env bash

set -x
export CMD_PATH=$(cd `dirname $0`; pwd)
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
# TODO HERE
cp -f ./1.ci.shell.runner.sh.template ./1.ci.shell.runner.sh
cp -f ./2.ci.docker.runner.sh.template ./2.ci.docker.runner.sh
chmod +x *.template
chmod +x *.sh

echo "============================================================================"
