local schemas = {
	{
		fileMatch = { 'package.json' },
		url = 'https://www.schemastore.org/package.json',
	},
	{
		fileMatch = { 'tsconfig.json', 'tsconfig.*.json', 'jsconfig.json', 'jsconfig.*.json' },
		url = 'https://www.schemastore.org/tsconfig.json',
	},
	{
		fileMatch = { '.prettierrc', '.prettierrc.json' },
		url = 'https://www.schemastore.org/prettierrc.json',
	},
}

return {
	settings = {
		json = {
			schemas = schemas,
			validate = { enable = true },
		},
	},
}
