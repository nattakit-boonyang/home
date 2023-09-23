-- Plugin: https://github.com/williamboman/mason.nvim
return {
  plugins.lsp.repo_mason,
  name = plugins.lsp.mason,
  config = true,
  opts = {
    ui = {
      icons = icons.mason_ui,
    }
  },
  keys = {
    { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" },
  },
}
