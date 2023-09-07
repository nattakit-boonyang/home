-- Plugin: https://github.com/williamboman/mason.nvim
return new_plugin(plugins.lsp.mason)
	.no_setup()
	.load_when_pressed({ "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" })
	.set_options({
		ui = {
			icons = icons.mason,
		},
	})
