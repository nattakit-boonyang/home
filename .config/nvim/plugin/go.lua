local go = g.loader.load_plugin('go')

go.setup({
	lsp_cfg = {
		capabilities = g.lsp.capabilities(),
		on_attach = g.lsp.on_attach,
		flags = g.lsp.flags,
	}
})
