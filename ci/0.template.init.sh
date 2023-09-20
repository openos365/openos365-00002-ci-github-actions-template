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
if [ "$1" == "1" ];then
	cp -f ./1.ci.shell.runner.sh.template ./1.ci.shell.runner.sh
fi

if [ "$1" == "2" ];then
	cp -f ./2.ci.docker.run.runner.sh.template ./2.ci.docker.run.runner.sh
fi

if [ "$1" == "3" ];then
	cp -f ./3.ci.docker.build.runner.sh.template ./3.ci.docker.build.runner.sh
fi



chmod +x *.template
chmod +x *.sh

echo "============================================================================"
