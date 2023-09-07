-- Plugin: https://github.com/jay-babu/mason-null-ls.nvim
return new_plugin(plugins.lsp.mason_null_ls).no_setup().set_options({
	ensure_installed = {
		"stylua",
	},
	automatic_installation = true,
})
