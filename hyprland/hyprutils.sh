#!/bin/bash
# HyprUtils Installation Script
#
# This script clones the HyprUtils repository, builds the project using CMake,
# and installs it on the system.

echo " ================================= "
echo 
echo "Cloning HyprUtils repository..."
git clone https://github.com/hyprwm/hyprutils.git
echo 
echo " ================================= "

echo " ================================= "
echo 
echo "Changing directory to hyprutils..."
cd hyprutils/
echo 
echo " ================================= "

echo " ================================= "
echo 
echo "Building HyprUtils..."
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
echo 
echo " ================================= "

echo " ================================= "
echo 
echo "Installing HyprUtils..."
sudo cmake --install build
echo 
echo " ================================= "
