# Dev container image for this repository — includes NASM and common build tools
FROM mcr.microsoft.com/devcontainers/base:ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    nasm \
    yasm \
    build-essential \
    binutils \
    cmake \
    make \
    ninja-build \
    gdb \
    gdb-multiarch \
    gcc-arm-none-eabi \
    binutils-arm-none-eabi \
    qemu-system-arm \
    openocd \
    git \
    curl \
    ca-certificates \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
