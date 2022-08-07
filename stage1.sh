#!/bin/sh

set -x
set -o pipefail

mkdir ${TOPLEV}/stage1

#cd ${TOPLEV}/stage1
#cmake -G Ninja ${TOPLEV}/llvm-project/llvm -DLLVM_TARGETS_TO_BUILD=X86 \
#      -DCMAKE_BUILD_TYPE=Release \
#      -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCMAKE_ASM_COMPILER=gcc \
#      -DLLVM_ENABLE_PROJECTS="clang;lld;compiler-rt" \
#      -DCOMPILER_RT_BUILD_SANITIZERS=OFF -DCOMPILER_RT_BUILD_XRAY=OFF \
#      -DCOMPILER_RT_BUILD_LIBFUZZER=OFF \
#      -DCMAKE_INSTALL_PREFIX=${TOPLEV}/stage1/install
#ninja install
