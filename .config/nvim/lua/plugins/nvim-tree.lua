-- https://github.com/nvim-tree/nvim-tree.lua
return {
  "nvim-tree/nvim-tree.lua",
  name = "nvim-tree",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local nvimtree = require("nvim-tree")

    nvimtree.setup({
      sort = {
        sorter = "case_sensitive",
      },
      renderer = {
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "",
              arrow_open = "",
            },
          },
        },
      },
      filters = {
        custom = { ".vscode", ".DS_Store" },
      },
      git = {
        ignore = false,
      },
    })

    vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = "#3FC5FF" })
  end,
}
