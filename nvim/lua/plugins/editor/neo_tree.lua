-- Plugin: https://github.com/nvim-neo-tree/neo-tree.nvim/tree/v3.x
return {
  plugins.editor.repo_neo_tree,
  name = plugins.editor.neo_tree,
  branch = "v3.x",
  event = "VeryLazy",
  dependencies = {
    plugins.ui.web_devicons,
    plugins.ui.nui,
    plugins.ui.plenary,
    plugins.ui.window_picker,
  },
  keys = {
    { "<leader>e", "<cmd>Neotree toggle source=last<cr>", desc = " Neo Tree" },
  },
  opts = {
    sources = {
      "filesystem",
      "buffers",
      "git_status",
    },
    source_selector = { statusline = true },
    filesystem = {
      use_libuv_file_watcher = true,
    },
    popup_border_style = "single",
    default_component_configs = {
      indent = {
        with_expanders = true,
      },
    },
    window = {
      position = "float",
      mappings = {
        ["C"] = "close_all_subnodes",
        ["Z"] = "expand_all_nodes",
      },
    },
  },
}
