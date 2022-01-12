#!/bin/bash

set -xe

# Define variables

DAY=`date +%u`
ARCHIVE=cointelegraph-$DAY.sql.gz
DUMP=cointelegraph-$DAY.sql

repositories=(
    # needs duke and node-graph added
    git@github.com:smart-kids/graph.git
    git@github.com:smart-kids/admin.git
    git@github.com:smart-kids/parent-and-bus-agent-app.git
)

clone_repositories () {
    echo "Cloning necessary repositories..."

    mkdir -p ../code
    for i in "${repositories[@]}"
    do
        if [ ! -d "../code/$i" ] ; then
            pwd
            git clone "$i" "../code/$i"
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
