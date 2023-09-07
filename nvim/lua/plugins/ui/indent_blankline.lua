-- https://github.com/lukas-reineke/indent-blankline.nvim
return new_plugin(plugins.ui.indent_blankline).setup(function()
	local indent = require("indent_blankline")
	local colors = {
		"#E06C75",
		"#E5C07B",
		"#98C379",
		"#56B6C2",
		"#61AFEF",
		"#C678DD",
	}
	local char_highlight_list = {}
	for i, color in ipairs(colors) do
		local name = string.format("IndentBlanklineIndent%d", i)
		table.insert(char_highlight_list, name)
		vim.api.nvim_set_hl(0, name, { fg = color, nocombine = true })
	end

	indent.setup({
		char = "│",
		filetype_exclude = {
			"help",
			"alpha",
			"dashboard",
			"neo-tree",
			"Trouble",
			"lazy",
			"mason",
			"notify",
			"toggleterm",
			"lazyterm",
		},
		show_trailing_blankline_indent = false,
		show_current_context = true,
		show_current_context_start = true,
		char_highlight_list = char_highlight_list,
	})
end)
