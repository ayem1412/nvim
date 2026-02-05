return function(_, bufnr)
	local keymap = vim.keymap

	--- @type vim.keymap.set.Opts
	local opts = { silent = true, remap = true, buffer = bufnr }

	keymap.set('n', 'K', vim.lsp.buf.hover, opts)
	keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
	keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
	keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
	keymap.set('n', '<leader>dm', vim.diagnostic.open_float, opts)
end
