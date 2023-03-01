#!/bin/bash

# usage: ./docker_build.sh galactic

if [[ "$1" != *"-"* ]];then
    cd ros2 && ./docker_build.sh $1 && cd ..
elif [[ "$1" =~ "ignition" ]];then
    cd ignition && ./docker_build.sh $1 && cd ..
elif [[ "$1" =~ "gazebo" ]];then
    cd gazebo && ./docker_build.sh $1 && cd ..
else
    echo "Invaild Tag: $1"
    exit -1
fi

exit $?