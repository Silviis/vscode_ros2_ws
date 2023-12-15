#!/bin/bash
set -e

vcs import < src/ros2.repos src
sudo apt-get update
rosdep update
rosdep install --from-paths src --ignore-src -r -y
cd src/ros2-vicon-receiver/ && ./install_libs.sh && cd -