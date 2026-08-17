
git switch release/16.x

rm -rf ./build/16/

mkdir build
mkdir ./build/16/

CXX=clang++ cmake -S ./llvm -B ./build/16/ -G Ninja \
   -DCMAKE_INSTALL_PREFIX=$INSTALLS/llvm/16 \
   -DLLVM_ENABLE_PROJECTS="clang;lld;llvm" \
   -DLLVM_ENABLE_RUNTIMES="all" \
   -DCMAKE_BUILD_TYPE="RelWithDebInfo" \
   -DCMAKE_CXX_FLAGS="-include cstdint" \
   -DLLVM_TARGETS_TO_BUILD=X86 

cd ./build/16
ninja
ninja install
cd ../../

echo "-I/home/helpful/.installs/llvm/16/lib/clang/16
-I/home/helpful/.installs/llvm/16/include/
-Wl,-rpath,/home/helpful/.installs/llvm/16/lib
-Wl,-rpath,/home/helpful/.installs/llvm/16/lib/x86_64-unknown-linux-gnu" \
   > $INSTALLS/llvm/16/bin/clang++.cfg

echo "-I/home/helpful/.installs/llvm/16/lib/clang/16
-I/home/helpful/.installs/llvm/16/include/
-Wl,-rpath,/home/helpful/.installs/llvm/16/lib
-Wl,-rpath,/home/helpful/.installs/llvm/16/lib/x86_64-unknown-linux-gnu" \
   > $INSTALLS/llvm/16/bin/clang.cfg


git switch main
