-- https://github.com/aserowy/tmux.nvim
return {
  plugins.editor.repo_tmux_navigator,
  name = plugins.editor.tmux_navigator,
  event = "VeryLazy",
  opts = {
    copy_sync = { enable = false },
  },
}
