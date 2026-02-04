local ok, tree = pcall(require, 'nvim-tree')
if not ok then
	return vim.notify('COULD NOT LOAD TREE', vim.log.levels.ERROR, { title = 'TREE' })
end

tree.setup {}

local keymap = vim.keymap
local opts = { silent = true }

keymap.set('n', '<C-n>', '<CMD>NvimTreeToggle<CR>', opts)
