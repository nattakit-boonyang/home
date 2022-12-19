-- Plugin for display bottom status line
local lualine = g.loader.load_plugin('lualine')

lualine.setup({
	options = {
		icons_enabled = true,
		theme = 'dracula-nvim',
		extensions = { 'fugitive' }
	},
})
