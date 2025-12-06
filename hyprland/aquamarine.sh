#!/bin/bash

# Aquamarine

echo "================================"
echo "Cloning Aquamarine repository..."
git clone https://github.com/hyprwm/aquamarine.git
echo "================================"

echo "================================"
echo "Installing dependencies..."
sudo apt update
dependencies=(
    libseat-dev
    libinput-dev
    libgbm-dev
    libudev-dev
    libdisplay-info-dev
    hwdata
)
for package in "${dependencies[@]}"; do
	echo "Installing $package..."
	sudo apt install -y "$package"
done
echo "================================"

echo "================================"
echo "Building Aquamarine..."
cd aquamarine
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
echo "================================"

echo "================================"
echo "Installing Aquamarine..."
sudo cmake --install build
echo "================================"
