return {
  -- Ensure the binaries you actually need are installed
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        -- C/C++
        "clangd",
        "clang-format",
        "codelldb",

        -- CMake (matches the CMake extra) :contentReference[oaicite:11]{index=11}
        "cmakelang",
        "cmakelint",

        -- Rust / Go (extras will configure, this ensures binaries exist)
        "rust-analyzer",
        "gopls",
        "goimports",
        "gofumpt",
        "golangci-lint",
        "delve",
      })
    end,
  },

  -- Format C/C++ with clang-format (LazyVim uses conform.nvim) :contentReference[oaicite:12]{index=12}
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        c = { "clang-format" },
        cpp = { "clang-format" },
      },
    },
  },
}
