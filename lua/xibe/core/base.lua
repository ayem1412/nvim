local g = vim.g
local opt = vim.opt

g.mapleader = ' '
g.maplocalleader = '\\'

opt.swapfile = false
opt.undofile = true
opt.undodir = vim.fn.stdpath 'data' .. '/undo'

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
