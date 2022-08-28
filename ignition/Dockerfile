ARG ROS_DISTRO=galactic
From gezp/ubuntu-desktop-ros:$ROS_DISTRO

ARG ROS_DISTRO=galactic
ARG IGNITION_VERSION=edifice

## Install Gazebo
RUN apt-get update  && \
    wget https://packages.osrfoundation.org/gazebo.gpg -O /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null && \
    apt-get update && \
    apt-get install -y ignition-$IGNITION_VERSION ros-$ROS_DISTRO-ros-ign && \
    rm -rf /var/lib/apt/lists/* 
