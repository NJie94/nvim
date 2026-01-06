# Neovim (LazyVim) Setup — Dependencies & Install Guide (Linux / macOS / Windows)

## Contents

- [Linux (Ubuntu/Debian) / WSL](#linux-ubuntu)
- [macOS (Homebrew)](#macos-homebrew)
- [Windows (Native Neovim)](#windows-native-neovim)

---

# Git Clone to repo

``` git
git clone https://github.com/NJie94/nvim.git ~/.config/nvim
```

This Neovim configuration is built around:

- **Neovim** + **LazyVim**
- **Snacks dashboard**
- **Telescope** (find files / live grep)
- **fzf-lua** (optional picker)
- **Mason** (installs LSP/formatters/debuggers)
- Language tooling for **C++ / Rust / Go / C# (Roslyn)**

> Important: install tools in the SAME environment where Neovim runs.
>
> - If you run Neovim inside **WSL**, install deps inside **WSL**
> - If you run Neovim on **Windows**, install deps on **Windows**
>
---

## Minimum versions

- **Neovim**: latest stable recommended  
  - If you use **C# Roslyn (`roslyn.nvim`)**, you generally want **Neovim 0.11+**
- **git**: required (downloads plugins)

---

## Core CLI tools (required / strongly recommended)

These are the most common missing dependencies for pickers + Mason:

### Required

- `git`
- `unzip` (Mason needs this for many packages, e.g. `codelldb`)
- `ripgrep` (`rg`) — required for Telescope `live_grep`

### Strongly recommended

- `fd` (fast file discovery; improves Telescope `find_files`)
- `fzf` (for fzf-lua and fuzzy workflows)
- build tools (for native extensions like `telescope-fzf-native`)
  - `make`
  - `cmake`
  - a compiler toolchain (`gcc/g++` or `clang`

---

## Linux Ubuntu

### Install dependencies

```bash
sudo apt update
sudo apt install -y \
  git curl unzip \
  ripgrep fd-find fzf \
  build-essential cmake
```

Restart your shell.

---

## macOS (Homebrew)

### Install dependencies

``` bash
brew update
brew install \
  neovim git curl unzip \
  ripgrep fd fzf \
  cmake

```

(Optional) If Homebrew suggests enabling shell integration for fzf, follow its post-install message.

---

## Windows (Native Neovim)

> If you run Neovim on Windows, you must install Windows versions of tools
> (WSL tools won’t be visible to Windows Neovim).

### Install via winget

``` Powershell
winget install -e --id Neovim.Neovim
winget install -e --id Git.Git
winget install -e --id BurntSushi.ripgrep
winget install -e --id sharkdp.fd
winget install -e --id junegunn.fzf
winget install -e --id 7zip.7zip
winget install -e --id Kitware.CMake
```

### Build tools (for native extensions)

If you compile native extensions (like telescope-fzf-native), install one of:

- Visual Studio Build Tools (C++ workload), or
- MSYS2 (make/gcc), or
- LLVM/Clang toolchain

For many people, CMake + Build Tools is enough.

---

## Language toolchains

These are not always required if you rely only on Mason, but they’re recommended for real development.

### C / C++

- System compiler: gcc/g++ or clang
- CMake for CMake projects
- compile_commands.json strongly recommended for best clangd results:
  - CMake: build with -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

### Rust

- Install Rust via rustup:

``` Bash
 curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

(Mason can install rust-analyzer, but you still want cargo/rustc.)

### Go

Install Go from the official installer or your package manager.
(Mason installs gopls, delve, goimports, etc., but you still need go for builds.)

### C# (Roslyn)

#### Install .NET SDK

Linux (Ubuntu)

```
sudo apt install -y dotnet-sdk-8.0 
```

macOS

```
brew install --cask dotnet-sdk
```

Windows

```
winget install -e --id Microsoft.DotNet.SDK.8
```
