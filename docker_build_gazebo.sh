#!/bin/bash

# usage: ./docker_build_gazebo.sh galactic-edifice

if [[("$1" == "galactic-edifice")]];then
    ROS_DISTRO=galactic
    GAZEBO_VERSION=edifice
elif [[("$1" == "humble-fortress")]];then
    ROS_DISTRO=humble
    GAZEBO_VERSION=fortress
else
    echo "Invaild Tag: $1"
    exit -1
fi

# build ubuntu-desktop-ros image
DOCKER_TAG=${1}
docker build . --file Dockerfile.gazebo \
             --build-arg ROS_DISTRO=${ROS_DISTRO} \
             --build-arg GAZEBO_VERSION=${GAZEBO_VERSION} \
             --tag ubuntu-desktop-ros:${DOCKER_TAG}
if [[ $? != 0 ]]; then 
    echo "Failed to build docker image 'ubuntu-desktop-ros:${DOCKER_TAG}'"
    exit -3
fi

exit 0