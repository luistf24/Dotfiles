-- colors
vim.opt.termguicolors = true
vim.cmd.colorscheme('monochrome')
vim.opt.syntax = "on"

-- enable line number and relative line number
vim.opt.number = true
vim.opt.relativenumber = true

-- width of a tab
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.breakindent = true

-- seach
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = true

-- clipboard: xsel
vim.opt.clipboard = "unnamedplus"
