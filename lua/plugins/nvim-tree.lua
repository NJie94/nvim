return {
  -- disable neo-tree
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },

  -- enable nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    -- these make which-key show entries under <leader>
    keys = {
      {
        "<leader>e",
        function()
          local api = require("nvim-tree.api")

          -- LazyVim "Root Dir" (project root). Fallback to git root, then cwd.
          local root = nil
          if _G.LazyVim and _G.LazyVim.root and _G.LazyVim.root.get then
            root = _G.LazyVim.root.get()
          else
            local ok, util = pcall(require, "lazyvim.util")
            if ok and util.root then
              if type(util.root) == "function" then
                root = util.root()
              elseif type(util.root) == "table" and util.root.get then
                root = util.root.get()
              end
            end
          end
          root = root or (vim.fs and vim.fs.root(0, { ".git" })) or vim.fn.getcwd()

          api.tree.toggle({ path = root, focus = true, find_file = true })
        end,
        desc = "Explorer (Root Dir)",
      },
      {
        "<leader>E",
        function()
          local api = require("nvim-tree.api")
          api.tree.toggle({ path = vim.fn.getcwd(), focus = true, find_file = true })
        end,
        desc = "Explorer (CWD)",
      },
    },

    opts = {
      disable_netrw = true,
      hijack_netrw = true,

      sync_root_with_cwd = true,
      update_focused_file = { enable = true, update_root = true },

      view = { width = 35, side = "left" },
      renderer = { group_empty = true },
      diagnostics = { enable = true },
      git = { enable = true },
    },
  },
}
