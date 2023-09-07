-- Plugin: https://github.com/williamboman/mason-lspconfig.nvim
return new_plugin(plugins.lsp.mason_lspconfig).no_setup().set_options({
	ensure_installed = {
		"lua_ls",
	},
	automatic_installation = true,
})
