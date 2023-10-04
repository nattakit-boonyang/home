-- Plugin: https://github.com/folke/noice.nvim
return {
  plugins.ui.repo_noice,
  name = plugins.ui.noice,
  enabled = false,
  event = "VeryLazy",
  dependencies = {
    plugins.ui.nui,
    plugins.ui.notify,
    plugins.coding.treesitter,
  },
  opts = {
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = true,
      lsp_doc_border = true,
    },
  },
}
