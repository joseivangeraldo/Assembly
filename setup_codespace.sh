#!/usr/bin/env bash
set -euo pipefail

echo "Running workspace setup: installing NASM and build tools if missing..."

if command -v nasm >/dev/null 2>&1; then
  echo "nasm already installed: $(nasm -v | head -n1)"
else
  echo "Installing nasm, build tools, binutils, gdb, yasm (requires sudo)"
  sudo apt-get update
  sudo apt-get install -y nasm yasm build-essential binutils gdb curl ca-certificates
fi

echo "Setup complete. Verify with: nasm -v && gcc --version | head -n1 && ld --version | head -n1"
