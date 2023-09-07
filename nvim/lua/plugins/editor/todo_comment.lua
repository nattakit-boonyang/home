-- Plugin: https://github.com/folke/todo-comments.nvim
return new_plugin(plugins.editor.todo_comment)
	.load_after(plugins.util.plenary)
	.no_setup()
	.load_on_event("BufReadPost")
	.load_on_event("BufNewFile")
	.load_when_called("TodoTrouble")
	.load_when_called("TodoTelescope")
	.load_when_pressed({
		"[t",
		function()
			require("todo-comments").jump_next()
		end,
		desc = "",
	})
	.load_when_pressed({
		"]t",
		function()
			require("todo-comments").jump_prev()
		end,
		desc = "",
	})
	.load_when_pressed({ "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" })
	.load_when_pressed({ "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" })
	.load_when_pressed({ "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" })
	.load_when_pressed({ "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" })
