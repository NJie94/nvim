return {
  -- disable neo-tree
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },

  -- enable nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- icons (optional but nice)
    opts = {
      disable_netrw = true,
      hijack_netrw = true,

      -- makes it behave more like “follow my cwd”
      sync_root_with_cwd = true,
      update_focused_file = { enable = true, update_root = true },

      view = { width = 35, side = "left" },
      renderer = { group_empty = true },
      diagnostics = { enable = true },
      git = { enable = true },
    },
  },
}
