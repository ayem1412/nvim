local ok, bufferline = pcall(require, 'bufferline')
if not ok then
	return vim.notify('COULD NOT LOAD BUFFERLINE', vim.log.levels.ERROR, { title = 'BUFFERLINE' })
end

bufferline.setup {
	options = {
		close_command = function() vim.api.nvim_command 'bp|sp|bn|bd' end,
		right_mouse_command = function() vim.api.nvim_command 'bp|sp|bn|bd' end,
		middle_mouse_command = function() vim.api.nvim_command 'bp|sp|bn|bd' end,
		numbers = 'ordinal',
		diagnostics = 'nvim_lsp',
		offsets = {
			{
				filetype = 'NvimTree',
				text = function() return vim.fn.fnamemodify(vim.fn.getcwd(), ':t') end,
				highlight = 'Directory',
				text_align = 'left',
				separator = true,
			},
		},
	},
}

local keymap = vim.keymap
local opts = { silent = true }

keymap.set('n', '<A-,>', '<CMD>BufferLineCyclePrev<CR>', opts)
keymap.set('n', '<A-.>', '<CMD>BufferLineCycleNext<CR>', opts)

keymap.set('n', '<A-Right>', '<CMD>BufferLineMoveNext<CR>', opts)
keymap.set('n', '<A-Left>', '<CMD>BufferLineMovePrev<CR>', opts)

keymap.set('n', '<A-1>', function() bufferline.go_to(1, true) end, opts)
keymap.set('n', '<A-2>', function() bufferline.go_to(2, true) end, opts)
keymap.set('n', '<A-3>', function() bufferline.go_to(3, true) end, opts)
keymap.set('n', '<A-4>', function() bufferline.go_to(4, true) end, opts)
keymap.set('n', '<A-5>', function() bufferline.go_to(5, true) end, opts)
keymap.set('n', '<A-6>', function() bufferline.go_to(6, true) end, opts)
keymap.set('n', '<A-7>', function() bufferline.go_to(7, true) end, opts)
keymap.set('n', '<A-8>', function() bufferline.go_to(8, true) end, opts)
keymap.set('n', '<A-9>', function() bufferline.go_to(9, true) end, opts)
keymap.set('n', '<A-0>', function() bufferline.go_to(-1, true) end, opts)
