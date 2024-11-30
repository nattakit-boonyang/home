-- Plugin: https://github.com/williamboman/mason-lspconfig.nvim
return {
  plugins.lsp.repo_mason_lspconfig,
  name = plugins.lsp.mason_lspconfig,
  dependencies = plugins.lsp.mason,
  config = true,
  opts = {
    ensure_installed = servers.mason_lsp,
    automatic_installation = true,
  },
}
