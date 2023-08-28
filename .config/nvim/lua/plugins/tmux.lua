return {
  -- https://github.com/aserowy/tmux.nvim
  {
    "aserowy/tmux.nvim",
    version = false,
    event = "VeryLazy",
    opts = {
      navigation = {
        enable_default_keybindings = false,
      },
    },
    config = true,
  },

  -- https://github.com/tmux-plugins/vim-tmux
  { "tmux-plugins/vim-tmux" },
}
