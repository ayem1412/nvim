return {
	'ellisonleao/gruvbox.nvim',
	priority = 1000,
	opts = {
		transparent_mode = true,
	},
	config = function()
		vim.o.background = 'dark'
		vim.cmd [[colorscheme gruvbox]]
	end,
}
