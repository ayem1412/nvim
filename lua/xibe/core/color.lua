local opt = vim.opt

opt.termguicolors = true

vim.filetype.add {
	pattern = {
		['%.env.*'] = 'sh',
		['%.env'] = 'sh',
	},
}
