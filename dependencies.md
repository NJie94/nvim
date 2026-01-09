# Neovim (LazyVim) — Dependencies & Install Guide (macOS / Ubuntu / Fedora / Windows)

This doc lists the external tools that commonly show up in `:LazyHealth` / `:checkhealth`, including fixes for:
- Missing **rg**, **fd/fdfind**, **fzf**, **lazygit**
- Missing **tree-sitter CLI** (required by `nvim-treesitter`)
- Missing **node/npm** + **mmdc** (Mermaid) for optional `Snacks.image` rendering
- Optional language providers (Python/Node/Perl/Ruby)

---

## Table of contents

- [What you need](#what-you-need)
- [macOS](#macos)
- [Linux: Ubuntu / Debian](#linux-ubuntu--debian)
- [Linux: Fedora](#linux-fedora)
- [Windows](#windows)
- [Verify installs](#verify-installs)
- [Optional: Language providers](#optional-language-providers)

---

## What you need

### Required / Core
- `git`, `curl`, `tar`
- **C compiler toolchain** (for compiling certain parsers)
- **tree-sitter CLI** (`tree-sitter`) — required by `nvim-treesitter`

### Highly recommended (fixes most LazyVim warnings)
- **ripgrep** (`rg`) — fast text search
- **fd** (`fd` or Ubuntu’s `fdfind`) — fast file finder
- **fzf** — fuzzy finder
- **lazygit** — optional but commonly used (LazyVim and Snacks integrations)

### Optional (Snacks.image rendering features)
If you enable `Snacks.image`, these often matter:
- **Node.js + npm**
- **Mermaid CLI** (`mmdc`) via `@mermaid-js/mermaid-cli`
- **ImageMagick** (`magick`) + **Ghostscript** (`gs`)
- **TeX**: `pdflatex` (TeX Live / BasicTeX / MiKTeX) *or* `tectonic`

> If you don’t use Mermaid/image/PDF/LaTeX rendering inside Neovim, you can skip the Optional section.

---

## macOS

### Minimal (Core + Recommended)
```bash
brew install git curl gnu-tar
brew install ripgrep fd fzf lazygit
brew install tree-sitter
```

### Optional (Snacks.image + Mermaid)
```bash
brew install node
# Mermaid (choose one)
brew install mermaid-cli
# OR:
npm i -g @mermaid-js/mermaid-cli

brew install imagemagick ghostscript

# TeX (pick one)
brew install --cask basictex
# brew install --cask mactex  # huge
```

---

## Linux: Ubuntu / Debian

### Minimal (Core + Recommended)
```bash
sudo apt update
sudo apt install -y git curl tar build-essential
sudo apt install -y ripgrep fzf fd-find
sudo apt install -y lazygit || true
```

### Fix: Ubuntu uses `fdfind` instead of `fd`
Many tools expect `fd`. Create a user-local symlink:
```bash
mkdir -p ~/.local/bin
ln -sf "$(command -v fdfind)" ~/.local/bin/fd
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
```

### Install tree-sitter CLI (if not available via apt on your Ubuntu version)
Option A (npm):
```bash
sudo apt install -y nodejs npm
sudo npm i -g tree-sitter-cli
```

Option B (cargo):
```bash
sudo apt install -y cargo
cargo install tree-sitter-cli
```

### Optional (Snacks.image + Mermaid)
```bash
# Node + Mermaid CLI
sudo apt install -y nodejs npm
sudo npm i -g @mermaid-js/mermaid-cli

# Image + PDF helpers
sudo apt install -y imagemagick ghostscript

# TeX (pdflatex)
sudo apt install -y texlive-latex-base
# OR: install tectonic if you prefer it
```

---

## Linux: Fedora

### Minimal (Core + Recommended)
```bash
sudo dnf install -y git curl tar
sudo dnf groupinstall -y "Development Tools"
sudo dnf install -y ripgrep fd-find fzf
sudo dnf install -y tree-sitter-cli
```

### Install lazygit (Fedora COPR)
```bash
sudo dnf copr enable -y dejan/lazygit
sudo dnf install -y lazygit
```

### Optional (Snacks.image + Mermaid)
```bash
sudo dnf install -y nodejs npm
sudo npm i -g @mermaid-js/mermaid-cli

sudo dnf install -y ImageMagick ghostscript

# TeX (pdflatex)
sudo dnf install -y texlive-scheme-basic
# OR: use tectonic if you prefer it
```

### Optional: Lua 5.1 on Fedora (only if you *really* need it)
Some LuaRocks-related tooling expects Lua 5.1. Fedora typically provides it via:
```bash
sudo dnf install -y compat-lua
```

---

## Windows

### Minimal (Recommended tools via winget)
Open **PowerShell** and run:
```powershell
winget install -e --id BurntSushi.ripgrep.MSVC
winget install -e --id sharkdp.fd
winget install -e --id junegunn.fzf
winget install -e --id JesseDuffield.lazygit
winget install -e --id OpenJS.NodeJS.LTS
```

### tree-sitter CLI + Mermaid CLI (via npm)
```powershell
npm i -g tree-sitter-cli
npm i -g @mermaid-js/mermaid-cli
```

### Optional (Snacks.image)
Install ImageMagick + Ghostscript:
- ImageMagick: https://imagemagick.org/script/download.php
- Ghostscript: https://www.ghostscript.com/download/gsdnld.html

TeX options:
- MiKTeX: https://miktex.org/download
- TeX Live: https://tug.org/texlive/

### Important note (Windows): C compiler for nvim-treesitter
`nvim-treesitter` needs a working C compiler in your PATH to build parsers. Common approaches:
- **Visual Studio Build Tools** (MSVC / clang toolset)
- **MSYS2** (gcc/clang)

If you don’t want to install a compiler, you’ll have trouble compiling parsers on Windows.

---

## Verify installs

In your terminal:

```bash
git --version
curl --version
tar --version

rg --version
fd --version || fdfind --version
fzf --version
lazygit --version

tree-sitter --version

node --version
npm --version
mmdc --version

magick -version
gs --version
pdflatex --version || tectonic --version
```

Then in Neovim:

```vim
:LazyHealth
:checkhealth nvim-treesitter
:checkhealth provider
```

---

## Optional: Language providers

If you want to *fix* provider warnings (only needed if you use plugins that rely on these):

### Node provider (Neovim)
```bash
npm install -g neovim
```

### Python provider (Neovim)
Install Python + pip, then:
```bash
python3 -m pip install --user --upgrade pynvim
```

### Ruby provider (Neovim)
```bash
gem install neovim
```

### Perl provider (Neovim)
```bash
cpanm -n Neovim::Ext
```

### If you *don’t* need providers, you can disable warnings
Add to your `lua/config/options.lua` (or similar):
```lua
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
```
