return {
	'mrcjkb/rustaceanvim',
	version = '^8', -- Recommended
	lazy = false, -- This plugin is already lazy
	init = function()
		vim.g.rustaceanvim = {
			server = {
				on_attach = function(_, bufnr)
					local keymap = vim.keymap

					--- @type vim.keymap.set.Opts
					local opts = { silent = true, buffer = bufnr }

					keymap.set('n', '<leader>ca', function() vim.cmd.RustLsp 'codeAction' end, opts)
					keymap.set(
						'n',
						'K',
						function() vim.cmd.RustLsp { 'hover', 'actions' } end,
						opts
					)
					keymap.set(
						'n',
						'<leader>de',
						function() vim.cmd.RustLsp { 'explainError', 'current' } end,
						opts
					)
					keymap.set(
						'n',
						'<leader>dm',
						function() vim.cmd.RustLsp { 'renderDiagnostic', 'current' } end,
						opts
					)
					keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
					keymap.set('n', '<leader>rn', '<CMD>Lspsaga rename<CR>', opts)
					keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
					keymap.set('n', '<leader>gf', '<CMD>Lspsaga finder<CR>', opts)
				end,
			},
		}
	end,
}
