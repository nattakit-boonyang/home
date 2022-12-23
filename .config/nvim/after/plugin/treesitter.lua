-- Plugin for syntax
local treesitter = require('nvim-treesitter.configs')

treesitter.setup({
	ensure_installed = 'all',
	highlight = {
		enable = true,
		disable = { 'help' },
	},
	indent = {
		enable = true,
		disable = {},
	},
	rainbow = {
		enable = true,
		extended_mode = true,
	},
	matchup = {
		enable = true,
	},
})
