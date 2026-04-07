local ok, configs = pcall(require, 'nvim-treesitter.configs')
if not ok then
	return vim.notify(
		'COULD NOT LOAD NVIM-TREESITTER',
		vim.log.levels.ERROR,
		{ title = 'NVIM-TREESITTER' }
	)
end

local ok_install, install = pcall(require, 'nvim-treesitter.install')
if not ok_install then
	return vim.notify(
		'COULD NOT LOAD NVIM-TREESITTER.INSTALL',
		vim.log.levels.ERROR,
		{ title = 'NVIM-TREESITTER.INSTALL' }
	)
end

if vim.fn.has 'win32' == 1 then install.compilers = { 'zig' } end

local ensure_installed = {
	'bash',
	'comment',
	'css',
	'dockerfile',
	'editorconfig',
	'gitignore',
	'html',
	'hyprlang',
	'java',
	'javadoc',
	'javascript',
	'jsdoc',
	'json',
	'lua',
	'luap',
	'markdown',
	'markdown_inline',
	'php',
	'phpdoc',
	'powershell',
	'properties',
	'regex',
	'rust',
	'sql',
	'tmux',
	'todotxt',
	'toml',
	'tsx',
	'twig',
	'typescript',
	'vim',
	'vimdoc',
	'vue',
	'xml',
	'yaml',
}

--[[ configs.setup {
	install_dir = vim.fn.stdpath 'data' .. '/site',
} ]]

-- configs.install = ensure_installed

-- pcall(vim.treesitter.start)

--[[ vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo[0][0].foldmethod = 'expr' ]]

-- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

configs.setup {
	ensure_installed = ensure_installed,
	sync_install = false,
	auto_install = false,
	indent = { enable = true },
	highlight = { enable = true },
}
