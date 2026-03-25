local on_attach_ok, on_attach = pcall(require, 'xibe.lsp.utils.on_attach')
if not on_attach_ok then
	return vim.notify('COULD NOT LOAD ON_ATTACH', vim.log.levels.ERROR, { title = 'ON_ATTACH' })
end

return {
	'nvim-java/nvim-java',
	config = function()
		require('java').setup()

		vim.lsp.config('jdtls', {
			on_attach = on_attach,
		})

		vim.lsp.enable 'jdtls'
	end,
}
