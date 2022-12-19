-- Enable language servers
local servers = {
	'sumneko_lua',
	'bashls',
	'yamlls',
	'jsonls',
	'dockerls',
	'golangci_lint_ls',
	'graphql',
	'html',
	'marksman',
	'sqlls',
	'lemminx',
}

-- Ensure to enable mason before lspconfig
g.loader.load_plugin('mason').setup()
g.loader.load_plugin('mason-lspconfig').setup({
	ensure_installed = servers,
})

local lspconfig = g.loader.load_plugin('lspconfig')

for _, server in ipairs(servers) do
	-- load settings
	local settings = g.loader.load_lspconfig_setup(server)

	-- load setup
	lspconfig[server].setup({
		capabilities = g.lsp.capabilities(),
		on_attach = g.lsp.on_attach,
		settings = settings,
		flags = g.lsp.flags,
	})
end

-- Override diagnostic
vim.fn.sign_define("DiagnosticSignError", { text = "✗", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "!", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInformation", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
vim.diagnostic.config {
	underline = false,
	virtual_text = false,
	signs = true,
	severity_sort = true,
}
