vim.g.mapleader = ','

vim.keymap.set('n', '<leader>w', '<cmd>write<cr>', {desc = 'Save'})
vim.keymap.set('n', '<leader>q', '<cmd>quit<cr>', {desc = 'Quit'})
vim.keymap.set('n', '<leader>Wq', '<cmd>wq<cr>', {desc = 'Save and Quit'})
vim.keymap.set('n', '<leader>Qq', '<cmd>q!<cr>', {desc = 'Quit not save'})

vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { noremap = true, silent = true })

-- Telescope
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {desc = 'Save'})
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {desc = 'Save'})
vim.keymap.set('n', '<leader>gg', '<cmd>Telescope buffers<cr>', {desc = 'Save'})
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', {desc = 'Save'})

-- Nvim-tree
vim.keymap.set('n', '<C-n>', '<cmd>NvimTreeToggle<cr>', {desc = 'Save'})
