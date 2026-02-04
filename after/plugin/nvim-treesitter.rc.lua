local ok, configs = pcall(require, 'nvim-treesitter.configs')
if not ok then
	return vim.notify('COULD NOT LOAD CONFIGS', vim.log.levels.ERROR, { title = 'CONFIGS' })
end

local ensure_installed = {
	'comment',
	'css',
	'editorconfig',
	'gitignore',
	'html',
	'java',
	'javadoc',
	'javascript',
	'jsdoc',
	'json',
	'lua',
	'luap',
	'powershell',
	'properties',
	'regex',
	'tmux',
	'todotxt',
	'toml',
	'tsx',
	'typescript',
	'vim',
	'vimdoc',
	'vue',
	'xml',
	'yaml',
}

configs.setup {
	ensure_installed = ensure_installed,
	sync_install = false,
	auto_install = false,
	indent = { enable = true },
	highlight = { enable = true },
}
