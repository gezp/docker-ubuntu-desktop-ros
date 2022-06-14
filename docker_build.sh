#!/bin/bash

# usage: ./docker_build.sh galactic
if [[ "$1" != *"-"* ]];then
    ./docker_build_ros.sh $1
else
    ./docker_build_gazebo.sh $1
fi

exit 0