return {
	'catppuccin/nvim',
	name = 'catppuccin',
	priority = 1000,
	opts = {
		integrations = {
			mason = true,
		},
	},
	init = function() vim.cmd.colorscheme 'catppuccin-mocha' end,
}
