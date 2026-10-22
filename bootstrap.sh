VERSION=bootstrap

rm -rf ./build/${VERSION}
mkdir -p build
mkdir ./build/${VERSION}/

CXX=g++ CC=gcc cmake -S ./llvm -B ./build/${VERSION}/ -G Ninja \
            -DCMAKE_INSTALL_PREFIX=$INSTALLS/llvm/${VERSION} \
            -DLLVM_ENABLE_PROJECTS="clang;llvm" \
            -DCMAKE_BUILD_TYPE="Release" \
            -DBUILD_SHARED_LIBS=ON \
            -DLLVM_ENABLE_PLUGINS=ON 

cd ./build/${VERSION}
ninja
ninja install
cd ../../

