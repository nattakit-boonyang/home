-- Plugin: https://github.com/nvim-treesitter/nvim-treesitter
return new_plugin(plugins.treesitter.nvim_ts)
	.load_on_event("BufReadPost")
	.load_on_event("BufNewFile")
	.load_when_called("TSUpdateSync")
	.set_options({
		ensure_installed = "all",
		autotag = {
			enable = true,
		},
		playground = {
			enable = true,
		},
		highlight = {
			enable = true,
			disable = {},
			additional_vim_regex_highlighting = false,
		},
		indent = {
			enable = true,
			disable = {},
		},
		rainbow = {
			enable = true,
			extended_mode = true,
		},
		matchup = {
			enable = true,
		},
	})
	.setup(function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end)
	.override({
		build = ":TSUpdate",
	})
