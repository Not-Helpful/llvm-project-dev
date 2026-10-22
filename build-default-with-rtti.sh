VERSION=default-with-rtti

rm -rf ./build/${VERSION}
mkdir -p build
mkdir ./build/${VERSION}/

CXX=clang++ CC=clang cmake -S ./llvm -B ./build/${VERSION}/ -G Ninja \
            -DCMAKE_INSTALL_PREFIX=$INSTALLS/llvm/${VERSION} \
            -DLLVM_ENABLE_PROJECTS="clang;llvm;" \
            -DLLVM_ENABLE_RUNTIMES="all" \
            -DCMAKE_BUILD_TYPE="RelWithDebInfo" \
            -DBUILD_SHARED_LIBS=ON \
            -DLLVM_ENABLE_RTTI=ON \
            -DLLVM_ENABLE_PLUGINS=ON \
            -DLLVM_TARGETS_TO_BUILD=X86 

cd ./build/${VERSION}
ninja
ninja install
cd ../../

