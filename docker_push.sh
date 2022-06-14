#!/bin/bash

# usage: ./docker_push.sh galactic

DOCKER_TAG=$1

# push to docker hub
docker tag ubuntu-desktop-ros:${DOCKER_TAG} gezp/ubuntu-desktop-ros:${DOCKER_TAG}
docker push gezp/ubuntu-desktop-ros:${DOCKER_TAG}
# push to aliyun
docker tag ubuntu-desktop-ros:${DOCKER_TAG} registry.cn-shenzhen.aliyuncs.com/gezp/ubuntu-desktop-ros:${DOCKER_TAG}
docker push registry.cn-shenzhen.aliyuncs.com/gezp/ubuntu-desktop-ros:${DOCKER_TAG}

exit 0

