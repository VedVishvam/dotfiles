#!/bin/bash

# Hyprcursor - A script to change the cursor theme in Hyprland

echo "================================"
echo "Cloning Hyprcursor repository..."
git clone https://github.com/hyprwm/hyprcursor
echo "================================"

echo "================================"
echo "Installing Dependencies..."
sudo apt-get update
deps=(libzip-dev libtomlplusplus-dev libcairo2-dev libcairo2 librsvg2-dev librsvg2-2)
for dep in "${deps[@]}"; do
	echo "================================"
	sudo apt-get install -y "$dep"
	echo "================================"
done
echo "================================"

echo "================================"
echo "Building Hyprcursor..."
cd hyprcursor
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
echo "================================"

echo "================================"
echo "Installing Hyprcursor..."
sudo cmake --install build
echo "================================"
