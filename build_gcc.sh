cd ../../gcc-11.1.0 \
  && contrib/download_prerequisites \
  && mkdir build \
  && cd build \
  && ../configure --target=$TARGET --prefix="$PREFIX" --disable-nls --enable-languages=c,c++ --without-headers --with-multilib-list=m4-nofpu \
  && make all-gcc -j$(nproc) \
  && make all-target-libgcc -j$(nproc) \
  && sudo make install-gcc \
  && sudo make install-target-libgcc