-- Plugin: https://github.com/jose-elias-alvarez/null-ls.nvim
return {
  plugins.lsp.repo_null_ls,
  name = plugins.lsp.null_ls,
  dependencies = plugins.lsp.mason,
  event = { "BufReadPre", "BufNewFile" },
  opts = function()
    return {
      diagnostic_config = {
        underline = false,
      },
      sources = servers.sources_null_ls(),
    }
  end,
}
