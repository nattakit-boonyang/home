local api = vim.api
local augroup = function(name)
	return api.nvim_create_augroup(name, { clear = true })
end
local autocmd = api.nvim_create_autocmd

-- Close filetypes with <q>
autocmd("FileType", {
	group = augroup("close_with_q"),
	pattern = {
		"PlenaryTestPopup",
		"help",
		"lspinfo",
		"man",
		"notify",
		"qf",
		"tsplayground",
		"checkhealth",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

-- Highlight on yank
autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		vim.highlight.on_yank()
	end,
})

local M = {}
M.auto_format_on_save = function(bufnr)
	autocmd("BufWritePre", {
		group = augroup("format_on_save"),
		buffer = bufnr,
		callback = function()
			vim.lsp.buf.format({ async = true })
		end,
	})
	autocmd("BufWritePre", {
		group = augroup("go_import_on_save"),
		pattern = "*.go",
		callback = function()
			require("go.format").goimport()
		end,
	})
end
return M
