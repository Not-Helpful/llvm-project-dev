rm -rf llvm-gold-build/
mkdir llvm-gold-build
cd llvm-gold-build
cmake -G Ninja ../llvm \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$HOME/llvm-rr \
      -DLLVM_ENABLE_PROJECTS="" \
      -DLLVM_TARGETS_TO_BUILD="X86" \
      -DBUILD_SHARED_LIBS=ON \
      -DLLVM_ENABLE_RTTI=ON

ninja
cd ..
