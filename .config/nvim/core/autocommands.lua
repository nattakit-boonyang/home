-- Define command groups
local editors = vim.api.nvim_create_augroup('Editors', { clear = true })
local configs = vim.api.nvim_create_augroup('Configs', { clear = true })

-- Trim trailing whitespace
vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = '*',
	group = editors,
	callback = function()
		g.buffer.run_cmd_curr_cursor(0, [[%s/\s\+$//e]])
	end,
})

-- Trim end-of-file line
vim.api.nvim_create_autocmd('BufWritePost', {
	pattern = '*',
	group = editors,
	callback = function()
		g.buffer.run_cmd_curr_cursor(0, [[%s#\($\n\s*\)\+\%$##]])
	end,
})

-- Reload lua configurations
vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
	pattern = '*/.config/nvim/*.lua',
	group = configs,
	callback = function(ctx)
		vim.cmd(string.format('source %s', ctx.file))
	end,
})
