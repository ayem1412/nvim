local opt = vim.opt

opt.guicursor = 'n-v-c-i:block'

opt.number = true
opt.relativenumber = true

opt.signcolumn = 'yes'

opt.colorcolumn = '120'

local space = '·'
opt.list = true
opt.listchars:append {
	tab = '│─',
	multispace = space,
	lead = space,
	trail = space,
	nbsp = space,
}
