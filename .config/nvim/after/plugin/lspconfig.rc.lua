local status1, lsp = pcall(require, 'lspconfig')
if not status1 then return end

local status2, cmplsp = pcall(require, 'cmp_nvim_lsp')
if not status2 then return end

local capabilities = cmplsp.default_capabilities()

local on_attach = function(client, bufnr)
	-- formatting
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_command [[augroup Format]]
		vim.api.nvim_command [[autocmd! * <buffer>]]
		vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
		vim.api.nvim_command [[augroup END]]
	end
end

-- LSP: lua
lsp.sumneko_lua.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			format = {
				enable = true,
			},
			runtime = {
				-- Select version for Neovim
				version = 'LuaJIT',
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file('', true),
			},
		},
	},
})

-- LSP: bash
lsp.bashls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- LSP: golang
local status3, go = pcall(require, 'go')
if not status3 then return end

local status4, fmt = pcall(require, 'go.format')
if not status4 then return end

go.setup({
	goimport = 'gopls',
	gofmt = 'gopls',
	max_line_len = 120,
	tag_transform = false,
	test_dir = '',
	comment_placeholder = '   ',
	lsp_cfg = {
		capabilities = capabilities,
	},
	lsp_gofumpt = true,
	lsp_on_attach = true,
	dap_debug = true,
})
