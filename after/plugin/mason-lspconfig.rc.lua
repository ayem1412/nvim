local ok, mlsp = pcall(require, 'mason-lspconfig')
if not ok then
	return vim.notify('COULD NOT LOAD MLSP', vim.log.levels.ERROR, { title = 'MLSP' })
end

local automatic_enable = {
	'lua_ls',
}

local ensure_installed = {
	'lua_ls',
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('*', {
	capabilities = capabilities,
})

mlsp.setup {
	ensure_installed = ensure_installed,
	automatic_enable = automatic_enable,
}

local keymap = vim.keymap
local opts = { silent = true, remap = true }

keymap.set('n', 'K', vim.lsp.buf.hover, opts)
keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
