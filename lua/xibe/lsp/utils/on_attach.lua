return function(_, bufnr)
	local keymap = vim.keymap

	--- @type vim.keymap.set.Opts
	local opts = { silent = true, remap = true, buffer = bufnr }

	keymap.set('n', 'K', '<CMD>Lspsaga hover_doc<CR>', opts)
	keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	keymap.set('n', '<leader>gf', '<CMD>Lspsaga finder<CR>', opts)
	keymap.set({ 'n', 'v' }, '<leader>ca', '<CMD>Lspsaga code_action<CR>', opts)
	keymap.set('n', '<leader>rn', '<CMD>Lspsaga rename<CR>', opts)
	keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
	keymap.set('n', '<leader>dm', '<CMD>Lspsaga diagnostic_jump_next<CR>', opts)
	keymap.set('n', '<leader>dp', '<CMD>Lspsaga diagnostic_jump_prev<CR>', opts)
end
