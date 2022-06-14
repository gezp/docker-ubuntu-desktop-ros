#!/bin/bash

# usage: ./docker_build_gazebo.sh galactic-ignition-edifice

if [[("$1" == "galactic-ignition-edifice")]];then
    ROS_DISTRO=galactic
    IGNITION_VERSION=edifice
elif [[("$1" == "humble-ignition-fortress")]];then
    ROS_DISTRO=humble
    IGNITION_VERSION=fortress
else
    echo "Invaild Tag: $1"
    exit -1
fi

# build ubuntu-desktop-ros image
DOCKER_TAG=${1}
docker build . --file Dockerfile.iginition \
             --build-arg ROS_DISTRO=${ROS_DISTRO} \
             --build-arg IGNITION_VERSION=${IGNITION_VERSION} \
             --tag ubuntu-desktop-ros:${DOCKER_TAG}
if [[ $? != 0 ]]; then 
    echo "Failed to build docker image 'ubuntu-desktop-ros:${DOCKER_TAG}'"
    exit -3
fi

exit 0