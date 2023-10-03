-- Plugin: https://github.com/nvim-lualine/lualine.nvim
return {
  plugins.editor.repo_lualine,
  name = plugins.editor.lualine,
  dependencies = {
    plugins.ui.web_devicons,
    plugins.ui.navic,
  },
  event = "VeryLazy",
  config = true,
  opts = {
    sections = {
      lualine_c = { "filename", { "navic" } },
      lualine_y = { "progress" },
    },
    options = {
      theme = "catppuccin",
      disabled_filetypes = {
        statusline = {
          "alpha",
          "neo-tree",
        },
      },
    },
  },
}
