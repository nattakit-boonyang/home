local M = {}

-- Run matches command then move cursor to appropriately position
function M.run_cmd_curr_cursor(bufnr, cmd)
	-- Save last cursor
	local linenr = vim.api.nvim_win_get_cursor(bufnr)

	-- Run command with ignore error
	local status, _ = pcall(vim.cmd, cmd)
	if not status then return end

	-- Move cursor position
	local total_line = vim.api.nvim_buf_line_count(bufnr)
	if total_line < linenr[1] then
		linenr[1], linenr[2] = total_line, 0
	end

	-- Set new cursor position
	vim.api.nvim_win_set_cursor(bufnr, linenr)
end

return M
