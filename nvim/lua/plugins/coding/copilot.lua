-- Plugin: https://github.com/zbirenbaum/copilot.lua
return new_plugin(plugins.coding.copilot)
	.load_when_called("Copilot")
	.set_options({
		suggestion = { enabled = false },
		panel = { enabled = false },
		filetypes = {
			markdown = true,
			help = true,
		},
	})
	.override({
		build = ":Copilot auth",
	})
