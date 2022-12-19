local null_ls = g.loader.load_plugin('null-ls')

local sources = {
	null_ls.builtins.formatting.prettier,
	null_ls.builtins.completion.spell,
	null_ls.builtins.diagnostics.write_good,
	null_ls.builtins.code_actions.gitsigns,
}

null_ls.setup({
	sources = sources,
})
