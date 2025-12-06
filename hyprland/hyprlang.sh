#!/bin/bash

# HyprLang Installation Script

echo " ================================= "
echo
printf "Cloning HyprLang repository...\n"
git clone https://github.com/hyprwm/hyprlang.git
echo 
echo " ================================= "

echo " ================================= "
echo
printf "Changing directory to hyprlang...\n"
cd hyprlang/
echo 
echo " ================================= "

echo " ================================= "
echo
printf "Building HyprLang...\n"
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target hyprlang -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
echo 
echo " ================================= "

echo " ================================= "
echo
printf "Installing HyprLang...\n"
sudo cmake --install ./build
echo
echo " ================================= "

