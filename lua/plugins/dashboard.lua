local function cwd()
  return vim.fn.getcwd() -- important: respects :cd
end

local function nvimtree_toggle_at(dir)
  dir = dir or cwd()
  -- Maintainer-recommended style: toggle with path at call time :contentReference[oaicite:2]{index=2}
  require("nvim-tree.api").tree.toggle({ path = dir, focus = true })
end

local function open_tree_root()
  nvimtree_toggle_at(LazyVim.root())
  Snacks.dashboard.update()
end

local function open_tree_cwd()
  nvimtree_toggle_at(cwd())
  Snacks.dashboard.update()
end

local function open_tree_pick_dir()
  vim.ui.input({ prompt = "Open tree at: ", default = cwd(), completion = "dir" }, function(input)
    if input and input ~= "" then
      nvimtree_toggle_at(input)
      Snacks.dashboard.update()
    end
  end)
end

local function change_dir_and_open_tree()
  vim.ui.input({ prompt = "cd to: ", default = cwd(), completion = "dir" }, function(input)
    if input and input ~= "" then
      vim.cmd("cd " .. vim.fn.fnameescape(input))
      nvimtree_toggle_at(cwd())
      Snacks.dashboard.update()
    end
  end)
end

return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.dashboard = opts.dashboard or {}
      opts.dashboard.preset = opts.dashboard.preset or {}
      opts.dashboard.formats = opts.dashboard.formats or {}
    
      --I dont want header for now
      opts.dashboard.preset.header = ""
      -- Big header (top)
    --   opts.dashboard.preset.header = table.concat({
    --     "   ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z    ",
    --     "   ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z        ",
    --     "   ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z           ",
    --     "   ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z             ",
    --     "   ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║               ",
    --     "   ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝               ",
    -- --  "               这个世界上没有遗憾，只有放错了地方的希望                        ",
    --   }, "\n")

      -- Make keys look like: "Desc .......... key" (no [brackets])
    --   opts.dashboard.formats.key = function(item)
    --     return { { item.key, hl = "SnacksDashboardKey" } }
    --   end

      --  Menu items (very similar to what you showed)
      opts.dashboard.preset.keys = {
        { icon = " ", key = "f", desc = "Find File (cwd)", action = function()
            require("telescope.builtin").find_files({ cwd = vim.fn.getcwd(), hidden = true })
            end
        },
        { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
        { icon = " ", key = "g", desc = "Find Text (cwd)", action = function()
            require("telescope.builtin").live_grep({ cwd = vim.fn.getcwd(), hidden = true})
            end
        },
        { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
        { icon = "󰙅 ", key = "e", desc = "File Tree (CWD)", action = open_tree_root },
        { icon = " ", key = "D", desc = "File Tree (Pick Dir)", action = open_tree_pick_dir },
        { icon = "󰉋 ", key = "d", desc = "Change Directory (cd)", action = change_dir_and_open_tree },
        { icon = " ", key = "s", desc = "Restore Session", section = "session" },
        { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
        { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
      }

      opts.dashboard.sections = {
        { section = "header" },
        function()
          local cwd = vim.fn.fnamemodify((vim.uv or vim.loop).cwd(), ":~")
          return {
            { title = "󰉋  " .. cwd, padding = 1 },
          }
        end,
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
      }
    end,
  },
}
