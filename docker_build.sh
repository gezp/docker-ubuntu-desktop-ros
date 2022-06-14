#!/bin/bash

# usage: ./docker_build.sh galactic

if [[ "$1" != *"-"* ]];then
    ./docker_build_ros.sh $1
elif [[ "$1" =~ "ignition" ]];then
    ./docker_build_ignition.sh $1
else
    echo "Invaild Tag: $1"
    exit -1
fi

exit 0