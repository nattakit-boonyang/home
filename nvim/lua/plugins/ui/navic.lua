-- Plugin: https://github.com/SmiteshP/nvim-navic
return {
  plugins.ui.repo_navic,
  name = plugins.ui.navic,
  lazy = true,
  opts = {
    icons = icons.lspkind,
    highlight = true,
    lsp = { auto_attach = true },
  },
}
