-- Plugin: https://github.com/rmagatti/auto-session
return {
  plugins.editor.repo_auto_session,
  name = plugins.editor.auto_session,
  event = "VeryLazy",
  dependencies = plugins.editor.neo_tree,
  config = true,
  opts = {
    auto_restore_enabled = true,
  },
  keys = {
    { "<leader>ra", "<cmd>Autosession search<cr>", desc = "󰦛 Search" },
    { "<leader>rd", "<cmd>Autosession delete<cr>", desc = "󰦛 Delete" },
    { "<leader>rs", "<cmd>Neotree close<cr><cmd>SessionSave<cr>", desc = "󰦛 Save" },
    { "<leader>rr", "<cmd>Neotree close<cr><cmd>SessionRestore<cr>", desc = "󰦛 Restore" },
  },
}
