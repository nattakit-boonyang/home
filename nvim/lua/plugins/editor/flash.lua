-- Plugin: https://github.com/folke/flash.nvim
return new_plugin(plugins.editor.flash)
	.is_lazy()
	.set_options({
		modes = {
			char = {
				jump_labels = true,
			},
		},
	})
	.load_when_pressed({
		"s",
		mode = { "n", "o", "x" },
		function()
			require("flash").jump()
		end,
		desc = "[Flash] Search",
	})
	.load_when_pressed({
		"r",
		mode = "o",
		function()
			require("flash").remote()
		end,
		desc = "[Flash] Remote Flash",
	})
	.load_when_pressed({
		"R",
		mode = { "o", "x" },
		function()
			require("flash").treesitter_search()
		end,
		desc = "[Flash] Treesitter Search",
	})
	.load_when_pressed({
		"<c-s>",
		mode = { "c" },
		function()
			require("flash").toggle()
		end,
		desc = "[Flash] Toggle Flash Search",
	})
