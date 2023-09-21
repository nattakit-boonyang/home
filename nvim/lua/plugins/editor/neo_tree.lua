-- Plugin: https://github.com/nvim-neo-tree/neo-tree.nvim/tree/v3.x
return {
  plugins.editor.repo_neo_tree,
  name = plugins.editor.neo_tree,
  branch = "v3.x",
  dependencies = {
    plugins.ui.web_devicons,
    plugins.ui.nui,
    plugins.ui.plenary,
    plugins.ui.window_picker,
  },
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
  },
  opts = {
    sources = {
      "filesystem",
      "buffers",
      "git_status",
      "document_symbols",
    },
    popup_border_style = "single",
    default_component_configs = {
      indent = {
        with_expanders = true,
      },
    },
  },
}
