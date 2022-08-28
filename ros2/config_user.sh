#!/bin/bash

# update .bashrc
echo "export PATH=/usr/NX/scripts/vgl:\$PATH" >> ~/.bashrc
echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc

rosdep update
