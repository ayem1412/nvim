return {
	'catppuccin/nvim',
	name = 'catppuccin',
	priority = 1000,
	opts = {
		integrations = {
			mason = true,
		},
		custom_highlights = function(c)
			return {
				['@lsp.type.component'] = { fg = c.peach },
			}
		end,
	},
	init = function() vim.cmd.colorscheme 'catppuccin-mocha' end,
}
