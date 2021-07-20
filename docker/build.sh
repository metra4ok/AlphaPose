#!/bin/bash

orange=`tput setaf 3`
reset_color=`tput sgr0`

if command -v nvidia-smi &> /dev/null
then
    echo "Building for ${orange}nvidia cuda${reset_color} hardware"
    DOCKERFILE=docker/Dockerfile.cuda
else
    # echo "Building for ${orange}intel${reset_color} hardware: nvidia driver not found"
    # DOCKERFILE=docker/Dockerfile.intel
    echo "Build for ${orange}cpu${reset_color} not implemented yet :("
    exit 0
fi

docker build . \
    -f $DOCKERFILE \
    -t alphapose:latest
