-- Plugin: https://github.com/jose-elias-alvarez/null-ls.nvim
return new_plugin(plugins.lsp.null_ls)
	.load_after(plugins.lsp.mason)
	.load_on_event("BufReadPre")
	.load_on_event("BufNewFile")
	.set_options(function()
		local nls = require("null-ls")
		local utils = require("null-ls.utils")

		return {
			root_dir = utils.root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
			sources = {
				nls.builtins.formatting.stylua,
				nls.builtins.diagnostics.hadolint,
			},
		}
	end)
