#!/bin/bash

# NOTE:
# Build Your Frontend Project Use Pnpm Command.
# Usage: bf <dir_name> <build_mode>
# dir_name: The Directory Name Where You Want To Move The Build File.
# build_mode: The Build Mode, Default Is Production Mode.

dir_name=$1
build_mode=$2

if [ -z "$dir_name" ]; then
    echo "please provide a directory name"
    exit 1
fi

echo "Building Project Start..."
pnpm i 
pnpm build $build_mode

if [ $? -eq 0 ]; then
    echo "Build  Successfully."
    #定义时间戳变量 
    timestamp=`date +%Y%m%d%H%M%S`
    zip -r dist-$timestamp.zip dist
    rm -rf dist
    mv dist-$timestamp.zip $dir_name
    echo "Move dist-$timestamp.zip to $dir_name successfully."
else
    echo "Build Failed."
fi



