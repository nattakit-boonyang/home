-- Plugin: https://github.com/nvim-tree/nvim-tree.lua
return new_plugin(plugins.editor.nvim_tree)
	.is_lazy()
	.load_when_pressed({ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree Explorer" })
	.set_options({
		sort_by = "case_sensitive",
		view = {
			width = 30,
		},
		renderer = {
			group_empty = true,
			icons = {
				glyphs = {
					folder = {
						arrow_closed = "",
						arrow_open = "",
					},
				},
			},
		},
		filters = {
			custom = { ".git", ".vscode", ".DS_Store" },
		},
		git = {
			ignore = false,
		},
	})
	.setup(function(_, opts)
		require("nvim-tree").setup(opts)

		vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = "#3FC5FF" })
	end)
