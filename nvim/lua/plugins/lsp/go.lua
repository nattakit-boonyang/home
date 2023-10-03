-- Plugin: https://github.com/ray-x/go.nvim
return {
  plugins.lsp.repo_go,
  name = plugins.lsp.go,
  dependencies = {
    {
      -- Plugin: https://github.com/ray-x/guihua.lua
      plugins.ui.repo_guihua,
      name = plugins.ui.guihua,
      lazy = true,
    },
    plugins.coding.treesitter,
    plugins.lsp.lspconfig,
  },
  event = { "CmdlineEnter" },
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()',
  config = true,
  opts = {
    verbose = false,
    textobjects = false,
  },
}
