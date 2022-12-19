local pairs = g.loader.load_plugin('nvim-autopairs')

pairs.setup({
	disable_filetype = { 'vim' },
})
