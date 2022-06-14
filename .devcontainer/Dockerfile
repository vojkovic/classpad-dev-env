# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.236.0/containers/debian/.devcontainer/base.Dockerfile

# [Choice] Debian version (use bullseye on local arm64/Apple Silicon): bullseye, buster
ARG VARIANT="buster"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends binutils gcc g++ make \
    && wget https://gnu.askapache.com/binutils/binutils-2.36.tar.gz \
    && tar -xzf binutils-2.36.tar.gz \
    && wget http://ftp.tsukuba.wide.ad.jp/software/gcc/releases/gcc-11.1.0/gcc-11.1.0.tar.gz \
    && tar -xzf gcc-11.1.0.tar.gz \
    && export PREFIX="$HOME/opt/cross" \
    && export TARGET=sh4-elf \
    && export PATH="$PREFIX/bin:$PATH" \
