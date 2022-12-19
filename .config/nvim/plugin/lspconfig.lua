-- Enable language servers
local servers = {
	'bashls',
	'sumneko_lua',
}

local lspconfig = g.loader.load_plugin('lspconfig')
local cmplsp = g.loader.load_plugin('cmp_nvim_lsp')

-- Utilities
local flags = {
	debounce_text_changes = 150,
}
local capabilities = cmplsp.default_capabilities()
local on_attach = function(client, bufnr)
	-- Formatting
	if client.server_capabilities.documentFormattingProvider then
		-- Auto formatting
		vim.api.nvim_create_autocmd('BufWritePre', {
			pattern = '*',
			group = vim.api.nvim_create_augroup('Formats', { clear = true }),
			callback = function()
				vim.lsp.buf.format({ async = true })
			end,
		})

		-- Key mappings
		local bufopts = { noremap = true, silent = true, buffer = bufnr }
		vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, bufopts)
	end
end

for _, server in ipairs(servers) do
	-- load settings
	local settings = g.loader.load_lspconfig_setup(server)

	-- load setup
	lspconfig[server].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = settings,
		flags = flags,
	})
end
