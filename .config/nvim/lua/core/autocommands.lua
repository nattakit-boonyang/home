local api = vim.api
local editors = vim.api.nvim_create_augroup('Editor', { clear = true })
local exec_cmd_buf_cursor = function(bufnr, cmd)
  -- Save last cursor
  local linenr = vim.api.nvim_win_get_cursor(bufnr)

  -- Run command with ignore error
  local status, _ = pcall(vim.cmd, cmd)
  if not status then return end

  -- Move cursor position
  local total_line = api.nvim_buf_line_count(bufnr)
  if total_line < linenr[1] then
    linenr[1], linenr[2] = total_line, 0
  end

  -- Set new cursor position
  api.nvim_win_set_cursor(bufnr, linenr)
end

api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  group = editors,
  callback = function()
    -- Trim trailing whitespace
    exec_cmd_buf_cursor(0, [[%s/\s\+$//e]])
    -- Trim end-of-file line
    exec_cmd_buf_cursor(0, [[%s#\($\n\s*\)\+\%$##]])
  end,
})
