-- Plugin: https://github.com/RRethy/vim-illuminate
return new_plugin(plugins.editor.illuminate)
	.load_on_event("BufReadPost")
	.load_on_event("BufNewFile")
	.set_options({
		delay = 200,
		large_file_cutoff = 2000,
		large_file_overrides = {
			providers = { "lsp" },
		},
	})
	.setup(function(_, opts)
		require("illuminate").configure(opts)
	end)
