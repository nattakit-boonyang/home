-- Plugin: https://github.com/nvim-lualine/lualine.nvim
return {
  plugins.editor.repo_lualine,
  name = plugins.editor.lualine,
  event = "VeryLazy",
  config = true,
  opts = {
    sections = {
      lualine_c = { "filename", { "navic" } },
      lualine_y = { "progress" },
    },
    options = {
      disabled_filetypes = {
        statusline = { "neo-tree" },
      },
    },
  },
}
