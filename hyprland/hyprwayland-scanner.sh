#!/bin/bash

# HyprWayland Scanner Installation Script

echo " ==================================== "
echo 
echo "Cloning HyprWayland Scanner repository..."
git clone https://github.com/hyprwm/hyprwayland-scanner.git
echo "Changing directory to hyprwayland-scanner..."
cd hyprwayland-scanner
echo
echo " ==================================== "

echo " ==================================== "
echo 
echo "Installing dependencies..."
sudo apt install libpugixml-dev
echo
echo " ==================================== "


echo " ==================================== "
echo 
echo "Building HyprWayland Scanner..."
cmake -DCMAKE_INSTALL_PREFIX=/usr -B build
cmake --build build -j `nproc`
echo
echo " ==================================== "


echo " ==================================== "
echo 
echo "Installing HyprWayland Scanner..."
sudo cmake --install build
echo 
echo " ==================================== "
