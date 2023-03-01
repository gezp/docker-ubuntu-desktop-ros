ARG ROS_DISTRO=humble
From gezp/ubuntu-desktop-ros:$ROS_DISTRO

ARG ROS_DISTRO=humble
ARG GZ_VERSION=fortress

## Install Gazebo
RUN apt-get update  && \
    wget https://packages.osrfoundation.org/gazebo.gpg -O /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null && \
    apt-get update && \
    apt-get install -y gz-$GZ_VERSION ros-$ROS_DISTRO-ros-gz && \
    rm -rf /var/lib/apt/lists/* 
