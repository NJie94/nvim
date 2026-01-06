return {
  -- Theme plugin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- load early (prevents flash)
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      background = { light = "latte", dark = "mocha" },
      integrations = {
        snacks = true, 
        neotree = true,
        telescope = true,
        mason = true,
        which_key = true,
      },
    },
  },

  -- Tell LazyVim to use it
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
      -- (alternative) colorscheme = function() vim.cmd.colorscheme("catppuccin-mocha") end
    },
  },
}
