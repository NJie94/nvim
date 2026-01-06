return {
  -- Git inside Neovim
--   {
--     "tpope/vim-fugitive",
--     cmd = { "Git", "G" },
--     keys = {
--       { "<leader>gg", "<cmd>Git<cr>", desc = "Git (Fugitive)" },
--     },
--   },

  -- Optional: better GitHub integration for fugitive (:GBrowse)
--   { "tpope/vim-rhubarb", dependencies = { "tpope/vim-fugitive" }, lazy = true },

    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
        local harpoon = require("harpoon")
        harpoon:setup()
        end,
        keys = {
        { "<leader>a", function() require("harpoon"):list():add() end, desc = "Harpoon Add File" },
        { "<C-e>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon Menu" },
        -- { "<C-h>", function() require("harpoon"):list():select(1) end, desc = "Harpoon 1" },
        -- { "<C-j>", function() require("harpoon"):list():select(2) end, desc = "Harpoon 2" },
        -- { "<C-k>", function() require("harpoon"):list():select(3) end, desc = "Harpoon 3" },
        -- { "<C-l>", function() require("harpoon"):list():select(4) end, desc = "Harpoon 4" },
        },
    }, -- harpoon2 note :contentReference[oaicite:7]{index=7}

    -- Visual undo tree
    {
        "mbbill/undotree",
        keys = {
        { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "UndoTree" },
        },
    },
}