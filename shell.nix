# shell.nix
# https://nixos.wiki/wiki/LLVM
# https://github.com/facebookincubator/BOLT/blob/main/bolt/docs/OptimizingClang.md

{ pkgs ? import <nixpkgs> { } }:
with pkgs;
let
  gccForLibs = stdenv.cc.cc;
in
mkShell {
  name = "llvm-env";

  buildInputs = [
    bashInteractive
    llvmPackages_14.llvm
    cmake
    ninja
    nixfmt
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
  shellHook = ''
    export PS1="\n\[\033[1;32m\][nix-shell:\w]\$\[\033[0m\] "
    export TOPLEV=$(pwd)
  '';

}


