#!/bin/bash

set -xe

# Define variables

DAY=`date +%u`
ARCHIVE=cointelegraph-$DAY.sql.gz
DUMP=cointelegraph-$DAY.sql
SRC_DIR='./'

repositories=(
    git@github.com:smart-kids/graph.git
    git@github.com:smart-kids/admin.git
    # git@github.com:smart-kids/parent-and-bus-agent-app.git
)

clone_repositories () {
    echo "Cloning necessary repositories..."

    mkdir -p ../code
    cd ../code
    for i in "${repositories[@]}"
    do
        if [ ! -d "$i" ] ; then
            git clone "$i"
        fi
        
    done

    cd ../local-setup
}

build_and_run () {
   ls
   docker-compose up
}

# Clone all the repos to "../code/"
clone_repositories

# Build docker images and run containers
build_and_run
