return {
	'catppuccin/nvim',
	name = 'catppuccin',
	enabled = false,
	priority = 1000,
	opts = {
		transparent_background = true,
		integrations = {
			mason = true,
		},
		custom_highlights = function(c)
			return {
				['@lsp.type.component'] = { fg = c.peach },
			}
		end,
	},
	config = function() vim.cmd.colorscheme 'catppuccin-mocha' end,
}
