return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      -- Add Roslyn registry (required for :MasonInstall roslyn)
      opts.registries = opts.registries or {}
      local function add(reg)
        for _, r in ipairs(opts.registries) do
          if r == reg then return end
        end
        table.insert(opts.registries, reg)
      end

      add("github:mason-org/mason-registry")
      add("github:Crashdummyy/mason-registry") -- provides `roslyn`

      -- Keep this list small to avoid “already installing” races
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "clangd",
        "codelldb",
        "gopls",
        "delve",
        "rust-analyzer",
        "roslyn",
      })
    end,
  },
}
