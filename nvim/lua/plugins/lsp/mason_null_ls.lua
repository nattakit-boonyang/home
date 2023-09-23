-- Plugin: https://github.com/jay-babu/mason-null-ls.nvim
return {
  plugins.lsp.repo_mason_null_ls,
  name = plugins.lsp.mason_null_ls,
  dependencies = plugins.lsp.mason,
  config = true,
  opts = {
    ensure_installed = servers.null_ls,
    automatic_installation = true,
  },
}
