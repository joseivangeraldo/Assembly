# Assembly
Assembly codes.

## GitHub Codespaces for embedded development

This repository includes a ready-to-use Codespaces/devcontainer setup in `/home/runner/work/Assembly/Assembly/.devcontainer` with:

- NASM and YASM for x86/x64 assembly practice
- ARM embedded cross-compilation tools (`gcc-arm-none-eabi`, `binutils-arm-none-eabi`)
- Debugging and emulation tools (`gdb-multiarch`, `openocd`, `qemu-system-arm`)
- VS Code extensions for C/C++, Makefiles, Cortex debugging, and binary/hex inspection

To use it:

1. Open the repository on GitHub.
2. Click **Code** → **Codespaces** → **Create codespace on main**.
3. Wait for container build and run `nasm -v` or `arm-none-eabi-gcc --version` to verify tools.
