-- require("config.lazy")

vim.opt.autowriteall = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.pack.add({ 'https://github.com/zenbones-theme/zenbones.nvim' })
vim.pack.add({ 'https://github.com/f-person/auto-dark-mode.nvim' })
vim.pack.add({ 'https://github.com/nvim-mini/mini.pairs' }); require('mini.pairs').setup()
