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
if [ ! -z $${GITHUB_REPOSITORY} ];then
    # 1 
    git config --global user.email "gnuhub@gmail.com"
    git config --global user.name "gnuhub"

    # 2
    git remote -v
    git remote set-url origin git@github.com:${GITHUB_REPOSITORY}.git
    git remote -v

    # 3
    ssh-keygen -f "$HOME/.ssh/known_hosts" -R "frs.sourceforge.net"
    ssh-keyscan "frs.sourceforge.net" >> $HOME/.ssh/known_hosts
    ssh-keygen -f "$HOME/.ssh/known_hosts" -R "github.com"
    ssh-keyscan "github.com" >> $HOME/.ssh/known_hosts
    cat $HOME/.ssh/known_hosts

    # 4
    ./6.template.update.sh

    # 5
    cd $CMD_PATH
    git add .
    git commit -a -m "CI-BOT:$(date +%Y.%m.%d-%H%M%S)-$GITHUB_REF_NAME-$GITHUB_RUN_NUMBER"
    git push origin HEAD

    # 6
    cd $CMD_PATH
    for ci_dir in `ls -d -1 ci/1*`
    do
        echo $ci_dir
        if [ -f $ci_dir/1.ci.run.sh ];then
            ./${ci_dir}/1.ci.run.sh
        fi
    done

    # 7
    cd $CMD_PATH

    # sudo apt update -y
    # sudo apt upgrade -y
    apt list > 4.apt.list.txt
    apt list --installed > 5.apt.list.installed.txt

    git add .
    git commit -a -m "CI-BOT:$(date +%Y.%m.%d-%H%M%S)-$GITHUB_REF_NAME-$GITHUB_RUN_NUMBER"
    git push origin HEAD
fi
echo "============================================================================"
