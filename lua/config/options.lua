-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.lazyvim_picker = "telescope"

-- Use system clipboard locally, but leave it unset over SSH so Neovim can use OSC52
vim.opt.clipboard = vim.env.SSH_CONNECTION and "" or "unnamedplus"


if vim.env.SSH_CONNECTION then
  vim.g.clipboard = "osc52"
end
