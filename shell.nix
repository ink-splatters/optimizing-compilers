# shell.nix
# https://nixos.wiki/wiki/LLVM
# https://github.com/facebookincubator/BOLT/blob/main/bolt/docs/OptimizingClang.md

with import <nixpkgs> { };
let
  gccForLibs = stdenv.cc.cc;
in
pkgs.mkShell {
  name = "llvm-env";

  buildInputs = with pkgs ; [
    bashInteractive
    llvmPackages_14.llvm
    cmake
    ninja
    nixpkgs-fmt
  ];


  NIX_LDFLAGS = "-L${gccForLibs}/lib/gcc/${targetPlatform.config}/${gccForLibs.version}";

  CFLAGS = "-B${gccForLibs}/lib/gcc/${targetPlatform.config}/${gccForLibs.version} -B ${stdenv.cc.libc}/lib";
  cmakeFlags = [
    "-DGCC_INSTALL_PREFIX=${gcc}"
    "-DC_INCLUDE_DIRS=${stdenv.cc.libc}/include"
    "-GNinja"
    "-DCMAKE_BUILD_TYPE=Release"
    "-DLLVM_ENABLE_PROJECTS=clang;libcxx;libcxxabi"
    "-DLLVM_TARGETS_TO_BUILD=host"
  ];

}


