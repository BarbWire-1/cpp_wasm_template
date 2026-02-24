#!/usr/bin/env bash
set -e

# Load EMSDK environment
source /opt/emsdk/emsdk_env.sh

# Unset macOS SDK variables that break Emscripten
unset SDKROOT
unset CPATH
unset C_INCLUDE_PATH
unset CPLUS_INCLUDE_PATH
unset LIBRARY_PATH

# Ensure build directory
mkdir -p ./build

# Compile C++ to WASM
em++ ./src/hello.cpp \
    -O3 \
    -s WASM=1 \
    -s MODULARIZE=1 \
    -s EXPORT_ES6=1 \
    -s EXPORTED_FUNCTIONS='["_say_hello"]' \
	-s EXPORTED_RUNTIME_METHODS='["UTF8ToString"]' \
    --sysroot=$EMSDK/upstream/emscripten/cache/sysroot \
    -o ./build/hello.js

echo "Build complete: ./build/hello.js and ./build/hello.wasm"

# Temporarily in this shell - optional
# export PATH=/opt/emsdk:/opt/emsdk/upstream/emscripten:$PATH
# hash -r  # Clear command hash so shell finds new em++
# which em++  # Should now point to /opt/emsdk/upstream/emscripten/em++
# em++ -v     # Should say "target: wasm32-unknown-emscripten"
# chmod +x build_wasm.sh - make executable

# BUILDCOMMAND
# ./build_wasm.sh