-- Plugin: https://github.com/catppuccin/nvim
-- TODO:  https://github.com/catppuccin/nvim#integrations
return {
  plugins.editor.repo_catppuccin,
  name = plugins.editor.catppuccin,
  priority = 1000,
  opts = {
    integrations = {},
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)

    vim.cmd.colorscheme("catppuccin")
  end,
}
