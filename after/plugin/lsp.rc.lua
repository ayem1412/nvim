local ok, mlsp = pcall(require, 'mason-lspconfig')
if not ok then
	return vim.notify('COULD NOT LOAD MLSP', vim.log.levels.ERROR, { title = 'MLSP' })
end

local ensure_installed = {
	'css_variables',
	'cssls',
	'cssmodules_ls',
	'html',
	'lua_ls',
	'tailwindcss',
	'vtsls',
	'vue_ls',
}

local exclude = {
	'vtsls',
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('*', {
	capabilities = capabilities,
})

-- FOR SOME REASON VTSLS NEEDS TO BE CONFIGURED LIKE THIS INSTEAD OF /lsp DIR
local vue_language_server_path = vim.fn.expand '$MASON/packages'
	.. '/vue-language-server'
	.. '/node_modules/@vue/language-server'
local vue_plugin = {
	name = '@vue/typescript-plugin',
	location = vue_language_server_path,
	languages = { 'vue' },
	configNamespace = 'typescript',
}

vim.lsp.config('vtsls', {
	settings = {
		vtsls = {
			tsserver = {
				globalPlugins = {
					vue_plugin,
				},
			},
		},
	},
	filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
})

vim.lsp.enable 'vtsls'

mlsp.setup {
	ensure_installed = ensure_installed,
	automatic_enable = { exclude = exclude },
}

local keymap = vim.keymap
local opts = { silent = true, remap = true }

keymap.set('n', 'K', vim.lsp.buf.hover, opts)
keymap.set('n', 'gd', vim.lsp.buf.type_definition, opts)
keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
keymap.set('n', '<leader>dm', vim.diagnostic.open_float, opts)
