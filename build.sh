VERSION=USR-patch
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

echo "-I/home/helpful/.installs/llvm/${VERSION}/lib/clang/23
-I/home/helpful/.installs/llvm/${VERSION}/include/
-Wl,-rpath,/home/helpful/.installs/llvm/${VERSION}/lib
-Wl,-rpath,/home/helpful/.installs/llvm/${VERSION}/lib/x86_64-unknown-linux-gnu" \
     > $INSTALLS/llvm/${VERSION}/bin/clang++.cfg

echo "-I/home/helpful/.installs/llvm/${VERSION}/lib/clang/23
-I/home/helpful/.installs/llvm/${VERSION}/include/
-Wl,-rpath,/home/helpful/.installs/llvm/${VERSION}/lib
-Wl,-rpath,/home/helpful/.installs/llvm/${VERSION}/lib/x86_64-unknown-linux-gnu" \
     > $INSTALLS/llvm/${VERSION}/bin/clang.cfg
