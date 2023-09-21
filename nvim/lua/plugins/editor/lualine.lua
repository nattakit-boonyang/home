-- Plugin: https://github.com/nvim-lualine/lualine.nvim
return {
  plugins.editor.repo_lualine,
  name = plugins.editor.lualine,
  event = "VeryLazy",
  config = true,
  opts = {
    options = {
      disabled_filetypes = {
        statusline = { "neo-tree" },
      },
    },
  },
}
