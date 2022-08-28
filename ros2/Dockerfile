ARG BASE_IMAGE=gezp/ubuntu-desktop:20.04
From $BASE_IMAGE

ARG ROS_DISTRO=galactic

ENV ROS_DISTRO=$ROS_DISTRO

## Install ROS2
RUN apt-get update && \
    # add source
    curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null  && \
    apt-get update && \
    apt-get install -y ros-$ROS_DISTRO-desktop && \
    apt-get install -y python3-colcon-common-extensions python3-rosdep python3-vcstool && \
    rosdep init && \
    rosdep update && \
    rm -rf /var/lib/apt/lists/*

# overlay scripts
COPY startup.sh /docker_config/startup.sh
