-- Plugin: https://github.com/catppuccin/nvim
return {
  plugins.editor.repo_catppuccin,
  name = plugins.editor.catppuccin,
  priority = 1000,
  opts = {
    transparent_background = true,
    integrations = {
      alpha = true,
      cmp = true,
      flash = true,
      lsp_trouble = true,
      mason = true,
      mini = true,
      neotree = true,
      noice = true,
      notify = true,
      symbols_outline = true,
      treesitter = true,
      treesitter_context = true,
      which_key = true,
      window_picker = true,
      telescope = { enabled = true },
      navic = {
        enabled = true,
        custom_bg = "NONE",
      },
      illuminate = {
        enabled = true,
        lsp = false,
      },
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)

    vim.cmd.colorscheme("catppuccin")
  end,
}
