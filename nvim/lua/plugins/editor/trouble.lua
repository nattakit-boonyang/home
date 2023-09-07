-- Plugin: https://github.com/folke/trouble.nvim
return new_plugin(plugins.editor.trouble)
	.load_when_called("TroubleToggle")
	.load_when_called("Trouble")
	.set_options({
		use_diagnostic_signs = true,
	})
	.load_when_pressed({
		"<leader>xx",
		"<cmd>TroubleToggle document_diagnostics<cr>",
		desc = "Document Diagnostics (Trouble)",
	})
	.load_when_pressed({
		"<leader>xX",
		"<cmd>TroubleToggle workspace_diagnostics<cr>",
		desc = "Workspace Diagnostics (Trouble)",
	})
	.load_when_pressed({
		"<leader>xL",
		"<cmd>TroubleToggle loclist<cr>",
		desc = "Location List (Trouble)",
	})
	.load_when_pressed({
		"<leader>xQ",
		"<cmd>TroubleToggle quickfix<cr>",
		desc = "Quickfix List (Trouble)",
	})
	.load_when_pressed({
		"[q",
		function()
			if require("trouble").is_open() then
				require("trouble").previous({ skip_groups = true, jump = true })
			end
		end,
		desc = "Previous trouble/quickfix item",
	})
	.load_when_pressed({
		"]q",
		function()
			if require("trouble").is_open() then
				require("trouble").next({ skip_groups = true, jump = true })
			end
		end,
		desc = "Next trouble/quickfix item",
	})
