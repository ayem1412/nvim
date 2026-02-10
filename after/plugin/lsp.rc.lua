local ok, mlsp = pcall(require, 'mason-lspconfig')
if not ok then
	return vim.notify('COULD NOT LOAD MLSP', vim.log.levels.ERROR, { title = 'MLSP' })
end

local on_attach_ok, on_attach = pcall(require, 'xibe.lsp.utils.on_attach')
if not on_attach_ok then
	return vim.notify('COULD NOT LOAD ON_ATTACH', vim.log.levels.ERROR, { title = 'ON_ATTACH' })
end

local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_nvim_lsp_ok then
	return vim.notify(
		'COULD NOT LOAD CMP_NVIM_LSP',
		vim.log.levels.ERROR,
		{ title = 'CMP_NVIM_LSP' }
	)
end

local ensure_installed = {
	'css_variables',
	'cssls',
	'cssmodules_ls',
	'html',
	'jsonls',
	'lua_ls',
	'rust_analyzer',
	'tailwindcss',
	'ts_ls',
	'vtsls',
	'vue_ls',
}

local excluded_servers = {
	'ts_ls',
}

mlsp.setup {
	ensure_installed = ensure_installed,
	automatic_enable = false,
}

local capabilities = cmp_nvim_lsp.default_capabilities()

for _, server in ipairs(mlsp.get_installed_servers()) do
	local server_opts = {
		on_attach = on_attach,
		capabilities = capabilities,
	}

	if not vim.tbl_contains(excluded_servers, server) then
		local server_ok, opts = pcall(require, 'xibe.lsp.configs.' .. server)
		if server_ok then server_opts = vim.tbl_deep_extend('force', opts, server_opts) end

		vim.lsp.config(server, server_opts)
		vim.lsp.enable(server)
	end
end
