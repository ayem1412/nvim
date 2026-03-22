return {
	'saecki/crates.nvim',
	event = { 'BufRead Cargo.toml' },
	opts = {
		completion = {
			cmp = {
				enabled = true,
			},
			crates = {
				enabled = true, -- Disabled by default
				max_results = 8, -- The maximum number of search results to display
				min_chars = 3, -- The minimum number of charaters to type before completions begin appearing
			},
		},
	},
}
