#!/bin/sh
# for ros
cp -r /root/.ros /home/$USER/.ros
chown -R $UID:$GID /home/$USER/.ros
echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> /home/$USER/.bashrc
exit 0
