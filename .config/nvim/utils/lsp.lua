local M = {}

M.flags = {
	debounce_text_changes = 150,
}

function M.capabilities()
	local cmplsp = g.loader.load_plugin('cmp_nvim_lsp')
	return cmplsp.default_capabilities()
end

function M.on_attach(client, bufnr)
	-- Formatting
	if client.server_capabilities.documentFormattingProvider then
		local format = function()
			vim.lsp.buf.format({ bufnr = bufnr, async = false })
		end

		-- Auto formatting
		vim.api.nvim_create_autocmd('BufWritePre', {
			group = vim.api.nvim_create_augroup('LspFormatting', { clear = true }),
			buffer = bufnr,
			callback = format,
		})

		-- Key mappings
		vim.keymap.set('n', '<leader>fo', format, { noremap = true, silent = true })
	end
end

return M
