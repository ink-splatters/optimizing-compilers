#!/bin/sh

set -e
set -o pipefail


DEFAULT_BRANCH=llvmorg-14.0.6
BRANCH="$1"
if [ "$BRANCH == "" ] ;
	BRANCH="$DEFAULT_BRANCH"
fi


set -x 

git clone --depth 1 --branch="$BRANCH"  https://github.com/llvm/llvm-project.git

set +x
