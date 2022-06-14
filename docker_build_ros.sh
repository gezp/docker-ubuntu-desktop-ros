#!/bin/bash

# usage: ./docker_build_ros.sh galactic

if [[("$1" == "galactic")]];then
    BASE_IMAGE=gezp/ubuntu-desktop:20.04
    ROS_DISTRO=galactic
elif [[("$1" == "humble")]];then
    BASE_IMAGE=gezp/ubuntu-desktop:22.04
    ROS_DISTRO=humble
elif [[("$1" == "rolling")]];then
    BASE_IMAGE=gezp/ubuntu-desktop:22.04
    ROS_DISTRO=rolling
else
    echo "Invaild Tag: $1"
    exit -1
fi

# pull base iamge
docker pull ${BASE_IMAGE}
if [[ $? != 0 ]]; then 
    echo "Failed to pull docker image '${BASE_IMAGE}'"
    exit -2
fi

# build ubuntu-desktop-ros image
DOCKER_TAG=${1}
docker build . --file Dockerfile.ros \
             --build-arg BASE_IMAGE=${BASE_IMAGE} \
             --build-arg ROS_DISTRO=${ROS_DISTRO} \
             --tag ubuntu-desktop-ros:${DOCKER_TAG}
if [[ $? != 0 ]]; then 
    echo "Failed to build docker image 'ubuntu-desktop-ros:${DOCKER_TAG}'"
    exit -3
fi

exit 0