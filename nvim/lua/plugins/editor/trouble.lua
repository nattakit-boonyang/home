-- Plugin: https://github.com/folke/trouble.nvim
return {
  plugins.editor.repo_trouble,
  name = plugins.editor.trouble,
  cmd = { "TroubleToggle", "Trouble" },
  opts = { use_diagnostic_signs = true },
  keys = {
    { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "󰍉 Document Diagnostics" },
    { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "󰍉 Workspace Diagnostics" },
    { "<leader>xL", "<cmd>TroubleToggle loclist<cr>", desc = "󰍉 Location List" },
    { "<leader>xQ", "<cmd>TroubleToggle quickfix<cr>", desc = "󰍉 Quickfix List" },
  },
}
