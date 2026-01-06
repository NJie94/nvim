return {
  -- C/C++: clangd + clangd_extensions + nice defaults
  { import = "lazyvim.plugins.extras.lang.clangd" },

  -- CMake: neocmake + cmake-tools + cmake treesitter + cmakelang/cmakelint
  { import = "lazyvim.plugins.extras.lang.cmake" },

  -- Rust: rustaceanvim (+ rust-analyzer) + optional codelldb wiring
  { import = "lazyvim.plugins.extras.lang.rust" },

  -- Go: gopls + go tools (goimports/gofumpt/etc)
  { import = "lazyvim.plugins.extras.lang.go" },

  -- Debugging (recommended): nvim-dap UI + adapters via mason
  { import = "lazyvim.plugins.extras.dap.core" },

  -- Primeagen-style fast file jumping (Harpoon2)
  { import = "lazyvim.plugins.extras.editor.harpoon2" },
}
