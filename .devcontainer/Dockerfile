
ARG VARIANT="bullseye"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}
SHELL ["/bin/bash", "-c"]

# download dependencies from apt and some text editors
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
  && apt-get -y install --no-install-recommends binutils gcc g++ make git bzip2 libsdl2-dev vim nano

# download and extract required packages
RUN wget https://gnu.askapache.com/binutils/binutils-2.36.tar.gz \
  && tar -xzf binutils-2.36.tar.gz \
  && wget http://ftp.tsukuba.wide.ad.jp/software/gcc/releases/gcc-11.1.0/gcc-11.1.0.tar.gz \
  && tar -xzf gcc-11.1.0.tar.gz

# build binutils
RUN cd binutils-2.36 \
  && mkdir build \
  && cd build \
  && ../configure --target=sh4-elf --prefix="$HOME/opt/cross" --with-sysroot --disable-nls --disable-werror \
  && make -j$(nproc) \
  && sudo make install

# build gcc
RUN cd gcc-11.1.0 \
  && contrib/download_prerequisites \
  && mkdir build \
  && cd build \
  && ../configure --target=sh4-elf --prefix="$HOME/opt/cross" --disable-nls --enable-languages=c,c++ --without-headers --with-multilib-list=m4-nofpu \
  && make all-gcc -j$(nproc) \
  && make all-target-libgcc -j$(nproc) \
  && sudo make install-gcc \
  && sudo make install-target-libgcc

# clone hollyhock sdk and add environment variables to .bashrc and make sdk files.
RUN cd $HOME \
  && git clone https://github.com/SnailMath/hollyhock-2.git \
  && echo 'export PATH="$PATH:$HOME/opt/cross/bin"' >> .bashrc \
  && echo 'export SDK_DIR="$HOME/hollyhock-2/sdk"' >> .bashrc \
  && source .bashrc \
  && make -C $HOME/hollyhock-2/sdk
