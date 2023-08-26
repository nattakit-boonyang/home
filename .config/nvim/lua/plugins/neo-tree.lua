-- https://github.com/nvim-neo-tree/neo-tree.nvim
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    default_component_configs = {
      indent = {
        expander_collapsed = "",
        expander_expanded = "",
      },
    },
    window = {
      width = 25,
      mappings = {
        ["o"] = "open",
      },
    },
  },
}
