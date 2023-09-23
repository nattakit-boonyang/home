-- Plugin: https://github.com/ray-x/go.nvim
return {
  plugins.lsp.go.repo_go,
  name = plugins.lsp.go.go,
  dependencies = {
    plugins.lsp.lspconfig,
    plugins.coding.treesitter,
    {
      plugins.ui.repo_guihua,
      name = plugins.ui.guihua,
    },
  },
  config = true,
  event = { "CmdlineEnter" },
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()',
}
