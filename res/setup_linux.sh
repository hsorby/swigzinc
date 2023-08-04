#!/bin/bash

yum install -y freetype-devel.x86_64 mesa-libGLU-devel.x86_64 libxml2-devel.x86_64

python3.10 -m venv venv

source venv/bin/activate

pip install ninja

cmake -G Ninja -S res -B build-nonpython
cmake --build build-nonpython

cd build-nonpython/ZincLibrary/src/build_zinc-build
cmake . > zinc_config.out

export ZINC_VERSION_TAG=`python3.10 res/scrape_zinc_version.py zinc_config.out`
echo "Exporting Zinc version tag as $ZINC_VERSION_TAG." 
