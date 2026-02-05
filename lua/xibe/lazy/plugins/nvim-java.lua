return {
	'nvim-java/nvim-java',
	opts = {},
	init = function() vim.lsp.enable 'jdtls' end,
}
