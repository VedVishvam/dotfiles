#!/bin/bash

# Hyprgraphics Installation Script


# Installl the dependencies
dependencies=(
    libpixman-1-dev
    libpixman-1-0
    libjpeg-dev
    libwebp-dev
    libmagic1
    libmagic-dev
    libpng-dev
    libturbojpeg0-dev
    librsvg2-2
    librsvg2-dev
    build-essential
    git
    cmake
    ninja-build
    pkg-config
)


for dep in "${dependencies[@]}"; do
	echo " ================================= "
	echo "Installing dependency: $dep"
	sudo apt-get install -y "$dep"
	echo " ================================= "
done

echo " ================================= "
echo "Cloning Hyprgraphics repository..."
echo " ================================= "
git clone https://github.com/hyprwm/hyprgraphics

echo " ================================= "
echo "Changing directory to hyprgraphics..."
echo " ================================= "
cd hyprgraphics/

echo " ================================= "
echo "Building Hyprgraphics..."
echo " ================================= "
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`

echo " ================================= "
echo "Installing Hyprgraphics..."
echo " ================================= "
sudo cmake --install build
