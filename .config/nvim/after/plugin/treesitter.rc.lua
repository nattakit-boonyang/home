local status, ts = pcall(require, 'nvim-treesitter.configs')
if not status then return end

ts.setup({
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = {},
	},
	ensure_installed = {
		'markdown', 'go', 'vim',
		'lua', 'json', 'yaml',
		'css', 'html'
	},
	autotag = {
		enable = true,
	},
})
