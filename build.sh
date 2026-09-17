use.hs llvm full_build
VERSION=24
BUILD=./build/${VERSION}

if [ ! -f "$BUILD/build.ninja" ]; then
    cmake -S ./llvm -B "$BUILD" -G Ninja \
          -DCMAKE_INSTALL_PREFIX="$INSTALLS/llvm/${VERSION}" \
          -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
          -DLLVM_ENABLE_PROJECTS="clang" \
          -DCMAKE_BUILD_TYPE="RelWithDebInfo" \
          -DBUILD_SHARED_LIBS=ON \
          -DLLVM_ENABLE_PLUGINS=ON \
          -DLLVM_TARGETS_TO_BUILD=X86
fi

ninja -C "$BUILD" clang
ninja -C "$BUILD" install

use.hs llvm 24 
