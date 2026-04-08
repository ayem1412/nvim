local ok, treesitter = pcall(require, 'nvim-treesitter')
if not ok then
	return vim.notify(
		'COULD NOT LOAD NVIM-TREESITTER',
		vim.log.levels.ERROR,
		{ title = 'NVIM-TREESITTER' }
	)
end

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

treesitter.install(ensure_installed)

vim.api.nvim_create_autocmd('FileType', {
	pattern = ensure_installed,
	callback = function()
		vim.treesitter.start()
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
