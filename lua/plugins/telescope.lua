return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "*", -- Telescope README recommends pinning to a release tag :contentReference[oaicite:3]{index=3}
    dependencies = {
      "nvim-lua/plenary.nvim", -- required :contentReference[oaicite:4]{index=4}
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- recommended native sorter :contentReference[oaicite:5]{index=5}
      "nvim-tree/nvim-web-devicons", -- optional icons :contentReference[oaicite:6]{index=6}
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<C-h>"] = "which_key", -- example from README :contentReference[oaicite:7]{index=7}
              ["<Esc>"] = actions.close,
            },
          },
        },
      })

      pcall(telescope.load_extension, "fzf")
    end,
    keys = {
      { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find Files" },
      { "<leader>fg", function() require("telescope.builtin").live_grep() end,  desc = "Live Grep" },
      { "<leader>fb", function() require("telescope.builtin").buffers() end,    desc = "Buffers" },
      { "<leader>fh", function() require("telescope.builtin").help_tags() end,  desc = "Help" },
    },
  },
}
