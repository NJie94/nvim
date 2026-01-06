return {
  -- If omnisharp-extended is added, disable it (Roslyn replaces this workflow)
  { "Hoffs/omnisharp-extended-lsp.nvim", enabled = false },

  -- Roslyn LSP plugin
  {
    "seblyng/roslyn.nvim",
    ft = { "cs", "csproj", "csx", "razor", "cshtml" },
    opts = {
      -- defaults are fine; optional:
      -- filewatching = "roslyn",
      -- broad_search = true,
    },
    init = function()
      -- Neovim 0.11+ LSP config API
      vim.lsp.config("roslyn", {
        settings = {
          ["csharp|inlay_hints"] = {
            csharp_enable_inlay_hints_for_implicit_variable_types = true,
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
          },
          ["csharp|code_lens"] = {
            dotnet_enable_references_code_lens = true,
            dotnet_enable_tests_code_lens = true,
          },
        },
      })
    end,
  },
}
