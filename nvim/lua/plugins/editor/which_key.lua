-- Plugin: https://github.com/folke/which-key.nvim
return new_plugin(plugins.editor.which_key)
	.is_lazy()
	.set_options({
		defaults = {
			mode = { "n", "v" },
			["g"] = { name = "+goto" },
			["gz"] = { name = "+surround" },
			["]"] = { name = "+next" },
			["["] = { name = "+prev" },
			["<leader>f"] = { name = "+file/find" },
			["<leader>c"] = { name = "+code" },
			["<leader>s"] = { name = "+search" },
		},
	})
	.setup(function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.register(opts.defaults)
	end)
