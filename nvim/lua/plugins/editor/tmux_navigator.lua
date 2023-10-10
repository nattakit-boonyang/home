-- https://github.com/aserowy/tmux.nvim
return {
  plugins.editor.repo_tmux_navigator,
  name = plugins.editor.tmux_navigator,
  event = "VeryLazy",
  opts = {
    copy_sync = { enable = false },
    navigation = {
      cycle_navigation = false,
      enable_default_keybindings = true,
      persist_zoom = false,
    },
    resize = {
      enable_default_keybindings = true,
      resize_step_x = 5,
      resize_step_y = 5,
    },
  },
}
