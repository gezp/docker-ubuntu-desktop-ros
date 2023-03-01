#!/bin/bash

# usage: ./docker_build_gazebo.sh humble-gazebo-fortress

if [[("$1" == "humble-gazebo-fortress")]];then
    ROS_DISTRO=humble
    GZ_VERSION=fortress
elif [[("$1" == "humble-gazebo-garden")]];then
    ROS_DISTRO=humble
    GZ_VERSION=garden
else
    echo "Invaild Tag: $1"
    exit -1
fi

# build ubuntu-desktop-ros image
DOCKER_TAG=${1}
docker build . --file Dockerfile \
             --build-arg ROS_DISTRO=${ROS_DISTRO} \
             --build-arg GZ_VERSION=${GZ_VERSION} \
             --tag ubuntu-desktop-ros:${DOCKER_TAG}
if [[ $? != 0 ]]; then 
    echo "Failed to build docker image 'ubuntu-desktop-ros:${DOCKER_TAG}'"
    exit -3
fi

exit 0