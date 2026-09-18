vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes" -- always reserve a column left of the numbers, small gutter gap

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.scrolloff = 999 -- keep cursor line centered vertically

vim.opt.guicursor = "a:block-blinkon0" -- solid block cursor in all modes, no blinking

vim.opt.clipboard = "unnamedplus" -- yank/delete/paste use the system clipboard

vim.opt.cmdheight = 0 -- hide the command-line area when not in use

vim.o.guifont = "JetBrains Mono:h14" -- only used by GUI frontends (Neovide, nvim-qt); terminal nvim inherits the terminal's font

require("mappings")

-- Bootstrap lazy.nvim: https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Your own plugin specs live in lua/plugins/*.lua
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  install = { colorscheme = { "gruvbox", "habamax" } },
  checker = { enabled = true },
})
