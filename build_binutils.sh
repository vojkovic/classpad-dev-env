cd binutils-2.36 \
  && mkdir build \
  && cd build \
  && ../configure --target=$TARGET --prefix="$PREFIX" --with-sysroot --disable-nls --disable-werror \
  && make -j$(nproc) \
  && sudo make install