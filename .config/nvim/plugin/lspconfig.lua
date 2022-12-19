-- Enable language servers
local servers = {
	'sumneko_lua',
	'bashls',
	'yamlls',
	'vimls',
	'jsonls',
}

-- Ensure to enable mason before lspconfig
g.loader.load_plugin('mason').setup()
g.loader.load_plugin('mason-lspconfig').setup({
	ensure_installed = servers,
})

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
		local format = function()
			vim.lsp.buf.format({ bufnr = bufnr, async = true })
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
