VERSION=16-with-rtti
git switch release/16.x

rm -rf ./build/${VERSION}/

mkdir -p build
mkdir ./build/${VERSION}/

CXX=clang++ cmake -S ./llvm -B ./build/${VERSION}/ -G Ninja \
   -DCMAKE_INSTALL_PREFIX=$INSTALLS/llvm/${VERSION}\
   -DLLVM_ENABLE_PROJECTS="clang;lld;llvm" \
   -DLLVM_ENABLE_RUNTIMES="all" \
   -DCMAKE_BUILD_TYPE="RelWithDebInfo" \
   -DLLVM_ENABLE_RTTI=ON \
   -DCMAKE_CXX_FLAGS="-include cstdint -std=c++20" \
   -DLLVM_TARGETS_TO_BUILD=X86 

cd ./build/${VERSION}/
ninja
ninja install
cd ../../

echo "-I/home/helpful/.installs/llvm/${VERSION}/lib/clang/16
-I/home/helpful/.installs/llvm/${VERSION}/include/
-Wl,-rpath,/home/helpful/.installs/llvm/${VERSION}/lib
-Wl,-rpath,/home/helpful/.installs/llvm/${VERSION}/lib/x86_64-unknown-linux-gnu" \
   > $INSTALLS/llvm/${VERSION}/bin/clang++.cfg

echo "-I/home/helpful/.installs/llvm/${VERSION}/lib/clang/16
-I/home/helpful/.installs/llvm/${VERSION}/include/
-Wl,-rpath,/home/helpful/.installs/llvm/${VERSION}/lib
-Wl,-rpath,/home/helpful/.installs/llvm/${VERSION}/lib/x86_64-unknown-linux-gnu" \
   > $INSTALLS/llvm/${VERSION}/bin/clang.cfg


git switch main
