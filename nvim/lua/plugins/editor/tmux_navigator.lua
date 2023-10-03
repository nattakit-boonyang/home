-- https://github.com/aserowy/tmux.nvim
return {
  plugins.editor.repo_tmux_navigator,
  name = plugins.editor.tmux_navigator,
  event = "VeryLazy",
  config = {
    copy_sync = { enable = false },
    navigation = { enable_default_keybindings = true },
  },
}
