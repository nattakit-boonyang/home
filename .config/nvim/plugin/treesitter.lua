-- Plugin for syntax
local treesitter = g.loader.load_plugin('nvim-treesitter.configs')

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
})
