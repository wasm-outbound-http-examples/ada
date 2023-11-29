#!/bin/sh
VERSION='22.1.0'
BINPREFIX=/usr/local/adawebpack/bin
apt update
apt install -y lld-15 llvm-15 clang-15 make gprbuild
wget -O /tmp/adawebpack.tgz https://github.com/godunko/adawebpack/releases/download/$VERSION/adawebpack-$VERSION.tar.gz
tar -C /usr/local -xzf /tmp/adawebpack.tgz
rm /tmp/adawebpack.tgz
ln -s $BINPREFIX/llvm-gcc $BINPREFIX/llvm-gnatgcc
ln -s $BINPREFIX/llvm-gnat1 $BINPREFIX/llvm-gnatgnat1
update-alternatives --install /usr/bin/wasm-ld wasm-ld /usr/bin/wasm-ld-15 80
update-alternatives --install /usr/bin/clang clang /usr/bin/clang-15 80
